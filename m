Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2287F77FA5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 09:30:28 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id c13so96916877qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 02:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B5QpZRKuKd68QNUxT+cFgwVpr4TjOi6w7LPt+jfjrnI=;
	b=PTBUmasv4RdUbSeTeQ1L3n6soJpMFMIIVWipyqE2ZWjyADM8BaZ18antAiliCaz6ug
	b0Wqz28nrJdcXxd30HO8aYzvYHOsCvugcCP2V3elBIkuakr4mWEUTfp+EZ51ju81/l6Z
	XeXOjDCncmIAciFCh3wEZBnv0Uc7s0wIVJfR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B5QpZRKuKd68QNUxT+cFgwVpr4TjOi6w7LPt+jfjrnI=;
	b=WVbVFaoEVPMCmgZf4u6BgqVIoW4Rdu5uiqFkSb2zvyfou787F0lnHkvuXmwPw8+SPb
	aHAiOtrtxOJZM8mLC3LyGGT+Sc1/4TXy0FzuYov0moRi4+nLXN++berfKlGjX0T7twYL
	Dk0Kev/wn0vmXHztHGdUOEupLJVdJXP/ZezKJ2ofjU0sv/vTUTZCK3cOEusNiWhvKgNE
	1RvbyN7xNzMovYvpBxXikQoSYJ+rrVWWahSkMsD+WSg7bePAbfjueu7rENkeUNtgO8NL
	kTxxwc+0Ft69C1YxwHz52UQoJDslA9yrbNfLk4UHVwOllhHSxyztia61kGKIxtppcxBx
	L8tA==
X-Gm-Message-State: AODbwcAvPzwcq/bBqqHV7B3RGJcHdfjZL26gRPI9jYJF8LLXWmxS/UVz
	ZlCYq3WHb2bfsn88ZQOaTQ==
X-Received: by 10.200.48.98 with SMTP id g31mr20202840qte.119.1495445429942;
	Mon, 22 May 2017 02:30:29 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	n17sm11667604qtb.6.2017.05.22.02.30.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 May 2017 02:30:29 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 May 2017 11:30:03 +0200
Message-Id: <20170522093003.17711-4-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170522093003.17711-1-nicolas.dechesne@linaro.org>
References: <20170522093003.17711-1-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 3/3] image_types: add support for 'fastboot' image type
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
X-List-Received-Date: Mon, 22 May 2017 09:30:29 -0000

'fastboot' images are Android sparse images, which can be loaded onto
development boards using the fastboot protocol, available on many development
boards, as well as a very large number of read devices (phones, tablets, ...).

In this implementation, the 'fastboot' image type relies on standard linux
mkfs.ext4 to generate the file system and uses ext2simg from android-tools to
generate the sparse image. android-tools has its own tool to build an ext4
image, but it usually has less features than the standard linux mkfs.ext4
(especially with regards to file attributes).

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/classes/image_types.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index efdcfed843..0b2f11e157 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -197,6 +197,12 @@ IMAGE_CMD_ubi () {
 
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
 
+IMAGE_CMD_fastboot () {
+	oe_mkext234fs ext4 tmp ${EXTRA_IMAGECMD}
+	ext2simg -v ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tmp ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.fastboot
+	rm -f ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tmp
+}
+
 EXTRA_IMAGECMD = ""
 
 inherit siteinfo
@@ -226,6 +232,7 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 IMAGE_DEPENDS_multiubi = "mtd-utils-native"
 IMAGE_DEPENDS_wic = "parted-native"
+IMAGE_DEPENDS_fastboot = "e2fsprogs-native android-tools-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
 IMAGE_TYPES = " \
@@ -234,6 +241,7 @@ IMAGE_TYPES = " \
     ext2 ext2.gz ext2.bz2 ext2.lzma \
     ext3 ext3.gz \
     ext4 ext4.gz \
+    fastboot fastboot.gz \
     btrfs \
     iso \
     hddimg \
-- 
2.11.0


