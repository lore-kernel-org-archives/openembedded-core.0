Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by mx.groups.io with SMTP id smtpd.web09.6596.1628399039894947044
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Aug 2021 22:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ozlabs.org header.s=201707 header.b=s+gHq1+D;
 spf=pass (domain: ozlabs.org, ip: 203.11.71.1, mailfrom: anton@ozlabs.org)
Received: by ozlabs.org (Postfix, from userid 1010)
	id 4Gj6Z44Fw6z9sWX; Sun,  8 Aug 2021 15:03:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1628399036;
	bh=pUxIlFsaEjKlkOGViUZ8m6XxPG1TJeXmShXLQ1jzbAQ=;
	h=From:To:Subject:Date:From;
	b=s+gHq1+DKIjTiMJUN+v34WOlNOt0j4n9O9A5mhHU6mxo9pYcRl6qFcLeiHJ5CVwo/
	 8XqRalUTdx6LiEu4OS3G+H9oPiZ8QdShONAUWBhRBM3scA4mNnEx5U3Vyw0IdgHmpZ
	 2Zc70KGxUeOkuhRARWOLLNqpLN7IRajQom0iSqKMEwO+YARvnlCZnQcrkjyZa6xRhy
	 8sKcynmsbPFM/GelP8g4kTsc02bbBQD0vOlY2V+7hx+mzGNfN86dCFCPi+IyxHIiOv
	 UIQTHHG+uH7VlcgLRw6MgtpdNo2JPJfosg+FjSavRlntF/PNS0Z2IFPQMB4/XfRgUP
	 lPbJiIb/nwKmA==
From: "Anton Blanchard" <anton@ozlabs.org>
To: openembedded-core@lists.openembedded.org,
	Qi.Chen@windriver.com
Subject: [PATCH] kmod: use nonarch_base_libdir for depmod.d and modprobe.d
Date: Sun,  8 Aug 2021 15:03:49 +1000
Message-Id: <20210808050349.2502749-1-anton@ozlabs.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These should always be in /lib, regardless of the configuration.

Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 meta/recipes-kernel/kmod/kmod_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/k=
mod/kmod_git.bb
index 853561a61e..eb5d176ded 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -24,13 +24,13 @@ do_install:append () {
                 lnr ${D}${base_bindir}/kmod ${D}${base_sbindir}/${tool}
         done
         # configuration directories
-        install -dm755 ${D}${base_libdir}/depmod.d
-        install -dm755 ${D}${base_libdir}/modprobe.d
+        install -dm755 ${D}${nonarch_base_libdir}/depmod.d
+        install -dm755 ${D}${nonarch_base_libdir}/modprobe.d
         install -dm755 ${D}${sysconfdir}/depmod.d
         install -dm755 ${D}${sysconfdir}/modprobe.d
=20
         # install depmod.d file for search/ dir
-        install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${base_libdi=
r}/depmod.d/search.conf"
+        install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${nonarch_ba=
se_libdir}/depmod.d/search.conf"
 }
=20
 do_compile:prepend() {
@@ -57,6 +57,6 @@ ALTERNATIVE_LINK_NAME[depmod] =3D "${base_sbindir}/depm=
od"
 PACKAGES =3D+ "libkmod"
=20
 FILES:libkmod =3D "${base_libdir}/libkmod*${SOLIBS} ${libdir}/libkmod*${=
SOLIBS}"
-FILES:${PN} +=3D "${base_libdir}/depmod.d ${base_libdir}/modprobe.d"
+FILES:${PN} +=3D "${nonarch_base_libdir}/depmod.d ${nonarch_base_libdir}=
/modprobe.d"
=20
 BBCLASSEXTEND =3D "nativesdk"
--=20
2.31.1

