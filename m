Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9738E7F870
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:14 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id r11so24827167pgf.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VqqkZHlHSMK+IaEEv7GVcK4F/1rzQ0J37YM+6hpxjug=;
	b=rLXJP/HCoibR+r7FG33B+lUiQsDb9bYixbslyatXkvoxodsR5+acwvdUUDiEFua4xQ
	GFdpMq3R897KVSPaSVEibms8UiwUTYzxDShh3O6JaQqOdagONXA8gA01VgVAuzx1KhKY
	XmPonaGCqRbFMj0TxHi9q0/CcHcZdONxv/bevuo52XQq/PKUALMGTm7z6NzmhLn3CGRw
	rhWdECDC4U2ZBVfmlLcrm2q0Z8gobVs4ykIzM8S/ENqKtxMhioF0ch1oAqBIN4NXDGjU
	FYzmfwhpOlgvNsfcuIKhw4cp1QhN4g29LhWcmH7kTgsDoPOUyv3Ee95HJCJ071GhPr3h
	8o3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VqqkZHlHSMK+IaEEv7GVcK4F/1rzQ0J37YM+6hpxjug=;
	b=sR5EBclfwWGszj5GBU2q1yfgAjnn/XPPMI0telwhuD/uXT8i9cUCGhk33v491BIKfW
	RCElFIqNC/CJt6egMLJN+jDg8WY8m+IzmuLzrCRjd1MnHdwtfAIormh9sv03a5hZ35Yw
	04DQSY95axyLTK3dVBJ7cpNAt19i6KDQE8yhV+79mWx/hd4bK0nj6g/gPO1t1R/Qobp7
	SK2MkxSTrdOCjSTD8BljR8+Daf5SNFc7zn1oH2U+bYfiM7AxkSuRoJVt0GYNqCc4jVmg
	nafGafua8NNJFWVxb6Ye6zBhBrNYtnQE8VY+IWlvIobiJG2kWw/Xpie5VzwPfszgbFJ5
	Corg==
X-Gm-Message-State: APjAAAUih7qAlKSC4Y51nk67gO8k+hFI/g7BLeNny+dbi45ud55Kpo0G
	EML8iyUshaX59hW/DsLPXBUwEI1dnns=
X-Google-Smtp-Source: APXvYqxW2XVXlww+HQfS3PnYAUNBqbafOUqM0nQPz1x53LzPOWBL+hL5zWtM5YKqDnGqN8UmQzSKPA==
X-Received: by 2002:a63:5243:: with SMTP id s3mr99097229pgl.449.1578155175549; 
	Sat, 04 Jan 2020 08:26:15 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:25:43 -0800
Message-Id: <fe454e9c7837a903ffcff4c6f8a25070a0f0af82.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 02/29] sstate: Stop overwriting SSTATE_PKG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Jan 2020 16:26:14 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Its rather antisocial to overwrite SSTATE_PKG with an expanded form for the variable
and it stops the value of BB_UNIHASH being changed when the package is written out.

Instead of expanding the variable, append to it instead to avoid this rather
hard to figure out behaviour and allow the siggen code to behave as expected.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 62eca02024b4c44d618ab9bcf87a3166c886dadb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sstate.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 64808f8e10..eb1ecd6822 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -318,7 +318,8 @@ def sstate_installpkg(ss, d):
 
     sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['task'])
     sstatefetch = d.getVar('SSTATE_PKGNAME') + '_' + ss['task'] + ".tgz"
-    sstatepkg = d.getVar('SSTATE_PKG') + '_' + ss['task'] + ".tgz"
+    d.appendVar('SSTATE_PKG', '_'+ ss['task'] + ".tgz")
+    sstatepkg = d.getVar('SSTATE_PKG')
 
     if not os.path.exists(sstatepkg):
         pstaging_fetch(sstatefetch, d)
@@ -330,7 +331,6 @@ def sstate_installpkg(ss, d):
     sstate_clean(ss, d)
 
     d.setVar('SSTATE_INSTDIR', sstateinst)
-    d.setVar('SSTATE_PKG', sstatepkg)
 
     if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
         signer = get_signer(d, 'local')
@@ -612,7 +612,8 @@ def sstate_package(ss, d):
     tmpdir = d.getVar('TMPDIR')
 
     sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['task'])
-    sstatepkg = d.getVar('SSTATE_PKG') + '_'+ ss['task'] + ".tgz"
+    d.appendVar('SSTATE_PKG', '_'+ ss['task'] + ".tgz")
+    sstatepkg = d.getVar('SSTATE_PKG')
     bb.utils.remove(sstatebuild, recurse=True)
     bb.utils.mkdirhier(sstatebuild)
     bb.utils.mkdirhier(os.path.dirname(sstatepkg))
@@ -648,7 +649,6 @@ def sstate_package(ss, d):
         os.rename(plain, pdir)
 
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
-    d.setVar('SSTATE_PKG', sstatepkg)
     d.setVar('SSTATE_INSTDIR', sstatebuild)
 
     if d.getVar('SSTATE_SKIP_CREATION') == '1':
-- 
2.17.1


