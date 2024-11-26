Return-Path: <florian.kreutzer.oss@rohde-schwarz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBB2D65524
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 16:46:54 +0000 (UTC)
Received: from mail02.rohde-schwarz.com (mail02.rohde-schwarz.com [80.246.32.97])
 by mx.groups.io with SMTP id smtpd.web11.51132.1732639611505147285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 08:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: rohde-schwarz.com, ip: 80.246.32.97, mailfrom: florian.kreutzer.oss@rohde-schwarz.com)
Received: from securemail-mu-h4.rohde-schwarz.com (10.0.19.146) by
 mail02.rohde-schwarz.com (172.21.64.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 26 Nov 2024 17:46:49 +0100
Received: from GMU451.rsint.net ([10.0.225.106])
          by gmu812.rsint.net (Totemo SMTP Server) with SMTP ID 791;
          Tue, 26 Nov 2024 16:46:48 +0000 (GMT)
Received: from GMU454.rsint.net (10.0.225.120) by GMU451.rsint.net
 (10.0.225.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 26 Nov
 2024 17:46:48 +0100
Received: from lx000880.rsint.net (10.122.0.212) by SMTP-EMEA-AR.RSINT.NET
 (10.0.229.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 26 Nov
 2024 17:46:48 +0100
From: <florian.kreutzer.oss@rohde-schwarz.com>
To: <openembedded-core@lists.openembedded.org>, <steve@sakoman.com>
CC: <wangmy@fujitsu.com>, <yi.zhao@windriver.com>, Florian Kreutzer
	<florian.kreutzer.oss@rohde-schwarz.com>
Subject: [scarthgap][PATCH] dropbear: backport fix for concurrent channel
 open/close
Date: Tue, 26 Nov 2024 17:45:04 +0100
Message-ID: <20241126164504.163516-1-florian.kreutzer.oss@rohde-schwarz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.122.0.212]
X-RUS_SENSITIVITY: 10
X-GBS-PROC: N6NNupm1n1JE0IsU7esXgkHlQwpV3RfhjFM0TWN+2DICfuAjFOaqdJ+wfIae0sSnO9DAxdKJGy2e+WKM9/EtczMdq8XIX38J+Dqj1mhJxiJJ3vEBPePVJ23xYNOhz7LA
X-GBS-PROCJOB: 0wfeov1q38IN/XhqDSMprNBWfraYAHuwUCI9NFHV924MFxydIsDJdxWgEXxANvxk
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 16:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207867

From: Florian Kreutzer <florian.kreutzer.oss@rohde-schwarz.com>

Prevents sporadic crashes of dropbear server when multiple channels are
active at the same time.

Upstream discussion:
https://github.com/mkj/dropbear/pull/326/commits
https://github.com/mkj/dropbear/issues/321

Issue was introduced in dropbear-2022.83 and fixed in v2024.86.

Signed-off-by: Florian Kreutzer <florian.kreutzer.oss@rohde-schwarz.com>
---
 ...e-channels-when-a-PID-hasn-t-started.patch | 45 +++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2022.83.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/0007-Don-t-close-ch=
annels-when-a-PID-hasn-t-started.patch

diff --git a/meta/recipes-core/dropbear/dropbear/0007-Don-t-close-channels-=
when-a-PID-hasn-t-started.patch b/meta/recipes-core/dropbear/dropbear/0007-=
Don-t-close-channels-when-a-PID-hasn-t-started.patch
new file mode 100644
index 0000000000..dff6534027
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0007-Don-t-close-channels-when-a-=
PID-hasn-t-started.patch
@@ -0,0 +1,45 @@
+From 5c34e70b80e5fc539f96e029b56b95cdee556010 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Sun, 8 Sep 2024 11:07:41 +0200
+Subject: Don't close channels when a PID hasn't started
+
+If check_close() ran prior to a server channel exec/shell
+request, it would send a close immediately.
+This fix changes it to exclude write_fd=3D=3DFD_UNINIT from
+being closed there.
+
+When a channel was closed by the time shell/exec request
+was received, then data sent hits an assertion.
+This fixes #321 on Github.
+
+The "pid =3D=3D 0" check was initially added to avoid waiting
+to close a channel when a process has never been launched
+(which is correct), but that isn't correct in the case
+of the closed-fd test.
+
+Fixes: 8e6f73e879ca ("- Remove "flushing" handling for exited processes)
+
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/71521d1b=
78706a70d3570b860e65234cefdc8c81]
+
+Signed-off-by: Florian Kreutzer <florian.kreutzer.oss@rohde-schwarz.com>
+---
+ common-channel.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/common-channel.c b/common-channel.c
+index be5b57f..9926972 100644
+--- a/common-channel.c
++++ b/common-channel.c
+@@ -317,7 +317,8 @@ static void check_close(struct Channel *channel) {
+=20
+ =09if ((channel->recv_eof && !write_pending(channel))
+ =09=09/* have a server "session" and child has exited */
+-=09=09|| (channel->type->check_close && close_allowed)) {
++=09=09|| (channel->writefd !=3D FD_UNINIT
++=09=09=09&& channel->type->check_close && close_allowed)) {
+ =09=09close_chan_fd(channel, channel->writefd, SHUT_WR);
+ =09}
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/dropbear/dropbear_2022.83.bb b/meta/recipes-=
core/dropbear/dropbear_2022.83.bb
index 686cb8a809..772e08eaed 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.83.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.83.bb
@@ -14,6 +14,7 @@ RCONFLICTS:${PN} =3D "openssh-sshd openssh"
=20
 SRC_URI =3D "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.b=
z2 \
            file://0001-urandom-xauth-changes-to-options.h.patch \
+           file://0007-Don-t-close-channels-when-a-PID-hasn-t-started.patc=
h \
            file://init \
            file://dropbearkey.service \
            file://dropbear@.service \
--=20
2.34.1

