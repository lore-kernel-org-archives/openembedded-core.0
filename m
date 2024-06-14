Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7117AC27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 07:37:47 +0000 (UTC)
Received: from smtp-out.freemail.hu (smtp-out.freemail.hu [46.107.16.236])
 by mx.groups.io with SMTP id smtpd.web11.6259.1718350663912043315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jun 2024 00:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@freemail.hu header.s=20181004 header.b=qHQFSJzT;
 spf=pass (domain: freemail.hu, ip: 46.107.16.236, mailfrom: egyszeregy@freemail.hu)
Received: from localhost.localdomain (catv-80-98-74-198.catv.fixed.vodafone.hu [80.98.74.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.freemail.hu (Postfix) with ESMTPSA id 4W0rj049Yxz8yS;
	Fri, 14 Jun 2024 09:37:40 +0200 (CEST)
From: egyszeregy@freemail.hu
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Benjamin=20Sz=C5=91ke?= <egyszeregy@freemail.hu>
Subject: [PATCH v2] archiver.bbclass: Fix work-shared checking for kernel recipes
Date: Fri, 14 Jun 2024 09:37:29 +0200
Message-ID: <20240614073729.269-1-egyszeregy@freemail.hu>
X-Mailer: git-send-email 2.45.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1718350661;
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 07:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200650

	s=20181004; d=freemail.hu;

	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;

	l=1000; bh=cZq/iyRsiO/suMp6+XPpnAyruM/oarbAD89+GDtEKSs=;

	b=qHQFSJzTCJuTyMftQGChJHx+XjvMgsHgNdcuvW4MWBejSldfD0oINWiobepigfst

	gUNPW+azdUtD1FX+kZGNH/8xdvU/XWcQH2igIxG8Ynrunx/HSkZIebeUWU1QFBQsXsA

	SnbPg2p4q+kGkUriO5tR3UwX5Y2Zr+nBYt333OMwZ41yML5pomBBIsGylp7+d6elOBt

	GblQB2J7dnqeAaeXYDE2v25L7R8G/F8AcSkTCn+sf8ZQxsv8V0/hDqc7naHtq00kFMi

	Bi4BiusSrpORCHxLFRGmmWi8qMS9IuFE0hMJ4BzGlxb68dh8qOzPkZaH1IxrEPAwG8u

	nAFsgVWHCw==
Content-Transfer-Encoding: quoted-printable

From: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>

Source dir can be a symbolic link in some BSP's linux kernel recipe
which points to work-shared path (like linux-fslc in meta-freescale).
Change to use os.path.realpath() in order to get real path of
source dir.

Signed-off-by: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>
---
 meta/classes/archiver.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
index 2d0bbfbd42..9d286224d6 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -473,7 +473,8 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
=20
 def is_work_shared(d):
     sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), 'work-shared')
-    return d.getVar('S').startswith(sharedworkdir)
+    sourcedir =3D os.path.realpath(d.getVar('S'))
+    return sourcedir.startswith(sharedworkdir)
=20
 # Run do_unpack and do_patch
 python do_unpack_and_patch() {
--=20
2.45.2.windows.1


