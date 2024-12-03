Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3509E6C5F4
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 03:05:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.10980.1733195127797544321
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 19:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=pR/pC9aS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2K0usK028930
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Dec 2024 03:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5/PaYVCQHFj16wfaVJTvYLAMpxD1XbngQuU
	JZ9WWngM=; b=pR/pC9aSOMXchm6l3/yi7FnRcqBluyPHsMyMJIdCr5xLcQdI1ll
	cKfEeMHW7twqHtGak88cupisER6nQMsBs6obrqGehJv6AeI6Vku5Xof+T3ZENJwF
	T+sphg0Q+E+6NZso5Pv8pBYdIvHZpuY+xdFmdwkn637XrknbbCcekYO7nNc0hPgZ
	5C4We4jrNy6/nhhZXeah6cTK9m7ISyaG3V7B+cHr2NAumnuGTieefjGhX2QNbANL
	8DFbcWlA2xK2JzI0IGrG+U0LZNAfpVBw61TvrnUui2xf68IbosS0GjzHmpkQDCXh
	GO1hA2pSXKadPG/8HUK9jMBsn+SPuNhBppw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437tstemyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 03:05:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7251d769f7bso4026040b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 19:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733195125; x=1733799925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5/PaYVCQHFj16wfaVJTvYLAMpxD1XbngQuUJZ9WWngM=;
        b=VvP1c9VL6ewMoo5pM/bJyLIX0xgbjm98owRXNR4mqNawp9Dhq7E8uFIG0NK1f2XIoZ
         Z83fusJBrAvhS7kqm5zN4MUjeYW2appsHtHg8bYPX+BcTvokMhXpS+gr3FvkWaom/a9Z
         6104U8KZEN150fDLaM2rNB3NecgxCdSSDm6DR/xULsvx3MgMbFRAopSYHcQwpqOvKXBj
         MDdaGADGlOk5kXZWae/yqVRJaAEoZAZk5POaXjTIbru9W5RuGxk5Xo/hzcArGiHea0S+
         6+kPidIoZZa8A0liV3lQ875desjR11pRQEkKswTyeOvHW15hI8/EumnUlqPC5vQXTBci
         vRnA==
X-Gm-Message-State: AOJu0YxdiKxOLPYxzSxVxU8q8DtetFdNQkuavLTtMshTboQtYEvRy5Ni
	J4iMTa4FFHAW5Rr+gsFdJPnJi9TgPBwRM4/ZcFgGAfxve5L2KtRZC1v1oJD3v66LXc+FVRlzVoo
	kKNnNU2BtlWARZxT8Zle2mKX8bNOT2zK40slsjVsZrCYo8FnK9L9kHLTmD0KWpsBhyYa83uXO0J
	n23t0wewTdv3w=
X-Gm-Gg: ASbGnctD5PrEOMXf6pXfVjlkRl5R8IWgrEdI7ad7xoZK/GmM7ODzbPGFW38nY1G42G6
	oyRKVqiwZgObD2Zmlu7lUdZax36irF6VnwB7dAhuDZVz+oCRuj9qnvtp7koN2OotA5fkM8jfdm+
	eANt5Q6t/auOF58N7a0KWg95vzbgvvSqgIkwFW/LUQ3+eoVyfBfX12v7P0DqCqzjS8MfDkp2NW3
	EXkefXIw9g7MR9QIELMdVOZLPOYGc6FIUAewBuYLX7bN6A2DV3SyQfIHC6BHhWNc+qDILSEqA==
X-Received: by 2002:a05:6a00:3498:b0:725:4196:5cee with SMTP id d2e1a72fcca58-72541965f3fmr34144567b3a.4.1733195125054;
        Mon, 02 Dec 2024 19:05:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9Vjq4C52FpvOD6Otuk+TEKzI7ZeszZyJrA5UAzzgWtrJsaimuJFrGxLoiaGqRTyVbppmvqA==
X-Received: by 2002:a05:6a00:3498:b0:725:4196:5cee with SMTP id d2e1a72fcca58-72541965f3fmr34144520b3a.4.1733195124581;
        Mon, 02 Dec 2024 19:05:24 -0800 (PST)
