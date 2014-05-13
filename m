Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f181.google.com (unknown [74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id B1E61605B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 07:37:53 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id w61so8033632wes.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 00:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=57n0lpIbTmiA0kh+XWCLUYyeyzEPSZWsiuCGRwm9dXA=;
	b=J7PP4zCPUF09kpJo6UMAZC8R9zoGl7FtC0EYbsPWwMzuJVRp+DYUWd9D7oLKS6r2PD
	E8VrTGz+Qsow1a/jfXNNBt6oGstaYiWYtJNkfX7bAqAe/A33zaNyMf/XT1BNPN9PZdPK
	eJC1N1viL1Y6+HI4vX4aHevSePkDgSLJHd1eSFY6stoY1r0ik0Ghby5T4EuBV4rPS2om
	m67L+lZUSs+2fVwS4De/eLf2kbjJqoE+wOTaoscr1VM5+qRyqJWUIfz15lkIh5pjB/9a
	pjAaa/wCeaWoTnLvIcrhUxZIOqOTrI6aS5Pif3Idncj/a0YPg4fkXEoey5dlqNOr3JGA
	iheQ==
X-Gm-Message-State: ALoCoQme3qXRZCp+ARkEkvIb3RQ+1N3wL6iX6cSktFlomTk2gXOD/z6hzmo4Tj+lgACPg2GiRCo5
X-Received: by 10.194.222.197 with SMTP id qo5mr116459wjc.78.1399966249309;
	Tue, 13 May 2014 00:30:49 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id be3sm21088074wjc.5.2014.05.13.00.30.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 May 2014 00:30:48 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 May 2014 09:30:41 +0200
Message-Id: <1399966241-25745-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [RFC][PATCH] curl: work around RRECOMMENDS problems in -native* recipes
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
X-List-Received-Date: Tue, 13 May 2014 07:37:55 -0000

Both curl-native and git-(replacement-)native need ca-certs installed to support https:// but since PACKAGES is reset to "" R* variables don't work and ca-certs don't end up in sysroot. Adding it to DEPENDS works around this.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-support/curl/curl_7.36.0.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.36.0.bb b/meta/recipes-support/curl/curl_7.36.0.bb
index f3401fa..affc2e1 100644
--- a/meta/recipes-support/curl/curl_7.36.0.bb
+++ b/meta/recipes-support/curl/curl_7.36.0.bb
@@ -6,8 +6,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
 
 DEPENDS = "zlib gnutls"
-DEPENDS_class-native = "zlib-native openssl-native"
-DEPENDS_class-nativesdk = "nativesdk-zlib"
+
+# RDEPENDS/RRECOMMENDS don't work for -native, so add ca-certs to DEPENDS to install 
+# them into sysroot to make https:// work for curl and git
+DEPENDS_class-native = "zlib-native openssl-native ca-certificates-native"
+DEPENDS_class-nativesdk = "nativesdk-zlib ca-certificates-nativesdk"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch \
-- 
1.9.0


