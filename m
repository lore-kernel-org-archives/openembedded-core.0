Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web12.2942.1621556421360459665
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 17:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=o972DdYk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso16513083otn.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 17:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/UPD2hoQEudw3K6on5Y/K+FtwYwBi6/I1Vtw2wqeb4U=;
        b=o972DdYk3/LboMko9F7jUZmCgZYo8BuMBhkySltu8mZFoodumAFeKDnCvBrL3W/0hm
         kghaKx70ihsJesJ/35OKlXb/UFg+vLCSs5J8K67ROF2BkGQuhQe46u9osifLnWDFrCIA
         ayslL6mwIm0mnwOkOPMcU8OKCIjl6bS+FAmRJqAFBTyBHoRyZVFn+zPC3yXuoX324m/i
         c9wex9A2ClTVe/DR/jSQcAbc5HRBiRv8t7VzPHqeu7TzllZPIMUC7Wm5hvWzLuqkitwd
         riutotFM0n8ql9lq0PNw9vIgizcVrwl5EaPwed79hAHKLoHaeNfie536aPxlXqJ20xyg
         Gujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/UPD2hoQEudw3K6on5Y/K+FtwYwBi6/I1Vtw2wqeb4U=;
        b=dCc5qaszX6RXTrlQzx2+p4ASS0MtNXbQhN0l12z60Ci1/7tposN3AORWzBURwc66ss
         M+zmKTz/oRsxw/3Autauc7LROE5GAyX7bfyKykI3d9eLksLHhs8uyomZ9yUxyJIF7nw8
         cuWYwSabYsDEb1+2iRDXCqV+4AwvFAJ38TiqiCpeWm3cA3S7GJW6y9GfI996EIjsfZ0k
         w20wHfkU3MR9PMU0WeSAze9uZREeMNKKKmVckzGpH0LE4rwo5CLenVk0+DXfUy2cDBj/
         QC8pPH2HUPkYHagvYmIibu4PYkuxC8+RiWoV4nQf9KHyjPl9c/hfhdGNekZoGKtjTmDN
         WZwA==
X-Gm-Message-State: AOAM531VVlWPrenETUZjZBYKo0Ks8pscigUxK/gkBF5NKmsEpzvq1PES
	KV5g8mi55IEUCRKmcyCqdV0haaT/yGq2IZkyh7o=
X-Google-Smtp-Source: ABdhPJyijlTWtZkCwiUojEF8mMuMfQPQVgZy5uvWv6Kh+jl7/lnVDS8G83wH2WNdAvW6HL8dVlvAXQ==
X-Received: by 2002:a05:6830:1184:: with SMTP id u4mr5885698otq.324.1621556420150;
        Thu, 20 May 2021 17:20:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v22sm831013oic.37.2021.05.20.17.20.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 17:20:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/3] sstate: Handle manifest 'corruption' issue
Date: Thu, 20 May 2021 14:19:29 -1000
Message-Id: <dd458bf7401417cdc53b07a1f4712c6b22219882.1621520845.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621520845.git.steve@sakoman.com>
References: <cover.1621520845.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
(cherry picked from commit 63da9a4f889c5b0e41bc8ec08abe0acea1546479)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a8e169a10b..3c89c35ecf 100644
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
@@ -1175,11 +1177,21 @@ python sstate_eventhandler2() {
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
@@ -1210,6 +1222,8 @@ python sstate_eventhandler2() {
 
         with open(i, "w") as f:
             for l in lines:
+                if l in ignore:
+                    continue
                 f.write(l)
     machineindex |= set(stamps)
     with open(mi, "w") as f:
-- 
2.25.1

