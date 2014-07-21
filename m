Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 25ACD70502
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 12:56:14 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 21 Jul 2014 14:56:14 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 913D3288F33;
	Mon, 21 Jul 2014 14:56:14 +0200 (CEST)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Jul 2014 14:56:10 +0200
Message-ID: <1405947370-35562-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH v2 1/1] buildtools-tarball: Add wget to buildtools-tarball
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
X-List-Received-Date: Mon, 21 Jul 2014 12:56:21 -0000
Content-Type: text/plain

GNU Wget cannot be upgrated to a newer that 1.12 version on supported
Centos distro. GNU Wget 1.12 and earlier uses a server-provided filename
instead of the original URL to determine the destination filename of a
download.
This means the files downloaded when fetching cannot be properly used:
$ wget http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/3.4.2/source/eventlog_0.2.13.tar.gz
$ ls
eventlog_0.2.13.tar.gz?AWSAccessKeyId=AKIAICTJ5MANGPMOH7JA&Expires=1400838672&Signature=TjakOBpOvHtEKKDgF14iVinWpY0=
This in turn lead to build errors like:
WARNING: Failed to fetch URL http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/3.4.2/source/eventlog_0.2.13.tar.gz, attempting MIRRORS if available
ERROR: Fetcher failure for URL: 'http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/3.4.2/source/eventlog_0.2.13.tar.gz&#39;. The fetch command returned success for url http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/3.4.2/source/eventlog_0.2.13.tar.gz but /path/to/downloads/eventlog_0.2.13.tar.gz doesn't exist?!
ERROR: Function failed: Fetcher failure for URL: 'http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/3.4.2/source/eventlog_0.2.13.tar.gz&#39;. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /path/to/tmp/work/ppce500v2-enea-linux-gnuspe/eventlog/0.2.13-r0/temp/log.do_fetch.28302
ERROR: Task 4 (/path/to/poky/meta-openembedded/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb, do_fetch) failed with exit code '1'

[YOCTO #6549]

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 meta/recipes-extended/wget/wget.inc          | 3 +++
 meta/recipes-support/gnutls/gnutls.inc       | 2 +-
 meta/recipes-support/nettle/nettle_2.7.1.bb  | 2 +-
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 62e1e0b..c54d9e8 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -41,6 +41,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-git \
     nativesdk-pigz \
     nativesdk-make \
+    nativesdk-wget \
     "
 
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"
diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 642d502..386e3e8 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -13,6 +13,9 @@ EXTRA_OECONF = "--enable-ipv6 --with-ssl=gnutls --disable-rpath --disable-iri \
                 ac_cv_header_uuid_uuid_h=no"
 
 ALTERNATIVE_${PN} = "wget"
+ALTERNATIVE_${PN}_class-nativesdk = ""
 ALTERNATIVE_PRIORITY = "100"
 
 RRECOMMENDS_${PN} += "ca-certificates"
+
+BBCLASSEXTEND += "nativesdk"
diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 8820b0e..2193ea0 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -42,4 +42,4 @@ FILES_${PN}-xx = "${libdir}/libgnutlsxx.so.*"
 
 LDFLAGS_append_libc-uclibc += " -pthread"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
index 8aa5351..f53afcc 100644
--- a/meta/recipes-support/nettle/nettle_2.7.1.bb
+++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
@@ -23,4 +23,4 @@ do_configure_prepend() {
 
 inherit autotools
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


