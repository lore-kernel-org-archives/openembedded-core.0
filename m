Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FC5C77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 15:37:07 +0000 (UTC)
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by mx.groups.io with SMTP id smtpd.web10.1548.1684856219161875249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 08:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fris.de header.s=dkim header.b=j7E5Pm/l;
 spf=pass (domain: fris.de, ip: 116.203.77.234, mailfrom: frieder@fris.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0DE64C02AE;
	Tue, 23 May 2023 17:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1684856214; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=uhTQWYdDkYfkyBi5/fAF7xOFMVsbRCngGTM8QQ0unw4=;
	b=j7E5Pm/lJDjMOx0kNGg6yi8duLkj2BLCkwYeLGTtxBFarF3I+b0Uq5qxvYlfaGnyraFAdp
	4pLLRhnOLjAgYDmmbztLfN7tt7J6ql2+Nk3wzt8eG7SHMHtAJ4391vxxaUGdFPGjcJHNaK
	dNd6khANzXWzVhhRwR/KCfKrjzllSQAiVd3doClUfleTMgpVezCYO2ao5YAj2IbNUChkxT
	owRHmLJerU50tawYmVIA5HTRXABjoCT/mcA987D0/lJIvH+lTIqUpnr7wjIo7DW8napC6R
	mwr8kpnFZpEDZsEgsLBuMvhCD9czBXTad0c9rtZ0q7T0CaeWvmRqytrYP8HYsA==
From: Frieder Schrempf <frieder@fris.de>
To: openembedded-core@lists.openembedded.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [PATCH] psmisc: Set ALTERNATIVE for pstree to resolve conflict with busybox
Date: Tue, 23 May 2023 17:36:08 +0200
Message-Id: <20230523153608.119800-1-frieder@fris.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 15:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181640

From: Frieder Schrempf <frieder.schrempf@kontron.de>

If pstree in busybox is enabled there is a conflict with pstree from
psmisc resulting in:

  do_rootfs: Postinstall scriptlets of ['busybox'] have failed. If
  the intention is to defer them to first boot, then please place
  them into pkg_postinst_ontarget:${PN} ().
  Deferring to first boot via 'exit 1' is no longer supported.

And more detailed in do_rootfs.log:

  update-alternatives: Error: not linking [...]/rootfs/usr/bin/pstree to =
/bin/busybox.nosuid since [...]/rootfs/usr/bin/pstree exists and is not a=
 link

On order to fix this set ALTERNATIVE:pstree accordingly.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 meta/recipes-extended/psmisc/psmisc.inc   | 2 ++
 vscode-bitbake-build/executeBitBakeCmd.sh | 3 +++
 2 files changed, 5 insertions(+)
 create mode 100755 vscode-bitbake-build/executeBitBakeCmd.sh

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-exten=
ded/psmisc/psmisc.inc
index a429c2ee96..23e98d21be 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -55,3 +55,5 @@ ALTERNATIVE_PRIORITY =3D "90"
 ALTERNATIVE:killall =3D "killall"
=20
 ALTERNATIVE:fuser =3D "fuser"
+
+ALTERNATIVE:pstree =3D "pstree"
diff --git a/vscode-bitbake-build/executeBitBakeCmd.sh b/vscode-bitbake-b=
uild/executeBitBakeCmd.sh
new file mode 100755
index 0000000000..d7a4c5a5aa
--- /dev/null
+++ b/vscode-bitbake-build/executeBitBakeCmd.sh
@@ -0,0 +1,3 @@
+#!/bin/bash
+. ./oe-init-build-env vscode-bitbake-build > /dev/null
+bitbake-layers show-layers
\ No newline at end of file
--=20
2.40.1


