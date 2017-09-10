Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6B37F77E91
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 13:14:57 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id g13so10522426pfm.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 06:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=QVknxWXHFvYJDywGDV2KK55khEj9+2xNOJDTOQRugmo=;
	b=IDPSR0nMVIzH4Au+cwz/59tNPSaUMdWchHUAsnottCYq8D/C0rLYHt3b4L3Mv1m0W8
	c2oK3rbToHVEOzkKWYFDK8imI/XWCSVOva5LrwvUJS7b3T95wEbpzf0qrggCZBUYUkjw
	OJZx7Erpxj50bxzKDsFUpn09FQgoLfRQSv1gmOvu7SdIJ4D5UaIzj1MsOXTBeYJ+nBgg
	yOwNBVcTSa//PbwLYmv2gAERzpirls6X8C226454PzLX8Nj5xvNQ3+CXxhJfgxEn87B8
	9dpqhzmogCwSwGU0dBsSu6t+wQDDF1Ybc4VN4iYOwqhmupMF3Ou9xJUvjUOuVMJMwQI3
	kbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=QVknxWXHFvYJDywGDV2KK55khEj9+2xNOJDTOQRugmo=;
	b=Wjx9T45wkEYo16ygDaSHuP/Nctipn/luMWGsMTEG1JE8ROb+A3cUZiZfmb+IvbqD8g
	5uE6lsRTyB5IWksyhCOVMl5F8euwZFD71Xc2BWiM/vfeh4OkthzVpgXT2jsVFnTkKVPc
	yMdX1phfeXU+KsODf/5nEs0uuPW+zXzBfQx8ZZI3sqed1NJCGxRh5Q5kWYEpEYRl2U3r
	Gm7yOQkt+PR93mTwINZE+U6KROMU1yi/Vy/8VJypEAwAUSKhza39IAWB6X63vvAGSoGA
	ywltKSkEDJQBvqjUZCrVAZ3RWGvuVOZaOmagEM+UZnCzjgCwRdIMALFXwF3iXXVTw9G5
	nTsg==
X-Gm-Message-State: AHPjjUiWgmQ0/snVHQFZBhwQQdxzELmtVpLfUHAp+kBGJpjKC25GSRWy
	uMo386hJKeQkx7UwYIHOpA==
X-Google-Smtp-Source: ADKCNb7HJ/dhDgU86DbEspNocCHAMpZNUhnU5gUldphn10JVnsYeyc55WVQbqaVWU8FjAi2v1DrYOg==
X-Received: by 10.99.119.130 with SMTP id s124mr8737260pgc.436.1505049298566; 
	Sun, 10 Sep 2017 06:14:58 -0700 (PDT)
Received: from [127.0.1.1] (CPE-121-223-2-142.lnse2.cha.bigpond.net.au.
	[121.223.2.142])
	by smtp.gmail.com with ESMTPSA id f8sm9221715pgs.7.2017.09.10.06.14.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Sep 2017 06:14:58 -0700 (PDT)
Date: Sun, 10 Sep 2017 23:14:46 +1000
Message-Id: <20170910131446.4555-1-nathan@nathanrossi.com>
In-Reply-To: <20170910131446.4555-0-nathan@nathanrossi.com>
References: <20170910131446.4555-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 1/4] yosys: Add Yosys and ABC recipes
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
X-List-Received-Date: Sun, 10 Sep 2017 13:14:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Yosys provides a Open Source Verilog synthesis flow for a number of
targets including Altera, ASIC flows, Lattice FPGAs/CPLDs, Xilinx, etc.
This tool provides the first step in a fully open source HDL/Verilog to
bitstream flow.

Also included is its primary dependency Berkeley ABC which is used for
the synthesis and formal verification tooling.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/yosys/berkeley-abc_git.bb | 30 ++++++++++++++
 meta/recipes-devtools/yosys/yosys_git.bb        | 55 +++++++++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/yosys/berkeley-abc_git.bb
 create mode 100644 meta/recipes-devtools/yosys/yosys_git.bb

