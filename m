Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97798C61DE8
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 06:02:12 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23677.1788156123831299719
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 23:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hh57b0yy;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1c52d920b8so372301166b.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 23:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788156122; x=1788760922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ftAaD3jVA37Ed9lsPQDjTChOdyDHfI78WUT5IAmDg8=;
        b=hh57b0yyVDOJGu/chAsJwRB6HtFOu9t9FNof9w+Le6DzaipTJ6IhIIiycC39FsMfdq
         Tnt6046Q5HxUlgRGo8DrlvkCcMVWxPuTwKSHdqRRo8/WrnHutTQDRW7MuEELj2qdgTZo
         1yv6GONygdHXy3iNiyu0ddeiHQBub+A+ZdFH5LWakGlo/iGdCTmGwa3zsPruW97iksl6
         OKKDMR7l2DlkqOBYcvgBprORQFuOZzLUDyOZNV04A6L1/lR9uNJrsv6tNbuWuNuDGpQy
         ephshe8DI7aqMZ/iE775VJNKS/mkAWQD90yb9jKagzbMjWDXjcOY/YI9Iei5tErmY2pT
         sB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788156122; x=1788760922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ftAaD3jVA37Ed9lsPQDjTChOdyDHfI78WUT5IAmDg8=;
        b=kNlSMGxqNKbQWng8WfOjE9UofTfB3xvw+FRi8EYhVxzuMLaQVv6D+rBTclytFACQx/
         pyTy49mISPmkFQUZFJS1smEAmgvOx0FVGRTy9ci0tmoAfOQn6EjWMkdCTI01KrIm/DDO
         iWQuW2TU90i/fmntUB6r2NTHlZoolAVl+gp8FqOBQ1Lxqi7mn2TyGp1M+gnPr09D7cBD
         BhmP8AItoiyz+034Hr7ojXhuc0iEvWmH3jJWGchLCQO9f1FueZrpWyZXNEH0ek/hXijX
         aU4fwugl7Gg/yhnHJFmEiOBnHLX0aOtq2a0DpAI2YV94ZxJEIeE26+t8rJcKR1N0bwd8
         3hig==
X-Gm-Message-State: AFuF++nftSfWcp5IUNhC3L2YGBx8OnI5rydSpXo11oiHdQJYmg8Q7A27
	ev9W+w16P+d21LPC/J70UHVb8l9UmDY1oxo7fJ5q+wwbB4gGhiItBo1EJIARKQ==
X-Gm-Gg: AR+sD11d4WRo775A/ObSmHe50TfFYXvbX9myCwjzN8UsfNBkyA27G9l2UXYsO0WCNxK
	0QcTzmWJQcvyRJLD3yg7G8XOFCSGtfDPdB9c2uW5MlOiQj8mmiXjZ+1acrkbzny0QbsyxC1yUAB
	y/kjNnzociT9MAjeXHZyKXwuxqQ1aXfxSAQH5q7TbMkiSjg+mUFuXe1V8jfUv5wPuc+7ZRfAP/n
	+dWzMfhjuxH86PavPsLJ+H/TRoWgo0WjmH8Vpm66HdtQFq922eOxLqRQoOKFauzkhODJ6OG1FzV
	532NFmlhYs+1AUPFgdwCma9otkSpKwhY679xlofARjv7R4jxZ3R2lwI/I2QWBhQQIVuDm/TTM+L
	e+K0dbaEOxFbU3S+yekJb6gHPClgAgMVUoRbbKi3W8+6RYgERDz2CriZp0yFvYy6nysuGk5AAZZ
	FbbHn2fZiw0NJqQZMsF/iJi2JVFxk1Hrph5RIHtUa7IKbMR30RoKrqfypAeOHb4fhPNUTRyKuRV
	2Nd5uhbYO/OBb3tq0eQ+s3gPygCbXWqwOG9RKnkDy+G5LJy
X-Received: by 2002:a17:906:2092:b0:c1c:4db0:8314 with SMTP id a640c23a62f3a-c2557127bc1mr1043080166b.13.1788156121700;
        Sun, 30 Aug 2026 23:02:01 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48437bdd41csm8887590f8f.10.2026.08.30.23.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 23:02:01 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH] wpa-supplicant: Build .config from fragments
