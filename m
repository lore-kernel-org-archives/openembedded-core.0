Return-Path: <maanyagoenka@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DB9C47258
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 02:58:38 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.7110.1706756310383166588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 18:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=BlBHoKOe;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: maanyagoenka@linux.microsoft.com)
Received: from maanya-vm-20.i32zew0cey2u1cyshmh12embkc.xx.internal.cloudapp.net (unknown [20.115.210.253])
	by linux.microsoft.com (Postfix) with ESMTPSA id C5F5620B2000;
	Wed, 31 Jan 2024 18:58:29 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C5F5620B2000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1706756309;
	bh=XR9tLcLT7JoUqgJ9BEa2WI4gj8GmwRi1ENboFKODxus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BlBHoKOeKHiuvBgFrsnoz1zV92pp5DZB0bARvq6dXd+bjSBZtJSJnOcIXesanwvTN
	 hNPybSr7vTATUpTbeCp7M0hn/h2DvHQEjhxeb+1Q51Xkw+s9b7M65LSpfrV8L7k3Ca
	 nBdBJ5z3EuHUJG7Tau/itt70i6Ufa7Up5jeH7uzs=
From: Maanya Goenka <maanyagoenka@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: alhe@linux.microsoft.com,
	Maanya Goenka <maanyagoenka@microsoft.com>
Subject: [PATCH] toolchain-shar-relocate: allow 'find' access to libraries in symlinked directories
Date: Thu,  1 Feb 2024 02:56:24 +0000
Message-Id: <20240201025621.1632547-3-maanyagoenka@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240201025621.1632547-1-maanyagoenka@linux.microsoft.com>
References: <20240201025621.1632547-1-maanyagoenka@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 02:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194549

From: Maanya Goenka <maanyagoenka@microsoft.com>

If the '/' is not added to the end of the dynamic loader path, only direc=
tories
that are not symlinks will be looked into for libraries such as ld-linux*=
,
so the slash is added to allow the 'find' command to have symlinked direc=
tory access too.

Signed-off-by: Maanya Goenka <maanyagoenka@microsoft.com>
Signed-off-by : Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
---
 meta/files/toolchain-shar-relocate.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain=
-shar-relocate.sh
index cee9adbf39..e8ab357717 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -4,8 +4,9 @@ if ! xargs --version > /dev/null 2>&1; then
 fi
=20
 # fix dynamic loader paths in all ELF SDK binaries
+# allow symlinks to be accessed via the find command too
 native_sysroot=3D$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE=
_SYSROOT=3D'|cut -d'=3D' -f2|tr -d '"')
-dl_path=3D$($SUDO_EXEC find $native_sysroot/lib -maxdepth 1 -name "ld-li=
nux*")
+dl_path=3D$($SUDO_EXEC find $native_sysroot/lib/ -maxdepth 1 -name "ld-l=
inux*")
 if [ "$dl_path" =3D "" ] ; then
 	echo "SDK could not be set up. Relocate script unable to find ld-linux.=
so. Abort!"
 	exit 1
--=20
2.25.1


