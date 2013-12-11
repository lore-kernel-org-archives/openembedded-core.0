Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 82A0B6AE9E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 14:46:31 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id ec20so3783364lab.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 06:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=uvHKnTzcFTLQFvxhHKHc34X0eOVcaaLv2uGVgq9ah1Y=;
	b=t0h9o/PA3THqtMDbo0qovyYe0OuXpjcB8IqawVRTtcqI7sstRwDMVv3pCd9CJtiH75
	UWiuFlsFGLeMo1lNpxKFjzTlOYhX9qgkZ+uU5sBx/HiKw2tFPwI/D5YgGjlv5HFyFVJc
	aeY714uLiu7rh3irm2n9O7G9rXg/TeHEf+qQJcpv76j0gvXO9NClb1Cudj+Mds7WOQuP
	Erz5b32drllTEcsZ6GYbqHYEa5R6/tEN1QY5u9ZMmtwtpRpNuur3xnOAQsoObEMTNg1L
	KA8GE07F3q/V68InwpF9pS5pgnc1skb294prsg41leG0BAflR3EhVr7CSmOqTDS1sshI
	EVsg==
X-Received: by 10.152.44.225 with SMTP id h1mr1139590lam.22.1386773190092;
	Wed, 11 Dec 2013 06:46:30 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id
	ld10sm28798200lab.8.2013.12.11.06.46.28 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Dec 2013 06:46:29 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 7477E1C1344; Wed, 11 Dec 2013 15:46:22 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2013 15:46:21 +0100
Message-Id: <1386773181-24944-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] image.bbclass: Allow creation of meta-packages for images
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
X-List-Received-Date: Wed, 11 Dec 2013 14:46:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No packages were created for core-image-minimal et.c. which
is a known top level interface for Yocto/OE users.

When installing from a repo, it would be good if these interfaces
were common. If not, users are left with
packagegroup-core-*, which names are not always easy to parse.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/classes/image.bbclass | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index cc65e35..e875b8a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -8,11 +8,12 @@ POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_install_complementary populate_sdk;
 
 inherit gzipnative
 
+ALLOW_EMPTY_${PN} = "1"
+PACKAGES = "${PN}"
 LICENSE = "MIT"
-PACKAGES = ""
 DEPENDS += "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cross"
-RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
-RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
+RDEPENDS_${PN} += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
+RRECOMMENDS_${PN} += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -659,11 +660,6 @@ do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_install[noexec] = "1"
 do_populate_sysroot[noexec] = "1"
-do_package[noexec] = "1"
-do_packagedata[noexec] = "1"
-do_package_write_ipk[noexec] = "1"
-do_package_write_deb[noexec] = "1"
-do_package_write_rpm[noexec] = "1"
 
 addtask rootfs before do_build
 # Allow the kernel to be repacked with the initramfs and boot image file as a single file
-- 
1.8.3.2


