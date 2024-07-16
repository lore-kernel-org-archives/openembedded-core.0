Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D235C3DA4B
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 01:36:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1075.1721093804834773427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 18:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B533340C6C
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 01:36:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPOQwx30rqYx
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2024 01:36:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A291E407DA
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 01:36:43 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B477D163FF0;
	Mon, 15 Jul 2024 21:36:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] llvm: extend llvm-config reproducivility fix to all classes
Date: Mon, 15 Jul 2024 21:36:42 -0400
Message-Id: <20240716013642.3050435-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 01:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202077

It's not limited to "target", but also happens to e.g. nativesdk:

ERROR: nativesdk-llvm-18.1.8-r0 do_package_qa: QA Issue: File /usr/local/=
oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/llvm-con=
fig in package nativesdk-llvm contains reference to TMPDIR [buildpaths]

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-devtools/llvm/llvm_18.1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/llvm/llvm_18.1.8.bb b/meta/recipes-dev=
tools/llvm/llvm_18.1.8.bb
index 8dad952923..6afca9c7d7 100644
--- a/meta/recipes-devtools/llvm/llvm_18.1.8.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
@@ -95,7 +95,7 @@ EXTRA_OECMAKE:append:class-nativesdk =3D "\
                  "
=20
 # patch out build host paths for reproducibility
-do_compile:prepend:class-target() {
+do_compile:prepend() {
         sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariable=
s.inc
 }
=20
--=20
2.25.1


