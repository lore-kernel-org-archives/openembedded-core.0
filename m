Return-Path: <boucman2@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id C208F6080F
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 10:38:53 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id p65so11943834wmp.0
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 02:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ioO7P9A8NLC2Iz9fErbsXnX5Wyk089jleT6HKDrTDlA=;
	b=ZaNUgOLgorbDg8qt8XakCwwHHxTdrGpwqbElNkwmRueS1BOdVDoJXPqnhRAntNbOE0
	AdJn2XMVFOqPJ4uB22BxcSkx2egE3wMKTcYQitb006M+aGymLVv9gB9t6Tl68umzKVhP
	B2oY8SyCV7wZ7cQsQ3HG+u1NZ/PM3oJEXDYtZW80kJw5AbTTkpIoHVgNTHzegsAzBf33
	WCNTv/Xd2PzwLYcxjICwY2xByTMC6U8E1J6TZ75fcRHVr/ez6K1BMwWBGgMx7su9Bb6V
	7pUKWvwJo4HBRleuiOV1Bgppog9vh155poRD+TDz94+RJtICxLKXhTqC2eiSlKNNgTU7
	+M9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=ioO7P9A8NLC2Iz9fErbsXnX5Wyk089jleT6HKDrTDlA=;
	b=k2QnPJIJHa2Ezkx7i3PtZl4dqamO2PdGZwUelqLivmze5FkcdwBET0Sispd1T+5qL9
	jcf6zpNOucYCgGoy3c8TIzETjJtf8crt6UbF4GC4PHDj+cIynv61Tr5751WS99xL1bK9
	wZ5xnfveJQRIM6+Z+plEHHoRTmAEPuHJjs4KOHbAgQexA668i5pWn5O+8ipkoweiPU+F
	cyCwvHfi+nKChw4AEXezbDJdF2u2fknKQvH9ZQxc7LuIsY+6zxCbHEdt501A6fT7w/9n
	G5c8uwyt3L7KwvBkPFpZ+lfW0t2IZQq1MeYl96hWe2CpOLw63U8OH2dpGKZDWCv7vUQK
	KHoQ==
X-Gm-Message-State: AD7BkJKISlLnMy1SAXTaD17+3BfraFdWL0PKeEC1qXDPGB/dShxINu4bY5e/hOprri/jyg==
X-Received: by 10.28.87.65 with SMTP id l62mr2161975wmb.102.1457692733725;
	Fri, 11 Mar 2016 02:38:53 -0800 (PST)
Received: from pcrosen.daviel.openwide.fr
	(bob75-2-81-56-46-209.fbx.proxad.net. [81.56.46.209])
	by smtp.gmail.com with ESMTPSA id
	k125sm1609721wmb.14.2016.03.11.02.38.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Mar 2016 02:38:52 -0800 (PST)
Sender: jeremy rosen <boucman2@gmail.com>
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
To: Openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 11:38:31 +0100
Message-Id: <1457692711-20273-1-git-send-email-jeremy.rosen@openwide.fr>
X-Mailer: git-send-email 2.7.0
MIME-Version: 1.0
Subject: [PATCH 1/1] init-live : make it easier to add custom boot targets
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
X-List-Received-Date: Fri, 11 Mar 2016 10:38:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When booting from the live image, the label from the bootloader is passed
to init.sh. init.sh uses the label to either boot a live image or call a
script to take over and install the system.

It is possible to add new labels to the bootloader via the LABELS family of
variables, but the names in init.sh were hardcoded to install and
install-efi

this patch checks if a shell script with the same name as the label is
available instead of using a hardcoded list. Any recipe can add such file
and this provide a new boot target to the live image

Signed-off-by: Jérémy Rosen <jeremy.rosen@openwide.fr>
---
 meta/recipes-core/initrdscripts/files/init-live.sh | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index d852c57..f698535 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -214,11 +214,7 @@ mount_and_boot() {
     boot_live_root
 }
 
-case $label in
-    boot)
-	mount_and_boot
-	;;
-    install|install-efi)
+if [ "$label" != "boot" -a -f $label.sh ] ; then
 	if [ -f /run/media/$i/$ISOLINUX/$ROOT_IMAGE ] ; then
 	    ./$label.sh $i/$ISOLINUX $ROOT_IMAGE $video_mode $vga_mode $console_params
 	else
@@ -226,10 +222,8 @@ case $label in
 	fi
 
 	# If we're getting here, we failed...
-	fatal "Installation image failed"
-	;;
-    *)
-	# Not sure what boot label is provided.  Try to boot to avoid locking up.
-	mount_and_boot
-	;;
-esac
+	fatal "Target $label failed"
+fi
+
+mount_and_boot
+
-- 
2.7.0


