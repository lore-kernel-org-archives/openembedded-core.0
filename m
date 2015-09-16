Return-Path: <nathan@nathanrossi.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id B8F1760053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 05:00:20 +0000 (UTC)
Received: by padhk3 with SMTP id hk3so197410813pad.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 22:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AInn/8t2Hqn2yenvuRpohOxkQ9zPvZsXle0joYQMgfE=;
	b=RKUDUyhaG27RhX/helF3o5leUgFR6EeqwL2oK5Ih0/+xVteMgFYL7gxUH1WAQpSUTK
	T21U48rErFxnk2D9H0XQatdiHoJSNN8SbvODyg8d2DDsEyIK953jLdqF54lzs7Hy45Wq
	PSwA22U2r6C/yb9yOm/Odfm4sXdfh3Nm+d1RUtTPfxDU0KvqWPKSmXelwOnYJQ7I+Xt2
	QpKRONXwdMQ07JvCJnry2u3LNHXMjs6Qa3fkf2llLl0Ty2gVgr/Blc6clKaaUqIQMi/C
	G18bB2mcw3QV7scqyBYjHYmdM4ti4PttqwTHEPoFhQ3xU+qS+nn/Fg/dP36a4j49PEPj
	Qspg==
X-Gm-Message-State: ALoCoQm4RN7kTx+NyCrQcIgcZSpnbTwE8dKrFE0LpjOrqaJNIK/96sI33uZy6V8kEYu542ecRdoc
X-Received: by 10.68.181.130 with SMTP id dw2mr54065680pbc.70.1442379620322;
	Tue, 15 Sep 2015 22:00:20 -0700 (PDT)
Received: from nathanbox.home.gateway ([103.26.61.212])
	by smtp.gmail.com with ESMTPSA id
	lg7sm25143220pbc.1.2015.09.15.22.00.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Sep 2015 22:00:19 -0700 (PDT)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Sep 2015 14:59:59 +1000
Message-Id: <1442379599-27186-3-git-send-email-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1442379599-27186-1-git-send-email-nathan@nathanrossi.com>
References: <1442379599-27186-1-git-send-email-nathan@nathanrossi.com>
Subject: [PATCH 2/2] runqemu-internal: For qemumicroblaze use the QEMU provided device tree
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
X-List-Received-Date: Wed, 16 Sep 2015 05:00:22 -0000

Setup the qemumicroblaze machine to use the device tree provided by QEMU
instead of the device tree located in the images directory. Additionally
setup the default memory size to match the QEMU device tree.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 scripts/runqemu-internal | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 2d2a839..d6b1102 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -54,7 +54,7 @@ else
             mem_size=512
             ;;
         "qemumicroblaze")
-            mem_size=64
+            mem_size=256
             ;;
         "qemumips"|"qemumips64")
             mem_size=256
@@ -587,7 +587,7 @@ fi
 
 if [ "$MACHINE" = "qemumicroblaze" ]; then
     QEMU=qemu-system-microblazeel
-    QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M petalogix-ml605 -serial mon:stdio -dtb $KERNEL-$MACHINE.dtb"
+    QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M petalogix-ml605 -serial mon:stdio"
     if [ "${FSTYPE:0:3}" = "ext" -o "${FSTYPE:0:4}" = "cpio" ]; then
         KERNCMDLINE="earlyprintk root=/dev/ram rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS -initrd $ROOTFS"
-- 
2.5.1


