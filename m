Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id E1A727D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:46 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id cb4so242421plb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Nbu1UORCGoGyIrS5qRh61tGrZGrgCBCFyKyMhx2ChrA=;
	b=S+HK1gdUoEmJgvoFM6e8xJvSUTfmsH+TkZHveP6AiuRqZYhzh80sUSXB55quRuZGW2
	98l03dLQkkkGbgkSF4KkpSkZGZA4qFpyUWi2d1ewuVCKQaxEfcnaSj05qFclT//9Exa4
	TSTixyS/vrjgVNSUCKvupT1cnNXUingNiINn9MHX7FF5259US8Ju9jB1FHPHrUWi6Efa
	miBaNcYqe+6d8TJswpWyjeBmHIWGKtkf3jWs3AjM0y0XdgzR+PGuGFfDA3WYPJBSlAfS
	WprXIQ6lhrEpy7DmIvcMJHyHjdRXFtLg1OZvDV15SSQTlUb8TJl2D6Fj7wH39nEl+iD1
	pBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Nbu1UORCGoGyIrS5qRh61tGrZGrgCBCFyKyMhx2ChrA=;
	b=dNAh1iEU9Wd4200yifwNsrSYhkZ6gAq8olHK2rA1nWtJaYJGm85MNRjZdE3xOGbQb3
	6fgr7p3grxgzbwIr5mSeyUK4jq9swV14rR+H5pIL4WtTiajZN/Yrxb7yOw1oyIAQISAJ
	rVt/6hoGZNDnjxIBRCStlqYQDp4G2JomsQwNASxr+u74c9Uf2BUJL4jCkmrlTbC4Tn+O
	F09ILG8mfF5WNp7Hmk/4lxI78MM4zAJ4r8lDA3JP1Cj+ZzC2v88QAMbaqvtQQVNLyvY1
	X09/fyEHXJidfACoooeu1nv+HUOFoAyNlM6H3riTYr/AbBdrXJXSqQ7WJ+tgyrr2wSlS
	CouA==
X-Gm-Message-State: APjAAAUk7+C5kTL6BHkdtJk2c2w3tyQgn2rqNadeX1UuUeZWLlTme27W
	yyG4pgYIxgpYRofZ6gl48cAvJOqo
X-Google-Smtp-Source: APXvYqxHA6I40Qv/HUacWs0Yg05XVZxXhVm+embegHZczNQa4sc9HrIZeERMJJ7fN5O6+490FeSf7g==
X-Received: by 2002:a17:902:e293:: with SMTP id
	cf19mr20146134plb.151.1556983668126; 
	Sat, 04 May 2019 08:27:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:58 -0700
Message-Id: <732fb99d458926d2267ba39088472d62acc8f3a2.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 22/43] core-image-rt: make sure that we append to DEPENDS
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
X-List-Received-Date: Sat, 04 May 2019 15:27:47 -0000

From: Naveen Saini <naveen.kumar.saini@intel.com>

This also fix postinst intercept hook 'update_gio_module_cache' failed warnings
that are now flagged as errors after the recent chagnes at lib/oe/package_manager.py

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-rt/images/core-image-rt.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/images/core-image-rt.bb b/meta/recipes-rt/images/core-image-rt.bb
index 9cb93b3..053d232 100644
--- a/meta/recipes-rt/images/core-image-rt.bb
+++ b/meta/recipes-rt/images/core-image-rt.bb
@@ -10,7 +10,7 @@ python () {
 
 DESCRIPTION = "A small image just capable of allowing a device to boot plus a \
 real-time test suite and tools appropriate for real-time use."
-DEPENDS = "linux-yocto-rt"
+DEPENDS += "linux-yocto-rt"
 
 IMAGE_INSTALL += "rt-tests hwlatdetect"
 
-- 
2.7.4


