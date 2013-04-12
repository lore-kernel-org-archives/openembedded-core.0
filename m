Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UQZO3-0007xZ-U2
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 10:31:16 +0200
Received: by mail-pb0-f43.google.com with SMTP id md4so1307660pbc.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 01:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=+XO4r+PKahV2etwiXpXxAi4phHwA3hSpi+VJQb6NOm8=;
	b=ucjNKDYfVyHBdHcGbuePTzNQJNtkQJmCyfbN76rV8WQoLzB9EOf8watoFK5mU8c/lG
	Od6YnoUsaK2Pk7B4vR9w1OxRPcjeXFSg59gtyUzvt8xWQL+wYcUD9nv5ldbv52DkIvIC
	dNXWCjcq7ilBDUhbhhPqBd2ImtnhipW3YtO1l+W7vkVr9mq+kMvMqiLl4FIosjaJSA22
	DxVqbgwZdjsE9EIdDxHsYOmewFF174wYmW6MrA+IPrh3+kNBfQwDkI3uCx5KRnl2fxPJ
	rpebpJJ88nprnpukiLmv3r0RRcLw4OUTg0vRaNDbJajC+A/qez8YGqAIVAwnc+K26w0c
	7u6A==
X-Received: by 10.66.190.2 with SMTP id gm2mr14175539pac.25.1365754426033;
	Fri, 12 Apr 2013 01:13:46 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id dr6sm8551223pac.11.2013.04.12.01.13.44
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 01:13:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Apr 2013 01:12:55 -0700
Message-Id: <1365754375-6322-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [dylan][PATCH] kernel.bbclass: Optionally create lib dir during deploy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2013 08:31:16 -0000

when we have multilib and a 64bit machine and initramfs then image/lib
directory will not be created and it will end up with errors like

| DEBUG: Executing python function sstate_task_prefunc
| DEBUG: Python function sstate_task_prefunc finished
| DEBUG: Executing shell function do_deploy
| tar: lib: Cannot stat: No such file or directory
| tar: Exiting with failure status due to previous errors

So in order to overcome this shortcoming lets mkdir -p the
lib directory so the modules can be happily installed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f3a5553..8c8c95b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -372,6 +372,7 @@ addtask uboot_mkimage before do_install after do_compile
 kernel_do_deploy() {
 	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
+		mkdir -p ${D}/lib
 		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
 		ln -sf ${MODULE_TARBALL_BASE_NAME}.bin ${MODULE_TARBALL_SYMLINK_NAME}
 	fi
-- 
1.7.9.5



