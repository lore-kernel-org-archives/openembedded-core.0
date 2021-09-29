Return-Path: <matt@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C836C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 03:19:43 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web08.4105.1632885581357086957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 20:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: codeconstruct.com.au,
 ip: 203.29.241.158, mailfrom: matt@codeconstruct.com.au)
Received: by codeconstruct.com.au (Postfix, from userid 10001)
	id 18A0020166; Wed, 29 Sep 2021 11:19:28 +0800 (AWST)
From: Matt Johnston <matt@codeconstruct.com.au>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssh: openssh-dev shouldn't depend on openssh
Date: Wed, 29 Sep 2021 11:18:04 +0800
Message-Id: <20210929031804.178714-1-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 03:19:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156437

In some situations packages such as openssh-sftp-server are used
separately from openssh-sshd. The openssh-dev package is empty
but can have conflicts when installed via populate_sdk. Removing the
dependency avoids that.

https://github.com/openbmc/openbmc/issues/3819 is an example of the
problem.

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
---
 meta/recipes-connectivity/openssh/openssh_8.7p1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.7p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_8.7p1.bb
index 07cd6b74cd..3ebdd62de3 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.7p1.bb
@@ -165,6 +165,8 @@ RDEPENDS:${PN}-sshd +=3D "${PN}-keygen ${@bb.utils.co=
ntains('DISTRO_FEATURES', 'pa
 RRECOMMENDS:${PN}-sshd:append:class-target =3D "\
     ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
 "
+# openssh-dev shouldn't pull in openssh-sshd etc
+RDEPENDS:${PN}-dev =3D ""
=20
 # gdb would make attach-ptrace test pass rather than skip but not worth =
the build dependencies
 RDEPENDS:${PN}-ptest +=3D "${PN}-sftp ${PN}-misc ${PN}-sftp-server make =
sed sudo coreutils"
--=20
2.30.2


