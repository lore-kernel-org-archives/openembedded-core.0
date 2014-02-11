Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9A3BB6E99A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 09:55:00 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id q59so5356572wes.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 01:55:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+yQlA3aY+cNQavTpKiZI8HH/R8xmeWCKjOqsNqLZbrY=;
	b=l9i2NSflLqpfYWdlLkYWrZddobN9RIO6drH0s5I9pv78HXh8hmIvKOYDiLX3wr8WKJ
	zBZvHnX7+nZ4uWGu3PjAFQEhqf2u5yaeN4bSEk+KJES4TTqGLrgpOVXjuJQXX0bedWLo
	yR7tr77uDfnbAdY7pGMohf+VEpbCm0Z79EnkvS02EHOoayEGf16ZW/+/1zhqssOD6hUG
	AP1uF8PfcBLZID1CPZAJ4fVBLQfVCp7UJ4cMcpQIyaSNgWIQqALk5TSFY1LZ21wlSTT/
	kg+UGuHJLf84f0ZtVJk9Pq0vPIYTcZ76JeMNIcls4vxmMNDvGsDWeUy2qOg0jVD2omFA
	oXtw==
X-Gm-Message-State: ALoCoQkLAyiC/gx0mri0IpAibSowRYVOo2F+BhfFBuGv33weCY42gjCBTbjtGLLBf2b0U4yegsnD
X-Received: by 10.180.79.7 with SMTP id f7mr14262029wix.20.1392112500983;
	Tue, 11 Feb 2014 01:55:00 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id d6sm44621069wic.9.2014.02.11.01.55.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Feb 2014 01:55:00 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2014 10:54:54 +0100
Message-Id: <1392112494-27144-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCHv2] curl: fix https certificate problems
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
X-List-Received-Date: Tue, 11 Feb 2014 09:55:01 -0000

point CA bundle to /etc/ssl/certs/ca-certificates.crt instead of using the buildhost location, Configure would look at the buildhost and hardcode the bundle location for there into the target. This leads to non-working https support.

Also remove the empty and now useless curl-certs packages since it's empty and no ALLOW_EMPTY has been set.

Apart from making https work again with curl cmdline this also fixes libcurl which means git can fetch https repos as well instead of erroring out.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-support/curl/curl_7.34.0.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.34.0.bb b/meta/recipes-support/curl/curl_7.34.0.bb
index b49c6e4..aba6649 100644
--- a/meta/recipes-support/curl/curl_7.34.0.bb
+++ b/meta/recipes-support/curl/curl_7.34.0.bb
@@ -30,6 +30,7 @@ EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
                 --enable-crypto-auth \
                 --disable-ldap \
                 --disable-ldaps \
+                --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
                 ${CURLGNUTLS} \
                 "
 
@@ -45,13 +46,10 @@ do_install_append() {
 	oe_multilib_header curl/curlbuild.h
 }
 
-PACKAGES =+ "${PN}-certs libcurl libcurl-dev libcurl-staticdev libcurl-doc"
-
-FILES_${PN}-certs = "${datadir}/curl/curl-*"
-PACKAGE_ARCH_${PN}-certs = "all"
+PACKAGES =+ "libcurl libcurl-dev libcurl-staticdev libcurl-doc"
 
 FILES_lib${BPN} = "${libdir}/lib*.so.*"
-RRECOMMENDS_lib${BPN} += "${PN}-certs"
+RRECOMMENDS_lib${BPN} += "ca-certificates"
 FILES_lib${BPN}-dev = "${includedir} \
                       ${libdir}/lib*.so \
                       ${libdir}/lib*.la \
-- 
1.8.4.2


