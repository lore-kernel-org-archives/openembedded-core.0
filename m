Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.12881.1614955723938222990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ldMl8v98;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id w18so2212095pfu.9
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ryptlJOHskgWvILOiTiEYEM8CKGfobQrW2xDoLijOs8=;
        b=ldMl8v98ZjDzfSRwmktY0vFXchQH9m+QYIuZ4ciDCibXVihCFKj3Mlkq3FhUf6b8O0
         NJKUhSWtR4iorY4UJkTb7jd7PoCzjldiUJjn2kQ3WNGkO1Zw1tbgHA5xZ9zR1TN5HM77
         mDX1jIuEASnMkhh1v/TOZ/q2VdEq0aulPaR/W4YGIKkBGlUDdxhMg4G+WfY12VZ/fKcD
         +YVeLaPmB377VFZvfbEvIyFV2Mdp6A/7mKtWEF39lT9phKGZu7W2WyWlikSsRlHjCLlM
         w7IxnGqhj3PgpXityCPglbmBvWcJvMTEUiPnS7OHT8BQIPrEPVJrSHqfaKynCb2mmN63
         KpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ryptlJOHskgWvILOiTiEYEM8CKGfobQrW2xDoLijOs8=;
        b=Pf+SPFSoeYnw5/gHACxbIYcdflwRrhgQpO/0u+PQhF1N97laO+xLntiIDCNj2MX9Y1
         akRjLFTzrgIiosrEUckWKBqTIsNpUJ3DYK/c9w25XW+OTNJP165facbQIqZkKatAbBpa
         mNvgGm+IVXlgMBaE483z374u3rTprjOVmqd1Q8q3BSvsiDZII7SY7wQZGdTSUgbV6sMp
         il3cGF4tK6mkfZxFdMXACrCN71FkvGWRVpFSmMA3IHQH73EuE7I85wSYSBOjM3iCrJDT
         qBCcNKfRMhLLCjQQlKn4C9R2hw7K3Vws2Pg5+kcX8a9/nExFP0xhITz+zMioOvcC0r6p
         AOLA==
X-Gm-Message-State: AOAM5320OwY21VxFrVwnYr7aWEUYIixHIpzqJnSOWGm8h4SG/PuL3GFi
	ZQirnxGGa/NbaqQWZj9bM49OPtSNJz0qVHMS
X-Google-Smtp-Source: ABdhPJzZBGml03xpckaOrkccLmMzJoUdMgHn7f7/eUQDSWP+ggX6WPfItMQgzxWHnUgN0kZ/Pq2xqw==
X-Received: by 2002:a63:2321:: with SMTP id j33mr8956275pgj.120.1614955722898;
        Fri, 05 Mar 2021 06:48:42 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.48.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:48:42 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/27] reproducible_builds: SOURCE_DATE_EPOCH should not be 0
Date: Fri,  5 Mar 2021 04:46:28 -1000
Message-Id: <72daea3a413ff0a8ded76a494d673c5264535426.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jan-Simon Möller <jsmoeller@linuxfoundation.org>

A SOURCE_DATE_EPOCH of 0 might be misinterpreted by namely rpm as no SDE.

 e.g.:
 char *srcdate = getenv(SOURCE_DATE_EPOCH);
 if (srcdate && rpmExpandNumeric(%{?clamp_mtime_to_source_date_epoch}))

Solve this by:
- providing a SOURCE_DATE_EPOCH_FALLBACK variable != 0
- changing defaults to use it
- using SOURCE_DATE_EPOCH_FALLBACK also when reading 0 out of sstate-cache

Signed-off-by: Jan-Simon Möller <jsmoeller@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a1dde74e794362399193dc3f81c9685a83d0776)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/reproducible_build.bbclass | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 2f3bd90b07..9e806c0b75 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -37,10 +37,13 @@
 BUILD_REPRODUCIBLE_BINARIES ??= '1'
 inherit ${@oe.utils.ifelse(d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1', 'reproducible_build_simple', '')}
 
-SDE_DIR ="${WORKDIR}/source-date-epoch"
+SDE_DIR = "${WORKDIR}/source-date-epoch"
 SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
 SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
 
+# A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
+export SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
+
 SSTATETASKS += "do_deploy_source_date_epoch"
 
 do_deploy_source_date_epoch () {
@@ -81,6 +84,10 @@ python create_source_date_epoch_stamp() {
 
     source_date_epoch = oe.reproducible.get_source_date_epoch(d, d.getVar('S'))
 
+    if source_date_epoch == 0 :
+        bb.debug(1, "source_date_epoch is 0, using SOURCE_DATE_EPOCH_FALLBACK instead.")
+        source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
+
     bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
     bb.utils.mkdirhier(d.getVar('SDE_DIR'))
     with open(epochfile, 'w') as f:
@@ -93,15 +100,19 @@ def get_source_date_epoch_value(d):
         return cached
 
     epochfile = d.getVar('SDE_FILE')
-    source_date_epoch = 0
+    source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
     if os.path.isfile(epochfile):
         with open(epochfile, 'r') as f:
             s = f.read()
             try:
                 source_date_epoch = int(s)
+                # workaround for old sstate with SDE_FILE content being 0 - use SOURCE_DATE_EPOCH_FALLBACK
+                if source_date_epoch == 0 :
+                    source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
+                    bb.warn("SOURCE_DATE_EPOCH value from sstate '%s' is deprecated/invalid. Reverting to SOURCE_DATE_EPOCH_FALLBACK '%s'" % (s, source_date_epoch))
             except ValueError:
-                bb.warn("SOURCE_DATE_EPOCH value '%s' is invalid. Reverting to 0" % s)
-                source_date_epoch = 0
+                bb.warn("SOURCE_DATE_EPOCH value '%s' is invalid. Reverting to SOURCE_DATE_EPOCH_FALLBACK" % s)
+                source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
         bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
     else:
         bb.debug(1, "Cannot find %s. SOURCE_DATE_EPOCH will default to %d" % (epochfile, source_date_epoch))
-- 
2.25.1

