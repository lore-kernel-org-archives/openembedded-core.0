Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id ABAD261A92
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 01:42:51 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id 12so2887198pjb.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 17:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SurICGrLduOuKpwIdcetNRcUyogdSZd2ZHKJrgRjxYE=;
	b=u/9YLTZLtFm6VLpbeRURcB52HWZqwEUYoVRdhpULYELe1JEZnwwjrC+9f0v3b1qQbC
	6GIX2i/tmmjhsQKBKBjmhBUvP4XdR1gGi8ISJVArq+23EGrEv+bpcKQ5TW0M/fyHA1el
	8Xk5h5819XqujBGM0XmafOAyPM+8biJD/zZ4Afr95xYcYKBM6ee+3EksSLY41WervSCt
	B8MMNM1+El5bgf1EUZ68JumKCMPKFwYMKymv85j6HOZTPkSIHlpJxsl3COBTUdUcvVRz
	zRYgkSULM0xNtStq8HOj7Ao4rxWBrNaB010Y3/1ZooEwlNplEywCi5kmOxb0ngadcRjW
	FKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SurICGrLduOuKpwIdcetNRcUyogdSZd2ZHKJrgRjxYE=;
	b=EhKQXT0doNsdDfRw937HMSoA1iwOFkPBshsWVXOWITr1q/KeDcP56VxEjwWYgnhb1O
	M5FiRQCpU/G79QZh0lkf/XwvdCNeM+Q54JtpiN1vqCxHlhF0og6iFd8HE1ey08QlrP4W
	hYfgn03QVvKFyFvGBz96I/xVGyHhLOAdzhrG1lU1TlnHCo5NPvI/JXUVE8tsColA8pVj
	hEeB9rD8Y0YoTfqAG2WaY+1a/gFzPtByjc7PJRTkRhvNCeRTN/yWRH3UppN2gpI4MqwW
	6XyQSXKq/mz0Kdsmm+g2g3zyWeEHa5CwzbdfqBHbF9w33uV9/rDjQEkhfHxtgnTGy4Zd
	0Gng==
X-Gm-Message-State: APjAAAXKPOcP25z/PX0yiRpZILwMH3orlF0Xckjtj1ZdQN03l9jQwXM3
	cQZBdKEPGKQi2/MQsTTo3+G7FbS9zVw=
X-Google-Smtp-Source: APXvYqygK2OH2xtuhmc2gJP3YgWZn2tSqEwepncJ15FW+F7kzZGziVx3Ce53+roc9o4nSDSGKC3Okg==
X-Received: by 2002:a17:902:9b8a:: with SMTP id
	y10mr10685403plp.114.1583026972479; 
	Sat, 29 Feb 2020 17:42:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1634])
	by smtp.gmail.com with ESMTPSA id
	hg11sm6753702pjb.14.2020.02.29.17.42.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 17:42:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 17:43:01 -0800
Message-Id: <20200301014301.805156-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200301014301.805156-1-raj.khem@gmail.com>
References: <20200301014301.805156-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] boost: Fix host-user-contaminated QA errors
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
X-List-Received-Date: Sun, 01 Mar 2020 01:42:51 -0000
Content-Transfer-Encoding: 8bit

bjam calls cp directly, which can install with same user name as bitbake
in staging, which is caught by packager and reported, therefore override
cp command to use right options to make cp behave like install utility

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index e15dce4e1d..7f44638135 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -189,6 +189,7 @@ do_compile() {
 }
 
 do_install() {
+        export CP="cp -R --no-dereference --preserve=mode,links"
 	bjam ${BJAM_OPTS} \
 		--libdir=${D}${libdir} \
 		--includedir=${D}${includedir} \
-- 
2.25.1


