Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF97C433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 12:57:25 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web08.15572.1658062626091943937
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JMZ7UCQc;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id z25so15220722lfr.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uPCJTbQYQvMsQKS0asAawhrOcbeWcdbys14ctf2RNDg=;
        b=JMZ7UCQc0m6N4ZcxcIqtqczNxV3hkQhAAZUQoeF03vAHJh00ZxuATu2Nyy9jbIWbwX
         AXSUSlH6Ki8mj2yaZWJlN5ofjcRH8qtk3cuSlO7r/TcgoUqfdijJ/AiRvdLIAB+TCZOE
         k9+0VPYfCaeNUnvmeg0UH6CXrYQpPHhk/a85ApUjX3iauum63mLUerDp4BVdENoZ/OsQ
         SvRDfqOwFsxhLtVq+yF02m7DOOPnrWzDHzI5TPCR6lmY1+i9XTHYP38/zffxPYXJRyMg
         Wanh8Xrq10zwaUcBKIga3TrTaBsPl1k6xLJrDa338Lb+USNYdS1IE1qz6bkoGF2yewhS
         eJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uPCJTbQYQvMsQKS0asAawhrOcbeWcdbys14ctf2RNDg=;
        b=M8C4KY+tSss2YuVj+JsxobM2r2SmtxwnHnir+ltKlfUfmhflGZfZIazl5lWJmDFp5Z
         yR3HZg0kadwhpm0USzaABXuio1WNHIAAKvOQvL58wOE6hkyew/eu5JNgKY6XWCxsyHcA
         6+YGakCrf15M6Pl37tvx1ovBN9mCaHAlGVGDxRSbZaPphp19rIhCI16YE6783Y/9b8Ls
         nsVxrxvmGAjJlcmFcM5PybL+FzXsoihU+QIzvvAXFjjxbskcIm+SPMVRjsUeevHm7Zs4
         Hqpe7nreDXeT2c2tnrDTq2fCRLwRPkBnRuGWtP4EgH+/N54R8q89pU1Hw7G9w8TtlPmL
         5dVA==
X-Gm-Message-State: AJIora+WhxDG6baDB05dlOtjYys2fyn2u+rAYPZT0MZ4hesOzJCXGTHU
	yKkaVIz6jvw2U9B4P62xOYYBmpdpE4M=
X-Google-Smtp-Source: 
 AGRyM1vojew51OGJQsxuV/j7mjaBUSzKQS9KtjProtH1jli3DKBqqZU9UIWNNoCiQ0JFiZ2FgG5fmQ==
X-Received: by 2002:a05:6512:39cc:b0:48a:2c31:8feb with SMTP id
 k12-20020a05651239cc00b0048a2c318febmr4247364lfu.660.1658062635664;
        Sun, 17 Jul 2022 05:57:15 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 v11-20020a05651203ab00b00483e5f01698sm2023056lfp.65.2022.07.17.05.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:57:15 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Ming Liu <liu.ming50@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [kirkstone] [PATCH 8/9] udev-extraconf: fix some systemd
 automount issues
Date: Sun, 17 Jul 2022 14:56:47 +0200
Message-Id: <20220717125648.2942046-9-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220717125648.2942046-1-liu.ming50@gmail.com>
References: <20220717125648.2942046-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Jul 2022 12:57:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168156

From: Ming Liu <liu.ming50@gmail.com>

The '.include' syntax has been dropped from latest systemd releases,
we need drop the systemd-udevd.service here, introduce a postinst
function to add "MountFlags=shared" to systemd-udevd.service.

Also lsblk binary is being called in mount.sh automount_systemd
function, add it to RDEPENDS.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 356520d60b9429c6f62124821e42468ff2b7b1d6)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../udev/udev-extraconf/systemd-udevd.service |  3 ---
 meta/recipes-core/udev/udev-extraconf_1.1.bb  | 20 +++++++++++--------
 2 files changed, 12 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-core/udev/udev-extraconf/systemd-udevd.service

diff --git a/meta/recipes-core/udev/udev-extraconf/systemd-udevd.service b/meta/recipes-core/udev/udev-extraconf/systemd-udevd.service
deleted file mode 100644
index a9b86eb6e4..0000000000
--- a/meta/recipes-core/udev/udev-extraconf/systemd-udevd.service
+++ /dev/null
@@ -1,3 +0,0 @@
-.include @systemd_unitdir@/system/systemd-udevd.service
-[Service]
-MountFlags=shared
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index ef6019259e..30f1fe76d0 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -11,7 +11,6 @@ SRC_URI = " \
        file://autonet.rules \
        file://network.sh \
        file://localextra.rules \
-       ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://systemd-udevd.service', '', d)} \
 "
 
 S = "${WORKDIR}"
@@ -36,16 +35,21 @@ do_install() {
     sed -i 's|@MOUNT_BASE@|${MOUNT_BASE}|g' ${D}${sysconfdir}/udev/scripts/mount.sh
 
     install -m 0755 ${WORKDIR}/network.sh ${D}${sysconfdir}/udev/scripts
+}
+
+pkg_postinst:${PN} () {
+	if [ -e $D${systemd_unitdir}/system/systemd-udevd.service ]; then
+		sed -i "/\[Service\]/aMountFlags=shared" $D${systemd_unitdir}/system/systemd-udevd.service
+	fi
+}
 
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${sysconfdir}/systemd/system
-        install ${WORKDIR}/systemd-udevd.service ${D}${sysconfdir}/systemd/system/systemd-udevd.service
-        sed -i 's|@systemd_unitdir@|${systemd_unitdir}|g' ${D}${sysconfdir}/systemd/system/systemd-udevd.service
-    fi
+pkg_postrm:${PN} () {
+	if [ -e $D${systemd_unitdir}/system/systemd-udevd.service ]; then
+		sed -i "/MountFlags=shared/d" $D${systemd_unitdir}/system/systemd-udevd.service
+	fi
 }
 
-FILES:${PN} = "${sysconfdir}/udev ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${sysconfdir}/systemd/system/systemd-udevd.service', '', d)}"
-RDEPENDS:${PN} = "udev util-linux-blkid"
+RDEPENDS:${PN} = "udev util-linux-blkid ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'util-linux-lsblk', '', d)}"
 CONFFILES:${PN} = "${sysconfdir}/udev/mount.ignorelist"
 
 # to replace udev-extra-rules from meta-oe
-- 
2.25.1


