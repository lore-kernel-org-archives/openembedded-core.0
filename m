Return-Path: <damien.riegel@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA04605C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 17:50:47 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id d19so23155387qtq.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 09:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cJW+wQMprGL1peEOKMTR8JZDAE0Dg48TjNsEz5qLUNg=;
	b=MfkqK4SN2zA1zgri8NzBTSp6ddlmh4o1N3kmxmPQkrC3BYmyYrKFS9mK8EKMkSWiZX
	TWHIe/4SLYFls/hfu+uQXnkMAOyyAuAuLnCpPzvIFue16PdbVBKerLKZpEQvgWtGLdki
	ljGRz3aq3JIrUFgTCHI2eZel0ACrfqiGHhZ1gtkk46EH5dIoPSxRA3zeGF22auraCTME
	VRZZNRdODK4vVTeaXY2jxgY316OFQPncPpNJFHHYBuUSAP8/RBca0E+LchR+3weSqcYO
	GgVMP9SUYejVKawUhuJz/mWUbiQo47gyaqcWLBJ/GbrgVs+gfAZ1M8yog1S2JvGHPROD
	EOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cJW+wQMprGL1peEOKMTR8JZDAE0Dg48TjNsEz5qLUNg=;
	b=TL+OGJ/3f24c4pcFDIy0UJmzI4UWe7RZ7dcSuD7rt/K00YXZSP38LutGEZN8dOHpUa
	D+lsaaXixn6QtuoX0QKh3bhP86/VWHiSvd8XuatIN2zy+eBY3a2nvvvtLTyeZdxLSVAf
	Zlfkj/diugug79LFe9pWLX38YV5A+ICDQ4z2n+IQbcnp16Ya+ekIb2o04uRGWWUcWaek
	sEGH0Mdha+rZtE4CabR4ZGMOooDK/wN/85jE65pud0VnSVlkRKQqlnV353yakTY2Nu1Y
	IMhEBUVvLE2Sy9+jG8W4xML2HcgQJ4i8nQd8DP7++mvHC/ZHenWB4aLpdvf02+EnPq4I
	YaqQ==
X-Gm-Message-State: AA+aEWYn+/fWMubD4DJSJs9cOaIIthSApZ/Ypi19SdpQAxY4AvVL16xD
	Ps/tpa4zO5JCN0KrL313ilJhvSN+
X-Google-Smtp-Source: AFSGD/W7zXWbc5RwnfEJC9BPTDUPvsk0dLwoo43oYTOlmXIIP9lxpqcxcCdigzxi52oO2LLEN2R8Sw==
X-Received: by 2002:ac8:3ae5:: with SMTP id x92mr23667115qte.370.1545241847844;
	Wed, 19 Dec 2018 09:50:47 -0800 (PST)
Received: from workotop.localdomain (modemcable073.90-22-96.mc.videotron.ca.
	[96.22.90.73]) by smtp.gmail.com with ESMTPSA id
	x41sm2763204qth.92.2018.12.19.09.50.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Dec 2018 09:50:47 -0800 (PST)
From: Damien Riegel <damien.riegel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 12:50:40 -0500
Message-Id: <20181219175040.10507-1-damien.riegel@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH] [RFC] go.bbclass: install dependencies under $GOPATH instead of $GOROOT
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
X-List-Received-Date: Wed, 19 Dec 2018 17:50:47 -0000
Content-Transfer-Encoding: 8bit

To package a go application in Yocto, one needs to also package its
dependencies to keep the build reproducible and under control. The
default install task of the go class puts the source in ${libdir}/go/src.

${libdir}/go/src is where the standard go packages resides, aka $GOROOT.
When a go package has dependencies on other go packages, they must be
located under $GOPATH, otherwise errors like this one may happen:

  Non-standard package <packagename> in standard package <packagename>

This point of this patch is to trigger a discussion on how this issue
can be tackled in Yocto. Following code is working but should not be
considered for inclusion.

Signed-off-by: Damien Riegel <damien.riegel@gmail.com>
---
 meta/classes/go.bbclass | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 167d02e3fa..c0ed3211cd 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -111,9 +111,9 @@ do_compile_ptest_base() {
 do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
 
 go_do_install() {
-	install -d ${D}${libdir}/go/src/${GO_IMPORT}
+	install -d ${D}/gopath/src/${GO_IMPORT} ${D}${libdir}/go
 	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
-		tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
+		tar -C ${D}/gopath/src/${GO_IMPORT} --no-same-owner -xf -
 	tar -C ${B} -cf - pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
 
 	if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
@@ -172,9 +172,21 @@ do_install_ptest_base() {
 	chown -R root:root ${D}${PTEST_PATH}
 }
 
+do_fixupdeps() {
+	gopath="${WORKDIR}/recipe-sysroot/gopath"
+	if [ -d ${gopath} ]; then
+		tar -C ${gopath} -cf - src | tar -C ${B} --no-same-owner -k -xf -
+	else
+		echo "no dependencies to fixup"
+	fi
+}
+
 EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
 
-FILES_${PN}-dev = "${libdir}/go/src"
+addtask do_fixupdeps after do_configure before do_compile
+
+SYSROOT_DIRS_append = "/gopath"
+FILES_${PN}-dev = "/gopath/src"
 FILES_${PN}-staticdev = "${libdir}/go/pkg"
 
 INSANE_SKIP_${PN} += "ldflags"
-- 
2.19.2


