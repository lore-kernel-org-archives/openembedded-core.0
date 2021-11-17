Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D72BC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 12:32:12 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.6279.1637152331736962533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cQuxdXAw;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id z10so10289343edc.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4M8QiOtxgjNf1PFMVtGBDEEVYjx0Ydlgejt040NWctk=;
        b=cQuxdXAwcRe/lZ0JZ7gdT9u6xRJd27SnvnX1rGRq8h4P7pvVSQ2Nbq9OSfJVj0cg+u
         D2NDTmvE6OGoKcLsKJn1jD1Z20vy6LF75fiYo2QSiLvyiJE2UOsleQaLpn3idA+0es4F
         tTs7ZWnTT+MzL5vXJPgktL/JAD9claqjxzBPB63Q/YxI6C01pRhWGD2wLjPBz+t7Gi+P
         afxDI0Nb1Hoz+VUnJChO66/eLHOGuVMmCmInTzT7yh5utLcR3wRAKNRT0MTvFqkVs7/J
         Bkt5ZCXporneowIHSv84AjiwzoBOZbOSgiykzuxDVNdjdT9BhaQG7wn+K3OOtjDy1zi/
         4wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4M8QiOtxgjNf1PFMVtGBDEEVYjx0Ydlgejt040NWctk=;
        b=UhL3gPD1AGw/M17ykziPrFyx/XXfot5uAy9Eq4ClYSCzL/eOLaoIfZFwKa8L+kZZBr
         LRdriLHd0PsKDaegVZwUuwvJklLpVvrGDZIBRA66vkAnBKzPsA+zP56O+WeabbCBgZMz
         o1ylt9ESYlrUw2UCaWJtEQNVfMPhcgCW//qvvDBrXob/SzwVRVV0TBLdZlLIpPHHAy0q
         dw8X5Ad7P6FwGlaNqm/EcvEi6xTo5QfuPvkisvE2iBM2UDoqWoVQ2GcKmr8VI8FgXj+Y
         DLGpQVhwST8sYLu113FEr3j4lNWGmlgu+XwhnLvNjupU9rnFok+WpseNfXMAoncwYxLn
         mkSQ==
X-Gm-Message-State: AOAM532MWS8x8r8ky49ig9zG9txQMhJ4diZd109X5KeBrXZJ2NzYBxR8
	ex2q62PrMV32oUSFeoOl7N0VYkeKoxY1/w==
X-Google-Smtp-Source: 
 ABdhPJyOx3GM29ONmaQ8BcxVI4Nq6thyT3GzHmTAz/Adf1RFxeWeWuBTKJHpaD3EEIId4huPQrhjQQ==
X-Received: by 2002:a17:906:9b8b:: with SMTP id
 dd11mr21177721ejc.446.1637152330051;
        Wed, 17 Nov 2021 04:32:10 -0800 (PST)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 r7sm11657870edd.5.2021.11.17.04.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 04:32:09 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Subject: [PATCH 2/8] systemd: skip postinst in nativesdk builds
Date: Wed, 17 Nov 2021 12:31:55 +0000
Message-Id: <20211117123201.111905-3-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117123201.111905-1-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 12:32:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158386

From: Luca Boccassi <luca.boccassi@microsoft.com>

They will fail, as there's nowhere to run them

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_249.5.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
index 2f019a4b1f..38a2f5d474 100644
--- a/meta/recipes-core/systemd/systemd_249.5.bb
+++ b/meta/recipes-core/systemd/systemd_249.5.bb
@@ -773,12 +773,18 @@ ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
 pkg_postinst:${PN}:libc-glibc () {
+	if [ "${PN}" = "nativesdk-systemd" ]; then
+		exit 0
+	fi
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
 		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
 		-i $D${sysconfdir}/nsswitch.conf
 }
 
 pkg_prerm:${PN}:libc-glibc () {
+	if [ "${PN}" = "nativesdk-systemd" ]; then
+		exit 0
+	fi
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
 		-e '/^hosts:/s/\s*myhostname//' \
 		-i $D${sysconfdir}/nsswitch.conf
@@ -786,6 +792,9 @@ pkg_prerm:${PN}:libc-glibc () {
 
 PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst:udev-hwdb () {
+	if [ "${PN}" = "nativesdk-systemd" ]; then
+		exit 0
+	fi
 	if test -n "$D"; then
 		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} rootlibexecdir="${rootlibexecdir}" PREFERRED_PROVIDER_udev="${PREFERRED_PROVIDER_udev}"
 	else
@@ -794,5 +803,8 @@ pkg_postinst:udev-hwdb () {
 }
 
 pkg_prerm:udev-hwdb () {
+	if [ "${PN}" = "nativesdk-systemd" ]; then
+		exit 0
+	fi
 	rm -f $D${sysconfdir}/udev/hwdb.bin
 }
-- 
2.30.2


