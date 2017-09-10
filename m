Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id D02CE77E97
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 13:15:01 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id y29so9748985pff.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 06:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=RdjaCLetI3VSMpToDFG/pvy+KkKXJyf1TNVkCPsOMKI=;
	b=HmMhBUW/PskL+3fxafL0AkIDwJ7tiQaY8eqRwo7gl8EBOMixLmZfLLdS57D1zBr+0l
	psi2Oc9UQtLh6v7GKmOH1nclV7FSR4smA6Rvqcvvs9g1vXEY7x5owZKi5rK67g+3xAlx
	wOLrlNnVveKUGRaQPS+sG6HgpZAMsmphIGvmTYAXBmd8iQNjuMIXHmtduTP80a2Fw8QZ
	bgkiv9bfAFyGMvb71Td1w2tQK1hSE8Y2wLDHGczaeVEp/obQ9JDCVKD4oDVEw3HgyKSI
	607BqDSvzLGVGVaXKA5jkPKHr469xvUUu526MPNfYKGfp6/5/crgJzW/7ZOExEAQpqoY
	jyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=RdjaCLetI3VSMpToDFG/pvy+KkKXJyf1TNVkCPsOMKI=;
	b=ebcL1PiEGi7CG4U0OCit/acmWGWH3SPdUBdPzGNLTEUZiN9X/34G3ehvkdHy67RjFa
	t2XXExGoRMRfQRqC9/Xe4+EPXCpDDKZq+y706r7odpFbKnP2AsWLCXrJIpff2Ifr2scF
	edka0c7dbIlUIWnhHX94Fh117BgZQ//ouraUsNLEx8O7DaPpyxTmw+x1d5aDKv4tIWWU
	QobbouVBO9o+OtFIMr0xUDBBW30B6B+eItEvIBruQAbKIP9F6EPaDMpT/AXRwNvvSmMQ
	TkNWC7Dwdjl9ZtUE2Um7AZdz2uuZ2o3ChAMYa62gCispeBF4YSs64Kiy6zrbXhVMsy1B
	hKZw==
X-Gm-Message-State: AHPjjUhZPbeM1HI3gb18RDbO+nOBWiZnLEJyZ9iBEshPlCgwLqT5My5j
	1afLLWwjRd+G0gNx58VXSw==
X-Google-Smtp-Source: ADKCNb5btQTo2IRvdRnrxNRK4xOm0UaPtitZkLhDnX6xOapmLS9yz4axh1+e36Y1otdh/WkUqlcWMA==
X-Received: by 10.84.229.79 with SMTP id d15mr9926116pln.397.1505049302940;
	Sun, 10 Sep 2017 06:15:02 -0700 (PDT)
Received: from [127.0.1.1] (CPE-121-223-2-142.lnse2.cha.bigpond.net.au.
	[121.223.2.142]) by smtp.gmail.com with ESMTPSA id
	j10sm11488350pfj.116.2017.09.10.06.15.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Sep 2017 06:15:02 -0700 (PDT)
Date: Sun, 10 Sep 2017 23:14:46 +1000
Message-Id: <20170910131446.4555-2-nathan@nathanrossi.com>
In-Reply-To: <20170910131446.4555-0-nathan@nathanrossi.com>
References: <20170910131446.4555-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 2/4] icestorm: Add IceStorm tools for iCE40 FPGAs
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
X-List-Received-Date: Sun, 10 Sep 2017 13:15:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

IceStorm includes tools for packing iCE40 designs into bitstreams as
well as the data used in place and route tooling. Also included in
IceStorm is JTAG programming (which uses libftdi) and other helper tools
to generate iCE40 HDL and verify timing constraints.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/icestorm/icestorm_git.bb | 51 ++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/icestorm/icestorm_git.bb

diff --git a/meta/recipes-devtools/icestorm/icestorm_git.bb b/meta/recipes-devtools/icestorm/icestorm_git.bb
new file mode 100644
index 0000000000..01d755212b
--- /dev/null
+++ b/meta/recipes-devtools/icestorm/icestorm_git.bb
@@ -0,0 +1,51 @@
+DESCRIPTION = "Project IceStorm aims at reverse engineering, documenting and tools for Lattice iCE40 FPGAs"
+HOMEPAGE = "http://www.clifford.at/icestorm/"
+LICENSE = "ISC"
+SECTION = "devel/fpga"
+
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=18;md5=8104f3444ed967701dafaeab14d572b9"
+
+SRC_URI = "git://github.com/cliffordwolf/icestorm;protocol=https"
+SRCREV = "69613a26d3e3a5c6f0836a773717b03360df85ce"
+
+S = "${WORKDIR}/git"
+
+PV = "0+git${SRCPV}"
+
+inherit pkgconfig
+
+# diffutils (provided by hosttools)
+DEPENDS = "gawk-native python3-native"
+
+PACKAGECONFIG = "icebox icetime"
+PACKAGECONFIG[iceprog] = ",,libftdi"
+PACKAGECONFIG[icetime] = ",,,python3"
+PACKAGECONFIG[icebox] = ",,,python3"
+
+MAKE_SUBDIRS = "icepack icemulti icepll icebram ${PACKAGECONFIG}"
+
+do_configure () {
+	# remove posioned directories
+	sed -i 's/-I\S*//g' ${S}/config.mk
+	sed -i 's/-L\S*//g' ${S}/iceprog/Makefile
+}
+
+do_compile () {
+	for i in ${MAKE_SUBDIRS}; do
+		oe_runmake -C ${B}/$i PREFIX="${prefix}"
+	done
+}
+
+do_install () {
+	for i in ${MAKE_SUBDIRS}; do
+		oe_runmake -C ${B}/$i PREFIX="${prefix}" DESTDIR="${D}" install
+	done
+}
+
+# populate the chipdb into the sysroot (not enabled by default on -native)
+SYSROOT_DIRS_NATIVE_append = " ${datadir}/icebox"
+
+# package the icebox chipdb files
+FILES_${PN} += "${datadir}/icebox"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.14.1


