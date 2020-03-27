Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.17626.1585329930367764969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 10:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LERtjSVi;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id m17so12310810wrw.11
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 10:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mImpzByIEIvzG7ZjmZhKNDbLTCpxKKu3BSzQVjShJCI=;
        b=LERtjSViVwMgLVRgYV6AYQO0DFSE6tFixt6sbNRtUEuWDnpsg1ZGW3Tarvrh1A+Hmv
         woN2T26wJYwJFjmArPDIX7WK9yJ26aNaQokPrBB3iR7FEe3fI6dNQJIRsr4cfV0en362
         oRjJch2RGkkTqZWJTMizFaZMbaPvoTR/HY/9y6dfmxj/xGWwgAfZY3DSuKMWDhO8+HVm
         AmX8CbHclMNOydDAuteyUEIv2nKPtd5U0tNEVAjxf1M38YrxjgVwCr7AHxYxiDmCOAUL
         RxFe061vfcMboOHm0MawW6cwxYopIh1RBbtNdlSXEb6WdrvkatbEsMGJ98zwFzBIqAWo
         b4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mImpzByIEIvzG7ZjmZhKNDbLTCpxKKu3BSzQVjShJCI=;
        b=P1pOkxsigNXAdhdD/zsLJ6hf/ilqOP5ca6Bc0idpzxglv0ruSqMX+CUl5oNKRj4Oa1
         lld845atl52CrfkXVJg6lJPpdGThU59RPKJbnelndKH93EfVlu/O8fRx/OKbL6kxgel8
         gOjndpvFW9MY/BgDXvp7u89mR6RsjAWGmkTfTi6DFdslWU836Y23Z3ysKXtT99JkQdjJ
         fIdYAG7OOpjr3t6R/Puslpxb2wfwhGokIlhnUDG4mXnjveAQ7eH+j2kpT7usihdpD3Bu
         UhLpAPDSZ8eI1opjkLH8eJCnmqDkiQ2VhJFX/bDYRdmDCiNLWXJLcWkp19xfpgMQb2qN
         ehxg==
X-Gm-Message-State: ANhLgQ16srf+Gi0mhKBctf13vq5KCVPRygJkn2BBYp3ph/6ZJFDfhSym
	qDskijt067wLntJso7Rb4qYVvr/J
X-Google-Smtp-Source: ADFU+vsnWEI+qymhn/sMPkMa+RfJfQemCpHAYALeUErIQ24PPCMNJyY4/0o5Z0tXcIdQwk/EEIcvYQ==
X-Received: by 2002:adf:f8c1:: with SMTP id f1mr446671wrq.345.1585329928699;
        Fri, 27 Mar 2020 10:25:28 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id g186sm9281419wmg.36.2020.03.27.10.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 10:25:28 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH v3 04/13] systemd: Reinstate systemd-hwdb-update.service
Date: Fri, 27 Mar 2020 17:25:11 +0000
Message-Id: <20200327172520.62888-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327172520.62888-1-alex.kiernan@gmail.com>
References: <20200327172520.62888-1-alex.kiernan@gmail.com>

systemd supports a distribution hwdb.bin in /usr/lib/udev/hwdb.bin,
which is used if /etc/udev/hwdb.bin is not present. When generating the
install time hwdb, for systemd, ensure that we put it in /usr/lib/udev,
which then ensures that at boot time we do not regenerate it, unless the
system is marked for update.

This allows fragments dropped into /etc/udev/hwdb.d to be processed
correctly, but without requiring a first boot time build:

root@qemumips:~# systemctl status systemd-hwdb-update.service
* systemd-hwdb-update.service - Rebuild Hardware Database
     Loaded: loaded (/usr/lib/systemd/system/systemd-hwdb-update.service; static; vendor preset: disabled)
     Active: inactive (dead)
  Condition: start condition failed at Wed 2020-03-04 15:18:11 UTC; 44s ago
             |- ConditionPathExists=|!/usr/lib/udev/hwdb.bin was not met
             |- ConditionPathExists=|/etc/udev/hwdb.bin was not met
             `- ConditionDirectoryNotEmpty=|/etc/udev/hwdb.d was not met
       Docs: man:hwdb(7)
             man:systemd-hwdb(8)

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
Changes in v2: None

 meta/recipes-core/systemd/systemd_244.3.bb   | 10 ++++------
 scripts/postinst-intercepts/update_udev_hwdb | 16 ++++++++++++++--
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 214eee316b63..4ee20f85c21f 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -293,10 +293,6 @@ do_install() {
 	# install default policy for presets
 	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
 	install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_unitdir}/system-preset/99-default.preset
-
-    # We use package postinsts for the hwdb update, as the update service is
-    # easily triggered for no reason and will slow down boots.
-    find ${D} -name systemd-hwdb-update.service -delete
 }
 
 python populate_packages_prepend (){
@@ -636,7 +632,9 @@ FILES_udev += "${base_sbindir}/udevd \
                ${datadir}/bash-completion/completions/udevadm \
               "
 
-FILES_udev-hwdb = "${rootlibexecdir}/udev/hwdb.d"
+FILES_udev-hwdb = "${rootlibexecdir}/udev/hwdb.d \
+                   ${systemd_unitdir}/system/systemd-hwdb-update.service \
+                   "
 
 RCONFLICTS_${PN} = "tiny-init ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolvconf', '', d)}"
 
@@ -696,7 +694,7 @@ pkg_prerm_${PN}_libc-glibc () {
 PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst_udev-hwdb () {
 	if test -n "$D"; then
-		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX}
+		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} rootlibexecdir="${rootlibexecdir}" PREFERRED_PROVIDER_udev="${PREFERRED_PROVIDER_udev}"
 	else
 		udevadm hwdb --update
 	fi
diff --git a/scripts/postinst-intercepts/update_udev_hwdb b/scripts/postinst-intercepts/update_udev_hwdb
index c4fb2bffcbf0..102e99b94725 100644
--- a/scripts/postinst-intercepts/update_udev_hwdb
+++ b/scripts/postinst-intercepts/update_udev_hwdb
@@ -5,5 +5,17 @@
 
 set -e
 
-PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D
-chown root:root $D${sysconfdir}/udev/hwdb.bin
+case "${PREFERRED_PROVIDER_udev}" in
+	systemd)
+		UDEV_EXTRA_ARGS="--usr"
+		UDEVLIBDIR="${rootlibexecdir}"
+		;;
+
+	*)
+		UDEV_EXTRA_ARGS=""
+		UDEVLIBDIR="${sysconfdir}"
+		;;
+esac
+
+PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D ${UDEV_EXTRA_ARGS}
+chown root:root $D${UDEVLIBDIR}/udev/hwdb.bin
-- 
2.17.1

