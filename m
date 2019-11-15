Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 906637F7C8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2019 16:09:47 +0000 (UTC)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch
	[31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id A2C275C1D4B;
	Fri, 15 Nov 2019 17:09:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1573834187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=+PsAnkqw4FzMdAhO0PQKvsfUdKBfoZO4xeR7WtUdoz0=;
	b=vm8htUNCxbsg0M9an3SIV2Mc/usmW4yBGPLLYEh2uq9DYK1Ubb5eBHhSI3AAg/R5N0YWI/
	bOrlkrtuHev8AKZ20fLxFTs7x/O3OLQt5zgIN8E6Ac5FU20yOfGqG7ylzbXoX/1aqnr5sv
	HZJfgbO72AZiEFpBlTpqP+I/Wd1bWww=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2019 16:09:44 +0000
Message-Id: <20191115160944.28231-1-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH] base-files: set ptmxmode to 666
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
X-List-Received-Date: Fri, 15 Nov 2019 16:09:47 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Make sure that the (newer) /dev/pts/ptmx is accessible by users. This
is useful e.g. when running containers which symlink /dev/ptmx to
/dev/pts/ptmx on start. The default mode (000) does not allow to
create ptys inside the container.

Using 666 when symlinking /dev/ptmx is also recommended by the kernel
documentation when /dev/ptmx is symlinked:
https://www.kernel.org/doc/Documentation/filesystems/devpts.txt

Also buildroot uses ptmxmode=0666. The patch introducing the change
explains related use cases why this is necessary a bit more in depth:
https://github.com/buildroot/buildroot/commit/8196b299ba12bd6741bf7f4462cad180dab77fb0#diff-2d4604b9e565eb19fa52ce31f282f06c

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-core/base-files/base-files/fstab | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/fstab b/meta/recipes-core/base-files/base-files/fstab
index d79a01602f..70e400f567 100644
--- a/meta/recipes-core/base-files/base-files/fstab
+++ b/meta/recipes-core/base-files/base-files/fstab
@@ -2,7 +2,7 @@
 
 /dev/root            /                    auto       defaults              1  1
 proc                 /proc                proc       defaults              0  0
-devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
+devpts               /dev/pts             devpts     mode=0620,ptmxmode=0666,gid=5      0  0
 tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
 tmpfs                /var/volatile        tmpfs      defaults              0  0
 
-- 
2.17.1


