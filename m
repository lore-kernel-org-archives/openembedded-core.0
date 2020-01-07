Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1EE157D2E5
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:34:39 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id a6so21848160plm.3
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VqqkZHlHSMK+IaEEv7GVcK4F/1rzQ0J37YM+6hpxjug=;
	b=Op2lSh249lSc7otHHH8bZGCEnOoHFZb7WCzv6Ar7ZPjDARWWQbXpT76j5vv1uuHr1L
	eDxjbJavtGTKJG11lyfK7sGWGyheAuETH1q43EglmiP1iyPxmPkvpDsSKjdJ657Gd2H+
	/fgJkwpvADrodPyya6Tz4KPfv3OlMmM3O3WXwqcRHOLTDNAAlpBmcpFotUMXEtVK881s
	IM+io6k5G7TVkNIVeINa2745d2v8+LGiqu9LHgbvGOXesETxkX9xOPoU5eYGvXA/xgVF
	PDWvHGiVsSy6/jDDZauaikxjIerYT3mwPDXnX6PR7+zTZAERxbRzq4Yf2oewCb0Um9Vu
	LJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VqqkZHlHSMK+IaEEv7GVcK4F/1rzQ0J37YM+6hpxjug=;
	b=ZdEBgxP6Q7ESHPz3DpEsj7Vr1wq+y0Q6u6chtd1WyrSi/heFXvVs92BINf3W7fGmNh
	KZBlFkTq2V895vyW8bn/qGH8VS45vJC37RTcGU1hfWsoXcUQLw8OG2qhSzm4ftzPKsOz
	puXq1IoKulLTqG+g81YBZ7lkgYz/6OcSlCaAXUCbvRxPy3heSW9D6L3AlB2ChUnZvdJ+
	cSfDg09JTjxz/osO9QS3jedK3kIZ2VeYZp/ygaTFMjvh/Tk8/boFx5N5vAx+ozwMp9jx
	A9tTNccqm+sGm550lMvYKP6M9xtc4wqnrGJt1jvnBBnxlA9boWL3EwzY/5V9KPDhOH2P
	2Qog==
X-Gm-Message-State: APjAAAUmyS3PWHkPZLCl6D26zBoWAqG1qci0ef1VVGzk/xH2/xjILN9s
	2EgqubUlVxZaZDYwlR2oZPMXntG4
X-Google-Smtp-Source: APXvYqxT9fuXb3hGm2nyIlOkiBj3rbXdNs13vz086uYauaD1KTGzVHG5iqCDxIwPrDu5ACY8Xu76ZQ==
X-Received: by 2002:a17:902:7890:: with SMTP id
	q16mr103025165pll.105.1578364480684; 
	Mon, 06 Jan 2020 18:34:40 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.34.39
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:34:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:07 -0800
Message-Id: <fe454e9c7837a903ffcff4c6f8a25070a0f0af82.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
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
X-List-Received-Date: Tue, 07 Jan 2020 02:34:40 -0000

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


