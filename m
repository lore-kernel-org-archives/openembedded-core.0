Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 05139782A9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 18:26:42 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t74so14005104wme.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 10:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gwyNz8ZIha8XVWbcO5vcU0C10Fasbo9SCEJ858PqAXQ=;
	b=Ckbm0K97ZiBPf8yrcg2IfzaN1OyWgX8vjCOa0KZV4D4Zqiq9IJNrKLYdZtcFycLf1v
	TOg+UMxMICwpIZhk3mxzW5yEv/TWnd4Rbg/mLjIHg48y2997bT1q8sxagFmTHqn7UIEW
	QOd9YID9MpB0A0Cvk0q6QlDg1hUm0wGXg5s9v99y99kaAdzGTbD/UspLlgVNIAqWexU3
	gEujcpqoYodJ7ksVeZbisdbCoESedi3htN++sF7vzOH9LjyxTRYxwzMofbAtOm4fs1rQ
	c1QGkSG2+L+f77ep7EzbOpeZEvRXnTcgiSpS2B9AR7nUL+UrROxqBsPidqWA4CbUIEZ2
	FSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gwyNz8ZIha8XVWbcO5vcU0C10Fasbo9SCEJ858PqAXQ=;
	b=JbBxNJzkE0VHN/X7e8Zptxith7LoZXbAVnNzyCZ3gaKewLnS35L9A/by0J4uoSfpVq
	XlMkdFmoo156lbzrAv0hz+tvt9wlUJdUvuZcPig9x9kqNmQWC5naP0vVCossVb60ayTG
	7IyE1vklaf2D87mcXUoh+5fwE2uYNs3vtjxD6rn7nLHAjN7856i1PtGWecO+dWqKpOOO
	+xMjM/hTqtJoiJJBSepGNoB1O2KOmudabtUD6U0a02CilEmk/Kc/yNGNsi1oYI2p9w0J
	zrsD9Odk6z31kEHFg/lOmkLWjTkadQ9ihLFLVHb93aWg5GSKf2i9IT0LjNJsDIks6LAv
	6xnA==
X-Gm-Message-State: AElRT7GoytnySxexX5X9+W73+yiLu2S5MZ8WmAny2r5sdbD8ajUhOm/B
	Pzs5f3XAi82lAvruxP8FYK6YWYCv
X-Google-Smtp-Source: AG47ELvgtWsyLpuC1QxQtYUKJ8F7N7/EL8O2gJ90lKEh9YaATEtEEQxlsCfN8TYoJrNP3De3S8OCYw==
X-Received: by 10.28.235.4 with SMTP id j4mr2769817wmh.52.1519928803768;
	Thu, 01 Mar 2018 10:26:43 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h188sm4955285wmf.23.2018.03.01.10.26.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 10:26:43 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 18:26:26 +0000
Message-Id: <20180301182634.20502-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180301182634.20502-1-ross.burton@intel.com>
References: <20180301182634.20502-1-ross.burton@intel.com>
Subject: [PATCH 03/11] glibc: don't use host locales in nativesdk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2018 18:26:43 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glibc/glibc_2.27.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
index e9d4117a470..b6b66250224 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.27.bb
@@ -133,12 +133,6 @@ do_compile () {
 
 }
 
-# Use the host locale archive when built for nativesdk so that we don't need to
-# ship a complete (100MB) locale set.
-do_compile_prepend_class-nativesdk() {
-    echo "complocaledir=/usr/lib/locale" >> ${S}/configparms
-}
-
 require glibc-package.inc
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.11.0


