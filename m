Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.4065.1621070753716221705
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 02:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eeeEAggd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso2492489wmh.4
        for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 02:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9J1DKs4ta5gkD4z9glKRGsthVvbtN/1xshqtX62uhe0=;
        b=eeeEAggd87CWlZDr8TdIe9v/XSy2GCR9meaZkXwFbLXr583763ixhZq+Mf87I7GMbm
         6Q137BqZS9/UPVZOyUA55bBfhRgK3yPxFVRyZ876YqFRi/D1JqgfMNRHbldToG+cBrlM
         DFrRTL5ilw1+kgXQEx+JhR/wsqrSfogNBJ1iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9J1DKs4ta5gkD4z9glKRGsthVvbtN/1xshqtX62uhe0=;
        b=Cf15jmdDKgkMtmGEbdr9uIDSVGjIp3CpQ3OgpdcsL7GuFPIqMG54qXS1kgAZsZWefY
         z8BgJcOPDfht4Y59yz0VmxmAW9Se/BvnnadbK5UdF+q2icVfxgaDqUv68syMF1ygZb7n
         aJ1hGEq0ITTSP666h8NfNM/IkeNdsMgcYTIGiylA2OkLlZwHMsRzdeyqS2tRy8u7knek
         FReeV4fFMFFk6xsDqYRBMg+d+EFz7Zn/cjdvVhxMX7jyf3wwHbgacQXdPIDudzcCHUkG
         V0Todwg4GrQXRWTxoKnbpAJlyhNsExMBs109jWtSmvmmjY8xQob+JgMkFiHMpDr3I7VX
         o0vw==
X-Gm-Message-State: AOAM533TEGPWVFIgOiQj0AuKO4/YEtIwnQuQA4Kq7mED/tuxnWLi8kZw
	bIWetwU2kj1FWc4JqwztrxT6EE/HJzk1yA==
X-Google-Smtp-Source: ABdhPJxiBS6XgUJArbOMt4KAq3gS0Y4q/jUwikGQsSfBVgvhelJufELz57Ms5d0Q0mabmnBIHIsUrw==
X-Received: by 2002:a7b:c405:: with SMTP id k5mr13515362wmi.93.1621070751668;
        Sat, 15 May 2021 02:25:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:df9a:d0c:2699:1a6a])
        by smtp.gmail.com with ESMTPSA id y5sm8602107wrm.61.2021.05.15.02.25.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 02:25:51 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate: Handle manifest 'corruption' issue
Date: Sat, 15 May 2021 10:25:50 +0100
Message-Id: <20210515092550.2352598-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Under certain build patterns, warnings about missing manifests can appear. These
are real issues where the manifest was removed and shouldn't have been.

Martin Jansa was able to find a reproducer of:

MACHINE=qemux86 bitbake zlib-native
echo 'PR = "r1"' >> meta/recipes-core/zlib/zlib_1.2.11.bb
MACHINE=qemux86-64 bitbake zlib-native
MACHINE=qemux86 bitbake zlib-native

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
index b1c608dcb14..1a6e9962f9d 100644
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