Date: Mon, 31 Aug 2026 07:01:21 +0100
Message-ID: <20260831060120.399342-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 06:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244729

do_configure built wpa_supplicant's .config by sed-ing upstream's
defconfig and echoing CONFIG lines onto it, this is both fragile and
makes handling anything not covered by PACKAGECONFIG tricky.

wpa_supplicant has no configure script and no kconfig - it's just make,
so switch do_configure to build the configuration from a base file and
.cfg fragments, which matches what CML1 recipes do (though this isn't
CML1).

This should have no functional change; the effective configuration
should be identical.

AI-Generated: Claude Opus 5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../wpa-supplicant/wpa-supplicant/mbo.cfg     |  2 +
 .../wpa-supplicant/wpa-supplicant/suiteb.cfg  |  4 ++
 .../wpa-supplicant/tls-gnutls.cfg             | 23 ++++++++++
 .../wpa-supplicant/tls-openssl.cfg            |  7 +++
 .../wpa-supplicant/wpa-supplicant/wnm.cfg     |  2 +
 .../wpa-supplicant/wpa-supplicant_2.12.bb     | 46 +++++++------------
 6 files changed, 55 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/mbo.cfg
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/suiteb.cfg
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/tls-gnutls.cfg
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/tls-openssl.cfg
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wnm.cfg

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/mbo.cfg b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/mbo.cfg
new file mode 100644
index 000000000000..d869f79d722a
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/mbo.cfg
@@ -0,0 +1,2 @@
+# Support Multi Band Operation
+CONFIG_MBO=y
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/suiteb.cfg b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/suiteb.cfg
new file mode 100644
index 000000000000..ca752a9730d9
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/suiteb.cfg
@@ -0,0 +1,4 @@
+# Suite B cryptography support. Not offered by upstream's defconfig; the
+# symbols are read directly by wpa_supplicant/Makefile.
+CONFIG_SUITEB=y
+CONFIG_SUITEB192=y
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/tls-gnutls.cfg b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/tls-gnutls.cfg
new file mode 100644
index 000000000000..f3f2f8eed8c8
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/tls-gnutls.cfg
@@ -0,0 +1,23 @@
+# Select TLS implementation
+# openssl = OpenSSL (default)
+# gnutls = GnuTLS
+# internal = Internal TLSv1 implementation (experimental)
+# linux = Linux kernel AF_ALG and internal TLSv1 implementation (experimental)
+# none = Empty template
+CONFIG_TLS=gnutls
+
+# The following need functionality the GnuTLS backend does not provide, so they
+# are turned back off here. "undefine" rather than an empty assignment leaves
+# exactly the state the previous approach of commenting the lines out produced.
+
+# Device Provisioning Protocol (DPP) (also known as Wi-Fi Easy Connect)
+undefine CONFIG_DPP
+
+# EAP-pwd (secure authentication using only a password)
+undefine CONFIG_EAP_PWD
+
+# Simultaneous Authentication of Equals (SAE), WPA3-Personal
+undefine CONFIG_SAE
+
+# Opportunistic Wireless Encryption (OWE)
+undefine CONFIG_OWE
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/tls-openssl.cfg b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/tls-openssl.cfg
new file mode 100644
index 000000000000..542c4bcb5007
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/tls-openssl.cfg
@@ -0,0 +1,7 @@
+# Select TLS implementation
+# openssl = OpenSSL (default)
+# gnutls = GnuTLS
+# internal = Internal TLSv1 implementation (experimental)
+# linux = Linux kernel AF_ALG and internal TLSv1 implementation (experimental)
+# none = Empty template
+CONFIG_TLS=openssl
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wnm.cfg b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wnm.cfg
new file mode 100644
index 000000000000..5d07b15cdf72
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wnm.cfg
@@ -0,0 +1,2 @@
+# Wireless Network Management (IEEE Std 802.11v-2011)
+CONFIG_WNM=y
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb
index df0585f1f3c4..df46535043cc 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.12.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa-supplicant.sh \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
+           ${PACKAGECONFIG_CONFARGS} \
            "
 SRC_URI[sha256sum] = "08e23937e16d0155e55cab2b51f51fbe10d80a1aa91c4e15442645059b737ef6"
 
