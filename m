Return-Path: <mburtin@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD486DD6F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 16:59:25 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id ca18so7070653wib.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 08:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=hmy0cSTGfIJgMpaA0hjlzcv4wJ9pwSGwmk6ioX/eN7s=;
	b=tPFU7wc/GEdf+J3LnvWBCOVF3g0bONuOWEAqpNuKb2ZFzX10wcUDPQ1/+d/Ssrlz91
	nUOL5s87v7W1D6OPuLeTopnKzp4+/wFDOmy02OV3MRRVi/Kaxsf+O3Oqp3GkcA6WjITR
	/KhZUfi42WJPT3IHEf6Z9OPyY+6AP75WZBYHDm/vKdl/Rrb6ko3veoZ4nKTzvaivrNkb
	ULUwNlaHIjsQ9MADPXUMyeTAm5KM9R93yaHUzGm3iMKQnq5ZybbE7Bks1mjrDVb8s3Yn
	sBo/XOkdj/L8l+/0gTkGiOtuJ2qP/HxRJ8dtQsfbB2CT9vN9ZlnMLWg1gpQYCo9zHhH3
	Z89Q==
X-Received: by 10.194.240.41 with SMTP id vx9mr2606187wjc.70.1385571563727;
	Wed, 27 Nov 2013 08:59:23 -0800 (PST)
Received: from mburtin-desktop.mpl.mstarsemi.fr ([94.103.137.126])
	by mx.google.com with ESMTPSA id y20sm72730373wib.0.2013.11.27.08.59.22
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 08:59:22 -0800 (PST)
Sender: =?UTF-8?Q?Micha=C3=ABl_Burtin?= <mburtin@gmail.com>
From: =?UTF-8?q?Micha=C3=ABl=20Burtin?= <michael.burtin@innotis.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 17:58:59 +0100
Message-Id: <1385571539-3232-1-git-send-email-michael.burtin@innotis.org>
X-Mailer: git-send-email 1.8.4.2
Subject: [PATCH] initramfs-framework: fix udev working directory creation
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
X-List-Received-Date: Wed, 27 Nov 2013 16:59:25 -0000

udev recipe defines udev_run=/var/run/udev in udev.conf, update udev
initramfs script to create /var/run directory before starting daemon.
---
 meta/recipes-core/initrdscripts/initramfs-framework/udev | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index bb462dc..5226511 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -37,7 +37,7 @@ udev_enabled() {
 udev_run() {
 	add_module_pre_hook "udev_shutdown_hook_handler"
 
-	mkdir -p /run
+	mkdir -p /var/run
 
 	$_UDEV_DAEMON --daemon
 	udevadm trigger --action=add
-- 
1.8.4.2


