Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3C1FB7D09F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 13:28:12 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q1so10169997wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 06:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lbt9su3kfB29bISuDqg95ggnu9O6K7dwPcSgOUitNm4=;
	b=tnuoiLXPat5HhpoQ8Y3wGSLpCNac+qQrKzMxRo0yBAYhS03CMbuH2heR3/6RNIbDfe
	FhGgvt1q+Un2FmEMn0bwpYZ1GS9t+fMiZB6W5YkVAqijtGmCACh6sklAPOTEi0FJgbSZ
	Bvhpcskym2tT83vkY2w2+Hbfu5xcdoyBfTjRyboQsIGG5aY6haD7eS2W7n4g9HNDU17S
	fSZ/cUmaWpLWwQ2Lv6ZQfdigM2wGQ6lWFJvenqNxyYPRIYYgzHh7Ogg55plaUgCv910a
	OkQ51zKpVARgonrut+qqFzlXQxaTAE9mJkolc32Kcenye4lZU3PdbqMDww5L9UUOQtmm
	NEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lbt9su3kfB29bISuDqg95ggnu9O6K7dwPcSgOUitNm4=;
	b=pbrirs+44O5W68q50nu0s1/5yTjUTAu3pC6Oi/cAUmW/vTQNzRl+ZgNCQc1loPKyx9
	147slk5N1O4FLUQinh1RAr2/hSR3hUKw7O34B3sEVUihPHK1d8Z7sqIAzW3RzkIZg2VM
	AYZCrpaVHWLf9HH8tImFf05BnPnI6k0Ep8sEdrd9KPkSTRTwzLAgnVmfVCrpF1ciPlWZ
	7Zg1EKHsqjIPMF0qZs3EYc4dJnIWPP9CD8Lvc/JPBarC2bf28HtCe821MhndlYU89ODF
	cIPcbMmkL5BS30Lf9MiaLasXTvhY/GFfb9BX3bBuaVdmuLIUgV9r8ONq4OajijzJZb20
	pG4w==
X-Gm-Message-State: APjAAAVikXYAyDih3WHEdQDhWoi+3KUrAme5ckHQRJb+xXymY1WesPA7
	g3SuQLki169PDVeEyQX/uyKGh5jBYnM=
X-Google-Smtp-Source: APXvYqyTNA7kfA8oiIzgujvh7FiCbwZCCamb8OqKl64yPnCO/g4BNYbeuwAdqIS+3o6jL+LzK0nArQ==
X-Received: by 2002:a5d:6a08:: with SMTP id m8mr15397817wru.30.1553520492717; 
	Mon, 25 Mar 2019 06:28:12 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	e135sm26563321wmg.24.2019.03.25.06.28.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Mar 2019 06:28:12 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2019 13:27:28 +0000
Message-Id: <1553520448-12901-2-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553520448-12901-1-git-send-email-alex.kiernan@gmail.com>
References: <1553520448-12901-1-git-send-email-alex.kiernan@gmail.com>
Subject: [PATCH v3 2/2] wget: Convert EXTRA_OECONF to PACKAGECONFIG, extend PACKAGECONFIG
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
X-List-Received-Date: Mon, 25 Mar 2019 13:28:12 -0000

Convert existing EXTRA_OECONF and DEPENDS to PACKAGECONFIG, fill out
remaining PACKAGECONFIG options. When building without libpsl we pass in
--without-libpsl, which we didn't previously, but all this actually ends
up doing is silencing a warning from the configure script, the code
still uses an internal implemention when using this option.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v3:
- add explicit with/without/enable/disable for all PACKAGECONFIGs

Changes in v2:
- drop ac_cv_header_uuid_uuid_h hack

 meta/recipes-extended/wget/wget.inc | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 3cff656a68d9..07e8d8e8718f 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -3,12 +3,11 @@ HOMEPAGE = "https://www.gnu.org/software/wget/"
 SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
-DEPENDS = "gnutls zlib libpcre"
 
 inherit autotools gettext texinfo update-alternatives pkgconfig
 
-EXTRA_OECONF = "--with-ssl=gnutls --disable-rpath --disable-iri \
-                --without-libgnutls-prefix ac_cv_header_uuid_uuid_h=no"
+EXTRA_OECONF = "--without-libgnutls-prefix --without-libssl-prefix \
+                --disable-rpath"
 
 EXTRA_OEMAKE += 'TOOLCHAIN_OPTIONS="${TOOLCHAIN_OPTIONS}" \
                  DEBUG_PREFIX_MAP="${DEBUG_PREFIX_MAP}"'
@@ -21,9 +20,17 @@ RRECOMMENDS_${PN} += "ca-certificates"
 
 BBCLASSEXTEND = "nativesdk"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-PACKAGECONFIG[libuuid] = "--with-libuuid, --without-libuuid,util-linux"
+PACKAGECONFIG ??= "gnutls pcre zlib \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG[ares] = "--with-cares,--without-cares,c-ares"
+PACKAGECONFIG[gnutls] = "--with-ssl=gnutls,,gnutls"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[iri] = "--enable-iri,--disable-iri,libidn2"
+PACKAGECONFIG[libpsl] = "--with-libpsl,--without-libpsl,libpsl"
+PACKAGECONFIG[libuuid] = "--with-libuuid,--without-libuuid,util-linux"
+PACKAGECONFIG[openssl] = "--with-ssl=openssl,,openssl"
+PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 
 # Let aclocal use the relative path for the m4 file rather than
 # absolute, otherwise there might be an "Argument list too long" error
-- 
2.7.4


