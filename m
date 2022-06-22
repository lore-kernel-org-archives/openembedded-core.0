Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4908C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 17:33:13 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.10408.1655919192030789384
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 10:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout09.t-online.de (Postfix) with SMTP id C931E598
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 19:33:09 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.39.186]) by fwd75.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1o44Dz-03ssqH0; Wed, 22 Jun 2022 19:33:08 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 1/2] llvm: make LLVM_HAVE_OPT_VIEWER_MODULES optional
Date: Wed, 22 Jun 2022 19:32:50 +0200
Message-Id: <20220622173251.478588-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1655919188-01433199-5B82E466/0/0 CLEAN NORMAL
X-TOI-MSGID: cc8bd9ce-6aed-424e-8a16-ad5a020ad85d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 17:33:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167245

Make it a PACKAGECONFIG option and thus avoid automagic to improve reprod=
ucibility

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtoo=
ls/llvm/llvm_git.bb
index 67ed1eab00..b86605cbce 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -90,6 +90,9 @@ EXTRA_OECMAKE:append:class-nativesdk =3D "\
                   -DLLVM_CONFIG_PATH=3D${STAGING_BINDIR_NATIVE}/llvm-con=
fig${PV} \
                  "
=20
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[optviewer] =3D "-DPY_PYGMENTS_FOUND=3DON -DPY_PYGMENTS_LEX=
ERS_C_CPP_FOUND=3DON -DPY_YAML_FOUND=3DON,-DPY_PYGMENTS_FOUND=3DOFF,,pyth=
on3-pygments python3-pyyaml"
+
 # patch out build host paths for reproducibility
 do_compile:prepend:class-target() {
         sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariable=
s.inc
--=20
2.25.1


