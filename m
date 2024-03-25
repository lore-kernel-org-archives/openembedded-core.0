Return-Path: <lxy204899@163.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0BBC54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 07:24:50 +0000 (UTC)
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by mx.groups.io with SMTP id smtpd.web11.46342.1711351482424218392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 00:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@163.com header.s=s110527 header.b=bsjEm2zx;
 spf=pass (domain: 163.com, ip: 45.254.50.220, mailfrom: lxy204899@163.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=mh1vZbLJmHR3ZnrkbrFMSjIfdCZgst7YXsOJblbR8QU=;
	b=bsjEm2zxd0KChEsjDGZ+TJ7UdHWO90TO7miTj7HXzRBJ83TOUlqnkUP+X5uKzI
	eGBTsHauncQA5XATF/LoRYwD39OIP/seLh8haOHv4Iw/yd8ihd5vuZ0nm65I4Y2X
	GxW7/DOz4XVzWqpEF/bPgu0HlrQaOL3iYWgA7Vjruha80=
Received: from ubantupc-ThinkCentre-M920t-N000.. (unknown [139.159.170.28])
	by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wDXz5KwJgFmbNTjBw--.32941S4;
	Mon, 25 Mar 2024 15:24:33 +0800 (CST)
From: lixiaoyong <lxy204899@163.com>
To: openembedded-core@lists.openembedded.org
Cc: lixiaoyong <lxy204899@163.com>
Subject: [PATCH] kernel-module-split.bbclass: enhance objcopy command call for kernel compilation with llvm
Date: Mon, 25 Mar 2024 15:24:31 +0800
Message-Id: <20240325072431.3997059-1-lxy204899@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXz5KwJgFmbNTjBw--.32941S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr1UJry7Gr4rtF4kWr1fCrg_yoW8XFyUpF
	1FgrykGr43J3WDG3ZrAF4kWa43Kas7Wa1Fk34aqayfA3s09w1jqa4FgF13WF1UXF4aka45
	Gr18Xa9aga18CaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR4a09UUUUU=
X-Originating-IP: [139.159.170.28]
X-CM-SenderInfo: ho01jiiuyzmqqrwthudrp/1tbishasomVOCbl-7gAAsg
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 07:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197481

Using meta-clang for llvm kernel compilation previously defaulted to the gcc objcopy tool.
To improve flexibility and compatibility, $OBJCOPY is preferred over $HOST_PREFIXobjcopy
in the kernel-module-split.bbclass.

With $OBJCOPY already defined in bitbake.conf, the empty condition has been removed,
simplifying the invocation process.

Signed-off-by: lixiaoyong <lxy204899@163.com>
---
 meta/classes-recipe/kernel-module-split.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index c1208d5..9487365 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -67,9 +67,9 @@ python split_kernel_module_packages () {
             else:
                 msg = "Cannot decompress '%s'" % file
                 raise msg
-            cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX") or "", tmpkofile, tmpfile)
+            cmd = "%s -j .modinfo -O binary %s %s" % (d.getVar("OBJCOPY"), tmpkofile, tmpfile)
         else:
-            cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX") or "", file, tmpfile)
+            cmd = "%s -j .modinfo -O binary %s %s" % (d.getVar("OBJCOPY"), file, tmpfile)
         subprocess.check_call(cmd, shell=True)
         # errors='replace': Some old kernel versions contain invalid utf-8 characters in mod descriptions (like 0xf6, 'ö')
         with open(tmpfile, errors='replace') as f:
-- 
2.34.1


