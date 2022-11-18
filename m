Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F1EC433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 13:30:51 +0000 (UTC)
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.252])
 by mx.groups.io with SMTP id smtpd.web11.11536.1668778239414964930
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 05:30:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@yadro.com header.s=mta-01 header.b=mgbk0fBO;
 spf=pass (domain: yadro.com, ip: 89.207.88.252, mailfrom: s.zhmylev@yadro.com)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id D6C6D404AC
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 13:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-type:content-type:content-transfer-encoding:mime-version
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received:received:received; s=mta-01; t=1668778235; x=
	1670592636; bh=B7mQCswsSjZ+LjEMfTHsmTbTLxZe2x/PqG7ZMYdL4M4=; b=m
	gbk0fBO19pe+y68Q1QbZXHFxmEYwt1CN2NMGHsWelQia0hUP0x5wA0+AvgPLCd9K
	rCKhNo+6XwoC5l5NzTQEfOBTEpei5fRSvYkItYgpVNhzUt4c6tnRRHhhYYfTUSIu
	G7m6i8is5vfD7V8WINeY06nJq3zgIJ44PBJm5ubunk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lNZxKXQrhlcm
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2022 16:30:35 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (T-EXCH-02.corp.yadro.com [172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id A749041237
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 16:30:31 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 18 Nov 2022 16:30:31 +0300
Received: from localhost.localdomain (172.22.3.175) by
 T-EXCH-08.corp.yadro.com (172.17.11.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.9; Fri, 18 Nov 2022 16:30:31 +0300
From: <s.zhmylev@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sergei Zhmylev <s.zhmylev@yadro.com>
Subject: [PATCH] oeqa/qemurunner: implement vmdk images support
Date: Fri, 18 Nov 2022 16:30:20 +0300
Message-ID: <20221118133020.20735-1-s.zhmylev@yadro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.3.175]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 13:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173459

From: Sergei Zhmylev <s.zhmylev@yadro.com>

Qemurunner should not pass rootfs to runqemu in case
rootfs is not a filesystem itself.  Some images could
be built into some disk format like vmdk and this
commit makes qemurunner handle such images properly.

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemu=
runner.py
index e602399232..f982ea91da 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -177,7 +177,11 @@ class QemuRunner:
                 launch_cmd +=3D ' slirp'
             if self.use_ovmf:
                 launch_cmd +=3D ' ovmf'
-            launch_cmd +=3D ' %s %s %s' % (runqemuparams, self.machine, =
self.rootfs)
+            launch_cmd +=3D ' %s %s' % (runqemuparams, self.machine)
+            if self.rootfs.endswith('.vmdk'):
+                self.logger.debug('Bypassing VMDK rootfs for runqemu')
+            else:
+                launch_cmd +=3D ' %s' % (self.rootfs)
=20
         return self.launch(launch_cmd, qemuparams=3Dqemuparams, get_ip=3D=
get_ip, extra_bootparams=3Dextra_bootparams, env=3Denv)
=20
--=20
2.37.2


