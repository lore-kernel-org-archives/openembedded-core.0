Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 37B917D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:39 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id o5so4147723pls.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=POTUzHnyFzZDu5fnCb6t/KiA2pIV1dSkGGg4+IFxTsQ=;
	b=O10ThFGCsD6s8an8VTaGsNV4suqvntb+RXykp0KpTZhkQi9UzFuJvnHa80s/lp/9D+
	RvDv1defkbSlv5dfpOpDtlNW6P1GkPqEqcKUVnSInymq5J560oh4AHkJgefgFqd2cWTQ
	ZgtoQ7COO4q5FVZLLONIM2vowFj8HNLXN0Qk+MAVeVrEEZExDsx7xZHx34Xbi7yvdiq/
	Jd24BoWIhctT15Lskp+72YOok8w8k8PU+2hinPbP2xEGrJZ25CYjeVXwi1xl9HkpQizF
	GOnxwgNe90tbLvifABZWlYhesoT/ofUXfCy1jrHLisSHlHFtCneuDN+WDg76kXnrFr/8
	mQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=POTUzHnyFzZDu5fnCb6t/KiA2pIV1dSkGGg4+IFxTsQ=;
	b=biDaj0qAR5ud+ObkYuzZL9GTpVSAiAzahHA4giO91h0xmuwcmXhRXGhU/sDQ9srZEX
	8saROFiI05DBWkUFPJZ1gFpSsVNr82YQLlrOcPPayEy5RWLXf7zi+Q3FcCJUiYDrVuDm
	ayF1jXAs226iQg+IaXblb06wcnDtI6mJs7NqCxd2niQJS8vk4kasLr6k34t93mtYFE+B
	z2N0SsyAMvIE/NQNfpXIriy2lhgjIwQBP0yrCij15EAeYvmAmDg8Rt2QNjhHHUYYErRh
	11aBKpP5tg9D3bqMcZ9LcHVO5QocY1uO1VHa5Fvgx9v2j+yojByKmdKaojj2BV9m4EV2
	inug==
X-Gm-Message-State: APjAAAWsGMoYsds0fn6AVOZFvYJtW8TSWSz2X33tdai+EdgbzcNkJbq5
	P66Tr0MtmvvQ3k26SSSlQPgIokQB
X-Google-Smtp-Source: APXvYqxzMxMifiXO1lqgtytHbmjgf4mJ0/oIUj3gtHlf4vo/9sjXuMmXw0qE1qpP1n5u+93Hbyr/qg==
X-Received: by 2002:a17:902:322:: with SMTP id
	31mr14960193pld.204.1556983660184; 
	Sat, 04 May 2019 08:27:40 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:50 -0700
Message-Id: <2eab107e88800a62f7cb8d7f9f01e77214e9dcee.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 14/43] base-files: move hostname operations out of issue file settings
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
X-List-Received-Date: Sat, 04 May 2019 15:27:39 -0000

From: Chen Qi <Qi.Chen@windriver.com>

The function do_install_basefilesissue is meant to deal with
/etc/issue* files and the following setting could actually be
overridden.

  BASEFILESISSUEINSTALL ?= "do_install_basefilesissue"

So move the hostname operations out of this function.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index a1639db..4b4027f 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -134,15 +134,16 @@ do_install () {
 	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
 
 	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
-}
 
-DISTRO_VERSION[vardepsexclude] += "DATE"
-do_install_basefilesissue () {
+	# deal with hostname
 	if [ "${hostname}" ]; then
 		echo ${hostname} > ${D}${sysconfdir}/hostname
 		echo "127.0.1.1 ${hostname}" >> ${D}${sysconfdir}/hosts
 	fi
+}
 
+DISTRO_VERSION[vardepsexclude] += "DATE"
+do_install_basefilesissue () {
 	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
         if [ -n "${DISTRO_NAME}" ]; then
 		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
-- 
2.7.4


