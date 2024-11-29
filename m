Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC30BD70E16
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 03:37:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.108548.1732851421406069519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 19:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RQ/L1MTl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASN2aIC016069
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 03:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M8tnWbeXK8s
	nEG0Ita3ruk5gxRy8/Ef6yaBQjwmzEQg=; b=RQ/L1MTlnfv9AuAsatwRAicFaGs
	RyfiNFFqLE8RwMgFHKDd+59/JhZjoUEQHYSqAXU627L0kvLuB08dlbnmvCM2PR9W
	MOyfkz6ho7U9iYiJ6MP5OTDoyK5jPMxIDy1e0FVafEHxW0+M/3/nvz8Nurben5d7
	FOQKMrNL4itUg9LzNme30pNXkWFGYGZJm0kexHORTTABpEOZ/XnbjlcaCvpG6sj+
	IlR66LjpE8nvZyCw2ED1tdzsJHHuhzl/M4vpEHhVUw+97TO6mMkv13Q4nX9HhMFb
	C+kMx/awR+4JfJM0FV4B4pFlAsSiqswoI6Ta3ZZ8UMuyn4FGna3D+eC0A7w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43671ec89v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 03:37:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-725126e7da0so1414794b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 19:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732851420; x=1733456220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8tnWbeXK8snEG0Ita3ruk5gxRy8/Ef6yaBQjwmzEQg=;
        b=OFf6E1IRM1Gi9WVvhQFxRhXgbUddGFDeHnX8xgcWKVLdZPyMCKpniriuUkqBjdw1vl
         k7suBeAtOPNhThskF14NjlXOOTqTgH13p6zwivywdZ3EAMh2iWfYSxUsnFmPzWqsk0ou
         9yP6IWXU93cA5Xr4deVJCdTYWISm7paXXplPjeDwQYtmVglgX/gfDZfI09VIrqBj0nlU
         JTQu4z2WfP2s6zHawXXfgKL3ProJKk3WpueD39had7WF565BEyROLkkMq3DFTGbkni85
         /V2BRQl8fLCPnwhdN08hvgOlgy0xTHBY2Bi70VRy09p3Ipg9WtYbR9qUlDiysXfyXqWJ
         5o5A==
X-Gm-Message-State: AOJu0Yz3HCIdgGKaDgQAfCTYEk1//DUNpgndpyBxq0GGZElnYxwXTKtV
	wslWqaWs5Sb/Nkw7xSHzN+gPHlqj2hygiZv6v9n91r6JJh7wmO8M3Q1Bse249f0s520WhC4svpf
	Z/H/Yi9N4gcjcWew+bRAB05dORzJVibZyYC7R+sNRKE/bCllArTobveLd8YWWe/B9K0nCfvJ2Rq
	T/7B8Jutqg8PA=
X-Gm-Gg: ASbGncuU8mvAcT9jEmDqzIHmmgdY5SPEfT9grPXCM9Hwy5lhVqTjWggM13+OMUVNa7F
	gb7PC2w4Og+9IA1/WAPJ4+rXU99E782gopGKVxN/eqcXmpqf93iBycIBbj7m0DMWmlvv+pXVUu7
	nx2Ak8qNCABlTCPgGxXpzUCfAyUYMOpqPq6SPpCoUxPeWYDbnxL3cJ781KVzkjM6bkevRrT7awY
	4rbvqO/Bgmij5kdRVHiW/Qjf0g5Cyc4OSspKzri/8WZmgr4NtvZLkYeErLhv8XViIaz+FvPRw==
X-Received: by 2002:a17:903:98f:b0:215:401b:9535 with SMTP id d9443c01a7336-215401b96b9mr13669795ad.47.1732851419484;
        Thu, 28 Nov 2024 19:36:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE13YZPL1PoWODiT99LPUpB7Hb24vnF7jiNISUSfCoPg468E+ZQK99SuQfzVWrmWOtn+IiipA==
X-Received: by 2002:a17:903:98f:b0:215:401b:9535 with SMTP id d9443c01a7336-215401b96b9mr13669515ad.47.1732851418858;
        Thu, 28 Nov 2024 19:36:58 -0800 (PST)
