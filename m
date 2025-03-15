Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED51C28B28
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 10:24:48 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.7204.1742034282463712376
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 03:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bHK0K4fN;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so3146675e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 03:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742034281; x=1742639081; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwkH+akqEM/sl7hthMHgdzFvfW9jjqRRcMUORZZW/0c=;
        b=bHK0K4fNsOAZPQiERoaKkh/meaLxdxqRHf9F9IPkUeMQjkCwiN5UaE4s/UKiMt2qKq
         oRZ/fIHy4R7fZLz6/fll1R4NZx9YLs91NB4VzQW+DqArAccKDhQeYArrbec+6YPdpFMr
         a6DAJnqg65IPK4l43zIpnvdA68wFA3DbEspn5YXn0ZCI9ehrp3orkgvKrQWg90vvf0A9
         BWdnX1WrvUcuPp8kr9LetcunMnZpwrKlEqqU67crVCnH4VghE5fx4YvQCHrko97Xj8QX
         /Wpuuc98hXcqbze9xsTe15mah6W03rCA75Tb3UwgmlWpGXvdQNL+yx6oVJ2Kvp6k48Cf
         srww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742034281; x=1742639081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwkH+akqEM/sl7hthMHgdzFvfW9jjqRRcMUORZZW/0c=;
        b=ShHfZga7Uz+SQnzaT+F4E5q+IeQ3oygIEtb+hRyPwHxV8TKphVrYRju3h4pIEA4Rz7
         TTHQUq7KR4UL7+fhV3rtQHV9lOKY9gCJh4mXOSx3gQYAGXyfZe4QHIzD6LiBgUu/At29
         CqdTpCs67xAyWouJvd2yemr4WUhn8HQOghZ07ZSiL/f1pC7pr+1pXplAzKN2PZEXGIDV
         aarx1FU+K4Eq73zQ6Np+IxczdLlyJC4x0Wkd8FLfzMFYHrQWsV5dWuByRP+o6jL+81nx
         BVRA4As2o078CUtpPHuvHV1ADBLzwsOnsxkT9P1HFAxftVVd96FkmdaLoAQiluw/3xOU
         gH/Q==
X-Gm-Message-State: AOJu0YwKHE5tAINEz2DKzhWuE3fAGNZlkuxRWyErLyfTEyKudrMqaW4m
	aGmkWQ1l2oR/v/ThvvlavVauViIvRTlaCVdEiSLmUbRvA451RVDa
X-Gm-Gg: ASbGnct86t4z4HrnXP9MBoy1DEre4jTBy+CRHc4cjg43+IgQaqIxUc23PQ6skR40sV0
	MLFni5prKciqpbYbgMYeOUExrN+gchf3myH6ildk0VmiTlgkqvMq1Dgwjf9jViqjbQ/O04/l0oy
	ylNp2Dragk8gPUslQL/Bmh968V0IhLMTrkOXoPSPz/py0U24fbbgU1bgIKptaKJxBOvNUhGs+LN
	L8PrR9WD3CZWu6C8CfXD0OlFmhUuV95M3y4HeimmPYYA9xo1zuOAfRKQ+2T7QXwGGhDZZ+2Wo4G
	tsJCOnhmONVufwxsFldAoRkdcv07WAOpxuSR36E21lR8+TAB6/OjyMnyy7gjW6rzJIipHCZdWPn
	5+pDruEFl7aT+ryA2fmSD1A==
X-Google-Smtp-Source: AGHT+IHQK4I9x9d/jscdG5mLN3XBnHQBQPb4G6yKN03rkZZon1FoTTrVMAoPe9Q1Skupo/1aZh2VPQ==
X-Received: by 2002:a05:600c:548c:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-43d1ec7795fmr69294775e9.9.1742034280524;
        Sat, 15 Mar 2025 03:24:40 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe05e8dsm45186145e9.9.2025.03.15.03.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 03:24:40 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 15 Mar 2025 10:24:38 +0000
