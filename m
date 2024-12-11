Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F8CE7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 18:11:15 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.1499.1733940670992312611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 10:11:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=beVvLULj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202412111811099ca83519a3605c11ce-j9ap8m@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202412111811099ca83519a3605c11ce
        for <openembedded-core@lists.openembedded.org>;
        Wed, 11 Dec 2024 19:11:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=uDCheTMra/GfEKID/8ZmIwnCyzyHqvHcBxK5cWx0PZE=;
 b=beVvLULjpfFLa9kCSs6R/SpgCvcRL2YnQ6YTb974MVvY9wmgoUe2Jjt1f0jZeMR+m+7yq6
 K8PQ9nm6OfrYIC9TGOMprlMqy61qOzPu74LHZsBkZ2AW8mf9izaG8O1FJdEiaf+WG7jmweut
 G4wNoKBkFu4oH+ah36QK7X+Bt6y1J8BEEg7dnjkwACn2sc8ewSDmjb9gV3cNm/2tJlobRcm0
 S/YLrJeojNpPHhDpZDvokxN4CBFd7zXlkJ2dolHY0d1xEYV6tYBWRW39sZstt4vpfOXIaDce
 xjr19nItd6TJbkimC4tGZjPuGAztL7hDMxxRekwyJri031rJHCjGlX4w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/2] curl: upgrade 8.10.1 -> 8.11.0
Date: Wed, 11 Dec 2024 19:09:52 +0100
Message-Id: <20241211180953.3369248-2-peter.marko@siemens.com>
In-Reply-To: <20241211180953.3369248-1-peter.marko@siemens.com>
References: <20241211180953.3369248-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 18:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208604

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2024-9681

* refresh patch
* add patch for buildpaths issue
* add new options for ipfs and websockets, keep them configure as they
  were previously configures
* drop notexists.pl from ptest install as it was removed and code was
  integrated into the test framework in [1]
* add ptest dependency on perl-module-i18n-langinfo due to [2]