Received: from evatuf.domocacupe ([187.34.86.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215219a8c44sm21048735ad.221.2024.11.28.19.36.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 19:36:58 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] systemd: remove custom rootlibexecdir and replace with nonarch_base_libdir
Date: Fri, 29 Nov 2024 00:36:54 -0300
Message-Id: <20241129033654.1275825-2-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241129033654.1275825-1-ricardo.salveti@oss.qualcomm.com>
References: <20241129033654.1275825-1-ricardo.salveti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: K9zrvQ6-HCC_8DsM56Fk6WILjq4D5UR7
X-Proofpoint-GUID: K9zrvQ6-HCC_8DsM56Fk6WILjq4D5UR7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 03:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208000

The rootprefix build option was deprecated in systemd 255, making the
custom rootlibexecdir unnecessary, so remove it in favor of the standard
nonarch_base_libdir definition.

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta/recipes-core/systemd/systemd_256.8.bb | 186 ++++++++++-----------
 1 file changed, 91 insertions(+), 95 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_256.8.bb b/meta/recipes-core/systemd/systemd_256.8.bb
index 26d2237ce3a..c80bda15d87 100644
--- a/meta/recipes-core/systemd/systemd_256.8.bb
+++ b/meta/recipes-core/systemd/systemd_256.8.bb
@@ -237,10 +237,6 @@ RESOLV_CONF ??= ""
 # the eBPFs, so that it can find needed system includes in there.
 CFLAGS:append = " --sysroot=${STAGING_DIR_TARGET}"
 
-# Helper variables to clarify locations.  This mirrors the logic in systemd's
-# build system.
-rootlibexecdir = "${nonarch_base_libdir}"
-
 EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dnobody-group=nogroup \
                   -Ddefault-locale=C \
@@ -290,8 +286,8 @@ do_install() {
 	fi
 
 	# Provide support for initramfs
-	[ ! -e ${D}/init ] && ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
-	[ ! -e ${D}/${base_sbindir}/udevd ] && ln -s ${rootlibexecdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
+	[ ! -e ${D}/init ] && ln -s ${nonarch_base_libdir}/systemd/systemd ${D}/init
+	[ ! -e ${D}/${base_sbindir}/udevd ] && ln -s ${nonarch_base_libdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
 
 	install -d ${D}${sysconfdir}/udev/rules.d/
 	install -d ${D}${nonarch_libdir}/tmpfiles.d
@@ -304,7 +300,7 @@ do_install() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
-		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
+		sed -i s%@UDEVD@%${nonarch_base_libdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
 		install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 	fi
 
@@ -323,8 +319,8 @@ do_install() {
 	# if the user requests /tmp be on persistent storage (i.e. not volatile)
 	# then don't use a tmpfs for /tmp
 	if ! ${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs-perms-volatile-tmp.txt', 'true', 'false', d)}; then
-		rm -f ${D}${rootlibexecdir}/systemd/system/tmp.mount
-		rm -f ${D}${rootlibexecdir}/systemd/system/local-fs.target.wants/tmp.mount
+		rm -f ${D}${nonarch_base_libdir}/systemd/system/tmp.mount
+		rm -f ${D}${nonarch_base_libdir}/systemd/system/local-fs.target.wants/tmp.mount
 	fi
 
 	install -d ${D}${systemd_system_unitdir}/graphical.target.wants
@@ -388,11 +384,11 @@ do_install() {
 	fi
 
 	if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', d)}; then
-		if ! grep -q '^NamePolicy=.*mac' ${D}${rootlibexecdir}/systemd/network/99-default.link; then
-			sed -i '/^NamePolicy=/s/$/ mac/' ${D}${rootlibexecdir}/systemd/network/99-default.link
+		if ! grep -q '^NamePolicy=.*mac' ${D}${nonarch_base_libdir}/systemd/network/99-default.link; then
+			sed -i '/^NamePolicy=/s/$/ mac/' ${D}${nonarch_base_libdir}/systemd/network/99-default.link
 		fi
-		if ! grep -q 'AlternativeNamesPolicy=.*mac' ${D}${rootlibexecdir}/systemd/network/99-default.link; then
-			sed -i '/AlternativeNamesPolicy=/s/$/ mac/' ${D}${rootlibexecdir}/systemd/network/99-default.link
+		if ! grep -q 'AlternativeNamesPolicy=.*mac' ${D}${nonarch_base_libdir}/systemd/network/99-default.link; then
+			sed -i '/AlternativeNamesPolicy=/s/$/ mac/' ${D}${nonarch_base_libdir}/systemd/network/99-default.link
 		fi
 	fi
 }
@@ -478,7 +474,7 @@ RDEPENDS:${PN}-initramfs = "${PN}"
 
 FILES:${PN}-gui = "${bindir}/systemadm"
 
-FILES:${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
+FILES:${PN}-vconsole-setup = "${nonarch_base_libdir}/systemd/systemd-vconsole-setup \
                               ${systemd_system_unitdir}/systemd-vconsole-setup.service \
                               ${systemd_system_unitdir}/sysinit.target.wants/systemd-vconsole-setup.service"
 
@@ -494,7 +490,7 @@ FILES:${PN}-zsh-completion = "${datadir}/zsh/site-functions"
 
 FILES:${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
                       ${exec_prefix}/lib/binfmt.d \
-                      ${rootlibexecdir}/systemd/systemd-binfmt \
+                      ${nonarch_base_libdir}/systemd/systemd-binfmt \
                       ${systemd_system_unitdir}/proc-sys-fs-binfmt_misc.* \
                       ${systemd_system_unitdir}/systemd-binfmt.service"
 RRECOMMENDS:${PN}-binfmt = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', 'kernel-module-binfmt-misc', '', d)}"
@@ -502,7 +498,7 @@ RRECOMMENDS:${PN}-binfmt = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', 'ker
 RDEPENDS:${PN}-vconsole-setup = "${@bb.utils.contains('PACKAGECONFIG', 'vconsole', 'kbd kbd-consolefonts kbd-keymaps', '', d)}"
 
 
-FILES:${PN}-journal-gatewayd = "${rootlibexecdir}/systemd/systemd-journal-gatewayd \
+FILES:${PN}-journal-gatewayd = "${nonarch_base_libdir}/systemd/systemd-journal-gatewayd \
                                 ${systemd_system_unitdir}/systemd-journal-gatewayd.service \
                                 ${systemd_system_unitdir}/systemd-journal-gatewayd.socket \
                                 ${systemd_system_unitdir}/sockets.target.wants/systemd-journal-gatewayd.socket \
@@ -510,13 +506,13 @@ FILES:${PN}-journal-gatewayd = "${rootlibexecdir}/systemd/systemd-journal-gatewa
                                "
 SYSTEMD_SERVICE:${PN}-journal-gatewayd = "systemd-journal-gatewayd.socket"
 
-FILES:${PN}-journal-upload = "${rootlibexecdir}/systemd/systemd-journal-upload \
+FILES:${PN}-journal-upload = "${nonarch_base_libdir}/systemd/systemd-journal-upload \
                               ${systemd_system_unitdir}/systemd-journal-upload.service \
                               ${sysconfdir}/systemd/journal-upload.conf \
                              "
 SYSTEMD_SERVICE:${PN}-journal-upload = "systemd-journal-upload.service"
 
-FILES:${PN}-journal-remote = "${rootlibexecdir}/systemd/systemd-journal-remote \
+FILES:${PN}-journal-remote = "${nonarch_base_libdir}/systemd/systemd-journal-remote \
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
+                         ${nonarch_base_libdir}/systemd/systemd-import \
+                         ${nonarch_base_libdir}/systemd/systemd-importd \
+                         ${nonarch_base_libdir}/systemd/systemd-machined \
+                         ${nonarch_base_libdir}/systemd/systemd-pull \
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
+                        ${nonarch_base_libdir}/systemd/systemd-resolve-host \
+                        ${nonarch_base_libdir}/systemd/systemd-ac-power \
+                        ${nonarch_base_libdir}/systemd/systemd-activate \
+                        ${nonarch_base_libdir}/systemd/systemd-measure \
+                        ${nonarch_base_libdir}/systemd/systemd-pcrphase \
+                        ${nonarch_base_libdir}/systemd/systemd-socket-proxyd \
+                        ${nonarch_base_libdir}/systemd/systemd-reply-password \
+                        ${nonarch_base_libdir}/systemd/systemd-sleep \
+                        ${nonarch_base_libdir}/systemd/system-sleep \
                         ${systemd_system_unitdir}/systemd-hibernate.service \
                         ${systemd_system_unitdir}/systemd-hybrid-sleep.service \
                         ${systemd_system_unitdir}/systemd-pcrphase-initrd.service \
@@ -613,22 +609,22 @@ FILES:${PN}-extra-utils = "\
                         ${systemd_system_unitdir}/systemd-pcrphase-sysinit.service \
                         ${systemd_system_unitdir}/systemd-suspend.service \
                         ${systemd_system_unitdir}/sleep.target \
-                        ${rootlibexecdir}/systemd/systemd-initctl \
+                        ${nonarch_base_libdir}/systemd/systemd-initctl \
                         ${systemd_system_unitdir}/systemd-initctl.service \
                         ${systemd_system_unitdir}/systemd-initctl.socket \
                         ${systemd_system_unitdir}/sockets.target.wants/systemd-initctl.socket \
-                        ${rootlibexecdir}/systemd/system-generators/systemd-gpt-auto-generator \
-                        ${rootlibexecdir}/systemd/systemd-cgroups-agent \
+                        ${nonarch_base_libdir}/systemd/system-generators/systemd-gpt-auto-generator \
+                        ${nonarch_base_libdir}/systemd/systemd-cgroups-agent \
 "
 
 FILES:${PN}-mime = "${MIMEDIR}"
 RRECOMMENDS:${PN} += "${PN}-mime"
 
 FILES:${PN}-udev-rules = "\
-                        ${rootlibexecdir}/udev/rules.d/70-uaccess.rules \
-                        ${rootlibexecdir}/udev/rules.d/71-seat.rules \
-                        ${rootlibexecdir}/udev/rules.d/73-seat-late.rules \
-                        ${rootlibexecdir}/udev/rules.d/99-systemd.rules \
+                        ${nonarch_base_libdir}/udev/rules.d/70-uaccess.rules \
+                        ${nonarch_base_libdir}/udev/rules.d/71-seat.rules \
+                        ${nonarch_base_libdir}/udev/rules.d/73-seat-late.rules \
+                        ${nonarch_base_libdir}/udev/rules.d/99-systemd.rules \
 "
 
 CONFFILES:${PN} = "${sysconfdir}/systemd/coredump.conf \
@@ -672,7 +668,7 @@ FILES:${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/X11/xinit/xinitrc.d/* \
                 ${sysconfdir}/ssh/ssh_config.d/20-systemd-ssh-proxy.conf \
                 ${sysconfdir}/ssh/sshd_config.d/20-systemd-userdb.conf \
-                ${rootlibexecdir}/systemd/* \
+                ${nonarch_base_libdir}/systemd/* \
                 ${nonarch_base_libdir}/systemd/libsystemd-core* \
                 ${libdir}/pam.d \
                 ${nonarch_libdir}/pam.d \
@@ -698,8 +694,8 @@ FILES:${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/environment.d \
                 ${exec_prefix}/lib/pcrlock.d \
                 ${localstatedir} \
-                ${rootlibexecdir}/modprobe.d/systemd.conf \
-                ${rootlibexecdir}/modprobe.d/README \
+                ${nonarch_base_libdir}/modprobe.d/systemd.conf \
+                ${nonarch_base_libdir}/modprobe.d/README \
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
+               ${nonarch_base_libdir}/systemd/network/99-default.link \
+               ${nonarch_base_libdir}/systemd/systemd-udevd \
+               ${nonarch_base_libdir}/udev/accelerometer \
+               ${nonarch_base_libdir}/udev/ata_id \
+               ${nonarch_base_libdir}/udev/cdrom_id \
+               ${nonarch_base_libdir}/udev/collect \
+               ${nonarch_base_libdir}/udev/dmi_memory_id \
+               ${nonarch_base_libdir}/udev/fido_id \
+               ${nonarch_base_libdir}/udev/findkeyboards \
+               ${nonarch_base_libdir}/udev/iocost \
+               ${nonarch_base_libdir}/udev/keyboard-force-release.sh \
+               ${nonarch_base_libdir}/udev/keymap \
+               ${nonarch_base_libdir}/udev/mtd_probe \
+               ${nonarch_base_libdir}/udev/scsi_id \
+               ${nonarch_base_libdir}/udev/v4l_id \
+               ${nonarch_base_libdir}/udev/keymaps \
+               ${nonarch_base_libdir}/udev/rules.d/50-udev-default.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-autosuspend.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-autosuspend-chromiumos.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-block.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-cdrom_id.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-dmi-id.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-drm.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-evdev.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-fido-id.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-infiniband.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-input-id.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-persistent-alsa.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-persistent-input.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-persistent-storage.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-persistent-storage-mtd.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-persistent-storage-tape.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-persistent-v4l.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-sensor.rules \
+               ${nonarch_base_libdir}/udev/rules.d/60-serial.rules \
+               ${nonarch_base_libdir}/udev/rules.d/61-autosuspend-manual.rules \
+               ${nonarch_base_libdir}/udev/rules.d/64-btrfs.rules \
+               ${nonarch_base_libdir}/udev/rules.d/70-camera.rules \
+               ${nonarch_base_libdir}/udev/rules.d/70-joystick.rules \
+               ${nonarch_base_libdir}/udev/rules.d/70-memory.rules \
+               ${nonarch_base_libdir}/udev/rules.d/70-mouse.rules \
+               ${nonarch_base_libdir}/udev/rules.d/70-power-switch.rules \
+               ${nonarch_base_libdir}/udev/rules.d/70-touchpad.rules \
+               ${nonarch_base_libdir}/udev/rules.d/75-net-description.rules \
+               ${nonarch_base_libdir}/udev/rules.d/75-probe_mtd.rules \
+               ${nonarch_base_libdir}/udev/rules.d/78-sound-card.rules \
+               ${nonarch_base_libdir}/udev/rules.d/80-drivers.rules \
+               ${nonarch_base_libdir}/udev/rules.d/80-net-setup-link.rules \
+               ${nonarch_base_libdir}/udev/rules.d/81-net-dhcp.rules \
+               ${nonarch_base_libdir}/udev/rules.d/90-vconsole.rules \
+               ${nonarch_base_libdir}/udev/rules.d/90-iocost.rules \
+               ${nonarch_base_libdir}/udev/rules.d/README \
                ${sysconfdir}/udev \
                ${sysconfdir}/init.d/systemd-udevd \
                ${systemd_system_unitdir}/*udev* \
@@ -805,7 +801,7 @@ FILES:udev += "${base_sbindir}/udevd \
               "
 
 FILES:udev-bash-completion = "${datadir}/bash-completion/completions/udevadm"
-FILES:udev-hwdb = "${rootlibexecdir}/udev/hwdb.d \
+FILES:udev-hwdb = "${nonarch_base_libdir}/udev/hwdb.d \
                    "
 
 RCONFLICTS:${PN} = "tiny-init ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolvconf', '', d)}"
@@ -899,7 +895,7 @@ pkg_prerm:${PN}:libc-glibc () {
 PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst:udev-hwdb () {
 	if test -n "$D"; then
-		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} rootlibexecdir="${rootlibexecdir}" PREFERRED_PROVIDER_udev="${PREFERRED_PROVIDER_udev}" base_bindir="${base_bindir}"
+		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} rootlibexecdir="${nonarch_base_libdir}" PREFERRED_PROVIDER_udev="${PREFERRED_PROVIDER_udev}" base_bindir="${base_bindir}"
 	else
 		systemd-hwdb update
 	fi
-- 
2.34.1


