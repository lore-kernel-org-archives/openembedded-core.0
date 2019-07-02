Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 03C786C1BD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 15:22:52 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id v14so18310953wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 08:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=A4S/MWtrE6HLQe02a29DT/K/XOmd/8tT94bG1vWbDfM=;
	b=jbMZfg5snjGOCmsoeZG9qkFAVyKhGFompOSJfVV3925JFgPEh8DMjtk3ox+cjXLuFt
	Z3fWYt+um/ztvAISypcz82ZvKk5t9rrvdttRORF+xHQGaMplv4IixEmVGK051ctMk1IQ
	J0EFItNw6t9QcK7ocAJf2wpzoJdBGCyFY8VdHat5VnV8wiQ3jBfZR9xyJNB6492gVVqg
	uKwGkVTr1p3aM7EJBa4QJJqdSyUoJPGtT6P8YtnuHhf/tt1u++0KkR5KJbxBveSH2BsU
	7eNMjrLGzW6lUSofb7i5kZ4ZdqQZn5a3g7QavO14FATpQe+ROeP0hHw47c0KXJ6lJBVt
	HbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=A4S/MWtrE6HLQe02a29DT/K/XOmd/8tT94bG1vWbDfM=;
	b=XXGXHfZlY1sqJjO+N+d+EI6R7J2zSvXHXUye/qEXWSbhKHAp9SWAjHPTMT/ndnJGI+
	fKt8vxOTCZ0dmKqt8XNQRyKNWFzGTzS8YtYbyGPwOcHyFYJ5j79vjTWBLCCOJsD2dDlw
	lG8n/ggYkzzDDIHlIHgnQn8B4HD+2Lm8oFDKd/rnYnbo5qTnFPqngihfDV7l07rqKAaC
	iVUyM5dmV7/TOEcCX9VmEKe5Jo9IlYqNWY+vua+ujC1QbANmvdzmmMykF5Vm++AyVscd
	Yu+RB4YPS38KjY03HPKAK0sCskELheAUGC98mcqDBhrDDL52wYTD74Bcj6d8ME2GCUbX
	/Tqw==
X-Gm-Message-State: APjAAAWZK/PDXzUOiFMpLG8ryHV914markgMADEyUfaUnDpKA2qsI/sf
	ic6qn1HzYSJzfHuAmDUtgCuTso1jDkI=
X-Google-Smtp-Source: APXvYqxOAAOqgVYwU2xZTWDUf6BEq3iv7+xRQhRsYy7F98up3HOyHxBpeNpOnmDYyKl8xeA8Dn4IyA==
X-Received: by 2002:a5d:400f:: with SMTP id n15mr16164441wrp.312.1562080973638;
	Tue, 02 Jul 2019 08:22:53 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b203sm3548396wmd.41.2019.07.02.08.22.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Jul 2019 08:22:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 16:22:48 +0100
Message-Id: <20190702152248.13678-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190702152248.13678-1-ross.burton@intel.com>
References: <20190702152248.13678-1-ross.burton@intel.com>
Subject: [PATCH 2/2] multilib_script: use MLPREFIX instead of libdir when renaming
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
X-List-Received-Date: Tue, 02 Jul 2019 15:22:53 -0000

Instead of using part of ${base_libdir} to rename scripts, use MLPREFIX.  This
is more obvious as MLPREFIX is a common prefix in package names, and as these
filenames are hidden behind alternatives they're rarely used directly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/multilib_script.bbclass | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes/multilib_script.bbclass b/meta/classes/multilib_script.bbclass
index b11efc1ec5c..de95dc6551d 100644
--- a/meta/classes/multilib_script.bbclass
+++ b/meta/classes/multilib_script.bbclass
@@ -6,8 +6,6 @@
 
 inherit update-alternatives
 
-MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
-
 PACKAGE_PREPROCESS_FUNCS += "multilibscript_rename"
 
 multilibscript_rename() {
@@ -26,9 +24,10 @@ python () {
         pkg, script = entry.split(":")
         epkg = d.expand(pkg)
         scriptname = os.path.basename(script)
+        mlname = os.path.join(os.path.dirname(script), "${MLPREFIX}" + scriptname)
         d.appendVar("ALTERNATIVE_" + epkg, " " + scriptname + " ")
         d.setVarFlag("ALTERNATIVE_LINK_NAME", scriptname, script)
-        d.setVarFlag("ALTERNATIVE_TARGET", scriptname, script + "-${MULTILIB_SUFFIX}")
-        d.appendVar("multilibscript_rename",  "\n	mv ${PKGD}" + script + " ${PKGD}" + script + "-${MULTILIB_SUFFIX}")
-        d.appendVar("FILES_" + epkg, " " + script + "-${MULTILIB_SUFFIX}")
+        d.setVarFlag("ALTERNATIVE_TARGET", scriptname, mlname)
+        d.appendVar("FILES_" + epkg, " " + mlname)
+        d.appendVar("multilibscript_rename",  "\n	mv ${PKGD}" + script + " ${PKGD}" + mlname)
 }
-- 
2.11.0


