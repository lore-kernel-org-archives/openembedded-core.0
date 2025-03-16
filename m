Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B1DC28B2F
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:32 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.31710.1742141544718603984
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y8P+bmjn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so6846605e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141543; x=1742746343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7H20L3LWcLRtAnVuYrmuxKgZFefUGpzBOj+bclNHyLw=;
        b=Y8P+bmjnXXEaD4NV7FEZKWJEILEduZKzGF5BtgbTW5bH4Xqc+Oww+XymuwP7l8a/DR
         6YloIGnsOpcfqhWHTwU3RUMXpDamNzS3fGUyxDJmpQTnb5DGT/sHLf7z1S7jsPmH8Dng
         1INnPsnAcWSS7VL6Xmp5kSfhvPCHNdfmUwFow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141543; x=1742746343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7H20L3LWcLRtAnVuYrmuxKgZFefUGpzBOj+bclNHyLw=;
        b=coit+wxhe4L58gjzt0nUGbeu0E/hJ/02UNlQnYW6WK8W3e/vdxSXLCk2+HjAlv6boi
         jIhNgExTHeot1p/XqCj1KtF3+uaceuEDvnvLO5ri0cfyD53EwO/4GJ7yN2p3SZNIEfOC
         3sbVlbIOXR68OOY5mIcefZq7tYWt6sBoOCZkezc6CtiHWEDbDmGhaQR/+4yE+MfVlL3d
         +VU6pkrxpX0yP4rq7LlB0rbHyUCWF/8BM5D9LCjTG5xIHrS4Glp4NWgNXBZ2VI7Pinmc
         9qhFQirjZ3c7unEiX4WNGqwhV+Nxz9w8bBXDGUlIJkD5wAQKMcLjixHfsA5GiqTS8bX6
         y16w==
X-Gm-Message-State: AOJu0YxqaP25BwazQPe1VwOgRJTQcokoHF9Y2aYn/Bm0DD0hu8wXxba7
	fb+jYvpeXzKW+n622UBcq+XzoPIjxUBj3gUkQMBxetGoWDHNvaFmDt+QO93Wx/lElFkH4r/XmT9
	u
X-Gm-Gg: ASbGncvCCeW9xJ374atzNxJKEBv4KXtXbssDnlx+IvlwM5QE1t1IyB3sIY9+DJK1BBn
	5A/KWfcM6LXV2IaryRufghULbkvA0ol6rTv/D9gHove1I3rn2MPmP0Fypw5z60CHGA5cKt7DUbn
	Or4JrZWv0Mgh7lGutz3h+GAP6k+FuyJuV1neTalCEbTRCkBFJxFgowfyGZLnED2bRzD3IBAl6Zz
	T41z0UrbEq0jZQudKR9j1pp3JfraPWg4n1VCmnNYyuKVfp0Rh+9eqVdFR57z2vjIsa4n40zMTJU
	/0w0l26ZeM9G/TCBfhv9gBncSQaDu5fZW1bZ4SVpyr9DefBsXT7nGN++hgfhhPsnMfqonbtBefJ
	pCp4tkxxl
X-Google-Smtp-Source: AGHT+IG7k5AdN9dAEGdyDj89kDz5KmJwmUQGHIXxn6xV1LxOmfXED0Tm2SuXuMidHplx6unKAyDhEQ==
X-Received: by 2002:a05:600c:2d56:b0:439:5d00:e78f with SMTP id 5b1f17b1804b1-43d180acd8fmr140759605e9.11.1742141542751;
        Sun, 16 Mar 2025 09:12:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/43] git: upgrade 2.48.1 -> 2.49.0
Date: Sun, 16 Mar 2025 16:11:35 +0000
Message-ID: <20250316161209.3629986-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213012

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...nfig.mak.uname-do-not-force-RHEL-7-specific-build-.patch | 2 +-
 meta/recipes-devtools/git/git/fixsort.patch                 | 6 +++---
 meta/recipes-devtools/git/{git_2.48.1.bb => git_2.49.0.bb}  | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/git/{git_2.48.1.bb => git_2.49.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index cbe9a32fa1b..61bf0e12dce 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From 2a97f61c558a03282c7d81797f1cd8b594f953dc Mon Sep 17 00:00:00 2001
+From 325c30dac4eafdd463c8ffcfe1215858d642ab91 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index e01953e324e..e077eba8ff1 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,4 +1,4 @@
-From 0ada98b8e1de3fe835b439777303dfaf9ac65a08 Mon Sep 17 00:00:00 2001
+From 65fa5c0f849fe4a1e3cb8e6af0086ef0748c28de Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
 Subject: [PATCH] generate-configlist.sh: Fix determinism issue
@@ -23,12 +23,12 @@ Upstream-Status: Submitted [https://public-inbox.org/git/f029a942dd3d50d85e60bd3
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/generate-configlist.sh b/generate-configlist.sh
-index 5794226..6b0b939 100755
+index dffdaad..cc35a21 100755
 --- a/generate-configlist.sh
 +++ b/generate-configlist.sh
 @@ -15,7 +15,7 @@ static const char *config_name_list[] = {
  EOF
- 	grep -h '^[a-zA-Z].*\..*::$' "$SOURCE_DIR"/Documentation/*config.txt "$SOURCE_DIR"/Documentation/config/*.txt |
+ 	grep -h '^[a-zA-Z].*\..*::$' "$SOURCE_DIR"/Documentation/*config.adoc "$SOURCE_DIR"/Documentation/config/*.adoc |
  	sed '/deprecated/d; s/::$//; s/,  */\n/g' |
 -	sort |
 +	LC_ALL=C sort |
diff --git a/meta/recipes-devtools/git/git_2.48.1.bb b/meta/recipes-devtools/git/git_2.49.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.48.1.bb
rename to meta/recipes-devtools/git/git_2.49.0.bb
index e0df23eb477..66082d0bdea 100644
--- a/meta/recipes-devtools/git/git_2.48.1.bb
+++ b/meta/recipes-devtools/git/git_2.49.0.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "51b4d03b1e311ba673591210f94f24a4c5781453e1eb188822e3d9cdc04c2212"
+SRC_URI[tarball.sha256sum] = "f8047f572f665bebeb637fd5f14678f31b3ca5d2ff9a18f20bd925bd48f75d3c"

