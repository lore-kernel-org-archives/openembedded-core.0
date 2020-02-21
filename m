Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4A807616D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 17:46:07 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id j8so2553628qka.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 09:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3LxfLublw5/cjsT3gQnxruVRE4702ZWWMzRrMCkgjyE=;
	b=SC2TXb/8lRvNJIFnmynfZJnLPiJKnm8LQW8CsQgIGcon2oa+Nwbpqv5k4JtHLB99sV
	ON1UDjtvdCD6uq2Mjxv0TT4DA1GSPTYjliN/iz3felqS/RSjdC//xyIFNhwzRJ14kCFp
	2qDYggcFNL0HXvNa4hzrRAFmk//7i5TBpY344Lcb4UnW/dr1mS4Ja4QrseSQVv9+EL0w
	Lo0RnzMhTr/DBk2pblGZ8WCf8X7tDuO4cldGVoaAUT+9MitEb3jMFJsS5Kj4J6BTh5tZ
	CrNxWfiGU4IRlnRT9/Q9hnTij1b7Mj8rfjUFmkQnqB7gjGX/hwa979EIYmCACUaFT1Ni
	MVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3LxfLublw5/cjsT3gQnxruVRE4702ZWWMzRrMCkgjyE=;
	b=FWMKkj2WjpG0POU9HL6Dzt1EKKh4sLjFghNOAwhXGd6h2MoYE5SGoMoEpKbL201++S
	U+60m9HcBMxAxnO7+++kCEdISLLmOaRAhE0WR+JgO0wpteaJL5LYkG8Z83ONuVpk5/CW
	qQ4M0HsT4vnTpH11cf+xgzZbMFwU3p9XYLiM3f7/EFkqWz1LrKwpgZCIFICFqLctObYV
	O0oD+kApdI2GZqBYToJaOGZqMv3KW83pxYRDxDzElM9tbBVOcp70BZ/atG/Yy6Tob9WW
	Bk9r/qZnSegzzsl9DaI9ISf75rI2P5wAbWJJQ7ljUwvjeAgOeHSl6KETPNqNmevznRPX
	RuPg==
X-Gm-Message-State: APjAAAWW7M+5lovWwZmzbVKSwiOEkIK8lAbMgQRjOVDI738HYxJAG+J1
	n+FWvXh3f3ro98lrsBAPG7ovRrEbplf+7A==
X-Google-Smtp-Source: APXvYqzlVqoutNZUK4aoaR+VG1DGCk2zKvhWgb+khCi09SDgOGqvaNN4pWevcYPt8iVncaAX6MyGbw==
X-Received: by 2002:a37:7f03:: with SMTP id a3mr34754026qkd.121.1582307168276; 
	Fri, 21 Feb 2020 09:46:08 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	g17sm1855153qtq.29.2020.02.21.09.46.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 09:46:07 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 21 Feb 2020 12:45:56 -0500
Message-Id: <01bd9d3d2a0acc1bfd4e4eddabafabf8729bf003.1582306887.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1582306887.git.bruce.ashfield@gmail.com>
References: <cover.1582306887.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] linux-yocto: fix PV
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
X-List-Received-Date: Fri, 21 Feb 2020 17:46:07 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

For whatever reason, the creation of the 5.4 recipes missed the
PV that we've always had in linux-yocto. PV follows the LINUX_VERSION
variable and clearly indicates that we have git commits in our tree
above the -stable releases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index fc31dc869a..ab93f1bf55 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
 
-PV = "5.4.15"
+PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index cfecf986fb..097357d9c0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemuarm ?= "3805e4f98313c4a4c64ffdb06b6401de8746fe45"
 SRCREV_machine ?= "2358d789229f8d80ebe4b3e35d3819c4f0e00926"
 SRCREV_meta ?= "c11911d4d1cf0d0b069dfd1922b41256f61442de"
 
-PV = "5.4.15"
+PV = "${LINUX_VERSION}+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index aa17380d00..0b2a2305f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -35,7 +35,7 @@ LINUX_VERSION ?= "5.4.20"
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
 
-PV = "5.4.15"
+PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
-- 
2.19.1


