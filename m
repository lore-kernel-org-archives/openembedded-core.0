Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CFEE6C5F4
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 03:05:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.10981.1733195132147750017
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 19:05:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ya1o4oSF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2I62B5006221
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Dec 2024 03:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xguYEzxbbZW
	6FG57R01iC1yudDGJmhXzGfkY3japwLw=; b=Ya1o4oSF5nIU6sLrVF+zkxNwLQg
	/N2hPkuA9VYtiMUQC9sTfDWNHmiwtY46dm+BdfJf9yA6/RwnR3Vdz/jM69Gh2Ttq
	tsO3I90WjopcagGu3DD/UnANChikM1rjk7ayeUabVQGrBCbzVVVw3rqMYMlv3Kr3
	qZin6iviB6eL6SRl5ppsgIWn8umSq4ozLZRsMugOQxJ8PT9DHuw7h0cVABkopOB+
	kVE1ynmOb1GVFAXEr+dopgDht2cwYKJCo6L8BD6/xl4XpE3JkUIQJawRNyUOjaGp
	aGiztJKD46s9qVHVz6C+vklHZ8Kku/s+XsejnCYgP8GJolpbRutdpdSZeww==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437t1geq8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 03:05:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7250da8a2a5so4657963b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 19:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733195130; x=1733799930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xguYEzxbbZW6FG57R01iC1yudDGJmhXzGfkY3japwLw=;
        b=eDJrA3e02VzcKtflyIJ+sPUnGhaQ1MQ1vbyJneeo3ngZ93Dyqe/TS+mFSsENi727Nv
         j1ODI7Y29aDKtleRvlJScVNbsXryDziJ4/2VKkszwezy+feUEB9V+/FW84lakMX8igLj
         5bmBnjy7dGJXo16R2j6CcWX8FNxyUjZyelQDWypNlwloro0bdFK9/9qezzF2KoQzq0Kh
         iUg6Xj495x5b58aExalnbyqFGLNk9ZZr77+RFxajR2FBwE51uOwry4yXxISk5E4AC0LB
         IWMol8sSQ/kfyNwJwMrI0ogQAakdKzChvt4B03DYX9R51XhuOBxKClF1Wk9LM05r47iq
         3ptQ==
X-Gm-Message-State: AOJu0YzFnFzw81dJNcBu+/4Y/iyusVsTRITgxpOsLhsJk2wMQpR576sv
	g25WBFsqGRi9YUlo5aFDgK8BmyVY+kKIXYLRtN64ztNpZkZhK12y2qbHjJEdTeUlBUJjs+OWllg
	N1dGj5CwUom9hn+6tGwYQjW5Eqy7Bcp8cG6m9IZvvrYpLscua34kpgEM4DGH5Dnf/E42wrWb86U
	sNHUxMlgp8LBM=
X-Gm-Gg: ASbGncuC823YyWNquyK0VvyfkYFy45OD3g1cGL3ThkatMNknwz+MbgyMqLj/u6P62T6
	7egXEDU9c1JdsxxIclVBvxzDJh12JM2P11gfunPOd9bkC+/bZ3i1jYs+OBzxM2r2/vG2q1WKar9
	5bLQ7VCnCCa6NuBON/poyIxjMC2nsZpHup9hLYIIooO4NEmLm2MkIZGrn/+zUdnVmY8Ez976X7Q
	sjOVyfqXU0RvFE3j2bIyFgzea1zoPLl/FNbl1mo5YadBpt3lj3EpDNMzXs26SZSbZNV4YiEyw==
X-Received: by 2002:a05:6a20:e549:b0:1e0:d2f5:6ee8 with SMTP id adf61e73a8af0-1e16540f268mr1351012637.40.1733195129351;
        Mon, 02 Dec 2024 19:05:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8ukLPlpEwXydA9D9QdLQHujYoO3+Hh2sFgNX9YAHccElzsCHt2lrml1rcry9DEXGLVsj0ww==
