Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164C9C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 19:56:07 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web10.5943.1716839760931048931
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 12:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=jvz3cIkO;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id D94536DCE;
	Mon, 27 May 2024 21:55:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1716839758;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	l=989; bh=OrKKTirJvUiF/VHBEpK9PW45ctKeTG/1qqwlNMtPKpk=;
	b=jvz3cIkORMIxOQuz2Ft2pkKIBKddmjwhF8OphVpWQkyloAwQ3AudNOtbml7lxWZS
	EMWGO1nH+xjpf6UUW7bADiGvl21EBhglCUjTDu0kLeqazfW/UPWhgSznZD3RwSqQiGY
	2iV2lII8ZPdfSyQ0G5BOrflqyCQO+NXBulSfGHkZr5rPDflLVFj3LWthlUNc0oYUDeK
	t8J/1jJ9GUlWKoVO7E0fzQC0ZGk7cxqejV58FQAaP4CLARjDtuFraltIEIcUAKhUKr8
	hrXPRzyfX2tjVFoPJU08YevO3ziMUhtExJZkSqsvA6ojrDCHOFvHIau7qw/VZfvx2Hb
	qXd8BsUHCA==
Received: by smtp.mailfence.com with ESMTPSA ; Mon, 27 May 2024 21:55:55 +0200 (CEST)
From: robert.joslyn@redrectangle.org
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [master][scarthgap][PATCH] libgloss: Do not apply non-existent patch
Date: Mon, 27 May 2024 12:55:41 -0700
Message-ID: <20240527195541.30167-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-ContactOffice-Account: com:454140407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 19:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199937

From: Robert Joslyn <robert.joslyn@redrectangle.org>

When newlib and libgloss were updated to 4.3.0, SRC_URI was updated to
append a fix-rs6000-cflags.patch file when building on PowerPC, but this
file was not added to the repo.

Remove appending the missing patch.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-core/newlib/libgloss_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/newlib/libgloss_git.bb b/meta/recipes-core=
/newlib/libgloss_git.bb
index 7e34e33c7a..3c97a7f296 100644
--- a/meta/recipes-core/newlib/libgloss_git.bb
+++ b/meta/recipes-core/newlib/libgloss_git.bb
@@ -6,7 +6,6 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/libgloss:"
=20
 SRC_URI:append =3D " file://libgloss-build-without-nostdinc.patch"
 SRC_URI:append:powerpc =3D " file://fix-rs6000-crt0.patch"
-SRC_URI:append:powerpc =3D " file://fix-rs6000-cflags.patch"
=20
 do_configure() {
 	${S}/libgloss/configure ${EXTRA_OECONF}
--=20
2.44.1


