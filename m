Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62309C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 22:34:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2812.1721169250196047483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 15:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7154F40C79;
	Tue, 16 Jul 2024 22:34:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U7TB2VdJuOII; Tue, 16 Jul 2024 22:34:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 07BAC40B66;
	Tue, 16 Jul 2024 22:34:07 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B4521163FF3;
	Tue, 16 Jul 2024 18:34:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH v2] llvm: extend llvm-config reproducivility fix to nativesdk class
Date: Tue, 16 Jul 2024 18:34:06 -0400
Message-Id: <20240716223407.4025539-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 22:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202131

From: Denys Dmytriyenko <denys@konsulko.com>

It's not limited to "target", but also happens to nativesdk:

ERROR: nativesdk-llvm-18.1.8-r0 do_package_qa: QA Issue: File /usr/local/=
oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/llvm-con=
fig in package nativesdk-llvm contains reference to TMPDIR [buildpaths]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - only apply the fix to nativesdk, leaving native be as is

 meta/recipes-devtools/llvm/llvm_18.1.8.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm_18.1.8.bb b/meta/recipes-dev=
tools/llvm/llvm_18.1.8.bb
index 8dad952923..a700a1b2b1 100644
--- a/meta/recipes-devtools/llvm/llvm_18.1.8.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
@@ -99,6 +99,10 @@ do_compile:prepend:class-target() {
         sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariable=
s.inc
 }
=20
+do_compile:prepend:class-nativesdk() {
+        sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariable=
s.inc
+}
+
 do_compile() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'libllvm', 'true', 'false',=
 d)}; then
 	ninja -v ${PARALLEL_MAKE}
--=20
2.25.1