[1] https://github.com/curl/curl/commit/56183c1d6f7f4d0c18d9065cf870c4cd3fc329eb
[2] https://github.com/curl/curl/commit/0b70b23ef4d007031bc2ae4fc63d5ed9136bc2b5

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...pc.in-drop-LDFLAGS-from-Libs.private.patch | 39 +++++++++++++++++++
 .../curl/curl/no-test-timeout.patch           |  2 +-
 .../curl/{curl_8.10.1.bb => curl_8.11.0.bb}   |  9 +++--
 3 files changed, 46 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/curl/curl/0001-libcurl.pc.in-drop-LDFLAGS-from-Libs.private.patch
 rename meta/recipes-support/curl/{curl_8.10.1.bb => curl_8.11.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl/0001-libcurl.pc.in-drop-LDFLAGS-from-Libs.private.patch b/meta/recipes-support/curl/curl/0001-libcurl.pc.in-drop-LDFLAGS-from-Libs.private.patch
new file mode 100644
index 00000000000..79fc0b316e7
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-libcurl.pc.in-drop-LDFLAGS-from-Libs.private.patch
@@ -0,0 +1,39 @@
+From cfd5d794fdfcc12e386fdbb14161babf54d2a5ee Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Sat, 9 Nov 2024 22:26:58 +0100
+Subject: [PATCH] libcurl.pc.in: drop LDFLAGS from Libs.private
+
+Stop passing linker flags to pkg-config.
+
+This was added in v8.11.0 with commit [1].
+There are several problems with this, especially:
+* user may want to link curl and application with different flags
+* user usually adds the same or similar flags in all components, so this
+  will double the flags when linking application
+* when building components in temporary directories, these directories
+  are preserved in pkg-config linker flags and are invalid when building
+  application
+
+[1] https://github.com/curl/curl/commit/9f56bb608ecfbb8978c6cb72a04d9e8b23162d82
+
+Upstream-Status: Submitted [https://github.com/curl/curl/pull/15533]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libcurl.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcurl.pc.in b/libcurl.pc.in
+index 4c60a7ec7..7898dae35 100644
+--- a/libcurl.pc.in
++++ b/libcurl.pc.in
+@@ -36,6 +36,6 @@ Version: @CURLVERSION@
+ Requires: @LIBCURL_PC_REQUIRES@
+ Requires.private: @LIBCURL_PC_REQUIRES_PRIVATE@
+ Libs: -L${libdir} -lcurl @LIBCURL_PC_LIBS@
+-Libs.private: @LDFLAGS@ @LIBCURL_PC_LIBS_PRIVATE@
++Libs.private: @LIBCURL_PC_LIBS_PRIVATE@
+ Cflags: -I${includedir} @LIBCURL_PC_CFLAGS@
+ Cflags.private: @LIBCURL_PC_CFLAGS_PRIVATE@
+-- 
+2.30.2
+
diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 7122b6f0435..fe8efbe6125 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -14,7 +14,7 @@ diff --git a/tests/servers.pm b/tests/servers.pm
 index d4472d5..9999938 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
-@@ -120,7 +120,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
+@@ -122,7 +122,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
  my $sshderror;   # for socks server, ssh daemon version error
  my %doesntrun;    # servers that don't work, identified by pidfile
  my %PORT = (nolisten => 47); # port we use for a local non-listening service
diff --git a/meta/recipes-support/curl/curl_8.10.1.bb b/meta/recipes-support/curl/curl_8.11.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_8.10.1.bb
rename to meta/recipes-support/curl/curl_8.11.0.bb
index 0252d4475ec..a512aa443c8 100644
--- a/meta/recipes-support/curl/curl_8.10.1.bb
+++ b/meta/recipes-support/curl/curl_8.11.0.bb
@@ -14,8 +14,9 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
+    file://0001-libcurl.pc.in-drop-LDFLAGS-from-Libs.private.patch \
 "
-SRC_URI[sha256sum] = "73a4b0e99596a09fa5924a4fb7e4b995a85fda0d18a2c02ab9cf134bebce04ee"
+SRC_URI[sha256sum] = "db59cf0d671ca6e7f5c2c5ec177084a33a79e04c97e71cf183a5cdea235054eb"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
@@ -23,7 +24,7 @@ CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on go
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-COMMON_PACKAGECONFIG = "basic-auth bearer-auth digest-auth negotiate-auth openssl proxy threaded-resolver verbose zlib"
+COMMON_PACKAGECONFIG = "basic-auth bearer-auth digest-auth ipfs negotiate-auth openssl proxy threaded-resolver verbose zlib"
 PACKAGECONFIG ??= "${COMMON_PACKAGECONFIG} ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} aws libidn"
 PACKAGECONFIG:class-native = "${COMMON_PACKAGECONFIG} ipv6"
 PACKAGECONFIG:class-nativesdk = "${COMMON_PACKAGECONFIG} ipv6"
@@ -43,6 +44,7 @@ PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
 PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
 PACKAGECONFIG[imap] = "--enable-imap,--disable-imap,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[ipfs] = "--enable-ipfs,--disable-ipfs,"
 PACKAGECONFIG[kerberos-auth] = "--enable-kerberos-auth,--disable-kerberos-auth"
 PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
 PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap"
@@ -65,6 +67,7 @@ PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
 PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
 PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver,,,,ares"
 PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
+PACKAGECONFIG[websockets] = "--enable-websockets,--disable-websockets"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 
@@ -106,7 +109,6 @@ do_install_ptest() {
 	for name in $(makefile-getvar ${B}/tests/libtest/Makefile noinst_PROGRAMS noinst_LTLIBRARIES); do
 		${B}/libtool --mode=install install ${B}/tests/libtest/$name ${D}${PTEST_PATH}/tests/libtest
 	done
-	cp ${S}/tests/libtest/notexists.pl ${D}${PTEST_PATH}/tests/libtest
 	rm -f ${D}${PTEST_PATH}/tests/libtest/libhostname.la
 
 	install -d ${D}${PTEST_PATH}/tests/server
@@ -131,6 +133,7 @@ RDEPENDS:${PN}-ptest += " \
 	perl-module-file-basename \
 	perl-module-file-spec \
 	perl-module-file-temp \
+	perl-module-i18n-langinfo \
 	perl-module-io-socket \
 	perl-module-ipc-open2 \
 	perl-module-list-util \
-- 
2.30.2


