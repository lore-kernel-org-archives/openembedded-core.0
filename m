Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D902A65CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 13:40:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 187so5132367wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 06:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2VmN9qxzJLPjkiZzj3DLq0A3Il/0fmRTu/DvF+beHJQ=;
	b=CVO+dRXslY5AdNhQjmzxVP5Qkao++gyXv9Zz6N76GpUIAEclbOXteu304sqFqqRqLn
	UOfwL+FY2NDrhVl7xAQejucA3BNIxmVwfONcUpIioJRocCHSzeLch/NMIsNKfdqqT+ul
	7463fQh6tXd2/dHwkl+NeLgr2+yoHHz5ZtiuuIqOy+kDfZT+BPnAmjObZoONHbpcDo8m
	+vklEK15RsbyZCm3RDYo66tfxIXhFJMIlResC/NhfceH80eJ2FJf7X8d8UkFqLVD3szV
	vSsn1cZXoKd9bET3OBXIueaaUaiA/efF3iIrzfgl5jwJirIkbNhvR85xRnOSRfc8gDZW
	7A3g==
X-Gm-Message-State: ALyK8tKXir0h0XSNyCePnu0cPMKlzsst/kxxrg8WIu1h9MyAQ2+da6xoAR/iJv2nLtOs4w==
X-Received: by 10.28.71.74 with SMTP id u71mr6501027wma.0.1466775611569;
	Fri, 24 Jun 2016 06:40:11 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id g4sm5204559wju.30.2016.06.24.06.40.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Jun 2016 06:40:10 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 14:40:08 +0100
Message-Id: <1466775608-15708-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466764953-20079-2-git-send-email-git@andred.net>
References: <1466764953-20079-2-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2] classes/kernel: fix symlink logic when bundling initramfs images
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
X-List-Received-Date: Fri, 24 Jun 2016 13:40:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

If linkpath points to the a file in KERNEL_OUTPUT_DIR, rather than
outside, then symlink creation for the bundled initramfs image files
fails.

This is because in that case $linkpath.initramfs and $realpath.initramfs
are in the same directory, KERNEL_OUTPUT_DIR, and hence are the same.
Since we just created $realpath.initramfs, creating a symlink with the
same name will fail.

Given that $linkpath is not necessarily the same as the kernel image type,
just removing this symlink creation is not the right thing to do, as
in that case kernel_do_deploy() wouldn't find the bundled file.

What we really want is a symlink from the name of the initramfs-bundled
kernel image type to the real initramfs-bundled kernel image, as that is
what is actually used later in do_deploy().

This brings the code path for when $KERNEL_OUTPUT_DIR/$type is a symlink
in line with when it is not.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/kernel.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3127590..a56b66b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -232,8 +232,7 @@ do_bundle_initramfs () {
 			if [ -n "$realpath" ]; then
 				mv -f $realpath $realpath.initramfs
 				mv -f $realpath.bak $realpath
-				cd ${B}/${KERNEL_OUTPUT_DIR}
-				ln -sf $linkpath.initramfs
+				ln -sf $linkpath.initramfs ${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs
 			else
 				mv -f ${KERNEL_OUTPUT_DIR}/$type ${KERNEL_OUTPUT_DIR}/$type.initramfs
 				mv -f ${KERNEL_OUTPUT_DIR}/$type.bak ${KERNEL_OUTPUT_DIR}/$type
-- 
2.8.1


