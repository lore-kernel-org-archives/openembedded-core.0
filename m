Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615C7C27C52
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 20:49:15 +0000 (UTC)
Received: from smtp-out.freemail.hu (smtp-out.freemail.hu [46.107.16.232])
 by mx.groups.io with SMTP id smtpd.web11.26129.1717706952274872043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 13:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@freemail.hu header.s=20181004 header.b=iZKL9Fwm;
 spf=pass (domain: freemail.hu, ip: 46.107.16.232, mailfrom: egyszeregy@freemail.hu)
Received: from localhost.localdomain (catv-80-98-74-198.catv.fixed.vodafone.hu [80.98.74.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.freemail.hu (Postfix) with ESMTPSA id 4VwGdx32j3z34M;
	Thu,  6 Jun 2024 22:49:09 +0200 (CEST)
From: egyszeregy@freemail.hu
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Benjamin=20Sz=C5=91ke?= <egyszeregy@freemail.hu>
Subject: [PATCH] archiver.bbclass: Fix work-shared checking for kernel recipes
Date: Thu,  6 Jun 2024 22:48:55 +0200
Message-ID: <20240606204855.1904-1-egyszeregy@freemail.hu>
X-Mailer: git-send-email 2.45.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1717706949;
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 20:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200417

	s=20181004; d=freemail.hu;

	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;

	l=1045; bh=oHxilov6nfo9rMZSzya/JNLFzvCt7tB62SYU9eHL/QQ=;

	b=iZKL9Fwm3xlIxmkZhAYo72aSO9s12Xa+Meez4Z1s+t2UViytuBVT41554e5YDWWm

	qLaqsiEQbXVzpl80EVToMgZMnlOZUVkn/V9IS8Yd1gi+NjkiZwYQGeGMiWdV95yxxIB

	P8hnPdsg6EKgr35wF6kQt+FZyj6rxchgADvNoiD5W0poNcmgBMuBsM0gYYtj9+D//E4

	SU4Sy0EDWtvXdlqOJWHF+wqyi4erii116bmz1CjcAm66PnMkyfv5jZYtVuVeV+FxlkW

	KZb9lr4erYTMqDy+vnwYQZd3JOBcN22H5rOaRoKDtLrH22nBDVJB9lbYshdInkZbacO

	5N46Wb9YBA==
Content-Transfer-Encoding: quoted-printable

From: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>

Restore to use checking inherited kernel class, because it possible
that some BSP's linux kernel recipe (like linux-fslc in meta-freescale)
change source dir to S =3D "${WORKDIR}/git" symbolic link and in this
case work-shared checking is failed for kernel recipe.

Signed-off-by: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
index 2d0bbfbd42..fa285a1c10 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -473,7 +473,7 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
=20
 def is_work_shared(d):
     sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), 'work-shared')
-    return d.getVar('S').startswith(sharedworkdir)
+    return d.getVar('S').startswith(sharedworkdir) or bb.data.inherits_c=
lass('kernel', d)
=20
 # Run do_unpack and do_patch
 python do_unpack_and_patch() {
--=20
2.45.2.windows.1


