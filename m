Return-Path: <armccurdy@gmail.com>
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id B66EC74812
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 May 2018 01:18:17 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id n1-v6so7976893otf.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 18:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZrC8I9zavDpA+i9S37wc+vODHB9hkWPBuDfLVNpNfSo=;
	b=AYYezoaBmF1Dmcbq3xMdO0tHYTA0Z7RLRMzH8vpLPSUBKvo1VkDyxcYWgxjiDrZIjQ
	C0BgS2Q+lWGVHVcV1kffrwHWwQH73Vtp+qf2W/ytAT0p1XWe8+PK6ofbRQkPOJx+4tnW
	6EbQ+xqOwcv6ZVQHxrh9eH9weiKAgcMpkkFCuQ9o5qUnbxlcwcemN9U2Nsh1ey92oWxR
	yz4ghRCH5LbbwFbdvJyHE/zyKl3A6NwRfRmVk7U8ZHeQRu+voAkLBkVFmMuUDal77R9w
	WOyU4qngeVlUqJQdqxKu7NPZjDES6SFyLCE58OREULj2ua3zyZ1F7w0rfErvJrpadLmp
	gcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZrC8I9zavDpA+i9S37wc+vODHB9hkWPBuDfLVNpNfSo=;
	b=M5oOJHMt3Ao9Vb/nRuV3DD91NzbYdR9oeUrtCOJazIn8zeulwx7eoLAsd4ume+S07w
	nJDbFvDhk+fjDC5DNDqgjBPNivl7YyJtgjhhoRSo+RYUm5Q2k2ydTaa/8yX/hX4HjVoJ
	6Iw9AaC5Z+x1NgzxBOZtuRWgFJpQwcdGGW58eUC+TLeIgFGkq05Ra8QOHUR8qhd9DwgM
	8bv2koqnAEFkfV4WIXzfPgcKPr8FawV6sHztnL+cKyccnmt9FM5XbSvBJq0EdQQ9+4bL
	3mREqnA+bk/0zeT4HKcKc20OUUr/MyU7aB2niVjHZ0OA+oN4WMTER0ioolGAWRjK2qBo
	2LcA==
X-Gm-Message-State: ALKqPweFAhrospzyw+f2mG7nPYXGuCBliHgIqM1yHRySHQ/XXe2FVw0g
	8isj/AVkrA6VO2JOEkH37VNxJw==
X-Google-Smtp-Source: ADUXVKI83BLkvQHgiIjGt5po+hAf9n34p+JQfR3auyL1adyWOVKEj35O0Id+1ybua/TJ12vTlJ3xzA==
X-Received: by 2002:a9d:5137:: with SMTP id
	c52-v6mr2863717oth.22.1527297498439; 
	Fri, 25 May 2018 18:18:18 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n50-v6sm15726144otb.14.2018.05.25.18.18.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 May 2018 18:18:18 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 18:18:08 -0700
Message-Id: <1527297488-19530-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1527297488-19530-1-git-send-email-armccurdy@gmail.com>
References: <1527297488-19530-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] bitbake.conf: include ASNEEDED in TARGET_LDFLAGS directly
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
X-List-Received-Date: Sat, 26 May 2018 01:18:17 -0000

Previously, ASNEEDED was appended to TARGET_LDFLAGS from
as-needed.inc via tcmode-default.inc and so may not have been enabled
for external toolchain builds or other configurations which over-ride
TCMODE (ie builds which do not include tcmode-default.inc).

Include ASNEEDED in TARGET_LDFLAGS directly from bitbake.conf to
ensure that the optimisation is applied to all builds (and for
consistency with the way that TARGET_LINK_HASH_STYLE is handled).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/bitbake.conf                      | 4 +++-
 meta/conf/distro/include/as-needed.inc      | 4 ----
 meta/conf/distro/include/tcmode-default.inc | 3 ---
 3 files changed, 3 insertions(+), 8 deletions(-)
 delete mode 100644 meta/conf/distro/include/as-needed.inc

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 15f6da7..fab3dcc 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -585,8 +585,10 @@ LINKER_HASH_STYLE_mipsarch = "sysv"
 
 TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_STYLE') != 'gnu']}"
 
+ASNEEDED ?= "-Wl,--as-needed"
+
 export LDFLAGS = "${TARGET_LDFLAGS}"
-export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
+export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
 
 # Pass parallel make options to the compile task
 EXTRA_OEMAKE_prepend_task-compile = "${PARALLEL_MAKE} "
diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
deleted file mode 100644
index b163fef..0000000
--- a/meta/conf/distro/include/as-needed.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-
-ASNEEDED = "-Wl,--as-needed"
-
-TARGET_LDFLAGS += "${ASNEEDED}"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4b58df0..d85fd1e 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -65,12 +65,9 @@ PREFERRED_VERSION_glibc-initial            ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc-initial  ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
 
-
 PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
 PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
 PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
-# Setup suitable toolchain flags
-require conf/distro/include/as-needed.inc
 
 GOVERSION ?= "1.9%"
 PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
-- 
1.9.1


