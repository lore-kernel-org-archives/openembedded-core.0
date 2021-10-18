Return-Path: <yuka@yuka.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392CAC433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 12:03:02 +0000 (UTC)
Received: from mail.yuka.dev (mail.yuka.dev [195.39.247.168])
 by mx.groups.io with SMTP id smtpd.web10.35124.1634558580899950672
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 05:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@yuka.dev header.s=mail
 header.b=GHG9gKQ6;
 spf=pass (domain: yuka.dev, ip: 195.39.247.168, mailfrom: yuka@yuka.dev)
From: Yureka <yuka@yuka.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yuka.dev; s=mail;
	t=1634558579; bh=FPSCRu0+6eWlFVuqakWEg1NQl8ZlO2lOmeWFuEnda1E=;
	h=From:To:Cc:Subject:Date;
	b=GHG9gKQ692X0C4eEZxQUkIxv3aGHUuIdFO7QVx22h5a3JHnxQLSB09s9NLIhQHtaN
	 t+1e+8D6qPxq0VFyCjs1E5u5vwIAzmZrTH4FZb8hTHyc0d3A6xiCVb9anzgeg4vWBm
	 N+ziKQcz/+AJBog0lvkFmGfAZMuVbiRC3LnptueI=
To: openembedded-core@lists.openembedded.org
Cc: Yureka <yuka@yuka.dev>
Subject: [PATCH] systemd: add missing include for musl
Date: Mon, 18 Oct 2021 14:02:51 +0200
Message-Id: <20211018120251.1203204-1-yuka@yuka.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 12:03:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157055

Fixes "error: =E2=80=98FTW_ACTIONRETVAL=E2=80=99 undeclared (first use in=
 this
function)" in src/shared/mount-setup.c.

Signed-off-by: Yureka <yuka@yuka.dev>
---
 .../0008-add-missing-FTW_-macros-for-musl.patch  | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macr=
os-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FT=
W_-macros-for-musl.patch
index 95c3000aa1..792727ed8e 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-=
musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-=
musl.patch
@@ -10,10 +10,10 @@ This is to avoid build failures like below for musl.
 Upstream-Status: Inappropriate [musl specific]
=20
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
 ---
  src/basic/missing_type.h | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
+ src/shared/mount-setup.c |  1 +
+ 2 files changed, 21 insertions(+)
=20
 diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
 index aeaf6ad5ec..3df1084ef2 100644
@@ -43,3 +43,15 @@ index aeaf6ad5ec..3df1084ef2 100644
 +#ifndef FTW_SKIP_SIBLINGS
 +#define FTW_SKIP_SIBLINGS 3
 +#endif
+diff --git a/src/shared/mount-setup.c b/src/shared/mount-setup.c
+index ef3527e9a7..c1cab40eb8 100644
+--- a/src/shared/mount-setup.c
++++ b/src/shared/mount-setup.c
+@@ -32,6 +32,7 @@
+ #include "strv.h"
+ #include "user-util.h"
+ #include "virt.h"
++#include "missing_type.h"
+=20
+ typedef enum MountMode {
+         MNT_NONE           =3D 0,
--=20
2.33.0