Subject: [PATCH OE-Core v4 1/5] scdoc: Import from meta-wayland
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250315-kmod-v4-1-946682cc4090@gmail.com>
References: <20250315-kmod-v4-0-946682cc4090@gmail.com>
In-Reply-To: <20250315-kmod-v4-0-946682cc4090@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 10:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212870

scdoc is a simple man page generator for POSIX systems written in C99.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/conf/distro/include/maintainers.inc           |  1 +
 .../0001-Makefile-dont-add-static-to-LDFLAGS.patch | 27 ++++++++++++++++++++++
 meta/recipes-extended/scdoc/scdoc_git.bb           | 25 ++++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5515d46ca5b1aad22c46665c78e4707bc22e3a0a..2b47d3103c03b1b8a11f40566fdd5334d906860d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -761,6 +761,7 @@ RECIPE_MAINTAINER:pn-sassc = "Simone Weiß <simone.p.weiss@posteo.com>"
 RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-sato-icon-theme = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-sbc = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-scdoc = "Alex Kiernan <alex.kiernan@gmail.com>"
 RECIPE_MAINTAINER:pn-screen = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-seatd = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-sed = "Chen Qi <Qi.Chen@windriver.com>"
diff --git a/meta/recipes-extended/scdoc/scdoc/0001-Makefile-dont-add-static-to-LDFLAGS.patch b/meta/recipes-extended/scdoc/scdoc/0001-Makefile-dont-add-static-to-LDFLAGS.patch
new file mode 100644
index 0000000000000000000000000000000000000000..b520e949c0b31c0908118cba4f6c2b6ea26f5a26
--- /dev/null
+++ b/meta/recipes-extended/scdoc/scdoc/0001-Makefile-dont-add-static-to-LDFLAGS.patch
@@ -0,0 +1,27 @@
+From 2cac433806d9622dbc005fe5738f1ae8c33a98cb Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 13 Jul 2023 19:26:40 +0200
+Subject: [PATCH] Makefile: dont add -static to LDFLAGS
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 60a80b8..49021fa 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,7 +1,6 @@
+ VERSION=1.11.2
+ CFLAGS?=-g
+ MAINFLAGS:=-DVERSION='"$(VERSION)"' -Wall -Wextra -Werror -Wno-unused-parameter
+-LDFLAGS+=-static
+ INCLUDE+=-Iinclude
+ PREFIX?=/usr/local
+ BINDIR?=$(PREFIX)/bin
+-- 
+2.39.3
+
diff --git a/meta/recipes-extended/scdoc/scdoc_git.bb b/meta/recipes-extended/scdoc/scdoc_git.bb
new file mode 100644
index 0000000000000000000000000000000000000000..224e5417342e9db820456ec54476a1e3cac0e4e4
--- /dev/null
+++ b/meta/recipes-extended/scdoc/scdoc_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "scdoc is a simple man page generator for POSIX systems written in C99."
+HOMEPAGE = "https://github.com/ddevault/scdoc"
+BUGTRACKER = "https://github.com/ddevault/scdoc/issues"
+SECTION = "base/doc"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=31752b4a8edd3fb9ddba1cb90fada74d"
+
+SRC_URI = " \
+	git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master \
+	file://0001-Makefile-dont-add-static-to-LDFLAGS.patch \
+"
+
+DEPENDS = "scdoc-native"
+
+S = "${WORKDIR}/git"
+PV = "1.11.2"
+SRCREV = "afeda241f3f9b2c27e461f32d9c2a704ab82ef61"
+
+EXTRA_OEMAKE:class-native = "PREFIX=${prefix}"
+EXTRA_OEMAKE:class-target = "PREFIX=${prefix} HOST_SCDOC=${STAGING_BINDIR_NATIVE}/scdoc"
+
+inherit autotools-brokensep
+	
+BBCLASSEXTEND = "native"
+

-- 
2.25.1


