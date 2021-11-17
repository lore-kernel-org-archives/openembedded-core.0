Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05EBC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 09:20:45 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.4862.1637140844315961075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AH9KhFl000909
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:20:43 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1AH9KbtU026218
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:20:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 17 Nov 2021 01:20:37 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 17 Nov 2021 01:20:36 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 1/4] vim: fix CVE-2021-3872 and CVE-2021-3903
Date: Wed, 17 Nov 2021 17:18:23 +0800
Message-ID: <20211117091826.22740-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id
 1AH9KhFl000909
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 09:20:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158379

From: Mingli Yu <mingli.yu@windriver.com>

Backport 2 patches to fix below CVEs:
 - CVE-2021-3872
 - CVE-2021-3903

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../vim/files/CVE-2021-3872.patch             | 57 +++++++++++++++++++
 .../vim/files/CVE-2021-3903.patch             | 38 +++++++++++++
 meta/recipes-support/vim/vim.inc              |  2 +
 3 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3872.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3903.patch

diff --git a/meta/recipes-support/vim/files/CVE-2021-3872.patch b/meta/re=
cipes-support/vim/files/CVE-2021-3872.patch
new file mode 100644
index 0000000000..f0f30933fa
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2021-3872.patch
@@ -0,0 +1,57 @@
+From 132d060ffbb9651f0d79bd0b6d80cab460235a99 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Fri, 12 Nov 2021 02:56:51 +0000
+Subject: [PATCH] patch 8.2.3487: illegal memory access if buffer name is=
 very
+ long
+
+Problem:    Illegal memory access if buffer name is very long.
+Solution:   Make sure not to go over the end of the buffer.
+
+CVE: CVE-2021-3872
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/826bfe4bbd7=
594188e3d74d2539d9707b1c6a14b]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/drawscreen.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/drawscreen.c b/src/drawscreen.c
+index 3a88ee979..9acb70552 100644
+--- a/src/drawscreen.c
++++ b/src/drawscreen.c
+@@ -446,13 +446,13 @@ win_redr_status(win_T *wp, int ignore_pum UNUSED)
+ 	    *(p + len++) =3D ' ';
+ 	if (bt_help(wp->w_buffer))
+ 	{
+-	    STRCPY(p + len, _("[Help]"));
++	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", _("[Help]"));
+ 	    len +=3D (int)STRLEN(p + len);
+ 	}
+ #ifdef FEAT_QUICKFIX
+ 	if (wp->w_p_pvw)
+ 	{
+-	    STRCPY(p + len, _("[Preview]"));
++	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", _("[Preview]")=
);
+ 	    len +=3D (int)STRLEN(p + len);
+ 	}
+ #endif
+@@ -462,12 +462,12 @@ win_redr_status(win_T *wp, int ignore_pum UNUSED)
+ #endif
+ 		)
+ 	{
+-	    STRCPY(p + len, "[+]");
+-	    len +=3D 3;
++	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", "[+]");
++	    len +=3D (int)STRLEN(p + len);
+ 	}
+ 	if (wp->w_buffer->b_p_ro)
+ 	{
+-	    STRCPY(p + len, _("[RO]"));
++	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", _("[RO]"));
+ 	    len +=3D (int)STRLEN(p + len);
+ 	}
+=20
+--=20
+2.31.1
+
diff --git a/meta/recipes-support/vim/files/CVE-2021-3903.patch b/meta/re=
cipes-support/vim/files/CVE-2021-3903.patch
new file mode 100644
index 0000000000..fb45857de8
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2021-3903.patch
@@ -0,0 +1,38 @@
+From a366598006f4d7bf9b4fbcd334a2e5078dcb6ad8 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Fri, 12 Nov 2021 02:23:38 +0000
+Subject: [PATCH] =3D?UTF-8?q?patch=3D208.2.3564:=3D20invalid=3D20memory=3D=
20access?=3D
+ =3D?UTF-8?q?=3D20when=3D20scrolling=3D20without=3D20valid=3D20sc=3DE2=3D=
80=3DA6?=3D
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+=E2=80=A6reen
+
+Problem:    Invalid memory access when scrolling without a valid screen.
+Solution:   Do not set VALID_BOTLINE in w_valid.
+
+CVE: CVE-2021-3903
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/777e7c21b76=
27be80961848ac560cb0a9978ff43]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/move.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/move.c b/src/move.c
+index 8e53d8bcb..10165ef4d 100644
+--- a/src/move.c
++++ b/src/move.c
+@@ -198,7 +198,6 @@ update_topline(void)
+     {
+ 	curwin->w_topline =3D curwin->w_cursor.lnum;
+ 	curwin->w_botline =3D curwin->w_topline;
+-	curwin->w_valid |=3D VALID_BOTLINE|VALID_BOTLINE_AP;
+ 	curwin->w_scbind_pos =3D 1;
+ 	return;
+     }
+--=20
+2.31.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index e04c653fe3..362c822f05 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,6 +20,8 @@ SRC_URI =3D "git://github.com/vim/vim.git \
            file://CVE-2021-3778.patch \
            file://CVE-2021-3796.patch \
            file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
+           file://CVE-2021-3903.patch \
+           file://CVE-2021-3872.patch \
 "
=20
 SRCREV =3D "98056533b96b6b5d8849641de93185dd7bcadc44"
--=20
2.17.1


