Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E7FC4321E
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:31:40 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.12404.1668951093813364598
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XO4m5LPv;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id k8so16308069wrh.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDqtkW0SXy7Wg23G6JLZ/pzP0VcLf9YK56XyYuz8288=;
        b=XO4m5LPvdVPYUq9QzZwONRVGhFYh8AGMyQntbe3SEMetpEplBopqJybHueEC5scbFx
         lfB3jQHWx+SvZZcMsZBMki29o/Xx/kN1BO6PiVMrRrJvOBsEis9EnAxn58APF2yZP+VF
         WNOd7ihBgb+QM2mfrD/G6BhdhlN3EYTZVIcoeeNf7cWdGQrRw6Kjoj8dnsBsu4F3XlXy
         eA+xaY0W3uVkp24z6fvAk7bXcyMeMgt1xpL+lGDXAH+Ct8wq9nf/4g5SziJiSdKZ2DjD
         0X8qv6unXbjpcX1E0jA0PBDFxsgL+yOpKhHzO/bS85mLi7iRo9dEa8nOKqi/+/DTQyG2
         J5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDqtkW0SXy7Wg23G6JLZ/pzP0VcLf9YK56XyYuz8288=;
        b=hhu2p9rxIMrMjpVhl6b7atfLzwY1F/frsZj1cCux/Re4CwSVEX9jLGlz9nuaQ8HUnp
         OrIYZSDFiPrkj3ivWtHZuQyngk471jvlQRl9XCHIZ0/jBybPCcgRbqFJ5pEGgk/N6AsT
         sYJ+ZfcpK+HpQsZQ2YTkeqOMkXfvBTzdLArJmgyU1dLBJFelXYhzjEw7dwfcjtzJhvT2
         2INXmw6XVluVTTI2FKcePVBvTBUnjbVNjQLrjtUQdtWsF84dFiQu7G9hnE8xFW5RWONB
         RLNb5imkIh6o/Sco/jwM3WoF/fyly1bPrIHGVEKvK/atSpH4DOASWKDTc2fncBFWUkrc
         Wlrw==
X-Gm-Message-State: ANoB5pmcN3Y8ZZ4eCtSmfc2+fZMP0dcktOfAf6lsehIU6Gg9KLn/e/mQ
	J6jz3N7TLxvxYhppO1yACsmVCJlxxF0=
X-Google-Smtp-Source: AA0mqf62AftkU7o9z3jLI7zXyUbNwxGNxOVOm/cKx2uEcSn8YFxld47mH1gnNGd3F1uqYE+l3gvJKQ==
X-Received: by 2002:a5d:5447:0:b0:236:593f:2ab3 with SMTP id w7-20020a5d5447000000b00236593f2ab3mr9201013wrv.356.1668951092302;
        Sun, 20 Nov 2022 05:31:32 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b003b47b80cec3sm16295551wms.42.2022.11.20.05.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:31:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/17] quota: update 4.06 -> 4.09
Date: Sun, 20 Nov 2022 14:31:12 +0100
Message-Id: <20221120133122.2464634-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221120133122.2464634-1-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173588

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-realloc-3-instead-of-reallocarray-3.patch | 34 -------------------
 meta/recipes-extended/quota/quota/fcntl.patch | 27 +++++++--------
 .../quota/{quota_4.06.bb => quota_4.09.bb}    |  5 ++-
 3 files changed, 15 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-extended/quota/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch
 rename meta/recipes-extended/quota/{quota_4.06.bb => quota_4.09.bb} (89%)

diff --git a/meta/recipes-extended/quota/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch b/meta/recipes-extended/quota/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch
deleted file mode 100644
index 34ded2d857..0000000000
--- a/meta/recipes-extended/quota/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 02b222a335527f1031cc9495d8c5ebc1bc5b1d4e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 11 Nov 2020 15:00:47 +0100
-Subject: [PATCH] quota: Use realloc(3) instead of reallocarray(3)
-
-reallocarray(3) has been added to glibc relatively recently (version
-2.26, from 2017) and apparently not all users run new enough glibc. Just
-use realloc(3) for now since in this case there's no real risk of
-overflow.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Jan Kara <jack@suse.cz>
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- quota.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/quota.c b/quota.c
-index a6ed61f..a60de12 100644
---- a/quota.c
-+++ b/quota.c
-@@ -385,7 +385,7 @@ int main(int argc, char **argv)
- 			  break;
- 		  case 259:
- 			  fscount++;
--			  fsnames = reallocarray(fsnames, fscount, sizeof(char *));
-+			  fsnames = realloc(fsnames, fscount * sizeof(char *));
- 			  if (!fsnames)
- 				die(1, _("Not enough memory for filesystem names"));
- 			  fsnames[fscount - 1] = optarg;
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/quota/quota/fcntl.patch b/meta/recipes-extended/quota/quota/fcntl.patch
index 51a770ce6e..09a0c687b6 100644
--- a/meta/recipes-extended/quota/quota/fcntl.patch
+++ b/meta/recipes-extended/quota/quota/fcntl.patch
@@ -1,3 +1,8 @@
+From 00a456145531d194d3993c9f4cd404d5ca16c9df Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Apr 2015 17:36:44 +0000
+Subject: [PATCH] quota: Fix build with musl
+
 Include fcntl.h to pacify compiler errors on musl
 like
 
@@ -9,20 +14,14 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-diff --git a/quota.h b/quota.h
-index 4c21411..d20c217 100644
---- a/quota.h
-+++ b/quota.h
-@@ -182,6 +182,6 @@ enum {
- 	#endif
- #endif
- 
--long quotactl __P((int, const char *, qid_t, caddr_t));
-+long quotactl (int, const char *, qid_t, caddr_t);
- 
- #endif /* _QUOTA_ */
+---
+ quotacheck.c    | 1 +
+ quotaio.c       | 1 +
+ rquota_client.c | 4 ++++
+ 3 files changed, 6 insertions(+)
+
 diff --git a/quotacheck.c b/quotacheck.c
-index 2cdf475..07c18a7 100644
+index bd62d9a..772a27d 100644
 --- a/quotacheck.c
 +++ b/quotacheck.c
 @@ -19,6 +19,7 @@
@@ -46,7 +45,7 @@ index 94ae458..d57fc1a 100644
  #include <sys/stat.h>
  #include <sys/file.h>
 diff --git a/rquota_client.c b/rquota_client.c
-index a3a4ae3..0ffe7a9 100644
+index 7f8e821..d48505a 100644
 --- a/rquota_client.c
 +++ b/rquota_client.c
 @@ -19,7 +19,9 @@
diff --git a/meta/recipes-extended/quota/quota_4.06.bb b/meta/recipes-extended/quota/quota_4.09.bb
similarity index 89%
rename from meta/recipes-extended/quota/quota_4.06.bb
rename to meta/recipes-extended/quota/quota_4.09.bb
index 0535d14c20..b779657dfc 100644
--- a/meta/recipes-extended/quota/quota_4.06.bb
+++ b/meta/recipes-extended/quota/quota_4.09.bb
@@ -9,9 +9,8 @@ LIC_FILES_CHKSUM = "file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz \
            file://fcntl.patch \
-           file://0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch \
-          "
-SRC_URI[sha256sum] = "2f3e03039f378d4f0d97acdb49daf581dcaad64d2e1ddf129495fd579fbd268d"
+           "
+SRC_URI[sha256sum] = "9cdaca154bc92afc3117f0e5f5b3208dd5f84583af1cf061c39baa0a2bb142f9"
 
 CVE_PRODUCT = "linux_diskquota"
 
-- 
2.30.2