@@ -21,12 +22,22 @@ S = "${UNPACKDIR}/wpa_supplicant-${PV}"
 
 inherit pkgconfig systemd
 
+# There is no configure script, so use PACKAGECONFIG_CONFARGS to deliver
+# additional fragments
 PACKAGECONFIG ?= "openssl"
-PACKAGECONFIG[gnutls] = ",,gnutls libgcrypt"
-PACKAGECONFIG[openssl] = ",,openssl"
-PACKAGECONFIG[suiteb] = ",,"
-PACKAGECONFIG[wnm] = ",,"
-PACKAGECONFIG[mbo] = ",,"
+PACKAGECONFIG[gnutls] = "file://tls-gnutls.cfg,,gnutls libgcrypt,,,openssl"
+PACKAGECONFIG[openssl] = "file://tls-openssl.cfg,,openssl,,,gnutls"
+PACKAGECONFIG[suiteb] = "file://suiteb.cfg"
+PACKAGECONFIG[wnm] = "file://wnm.cfg"
+PACKAGECONFIG[mbo] = "file://mbo.cfg"
+
+# The base wpa-supplicant config from the upstream recipe
+WPA_SUPPLICANT_CONFIG ?= "${S}/wpa_supplicant/defconfig"
+
+# The same selection cml1.bbclass makes with find_cfgs(); we don't inherit cml1
+# because we don't support menuconfig etc.
+def wpa_supplicant_cfgs(d):
+    return [s for s in src_patches(d, True) if s.endswith('.cfg')]
 
 CVE_PRODUCT = "wpa_supplicant"
 
@@ -36,30 +47,7 @@ EXTRA_OEMAKE = "'LIBDIR=${libdir}' 'INCDIR=${includedir}' 'BINDIR=${sbindir}'"
 
 do_configure () {
 	${MAKE} -C wpa_supplicant clean
-	sed -e '/^CONFIG_TLS=/d' <wpa_supplicant/defconfig >wpa_supplicant/.config
-
-	if ${@ bb.utils.contains('PACKAGECONFIG', 'openssl', 'true', 'false', d) }; then
-		echo 'CONFIG_TLS=openssl' >>wpa_supplicant/.config
-	elif ${@ bb.utils.contains('PACKAGECONFIG', 'gnutls', 'true', 'false', d) }; then
-		echo 'CONFIG_TLS=gnutls' >>wpa_supplicant/.config
-		sed -i -e 's/\(^CONFIG_DPP=\)/#\1/' \
-		    -e 's/\(^CONFIG_EAP_PWD=\)/#\1/' \
-		    -e 's/\(^CONFIG_SAE=\)/#\1/' \
-		    -e 's/\(^CONFIG_OWE=\)/#\1/' wpa_supplicant/.config
-	fi
-
-	if ${@ bb.utils.contains('PACKAGECONFIG', 'suiteb', 'true', 'false', d) }; then
-		echo 'CONFIG_SUITEB=y' >>wpa_supplicant/.config
-		echo 'CONFIG_SUITEB192=y' >>wpa_supplicant/.config
-	fi
-
-	if ${@ bb.utils.contains('PACKAGECONFIG', 'wnm', 'true', 'false', d) }; then
-		echo 'CONFIG_WNM=y' >>wpa_supplicant/.config
-	fi
-
-	if ${@ bb.utils.contains('PACKAGECONFIG', 'mbo', 'true', 'false', d) }; then
-		echo 'CONFIG_MBO=y' >>wpa_supplicant/.config
-	fi
+	cat ${WPA_SUPPLICANT_CONFIG} ${@" ".join(wpa_supplicant_cfgs(d))} > wpa_supplicant/.config
 
 	# For rebuild
 	rm -f wpa_supplicant/*.d wpa_supplicant/dbus/*.d