diff --git a/meta/recipes-devtools/yosys/berkeley-abc_git.bb b/meta/recipes-devtools/yosys/berkeley-abc_git.bb
new file mode 100644
index 0000000000..8f39c7ab29
--- /dev/null
+++ b/meta/recipes-devtools/yosys/berkeley-abc_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Berkeley ABC: System for Sequential Logic Synthesis and Formal Verification"
+HOMEPAGE = "http://www.eecs.berkeley.edu/~alanmi/abc/"
+# License is MIT, but differs from standard license text
+LICENSE = "MIT"
+SECTION = "devel/hardware"
+
+LIC_FILES_CHKSUM = "file://copyright.txt;md5=04eb1ba7f36d87b164b6224e5417b860"
+
+SRC_URI = "hg://bitbucket.org/alanmi/abc;protocol=https;branch=default;module=root"
+SRCREV = "ff5be06"
+
+S = "${WORKDIR}/root"
+
+PV = "1.01+hg${SRCPV}"
+
+DEPENDS = "readline"
+
+# set the ARCHFLAGS to avoid execution of arch_flags during build
+ABC_ARCHFLAGS_x86-64 = "-DLIN64 -DSIZEOF_VOID_P=8 -DSIZEOF_LONG=8 -DSIZEOF_INT=4"
+ABC_ARCHFLAGS = "-DLIN -DSIZEOF_VOID_P=4 -DSIZEOF_LONG=4 -DSIZEOF_INT=4 -fpermissive -w"
+
+do_compile() {
+	oe_runmake ABC_MAKE_VERBOSE=1 ARCHFLAGS="${ABC_ARCHFLAGS}" CC="${CXX}" CXX="${CXX}" LD="${CXX} ${LDFLAGS}"
+}
+
+do_install() {
+	install -Dm 755 ${B}/abc ${D}${bindir}/abc
+}
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/yosys/yosys_git.bb b/meta/recipes-devtools/yosys/yosys_git.bb
new file mode 100644
index 0000000000..06ae74052a
--- /dev/null
+++ b/meta/recipes-devtools/yosys/yosys_git.bb
@@ -0,0 +1,55 @@
+DESCRIPTION = "Yosys, a framework for Verilog RTL synthesis"
+HOMEPAGE = "http://www.clifford.at/yosys/"
+LICENSE = "ISC"
+SECTION = "devel/verilog"
+
+LIC_FILES_CHKSUM = "file://README.md;beginline=2;endline=16;md5=ed95f8bf65484f10d063cb460b4df728"
+
+SRC_URI = "git://github.com/cliffordwolf/yosys;protocol=https"
+SRCREV = "7d41c5e1770419369617011167f01112d9b9b436"
+
+S = "${WORKDIR}/git"
+
+PV = "0.7+git${SRCPV}"
+
+inherit pkgconfig
+
+DEPENDS = " \
+		python3-native \
+		bison-native \
+		flex-native \
+		gawk-native \
+		tcl-native \
+		berkeley-abc \
+		readline \
+		tcl \
+		libffi \
+		"
+
+RDEPENDS_${PN} += "berkeley-abc bash"
+
+# OE modifies target tcl to populate includes into subdirectory but never sets that up in .pc
+CXXFLAGS_append = " -I=${includedir}/tcl8.6"
+
+do_configure_append () {
+	# config build for GCC
+	make config-gcc
+
+	# remove posions
+	sed -i 's/-I$(PREFIX)\/include//g' ${S}/Makefile
+	sed -i 's/-L$(LIBDIR)//g' ${S}/Makefile
+}
+
+# use abc from PATH
+export ABCEXTERNAL = "abc"
+
+do_compile() {
+	# force make variables for CXX and LD, the makefile forces them instead of defaulting
+	oe_runmake PREFIX="${prefix}" PRETTY=0 CXX="${CXX}" LD="${CC}"
+}
+
+do_install() {
+	oe_runmake PREFIX="${prefix}" PRETTY=0 DESTDIR="${D}" install
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.14.1


