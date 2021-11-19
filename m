Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA8CC433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 11:34:45 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.7856.1637321683905691664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:34:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a+QRz7mX;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id g14so41456423edb.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=45Bozbk+qUtzbgvWPELFviD/2QOjtcjG0l2wr3tz5ro=;
        b=a+QRz7mXOQFpiRKGA3k1zZQSnXMf1fUHFoRizFSHiwcZ/8wZxBK89INgAlGbdXN9Q0
         QwMayR3qF0OyAFcywCztJ1aPoPc3KnWtM0x0WUQwQgcYyt3XgwoJk2mZBlycfTA6h6nR
         d+N4qvhSmJrhBFN86/T9nINYJRppzv/yafAROQmoPn7zxXSWgvW5nQVSu8aJKFXEdVhy
         YFCrFT1TLjKC5Qyr/oJCU+6r/DuV7Y0xxiI6tVixJRr7UbB+2EIozqEfaNqmFKMB7ofv
         HEcnjBaSrSWawotjwCJtr3Ihka/uszkCAs99Ykc+qW524CU/Vpz4v5mNCVmLrWU1gFzI
         AiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=45Bozbk+qUtzbgvWPELFviD/2QOjtcjG0l2wr3tz5ro=;
        b=0tcfEzBBhxn1CxVhV2gW3sXEQ8NFY07+C0pWftd73Z6QvGLJWHDeM6GAo2hleYu3ua
         bK0Q1HWHwGNGPujGnHnYoK2N3fq7FV31D/+5+2rQDKp+vOgoh4DCLtdlLZqSTQe79QAm
         N1JwdBWmV0L4FK0EKnahtSCdxIfpXsgUkZlyHBTAQJAh0gvTEyOyO2wetUHm9RYyPuPn
         dADZ2WzSt4A3qC84E0B8MtYMaEhJYrAmpjDqCpJQBJapHMragbmt9xdOx9SzyirwrIu9
         PfWb+LNBSIlzpN9Z1lGka7dBerwaA5I2lWoUwAQjAJLrVpF2S1aNGpACbGXK0MoKs7UU
         bgcw==
X-Gm-Message-State: AOAM531G8mQUiohR8rUYyYwNEyJl23twAJ8XOiPhGIZwDO2RcwBSxM83
	f0ujhs2FxDm6NkP2LW+a7LVD/48OjzWZYQ==
X-Google-Smtp-Source: 
 ABdhPJz2pEiYjWVcCJ2nPVxA7hHwpyf8MrRPAPw8fis+olh7URwsTYIvnB3pr3lPmH1SKanRUmkFcg==
X-Received: by 2002:a17:906:5811:: with SMTP id
 m17mr6792364ejq.289.1637321682200;
        Fri, 19 Nov 2021 03:34:42 -0800 (PST)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 hv17sm1164063ejc.66.2021.11.19.03.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 03:34:41 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Subject: [PATCH v2 2/7] systemd: skip postinst in nativesdk builds
Date: Fri, 19 Nov 2021 11:34:24 +0000
Message-Id: <20211119113429.502652-2-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211119113429.502652-1-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
 <20211119113429.502652-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 11:34:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158508

From: Luca Boccassi <luca.boccassi@microsoft.com>

They will fail, as there's nowhere to run them

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: use "${PN}" = "${BPN}" as suggested by reviewers

 meta/recipes-core/systemd/systemd_249.5.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
index 2df2de0cf3..ec9c350297 100644
--- a/meta/recipes-core/systemd/systemd_249.5.bb
+++ b/meta/recipes-core/systemd/systemd_249.5.bb
@@ -773,12 +773,18 @@ ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
 pkg_postinst:${PN}:libc-glibc () {
+	if [ "${PN}" != "${BPN}" ]; then
+		exit 0
+	fi
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
 		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
 		-i $D${sysconfdir}/nsswitch.conf
 }
 
 pkg_prerm:${PN}:libc-glibc () {
+	if [ "${PN}" != "${BPN}" ]; then
+		exit 0
+	fi
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
 		-e '/^hosts:/s/\s*myhostname//' \
 		-i $D${sysconfdir}/nsswitch.conf
@@ -786,6 +792,9 @@ pkg_prerm:${PN}:libc-glibc () {
 
 PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst:udev-hwdb () {
+	if [ "${PN}" != "${BPN}" ]; then
+		exit 0
+	fi
 	if test -n "$D"; then
 		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} rootlibexecdir="${rootlibexecdir}" PREFERRED_PROVIDER_udev="${PREFERRED_PROVIDER_udev}"
 	else
@@ -794,5 +803,8 @@ pkg_postinst:udev-hwdb () {
 }
 
 pkg_prerm:udev-hwdb () {
+	if [ "${PN}" != "${BPN}" ]; then
+		exit 0
+	fi
 	rm -f $D${sysconfdir}/udev/hwdb.bin
 }
-- 
2.30.2


