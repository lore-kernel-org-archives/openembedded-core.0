Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6302.1792499710903872046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=HUEeJ8OD;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F2DB1596
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 05:35:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ED5C93F7D8
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 05:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792499710; bh=FHpN9stuLBUgK0Szpghm8HDdaVK1iDvq0+RcHYXp9p8=;
	h=From:To:Subject:Date:From;
	b=HUEeJ8ODWyU1/bKn38rRF+feCMoRC5MQt0gQUKr6P4oTkLYCFooiqwGbt06C815av
	 YaTkgtqabRjPmOWLsbSdPC/0Dyek7fKnfhax1qrmZYp6daLgsJVfyn9uYRJ8mMHMYP
	 uiWIeJOTFSayq++l5Y34Xz/2Dij1ZDyzo9MTU/yw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] systemd: merge group members from /etc/group and nss-systemd
Date: Tue, 20 Oct 2026 13:35:06 +0100
Message-ID: <20261020123506.1869634-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 12:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248277

From: Martin Hundeb=C3=B8ll <martin@geanix.com>

When systemd is configured with userdb and nss integration, it provides
group memberships in **addition** to those recorded in /etc/group. For
those additional memberships to be considered by nss, the group database
must be configured to merge the result from both /etc/group and the
systemd nss plugin.

[RB] Reference for the recommended configuration can be found at:
https://www.freedesktop.org/software/systemd/man/latest/nss-systemd.html

Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_262.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_262.bb b/meta/recipes-core=
/systemd/systemd_262.bb
index 46ef6554201..e1d64a5c941 100644
--- a/meta/recipes-core/systemd/systemd_262.bb
+++ b/meta/recipes-core/systemd/systemd_262.bb
@@ -907,7 +907,7 @@ pkg_postinst:${PN}:libc-glibc () {
 	fi
 	if ${@bb.utils.contains('PACKAGECONFIG', 'nss', 'true', 'false', d)}; t=
hen
 		sed -e 's#\(^passwd:.*\)#\1 systemd#' \
-			-e 's#\(^group:.*\)#\1 systemd#' \
+			-e 's#\(^group:.*\)#\1 [SUCCESS=3Dmerge] systemd#' \
 			-e 's#\(^shadow:.*\)#\1 systemd#' \
 			-i $D${sysconfdir}/nsswitch.conf
 	fi
--=20
2.43.0

