Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7BF9877028
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 21:39:41 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c133so4426713wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Sep 2016 14:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=juOgvR2AcT2bkaAJ8vGnHHcH2n4xjoRaVh6LINf6aww=;
	b=Xw612Gsv/SNR8L3vUl27mQY42+zIO7KVfQCr+mB03eeyEzaui2gO1l+B3Hs0Ao5gA8
	LFnHIHhcUGDmdt/hoa4HAAid4NIQKDLQ/8A1oU4NU8LdFhg43+sHGrPTl9+ciZMhvIBp
	dpQvMu+Ry2GHImfwwS1M6l591HEIPLJ/lw9b8Y81XGAX9VCd1mvO/gAS4S1+dRWvNb6Z
	wF1jofBrRR9AnUu/8SQ25015Y68SpdwUbrPRKS/Q7gZYLuEr+sP/5iete2h8Ts2eUVj/
	kuA674qBQuslB/9GU3FACWskTWEmHM8SzdlMVUfR8L/f4oTF0c4PDmpATtnMCSrhJto9
	cCoA==
X-Gm-Message-State: AE9vXwOso5RVQ1Sie4LY4oqdW/JgNkXJ3l4toeCoDaeLtBdQ1t+PYZ+3nlJgqWUhUkxaTA==
X-Received: by 10.194.200.99 with SMTP id jr3mr20944765wjc.14.1472852380864;
	Fri, 02 Sep 2016 14:39:40 -0700 (PDT)
Received: from tfsielt31850.fritz.box (31-187-15-27.dynamic.upc.ie.
	[31.187.15.27]) by smtp.gmail.com with ESMTPSA id
	yz6sm12296885wjb.35.2016.09.02.14.39.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Sep 2016 14:39:39 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2016 22:39:37 +0100
Message-Id: <20160902213937.6561-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] e2fsprogs: packaging cleanups (compile_et & mk_cmds)
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
X-List-Received-Date: Fri, 02 Sep 2016 21:39:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While comparing what were supposed to be similar
filesystems from different build machines, some issues
have been noticed in the e2fsprogs recipe, in
particular with the compile_et and mk_cmds utilities.

1) target:
   move compile_et and mk_cmds into the -dev package

   Both are development tools, from the man pages:

   compile_et - error table compiler
     compile_et converts a table listing error-code names
     and associated messages into a C source file suitable
     for use with the com_err(3) library.

   mk_cmds - error table compiler
     mk_cmds converts a table listing command names and
     associated help messages into a C source file suitable
     for use with the ss(3) library.

2) native/nativesdk
   Also apply cleaning of host path (build directory) here,
   so that only the sysroot directory remains, which is
   properly adjusted by the sstate handling.

3) make cleaning of host path actually work
   The existing sed command wasn't working, in particular
   for compile_et; we fix up the sed command so that
   removal of references to the local build directory
   really works. Do the same changes for mk_cmds, for
   consistency.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
index 837224c..f4855bc 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
@@ -52,6 +52,10 @@ do_install () {
 	mv ${D}${bindir}/chattr ${D}${base_bindir}/chattr.e2fsprogs
 
 	install -v -m 755 ${S}/contrib/populate-extfs.sh ${D}${base_sbindir}/
+
+	# Clean host path (build directory) in compile_et, mk_cmds
+	sed -i -e "s,\(ET_DIR=.*\)${S}/lib/et\(.*\),\1${datadir}/et\2,g" ${D}${bindir}/compile_et
+	sed -i -e "s,\(SS_DIR=.*\)${S}/lib/ss\(.*\),\1${datadir}/ss\2,g" ${D}${bindir}/mk_cmds
 }
 
 # Need to find the right mke2fs.conf file
@@ -61,12 +65,6 @@ e2fsprogs_conf_fixup () {
 	done
 }
 
-do_install_append_class-target() {
-	# Clean host path in compile_et, mk_cmds
-	sed -i -e "s,ET_DIR=\"${S}/lib/et\",ET_DIR=\"${datadir}/et\",g" ${D}${bindir}/compile_et
-	sed -i -e "s,SS_DIR=\"${S}/lib/ss\",SS_DIR=\"${datadir}/ss\",g" ${D}${bindir}/mk_cmds
-}
-
 do_install_append_class-native() {
 	e2fsprogs_conf_fixup
 }
@@ -90,7 +88,7 @@ FILES_libcomerr = "${base_libdir}/libcom_err.so.*"
 FILES_libss = "${base_libdir}/libss.so.*"
 FILES_libe2p = "${base_libdir}/libe2p.so.*"
 FILES_libext2fs = "${libdir}/e2initrd_helper ${base_libdir}/libext2fs.so.*"
-FILES_${PN}-dev += "${datadir}/*/*.awk ${datadir}/*/*.sed ${base_libdir}/*.so"
+FILES_${PN}-dev += "${datadir}/*/*.awk ${datadir}/*/*.sed ${base_libdir}/*.so ${bindir}/compile_et ${bindir}/mk_cmds"
 
 ALTERNATIVE_${PN} = "chattr"
 ALTERNATIVE_PRIORITY = "100"
-- 
2.9.3


