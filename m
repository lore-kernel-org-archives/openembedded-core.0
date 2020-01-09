Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id DE4777FE5C
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:49:52 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id a6so586359pjh.2
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VqqkZHlHSMK+IaEEv7GVcK4F/1rzQ0J37YM+6hpxjug=;
	b=au9/KNIwgbWqvuAGQFcwMhGFVxDn1LMO09+nr0oCkE4+VmykGtkBvEtJKIM7KUOgWB
	c0Uk+EKTVE/NKuem5nj1yaW/9jhA073FG1/MQZFMmZKezRc0vDBJmWI0pDnO3QYlG4R8
	Vw9P9NSaE9r7vfG4+IC88v4m/pA29cxRs2tnQzk1znAZ+UYERg97INKsX7gOhjrvzASR
	PmCjWb0uoEtb8sdne9Gxe5ETdc08DHLZ/euhBaqwJIM1XOEu2PaOTUrjimUG3zlt85Fq
	Hj5fT6WaZfDveQJ+MPORyixR1uDdMFZhk6WwBHWpzA7ocZU2wMe1FoboGL1WW0/2nI6j
	KpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VqqkZHlHSMK+IaEEv7GVcK4F/1rzQ0J37YM+6hpxjug=;
	b=BHbC73CGuF36WOo9D6ppJJlxg1x3UN4FMmWAS1CRBfq/BBSW0r0r1myyfjatG654xl
	zzVeTsK/y8eKJBnz3K/zxf9frtj6th6Um4ez7NsgYtCldKUdG3i1LuORE3kpULhqWIKd
	FpEqqujTw+EwskkaKaiivMt1p2aQdxPfrqudjK4VCnOX1SUUu42Q4Latr7eckn9FX/En
	PVFXCPU14iKDrSf+SHWhrnbp16t0tE2H6ttDKnMNtG6cg5kxMiaBlLjZz2s2uB2/C8Qj
	uRG4QxCLCijjDGhcSMPZ9PFpx4nJcSPeMfq6DYJqKx4hCOkb0Bn0SpFcr1naEswOCwTl
	PzUA==
X-Gm-Message-State: APjAAAUmo8rZOpv3Bljm0YyJIgKAUOuDAb+UyV9npjNA5tYF4w84QcjC
	AEALZLQ/wBHYaGQrBgg3LdS2clGw
X-Google-Smtp-Source: APXvYqxSrgBOh2E1T0WMfQWOK3G2jqHOSIdLGSc0Yz0nOEd0inOleF5377H7SE76UFP9dsXCWKgOPQ==
X-Received: by 2002:a17:902:9a08:: with SMTP id
	v8mr9693873plp.134.1578545393867; 
	Wed, 08 Jan 2020 20:49:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.49.53
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:49:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:21 -0800
Message-Id: <fe454e9c7837a903ffcff4c6f8a25070a0f0af82.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
Subject: [zeus 02/28] sstate: Stop overwriting SSTATE_PKG
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
X-List-Received-Date: Thu, 09 Jan 2020 04:49:53 -0000

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


