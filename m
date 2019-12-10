Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 08A1D7CFE3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 12:56:45 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p9so3090945wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 04:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NpYdvKxup1xFRy4FZdEdqAsPYZ6P552bYrUMdaG6SPc=;
	b=WTp3JwFTL/cKkF+PsK984ndsujlVf7wnF1JVArm9o3BXm3Za8wfpHxAkK+quGnezTx
	PSDrNz+8plHFc/zTV46mskJMpN2PL1esCTMQh8uWyxH8AzScY15EGvU25d2jMJ4Yjrre
	AjIGWJ/MbNtAnqrqqF81fAVugeTwaRjc8W8mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NpYdvKxup1xFRy4FZdEdqAsPYZ6P552bYrUMdaG6SPc=;
	b=BY75zTzZ147O771uWSWzcKkZAJGBAvCS5SA3CgSLdwHjaIxOvkLzo6Kfig3YOlLpx9
	xSrJYDkMbHc/hDvq4JcHubn6Ns62+tCI/WzdC3ohNihSN4B4ouwMZziZKdbmMFKoaiQT
	LYJQpunORUI246lGw2fzvPyF7BwJ7teHdnpz8Ch8u5zN9pKltx+Ir7C6l2D46pskkrJv
	XhaSD2h0+q9qWHHH2YdKj8rZR5bNb1kVMwHtMh+MlOqOKXZ3shHRxKFY3DNlAx1UaNZ8
	k6aQXwLZUGqi4pXxrR5QWBIAbKKmfacgZWV32jmv4VFVjCMoxU1Vd6cM8AW3hF/bUSDq
	LgrA==
X-Gm-Message-State: APjAAAV8kQ1MaPGPiBvsoXG9ladXNghx20NOVeWt3mlnpjuFVJ4YbJ7C
	rF97DZkWfRCgD80cTq3QRlh7Rfe9rcg=
X-Google-Smtp-Source: APXvYqxFzDps9Mp1e8aBVcLcQuhNjd0V2mepml0mCkAm9xIqS7/P+WWzrzgWYDzTd2iZKJkrZxPiqw==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr5126797wma.62.1575982606263;
	Tue, 10 Dec 2019 04:56:46 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w13sm3317965wru.38.2019.12.10.04.56.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 04:56:45 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2019 12:56:44 +0000
Message-Id: <20191210125644.2073-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] sstate: Stop overwriting SSTATE_PKG
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
X-List-Received-Date: Tue, 10 Dec 2019 12:56:46 -0000
Content-Transfer-Encoding: 8bit

Its rather antisocial to overwrite SSTATE_PKG with an expanded form for the variable
and it stops the value of BB_UNIHASH being changed when the package is written out.

Instead of expanding the variable, append to it instead to avoid this rather
hard to figure out behaviour and allow the siggen code to behave as expected.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 64808f8e105..eb1ecd6822d 100644
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
2.20.1


