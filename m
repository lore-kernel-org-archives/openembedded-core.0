Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BE8D70E1A
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 03:37:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.109269.1732851419942731997
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 19:36:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=F/nISrEc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASLbfll018114
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 03:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZOD3O0+VYX1RLhl3he71yIYyS1St/89ic7U
	XOQG3ePQ=; b=F/nISrEcT591mEXGmbnSfUD9RAMtJV5IuNKfnnG7O6Zgsl2CdUG
	IG3e0/c07EnWobKVsZAavc6+u6coReYjx4823+s4f80vfrF9kbaQ3/g/HRgwUSe3
	6O6BV64nsHTr59zeIv3juWgc12Jy8ubyie49Etto5bEzDQhGA03bFG4OCzL3hfdT
	k+i/p0CXQogF7mVXNGmDSA81g7Oqbw/iTRL8WYdYyMTRzEYAD4vnSLeFQo7krTGB
	JbP6DWLHPoKwVMWkbWvwua4GAolKUlGnsoYoEwxd8z80lEjfA0heGX+XIWlcLz8/
	1fZM+cxskJNozEiPqG0KJZc8SvSTlo6OlTg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43673jc972-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 03:36:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2153861c470so5560675ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 19:36:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732851418; x=1733456218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOD3O0+VYX1RLhl3he71yIYyS1St/89ic7UXOQG3ePQ=;
        b=ESgUEdyNxOHnPdtyXXj+hTLiajtgem4gpxvBHcneV4M39ANS5dQ/IBlV4tRWbXhhgY
         fesw6QrXCGHzY2+YAMAxv8tpB0Uonv59VKIlb/7n1nHEF1Lgh2TzbrMarUJkTyU34b0Q
         7086MkRFh60rxxwzd4XWhAHsl2D8wxcEd/8TTevaCiru7zyPFVWWLD9DJstOXB5b6zqH
         Z6ZASYA9/Q5Uw4pPEXZmYgttgFl8wsQQQnEvWXcaycfxym42ksVxLJer/O455vzVFhOl
         NWwfvweLKHIhDXEjoX8jkqye1PuiSXh7ryvbuwrMnQGpOijt5cRWirP88HNZ4q389/ye
         7d3g==
X-Gm-Message-State: AOJu0YxTJvkgHBts2qdSORs4YoL4lJaF90HxQ4OGtucsdLUO2gloEYzr
	2ZyrZ8Ankaop7sKpbYQAbSS0UnQMwGvi+GxwGpshbtaM0J0qCepRHNf1zafBT9jkHvhlN/HjF0b
	AW3FJKedOsC/vd+PAZNxG/Q/Awraz+ux1dkNkdZ+pnwI+oQ5abpzfIKkbJiSJTWuTx+CQUHwEP+
	EVXlHI4n3apj4=
X-Gm-Gg: ASbGncvGdfvJHP+L9dY09grtP7mA/o0Ac+IZ+KIcByD1p2iFitKMZs0yiXcLjPJ6nyx
	mWqmLPrOFYk+N6RGrQt9WObR1a//Ck5KfixL3TE5k4AsAQFcM6xmonvhJc5yjaL+rN1MporB8Pj
	IrORt+TirSpMQmP7l1XVkFna5eWrG+HZpC0XA9UUu+nObpIxrdacTJEaXM7RvjEMLH1C/Y8csgx
	eKwv7hnhhO1skH0znQ7Jx1xJoALA3THnhGbAuGtxdpyHIjHdkt5rx1utuShSMiu41d/0OGuJQ==
X-Received: by 2002:a17:902:e5c7:b0:212:77d:3899 with SMTP id d9443c01a7336-21501857a44mr131418615ad.31.1732851418128;
        Thu, 28 Nov 2024 19:36:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzrV7pSTqnUiatDhfFuUom98ybzU9xQk1694zZYnbjzTYzEFY5r5nKnFxpnlMnstbPUvUz4Q==
X-Received: by 2002:a17:902:e5c7:b0:212:77d:3899 with SMTP id d9443c01a7336-21501857a44mr131418225ad.31.1732851417438;
        Thu, 28 Nov 2024 19:36:57 -0800 (PST)
Received: from evatuf.domocacupe ([187.34.86.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215219a8c44sm21048735ad.221.2024.11.28.19.36.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 19:36:57 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] systemd: drop deprecated rootlibdir, rootprefix and split-usr options
Date: Fri, 29 Nov 2024 00:36:53 -0300
Message-Id: <20241129033654.1275825-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KrOFdxlY-RnKKYTvsXbhCqWgnaaW3FnR
X-Proofpoint-ORIG-GUID: KrOFdxlY-RnKKYTvsXbhCqWgnaaW3FnR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1011 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 03:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207999

Support for split-usr and unmerged-usr were both removed as part of the
systemd 255 release, so remove the current deprecated rootlibdir,
rootprefix and split-usr options from the recipe.

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta/recipes-core/systemd/systemd_256.8.bb | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_256.8.bb b/meta/recipes-core/systemd/systemd_256.8.bb
index c17100a636a..26d2237ce3a 100644
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
+rootlibexecdir = "${nonarch_base_libdir}"
 
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
+    systemdlibdir = d.getVar("nonarch_base_libdir")
     do_split_packages(d, systemdlibdir, r'^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
 }
 PACKAGES_DYNAMIC += "^lib(udev|systemd|nss).*"
@@ -678,7 +673,7 @@ FILES:${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/ssh/ssh_config.d/20-systemd-ssh-proxy.conf \
                 ${sysconfdir}/ssh/sshd_config.d/20-systemd-userdb.conf \
                 ${rootlibexecdir}/systemd/* \
-                ${rootlibdir}/systemd/libsystemd-core* \
+                ${nonarch_base_libdir}/systemd/libsystemd-core* \
                 ${libdir}/pam.d \
                 ${nonarch_libdir}/pam.d \
                 ${systemd_unitdir}/* \
@@ -739,7 +734,7 @@ INSANE_SKIP:${PN}-dbg += "libdir"
 INSANE_SKIP:${PN}-doc += " libdir"
 INSANE_SKIP:libsystemd-shared += "libdir"
 
-FILES:libsystemd-shared = "${rootlibdir}/systemd/libsystemd-shared*.so"
+FILES:libsystemd-shared = "${nonarch_base_libdir}/systemd/libsystemd-shared*.so"
 
 RPROVIDES:udev = "hotplug"
 
-- 
2.34.1


