Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 82D0B7E382
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:21 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id d30so8444530pgm.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zA57zyEhI5OlMDdSTY5vuKCsRM//g6AEsmwvkVODuAk=;
	b=rJjgapANyDImu0MMidIXLXN4fdn56F66sCJZJk3SoWen5jEfkR/2y2kkb2Cx6+YnZS
	LSEzI/uYfSRtBMKCFrqfuJV39/DSkLX85DZurdONvMoevFBTUZBFMKkpEvAsKvabFknY
	aruTTDWBJWakvApzijOCbn5c81MaTPVtKPe0jKQAZMyrUPmVtIP8axLw1n6RtyNxBSXr
	xweYDVPCTX2rYQbtrfKNqBl3mOBzMRaq4c/FW5dJJ7GbBsN5W0kadBg4bt5IFv1DFF4T
	I0TgHs/7u+mmRNGCvz6fVqc4wSeAFisaT0TNKCSlPZGtFjLrPww/VaMxFc9rMgdbBckK
	aPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zA57zyEhI5OlMDdSTY5vuKCsRM//g6AEsmwvkVODuAk=;
	b=V28X3y1sNSTg/v7BVFVJs9/27EmmihThZdLxrS84ypptin5D52PPLIMk3Uo/yPae+M
	GG7GulorRiUKJ00LvOfWNOQACQFmsnE5Qs6wFCLgI1bXY9a1lqt2tAwXbYi6eN7RrIjF
	3Kyn4+1okeitokPtYz2oG1hK1alycndRWuzb/FDvnDQiKioMfQnjev28jTb+bvH1fzcv
	MCNaVL+xC1nooyIvOAt1c8scqP2f9vQbMPMQnBI79ZbNeQ2pzziSJ1KWBSvxL7BSYp2b
	S1preVSTzJlUEj3b2LyzyIcB7BnKWBIRypzmGX7ZO1y3V6f/AnwV2R8v0YFRq3ZR4T1+
	rGCQ==
X-Gm-Message-State: APjAAAV9Jg5KCuAFQeF/O21IRkUJLLcrZzv/ZPodE//lDnhnJoPti6q0
	vkubwzYEFypzNx5g2qey+fQdG/4P
X-Google-Smtp-Source: APXvYqxda7xAoRNzJYDeOhY8ToYJrtqW+z4CKxiMkokNh+uDEE/h+I+/EfPfnvaxQEpbdiBaZAxPKA==
X-Received: by 2002:a63:d652:: with SMTP id d18mr29941658pgj.112.1559574442450;
	Mon, 03 Jun 2019 08:07:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:06:59 -0700
Message-Id: <ea2fdbd84da199c89081a824ecb0b97cf5a56bdf.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 16/21] bash: Fix bash-ptest dependencies
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:21 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Bash's ptest needs glibc-utils (for locale), some extra locales for various tests
it uses options busybox doesn't support for some tools, hence coreutils and also runs
perl for some tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/bash/bash.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 2e7f261..4b3692c 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -23,10 +23,10 @@ ALTERNATIVE_PRIORITY = "100"
 
 RDEPENDS_${PN} += "base-files"
 RDEPENDS_${PN}_class-nativesdk = ""
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make coreutils perl"
 
 DEPENDS_append_libc-glibc = " virtual/libc-locale"
-RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-fr-fr locale-base-de-de"
+RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-en-us locale-base-fr-fr locale-base-fr-fr.iso-8859-1 locale-base-de-de locale-base-zh-hk.big5-hkscs glibc-utils"
 
 USERADD_PACKAGES = "${PN}-ptest"
 USERADD_PARAM_${PN}-ptest = "--create-home --user-group test"
-- 
2.7.4


