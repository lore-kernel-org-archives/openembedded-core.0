Return-Path: <martyn.welch@collabora.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CD4C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 10:50:15 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by mx.groups.io with SMTP id smtpd.web11.10517.1635245413910800220
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 03:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: collabora.com, ip: 46.235.227.227, mailfrom: martyn.welch@collabora.com)
Received: from pan.home (unknown
 [IPv6:2a00:23c6:c31a:b300:6338:938c:ab16:fa48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: martyn)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 115311F420AF;
	Tue, 26 Oct 2021 11:50:12 +0100 (BST)
From: Martyn Welch <martyn.welch@collabora.com>
To: openembedded-core@lists.openembedded.org
Cc: Martyn Welch <martyn.welch@collabora.co.uk>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Martyn Welch <martyn.welch@collabora.com>
Subject: [PATCH v6 2/2] core-image.bbclass: add default
 IMAGE_QA_PROHIBIT_PATHS variable
Date: Tue, 26 Oct 2021 11:50:01 +0100
Message-Id: 
 <e1285a97073645957532749c71d2de3a02310198.1635240032.git.martyn.welch@collabora.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: 
 <06387e0dd040237457de963fd13ff3db3e02be61.1635240032.git.martyn.welch@collabora.com>
References: 
 <06387e0dd040237457de963fd13ff3db3e02be61.1635240032.git.martyn.welch@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 10:50:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157378

From: Martyn Welch <martyn.welch@collabora.co.uk>

Add a default IMAGE_QA_PROHIBIT_PATHS variable containing paths known to
be mounted in the default fstab, which are known mount points or
directories which should be populated at runtime.

Suggested-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
---
Changes since v3:
 - This patch added.

 meta/classes/core-image.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bb=
class
index 84fd3eeb38..33ab1c85de 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -63,6 +63,11 @@ IMAGE_FEATURES_REPLACES_ssh-server-openssh =3D "ssh-se=
rver-dropbear"
 # IMAGE_FEATURES_CONFLICTS_foo =3D 'bar1 bar2'
 # An error exception would be raised if both image features foo and bar1=
(or bar2) are included
=20
+# IMAGE_QA_PROHIBITED_PATHS
+# Ensure images aren't including files in places that will be used as mo=
unt points or that are
+# reserved for runtime data.
+IMAGE_QA_PROHIBITED_PATHS ?=3D "/dev/pts/*:/media/*:/mnt/*:/proc/*:/run/=
*:/tmp/*:/var/run/*:/var/tmp/*:/var/volatile/*"
+
 MACHINE_HWCODECS ??=3D ""
=20
 CORE_IMAGE_BASE_INSTALL =3D '\
--=20
2.33.0