X-Received: by 2002:a05:6a20:e549:b0:1e0:d2f5:6ee8 with SMTP id adf61e73a8af0-1e16540f268mr1350959637.40.1733195128504;
        Mon, 02 Dec 2024 19:05:28 -0800 (PST)
Received: from evatuf.domocacupe ([187.34.86.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417612b5sm9315462b3a.30.2024.12.02.19.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 19:05:28 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com, peter.kjellerstedt@axis.com
Subject: [PATCH v2 3/3] systemd: remove custom rootlibexecdir and replace with nonarch_libdir
Date: Tue,  3 Dec 2024 00:05:20 -0300
Message-Id: <20241203030520.1288256-3-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203030520.1288256-1-ricardo.salveti@oss.qualcomm.com>
References: <20241203030520.1288256-1-ricardo.salveti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dS21ei9HSKhbMfS4vF2yQN6FotRtVeAz
X-Proofpoint-ORIG-GUID: dS21ei9HSKhbMfS4vF2yQN6FotRtVeAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 03:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208174

The rootprefix build option was deprecated in systemd 255, making the
custom rootlibexecdir unnecessary, so remove it in favor of the standard
nonarch_libdir definition.

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
v2: replaced nonarch_base_libdir with nonarch_libdir as we can assume
usrmerge is used.

 meta/recipes-core/systemd/systemd_256.8.bb | 186 ++++++++++-----------
 1 file changed, 91 insertions(+), 95 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_256.8.bb b/meta/recipes-core/systemd/systemd_256.8.bb
index 6004d911ea8..c1915d7e941 100644
--- a/meta/recipes-core/systemd/systemd_256.8.bb
+++ b/meta/recipes-core/systemd/systemd_256.8.bb
@@ -237,10 +237,6 @@ RESOLV_CONF ??= ""
 # the eBPFs, so that it can find needed system includes in there.
 CFLAGS:append = " --sysroot=${STAGING_DIR_TARGET}"
 
-# Helper variables to clarify locations.  This mirrors the logic in systemd's
-# build system.
-rootlibexecdir = "${nonarch_libdir}"
-
 EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dnobody-group=nogroup \
                   -Ddefault-locale=C \
@@ -290,8 +286,8 @@ do_install() {
 	fi
 
 	# Provide support for initramfs
-	[ ! -e ${D}/init ] && ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
-	[ ! -e ${D}/${base_sbindir}/udevd ] && ln -s ${rootlibexecdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
+	[ ! -e ${D}/init ] && ln -s ${nonarch_libdir}/systemd/systemd ${D}/init
+	[ ! -e ${D}/${base_sbindir}/udevd ] && ln -s ${nonarch_libdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
 
 	install -d ${D}${sysconfdir}/udev/rules.d/
 	install -d ${D}${nonarch_libdir}/tmpfiles.d
@@ -304,7 +300,7 @@ do_install() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
-		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
+		sed -i s%@UDEVD@%${nonarch_libdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
 		install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 	fi
 
@@ -323,8 +319,8 @@ do_install() {
 	# if the user requests /tmp be on persistent storage (i.e. not volatile)
 	# then don't use a tmpfs for /tmp
 	if ! ${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs-perms-volatile-tmp.txt', 'true', 'false', d)}; then
-		rm -f ${D}${rootlibexecdir}/systemd/system/tmp.mount
-		rm -f ${D}${rootlibexecdir}/systemd/system/local-fs.target.wants/tmp.mount
+		rm -f ${D}${nonarch_libdir}/systemd/system/tmp.mount
+		rm -f ${D}${nonarch_libdir}/systemd/system/local-fs.target.wants/tmp.mount
 	fi
 
 	install -d ${D}${systemd_system_unitdir}/graphical.target.wants
@@ -388,11 +384,11 @@ do_install() {
 	fi
 
 	if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', d)}; then
-		if ! grep -q '^NamePolicy=.*mac' ${D}${rootlibexecdir}/systemd/network/99-default.link; then
-			sed -i '/^NamePolicy=/s/$/ mac/' ${D}${rootlibexecdir}/systemd/network/99-default.link
+		if ! grep -q '^NamePolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
+			sed -i '/^NamePolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
 		fi
-		if ! grep -q 'AlternativeNamesPolicy=.*mac' ${D}${rootlibexecdir}/systemd/network/99-default.link; then
-			sed -i '/AlternativeNamesPolicy=/s/$/ mac/' ${D}${rootlibexecdir}/systemd/network/99-default.link
+		if ! grep -q 'AlternativeNamesPolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
+			sed -i '/AlternativeNamesPolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
 		fi
 	fi
 }
@@ -478,7 +474,7 @@ RDEPENDS:${PN}-initramfs = "${PN}"
 
 FILES:${PN}-gui = "${bindir}/systemadm"
 
-FILES:${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
+FILES:${PN}-vconsole-setup = "${nonarch_libdir}/systemd/systemd-vconsole-setup \
                               ${systemd_system_unitdir}/systemd-vconsole-setup.service \
                               ${systemd_system_unitdir}/sysinit.target.wants/systemd-vconsole-setup.service"
 
@@ -494,7 +490,7 @@ FILES:${PN}-zsh-completion = "${datadir}/zsh/site-functions"
 
 FILES:${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
                       ${exec_prefix}/lib/binfmt.d \
-                      ${rootlibexecdir}/systemd/systemd-binfmt \
+                      ${nonarch_libdir}/systemd/systemd-binfmt \
                       ${systemd_system_unitdir}/proc-sys-fs-binfmt_misc.* \
                       ${systemd_system_unitdir}/systemd-binfmt.service"
 RRECOMMENDS:${PN}-binfmt = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', 'kernel-module-binfmt-misc', '', d)}"
@@ -502,7 +498,7 @@ RRECOMMENDS:${PN}-binfmt = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', 'ker
 RDEPENDS:${PN}-vconsole-setup = "${@bb.utils.contains('PACKAGECONFIG', 'vconsole', 'kbd kbd-consolefonts kbd-keymaps', '', d)}"
 
 
-FILES:${PN}-journal-gatewayd = "${rootlibexecdir}/systemd/systemd-journal-gatewayd \
+FILES:${PN}-journal-gatewayd = "${nonarch_libdir}/systemd/systemd-journal-gatewayd \
                                 ${systemd_system_unitdir}/systemd-journal-gatewayd.service \
                                 ${systemd_system_unitdir}/systemd-journal-gatewayd.socket \
                                 ${systemd_system_unitdir}/sockets.target.wants/systemd-journal-gatewayd.socket \
@@ -510,13 +506,13 @@ FILES:${PN}-journal-gatewayd = "${rootlibexecdir}/systemd/systemd-journal-gatewa
                                "
 SYSTEMD_SERVICE:${PN}-journal-gatewayd = "systemd-journal-gatewayd.socket"
 
-FILES:${PN}-journal-upload = "${rootlibexecdir}/systemd/systemd-journal-upload \
+FILES:${PN}-journal-upload = "${nonarch_libdir}/systemd/systemd-journal-upload \
                               ${systemd_system_unitdir}/systemd-journal-upload.service \
                               ${sysconfdir}/systemd/journal-upload.conf \
                              "
 SYSTEMD_SERVICE:${PN}-journal-upload = "systemd-journal-upload.service"
 
-FILES:${PN}-journal-remote = "${rootlibexecdir}/systemd/systemd-journal-remote \
+FILES:${PN}-journal-remote = "${nonarch_libdir}/systemd/systemd-journal-remote \
                               ${sysconfdir}/systemd/journal-remote.conf \
                               ${systemd_system_unitdir}/systemd-journal-remote.service \
                               ${systemd_system_unitdir}/systemd-journal-remote.socket \
@@ -543,10 +539,10 @@ FILES:${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${systemd_system_unitdir}/systemd-machined.service \
                          ${systemd_system_unitdir}/dbus-org.freedesktop.machine1.service \
                          ${systemd_system_unitdir}/var-lib-machines.mount \
-                         ${rootlibexecdir}/systemd/systemd-import \
-                         ${rootlibexecdir}/systemd/systemd-importd \
-                         ${rootlibexecdir}/systemd/systemd-machined \
-                         ${rootlibexecdir}/systemd/systemd-pull \
+                         ${nonarch_libdir}/systemd/systemd-import \
+                         ${nonarch_libdir}/systemd/systemd-importd \
+                         ${nonarch_libdir}/systemd/systemd-machined \
+                         ${nonarch_libdir}/systemd/systemd-pull \
                          ${exec_prefix}/lib/tmpfiles.d/systemd-nspawn.conf \
                          ${exec_prefix}/lib/tmpfiles.d/README \
                          ${systemd_system_unitdir}/systemd-nspawn@.service \
@@ -597,15 +593,15 @@ FILES:${PN}-extra-utils = "\
                         ${systemd_system_unitdir}/sysinit.target.wants/systemd-pcrphase.path \
                         ${systemd_system_unitdir}/sysinit.target.wants/systemd-pcrphase-sysinit.path \
                         ${systemd_system_unitdir}/multi-user.target.wants/systemd-ask-password-wall.path \
-                        ${rootlibexecdir}/systemd/systemd-resolve-host \
-                        ${rootlibexecdir}/systemd/systemd-ac-power \
-                        ${rootlibexecdir}/systemd/systemd-activate \
-                        ${rootlibexecdir}/systemd/systemd-measure \
-                        ${rootlibexecdir}/systemd/systemd-pcrphase \
-                        ${rootlibexecdir}/systemd/systemd-socket-proxyd \
-                        ${rootlibexecdir}/systemd/systemd-reply-password \
-                        ${rootlibexecdir}/systemd/systemd-sleep \
-                        ${rootlibexecdir}/systemd/system-sleep \
+                        ${nonarch_libdir}/systemd/systemd-resolve-host \
+                        ${nonarch_libdir}/systemd/systemd-ac-power \
+                        ${nonarch_libdir}/systemd/systemd-activate \
+                        ${nonarch_libdir}/systemd/systemd-measure \
+                        ${nonarch_libdir}/systemd/systemd-pcrphase \
+                        ${nonarch_libdir}/systemd/systemd-socket-proxyd \
+                        ${nonarch_libdir}/systemd/systemd-reply-password \
+                        ${nonarch_libdir}/systemd/systemd-sleep \
+                        ${nonarch_libdir}/systemd/system-sleep \
                         ${systemd_system_unitdir}/systemd-hibernate.service \
                         ${systemd_system_unitdir}/systemd-hybrid-sleep.service \
                         ${systemd_system_unitdir}/systemd-pcrphase-initrd.service \
@@ -613,22 +609,22 @@ FILES:${PN}-extra-utils = "\
                         ${systemd_system_unitdir}/systemd-pcrphase-sysinit.service \
                         ${systemd_system_unitdir}/systemd-suspend.service \
                         ${systemd_system_unitdir}/sleep.target \
-                        ${rootlibexecdir}/systemd/systemd-initctl \
+                        ${nonarch_libdir}/systemd/systemd-initctl \
                         ${systemd_system_unitdir}/systemd-initctl.service \
                         ${systemd_system_unitdir}/systemd-initctl.socket \
                         ${systemd_system_unitdir}/sockets.target.wants/systemd-initctl.socket \
-                        ${rootlibexecdir}/systemd/system-generators/systemd-gpt-auto-generator \
-                        ${rootlibexecdir}/systemd/systemd-cgroups-agent \
+                        ${nonarch_libdir}/systemd/system-generators/systemd-gpt-auto-generator \
+                        ${nonarch_libdir}/systemd/systemd-cgroups-agent \
 "
 
 FILES:${PN}-mime = "${MIMEDIR}"
 RRECOMMENDS:${PN} += "${PN}-mime"
 
 FILES:${PN}-udev-rules = "\
-                        ${rootlibexecdir}/udev/rules.d/70-uaccess.rules \
-                        ${rootlibexecdir}/udev/rules.d/71-seat.rules \
-                        ${rootlibexecdir}/udev/rules.d/73-seat-late.rules \
-                        ${rootlibexecdir}/udev/rules.d/99-systemd.rules \
+                        ${nonarch_libdir}/udev/rules.d/70-uaccess.rules \
+                        ${nonarch_libdir}/udev/rules.d/71-seat.rules \
+                        ${nonarch_libdir}/udev/rules.d/73-seat-late.rules \
+                        ${nonarch_libdir}/udev/rules.d/99-systemd.rules \
 "
 
 CONFFILES:${PN} = "${sysconfdir}/systemd/coredump.conf \
@@ -672,7 +668,7 @@ FILES:${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/X11/xinit/xinitrc.d/* \
                 ${sysconfdir}/ssh/ssh_config.d/20-systemd-ssh-proxy.conf \
                 ${sysconfdir}/ssh/sshd_config.d/20-systemd-userdb.conf \
-                ${rootlibexecdir}/systemd/* \
+                ${nonarch_libdir}/systemd/* \
                 ${libdir}/systemd/libsystemd-core* \
                 ${libdir}/pam.d \
                 ${nonarch_libdir}/pam.d \
@@ -698,8 +694,8 @@ FILES:${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/environment.d \
                 ${exec_prefix}/lib/pcrlock.d \
                 ${localstatedir} \
-                ${rootlibexecdir}/modprobe.d/systemd.conf \
-                ${rootlibexecdir}/modprobe.d/README \
+                ${nonarch_libdir}/modprobe.d/systemd.conf \
+                ${nonarch_libdir}/modprobe.d/README \
                 ${datadir}/dbus-1/system.d/org.freedesktop.timedate1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.locale1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
@@ -742,58 +738,58 @@ RDEPENDS:udev-bash-completion += "bash-completion"
 RDEPENDS:udev-hwdb += "udev"
 
 FILES:udev += "${base_sbindir}/udevd \
-               ${rootlibexecdir}/systemd/network/99-default.link \
-               ${rootlibexecdir}/systemd/systemd-udevd \
-               ${rootlibexecdir}/udev/accelerometer \
-               ${rootlibexecdir}/udev/ata_id \
-               ${rootlibexecdir}/udev/cdrom_id \
-               ${rootlibexecdir}/udev/collect \
-               ${rootlibexecdir}/udev/dmi_memory_id \
-               ${rootlibexecdir}/udev/fido_id \
-               ${rootlibexecdir}/udev/findkeyboards \
-               ${rootlibexecdir}/udev/iocost \
-               ${rootlibexecdir}/udev/keyboard-force-release.sh \
-               ${rootlibexecdir}/udev/keymap \
-               ${rootlibexecdir}/udev/mtd_probe \
-               ${rootlibexecdir}/udev/scsi_id \
-               ${rootlibexecdir}/udev/v4l_id \
-               ${rootlibexecdir}/udev/keymaps \
-               ${rootlibexecdir}/udev/rules.d/50-udev-default.rules \
-               ${rootlibexecdir}/udev/rules.d/60-autosuspend.rules \
-               ${rootlibexecdir}/udev/rules.d/60-autosuspend-chromiumos.rules \
-               ${rootlibexecdir}/udev/rules.d/60-block.rules \
-               ${rootlibexecdir}/udev/rules.d/60-cdrom_id.rules \
-               ${rootlibexecdir}/udev/rules.d/60-dmi-id.rules \
-               ${rootlibexecdir}/udev/rules.d/60-drm.rules \
-               ${rootlibexecdir}/udev/rules.d/60-evdev.rules \
-               ${rootlibexecdir}/udev/rules.d/60-fido-id.rules \
-               ${rootlibexecdir}/udev/rules.d/60-infiniband.rules \
-               ${rootlibexecdir}/udev/rules.d/60-input-id.rules \
-               ${rootlibexecdir}/udev/rules.d/60-persistent-alsa.rules \
-               ${rootlibexecdir}/udev/rules.d/60-persistent-input.rules \
-               ${rootlibexecdir}/udev/rules.d/60-persistent-storage.rules \
-               ${rootlibexecdir}/udev/rules.d/60-persistent-storage-mtd.rules \
-               ${rootlibexecdir}/udev/rules.d/60-persistent-storage-tape.rules \
-               ${rootlibexecdir}/udev/rules.d/60-persistent-v4l.rules \
-               ${rootlibexecdir}/udev/rules.d/60-sensor.rules \
-               ${rootlibexecdir}/udev/rules.d/60-serial.rules \
-               ${rootlibexecdir}/udev/rules.d/61-autosuspend-manual.rules \
-               ${rootlibexecdir}/udev/rules.d/64-btrfs.rules \
-               ${rootlibexecdir}/udev/rules.d/70-camera.rules \
-               ${rootlibexecdir}/udev/rules.d/70-joystick.rules \
-               ${rootlibexecdir}/udev/rules.d/70-memory.rules \
-               ${rootlibexecdir}/udev/rules.d/70-mouse.rules \
-               ${rootlibexecdir}/udev/rules.d/70-power-switch.rules \
-               ${rootlibexecdir}/udev/rules.d/70-touchpad.rules \
-               ${rootlibexecdir}/udev/rules.d/75-net-description.rules \
-               ${rootlibexecdir}/udev/rules.d/75-probe_mtd.rules \
-               ${rootlibexecdir}/udev/rules.d/78-sound-card.rules \
-               ${rootlibexecdir}/udev/rules.d/80-drivers.rules \
-               ${rootlibexecdir}/udev/rules.d/80-net-setup-link.rules \
-               ${rootlibexecdir}/udev/rules.d/81-net-dhcp.rules \
-               ${rootlibexecdir}/udev/rules.d/90-vconsole.rules \
-               ${rootlibexecdir}/udev/rules.d/90-iocost.rules \
-               ${rootlibexecdir}/udev/rules.d/README \
+               ${nonarch_libdir}/systemd/network/99-default.link \
+               ${nonarch_libdir}/systemd/systemd-udevd \
+               ${nonarch_libdir}/udev/accelerometer \
+               ${nonarch_libdir}/udev/ata_id \
+               ${nonarch_libdir}/udev/cdrom_id \
+               ${nonarch_libdir}/udev/collect \
+               ${nonarch_libdir}/udev/dmi_memory_id \
+               ${nonarch_libdir}/udev/fido_id \
+               ${nonarch_libdir}/udev/findkeyboards \
+               ${nonarch_libdir}/udev/iocost \
+               ${nonarch_libdir}/udev/keyboard-force-release.sh \
+               ${nonarch_libdir}/udev/keymap \
+               ${nonarch_libdir}/udev/mtd_probe \
+               ${nonarch_libdir}/udev/scsi_id \
+               ${nonarch_libdir}/udev/v4l_id \
+               ${nonarch_libdir}/udev/keymaps \
+               ${nonarch_libdir}/udev/rules.d/50-udev-default.rules \
+               ${nonarch_libdir}/udev/rules.d/60-autosuspend.rules \
+               ${nonarch_libdir}/udev/rules.d/60-autosuspend-chromiumos.rules \
+               ${nonarch_libdir}/udev/rules.d/60-block.rules \
+               ${nonarch_libdir}/udev/rules.d/60-cdrom_id.rules \
+               ${nonarch_libdir}/udev/rules.d/60-dmi-id.rules \
+               ${nonarch_libdir}/udev/rules.d/60-drm.rules \
+               ${nonarch_libdir}/udev/rules.d/60-evdev.rules \
+               ${nonarch_libdir}/udev/rules.d/60-fido-id.rules \
+               ${nonarch_libdir}/udev/rules.d/60-infiniband.rules \
+               ${nonarch_libdir}/udev/rules.d/60-input-id.rules \
+               ${nonarch_libdir}/udev/rules.d/60-persistent-alsa.rules \
+               ${nonarch_libdir}/udev/rules.d/60-persistent-input.rules \
+               ${nonarch_libdir}/udev/rules.d/60-persistent-storage.rules \
+               ${nonarch_libdir}/udev/rules.d/60-persistent-storage-mtd.rules \
+               ${nonarch_libdir}/udev/rules.d/60-persistent-storage-tape.rules \
+               ${nonarch_libdir}/udev/rules.d/60-persistent-v4l.rules \
+               ${nonarch_libdir}/udev/rules.d/60-sensor.rules \
+               ${nonarch_libdir}/udev/rules.d/60-serial.rules \
+               ${nonarch_libdir}/udev/rules.d/61-autosuspend-manual.rules \
+               ${nonarch_libdir}/udev/rules.d/64-btrfs.rules \
+               ${nonarch_libdir}/udev/rules.d/70-camera.rules \
+               ${nonarch_libdir}/udev/rules.d/70-joystick.rules \
+               ${nonarch_libdir}/udev/rules.d/70-memory.rules \
+               ${nonarch_libdir}/udev/rules.d/70-mouse.rules \
+               ${nonarch_libdir}/udev/rules.d/70-power-switch.rules \
+               ${nonarch_libdir}/udev/rules.d/70-touchpad.rules \
+               ${nonarch_libdir}/udev/rules.d/75-net-description.rules \
+               ${nonarch_libdir}/udev/rules.d/75-probe_mtd.rules \
+               ${nonarch_libdir}/udev/rules.d/78-sound-card.rules \
+               ${nonarch_libdir}/udev/rules.d/80-drivers.rules \
+               ${nonarch_libdir}/udev/rules.d/80-net-setup-link.rules \
+               ${nonarch_libdir}/udev/rules.d/81-net-dhcp.rules \
+               ${nonarch_libdir}/udev/rules.d/90-vconsole.rules \
+               ${nonarch_libdir}/udev/rules.d/90-iocost.rules \
+               ${nonarch_libdir}/udev/rules.d/README \
                ${sysconfdir}/udev \
                ${sysconfdir}/init.d/systemd-udevd \
                ${systemd_system_unitdir}/*udev* \
@@ -805,7 +801,7 @@ FILES:udev += "${base_sbindir}/udevd \
               "
 
 FILES:udev-bash-completion = "${datadir}/bash-completion/completions/udevadm"
-FILES:udev-hwdb = "${rootlibexecdir}/udev/hwdb.d \
+FILES:udev-hwdb = "${nonarch_libdir}/udev/hwdb.d \
                    "
 
 RCONFLICTS:${PN} = "tiny-init ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolvconf', '', d)}"
@@ -900,7 +896,7 @@ PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst:udev-hwdb () {
 	if test -n "$D"; then
 		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} \
-			rootlibexecdir="${rootlibexecdir}" PREFERRED_PROVIDER_udev="${PREFERRED_PROVIDER_udev}" base_bindir="${base_bindir}"
+			rootlibexecdir="${nonarch_libdir}" PREFERRED_PROVIDER_udev="${PREFERRED_PROVIDER_udev}" base_bindir="${base_bindir}"
 	else
 		systemd-hwdb update
 	fi
-- 
2.34.1


