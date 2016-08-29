Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E377F731FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 02:18:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7T2IbcH003242
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 19:18:37 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 28 Aug 2016 19:18:37 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Aug 2016 10:16:25 +0800
Message-ID: <1472436999-27335-8-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
References: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/21] http-daemon-perl: add new recipe
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
X-List-Received-Date: Mon, 29 Aug 2016 02:18:37 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add new recipe http-daemon-perl as libwww-perl-perl
  rdepends on http-daemon-perl

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../recipes-devtools/perl/http-daemon-perl_6.01.bb | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/http-daemon-perl_6.01.bb

diff --git a/meta/recipes-devtools/perl/http-daemon-perl_6.01.bb b/meta/recipes-devtools/perl/http-daemon-perl_6.01.bb
new file mode 100644
index 0000000..8461e85
--- /dev/null
+++ b/meta/recipes-devtools/perl/http-daemon-perl_6.01.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Instances of the \"HTTP::Daemon\" class are HTTP/1.1 servers that \
+listen on a socket for incoming requests. The \"HTTP::Daemon\" is a \
+subclass of \
+\"IO::Socket::INET\", so you can perform socket operations directly on \
+it too."
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-2.0"
+PR = "r0"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/HTTP-Daemon"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/G/GA/GAAS/HTTP-Daemon-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "ed0ae02d25d7f1e89456d4d69732adc2"
+SRC_URI[sha256sum] = "43fd867742701a3f9fcc7bd59838ab72c6490c0ebaf66901068ec6997514adc2"
+RDEPENDS_${PN} += "http-date-perl"
+RDEPENDS_${PN} += "http-message-perl"
+RDEPENDS_${PN} += "lwp-mediatypes-perl"
+
+S = "${WORKDIR}/HTTP-Daemon-${PV}"
+
+inherit cpan
+
+do_compile() {
+	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+	cpan_do_compile
+}
+
+BBCLASSEXTEND = "native"
-- 
2.8.1


