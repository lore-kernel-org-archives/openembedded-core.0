Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.513.1621543746435245788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fQMkeJfQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id y14so16881612wrm.13
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UfmLoniNkCiYJ4KPgBStFBl3TyW58wzFxfy8hobom/Y=;
        b=fQMkeJfQ218zGEid5crkgd8gE1PCDqtEEeVVeC3r7CfPrtMuJFYrMXDglVfP+N8d9z
         j6SU/Ip2zrHYKj/HL1jlDNLksd3tIuTvJjDtsjI+6jX4FCpFZBYlWklNBbTVe1K6YnvQ
         fZs7l+OqcNJKTl9txRapIZHz+VcBBHOoRiggE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UfmLoniNkCiYJ4KPgBStFBl3TyW58wzFxfy8hobom/Y=;
        b=AZjM2r7eAuMuCLV4vK48fiEK5PZImngw0poU5tov+3a5WZjVwG0I0o49WULIC5dFFA
         18kwYYK5fFSdjNmxgci9VJCHRj/V1btvyZ5t0DH+QayYCL5B8YF5YUrI7BGbnFlRL2K+
         4RKz8kRR+XM3LAvdiSG3A6gkGI1U6b2cZZv8xQ4cgIL9MQVMxhQHRfhGLVbKO2niSGf+
         0WjYr3ZdWoh91uWWKheqUOyaxdW5hOl3Vv1Ozu97Y8pMfCeX7V9sBuJSC6SqpYRX42u9
         Eq0+QexVRga4q3ZCTMrY+bMSPCFKDLepsLf6b25/gfS2YCwumeg0WsciU3+kJKzTeVCR
         Ftlg==
X-Gm-Message-State: AOAM530PrIzlcpRiIMQo0+Xr4OQ9d1YegxZlBZN8Pi6lNeRcZeRkNqFN
	n2NzyW+9eh2xX99Bfe94H5cD744C0fb7ag==
X-Google-Smtp-Source: ABdhPJw/Pbh79n6iQgZacpnTWPFaBoWjLSXOcTUOKk4V49Qhk7H9ltjqV93tYULRfiTWxUOgO599rQ==
X-Received: by 2002:a5d:4285:: with SMTP id k5mr6038795wrq.54.1621543744865;
        Thu, 20 May 2021 13:49:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:04 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 04/28] sstate: Handle manifest 'corruption' issue
Date: Thu, 20 May 2021 21:48:38 +0100
Message-Id: <20210520204902.2527687-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Under certain build patterns, warnings about missing manifests can appear. These
are real issues where the manifest was removed and shouldn't have been.

Martin Jansa was able to find a reproducer of:

MACHINE=qemux86 bitbake zlib-native
echo 'PR = "r1"' >> meta/recipes-core/zlib/zlib_1.2.11.bb
MACHINE=qemux86-64 bitbake zlib-native
MACHINE=qemux86 bitbake zlib-native
<the zlib-native manifest is now removed along with the sysroot-components contents>

The code maintains a per machine list of stamps but a per PACAGE_ARCH list of
stamp/manifest/workdir mappings. The latter is only appended to for speed with
the assumption that once stamps are gone, the code wouldn't trigger.

The code only ever appends to the mapping list (for speed/efficency under lock)
meaning that multiple entries can result where the stamp/workdir differs due to
version changes but the manifest remains the same.

By switching MACHINE part way through the build, the older stamp is referenced
and the manifest is incorrectly removed as it matches an now obsolete entry in
the mapping file.

There are two possible fixes, one is to rewrite the mapping file every time
which means adding regexs, iterating and generally complicating that code. The
second option is to only use the last mapping entry in the file for a given
manifest and ignore any earlier ones. This patch implments the latter.

Also drop the stale entries if we are rewriting it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 8e8efd18d58..79588df2cdb 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -319,6 +319,8 @@ def sstate_install(ss, d):
     if os.path.exists(i):
         with open(i, "r") as f:
             manifests = f.readlines()
+    # We append new entries, we don't remove older entries which may have the same
+    # manifest name but different versions from stamp/workdir. See below.
     if filedata not in manifests:
         with open(i, "a+") as f:
             f.write(filedata)
@@ -1183,11 +1185,21 @@ python sstate_eventhandler_reachablestamps() {
         i = d.expand("${SSTATE_MANIFESTS}/index-" + a)
         if not os.path.exists(i):
             continue
+        manseen = set()
+        ignore = []
         with open(i, "r") as f:
             lines = f.readlines()
-            for l in lines:
+            for l in reversed(lines):
                 try:
                     (stamp, manifest, workdir) = l.split()
+                    # The index may have multiple entries for the same manifest as the code above only appends
+                    # new entries and there may be an entry with matching manifest but differing version in stamp/workdir.
+                    # The last entry in the list is the valid one, any earlier entries with matching manifests
+                    # should be ignored.
+                    if manifest in manseen:
+                        ignore.append(l)
+                        continue
+                    manseen.add(manifest)
                     if stamp not in stamps and stamp not in preservestamps and stamp in machineindex:
                         toremove.append(l)
                         if stamp not in seen:
@@ -1218,6 +1230,8 @@ python sstate_eventhandler_reachablestamps() {
 
         with open(i, "w") as f:
             for l in lines:
+                if l in ignore:
+                    continue
                 f.write(l)
     machineindex |= set(stamps)
     with open(mi, "w") as f:
-- 
2.30.2

