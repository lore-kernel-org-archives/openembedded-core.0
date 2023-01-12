Return-Path: <bmauduit@beneth.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5A8C54EBD
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 13:24:28 +0000 (UTC)
Received: from mail.socneth.com (mail.socneth.com [54.36.198.193])
 by mx.groups.io with SMTP id smtpd.web10.54579.1673529863214885228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 05:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@beneth.fr header.s=mail header.b=F6BqlvNd;
 spf=pass (domain: beneth.fr, ip: 54.36.198.193, mailfrom: bmauduit@beneth.fr)
From: =?UTF-8?q?Beno=C3=AEt=20Mauduit?= <bmauduit@beneth.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=beneth.fr; s=mail;
	t=1673529860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S33HcobrN6BgdoGL04wgO+cdoD7W/O4vvIYGCsccrPE=;
	b=F6BqlvNdItp8kcoHQ4Gn3bHdRYwxcelCUM+gX0iQI4Ki1OdU/EhWNy+nDYgFllXO7XFn79
	KvwwLkT8kgKxRY2Y+Lu/ZdS4JYx76J7pvnW537IHAZLRVzWnpmQR7Fj8GSZi51Q6eeQRjL
	rGq+CRxQQRZAYVitCuKb5WOJkaZ+fHBot8rNmBf95QcNMKBoSC0T9ZfTCV4uTI+O1zg32N
	s6BHzCYF3Bfl/TNhtZQpEc+vJ7vEUMSK0F6B5DpTF3D9R3Zf3r69g+NhMnGsadcSUtqoBS
	YA8QQCba9Wnkgtr1stbxkGOeffY9Jy65F1WbiOiAhi6j+1QWxnXn9IL6GevfKA==
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Mauduit?= <bmauduit@beneth.fr>
Subject: [PATCH 1/1] lib/oe/reproducible: Use git log without gpg signature
Date: Thu, 12 Jan 2023 14:23:57 +0100
Message-Id: <4415ab7387d6c4466b693b4fc7c2dd4438c1d6aa.1673521664.git.bmauduit@beneth.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673521664.git.bmauduit@beneth.fr>
References: <cover.1673521664.git.bmauduit@beneth.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 13:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175795

Previously, if "showSignature" is present in user gitconfig, parsing
of the timestamp will fail.

Ideally we should replace this command with a git plumbing command.

Signed-off-by: Beno=C3=AEt Mauduit <bmauduit@beneth.fr>
---
 meta/lib/oe/reproducible.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 04a1810d4f2..9ac75c02e38 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -115,7 +115,8 @@ def get_source_date_epoch_from_git(d, sourcedir):
         return None
=20
     bb.debug(1, "git repository: %s" % gitpath)
-    p =3D subprocess.run(['git', '--git-dir', gitpath, 'log', '-1', '--p=
retty=3D%ct'], check=3DTrue, stdout=3Dsubprocess.PIPE)
+    p =3D subprocess.run(['git', '-c', 'log.showSignature=3Dfalse', '--g=
it-dir', gitpath, 'log', '-1', '--pretty=3D%ct'],
+                       check=3DTrue, stdout=3Dsubprocess.PIPE)
     return int(p.stdout.decode('utf-8'))
=20
 def get_source_date_epoch_from_youngest_file(d, sourcedir):
--=20
2.39.0