Received: from evatuf.domocacupe ([187.34.86.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417612b5sm9315462b3a.30.2024.12.02.19.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 19:05:24 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com, peter.kjellerstedt@axis.com
Subject: [PATCH v2 1/3] systemd: drop deprecated rootlibdir, rootprefix and split-usr options
Date: Tue,  3 Dec 2024 00:05:18 -0300
Message-Id: <20241203030520.1288256-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CCPVYtVi9K1J7ZMn1LfC336u0MR9okOv
X-Proofpoint-GUID: CCPVYtVi9K1J7ZMn1LfC336u0MR9okOv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=988 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 03:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208172

Support for split-usr and unmerged-usr were both removed as part of the
systemd 255 release, so remove the current deprecated rootlibdir,
rootprefix and split-usr options from the recipe.

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
v2: use nonarch_libdir instead of nonarch_base_libdir and correctly use
libdir for other library entries.

 meta/recipes-core/systemd/systemd_256.8.bb | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_256.8.bb b/meta/recipes-core/systemd/systemd_256.8.bb
index c17100a636a..5bec9cb976f 100644
--- a/meta/recipes-core/systemd/systemd_256.8.bb
+++ b/meta/recipes-core/systemd/systemd_256.8.bb
@@ -69,7 +69,7 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam pni-names selinux smack usrmerge polkit seccomp', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam pni-names selinux smack polkit seccomp', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elfutils', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
@@ -218,7 +218,6 @@ def build_epoch(d):
 PACKAGECONFIG[set-time-epoch] = "${@build_epoch(d)},-Dtime-epoch=0"
 PACKAGECONFIG[timedated] = "-Dtimedated=true,-Dtimedated=false"
 PACKAGECONFIG[timesyncd] = "-Dtimesyncd=true,-Dtimesyncd=false"
-PACKAGECONFIG[usrmerge] = "-Dsplit-usr=false,-Dsplit-usr=true"
 PACKAGECONFIG[sbinmerge] = "-Dsplit-bin=false,-Dsplit-bin=true"
 PACKAGECONFIG[userdb] = "-Duserdb=true,-Duserdb=false"
 PACKAGECONFIG[utmp] = "-Dutmp=true,-Dutmp=false"
@@ -240,14 +239,10 @@ CFLAGS:append = " --sysroot=${STAGING_DIR_TARGET}"
 
 # Helper variables to clarify locations.  This mirrors the logic in systemd's
 # build system.
-rootprefix ?= "${root_prefix}"
-rootlibdir ?= "${base_libdir}"
-rootlibexecdir = "${rootprefix}/lib"
+rootlibexecdir = "${nonarch_libdir}"
 
 EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dnobody-group=nogroup \
-                  -Drootlibdir=${rootlibdir} \
-                  -Drootprefix=${rootprefix} \
                   -Ddefault-locale=C \
                   -Dmode=release \
                   -Dsystem-alloc-uid-min=101 \
@@ -403,7 +398,7 @@ do_install() {
 }
 
 python populate_packages:prepend (){
-    systemdlibdir = d.getVar("rootlibdir")
+    systemdlibdir = d.getVar("libdir")
     do_split_packages(d, systemdlibdir, r'^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
 }
 PACKAGES_DYNAMIC += "^lib(udev|systemd|nss).*"
@@ -678,7 +673,7 @@ FILES:${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/ssh/ssh_config.d/20-systemd-ssh-proxy.conf \
                 ${sysconfdir}/ssh/sshd_config.d/20-systemd-userdb.conf \
                 ${rootlibexecdir}/systemd/* \
-                ${rootlibdir}/systemd/libsystemd-core* \
+                ${libdir}/systemd/libsystemd-core* \
                 ${libdir}/pam.d \
                 ${nonarch_libdir}/pam.d \
                 ${systemd_unitdir}/* \
@@ -739,7 +734,7 @@ INSANE_SKIP:${PN}-dbg += "libdir"
 INSANE_SKIP:${PN}-doc += " libdir"
 INSANE_SKIP:libsystemd-shared += "libdir"
 
-FILES:libsystemd-shared = "${rootlibdir}/systemd/libsystemd-shared*.so"
+FILES:libsystemd-shared = "${libdir}/systemd/libsystemd-shared*.so"
 
 RPROVIDES:udev = "hotplug"
 
-- 
2.34.1


