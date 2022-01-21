Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9D5C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 18:30:09 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.584.1642789808511497155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 10:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k+oE6tly;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id n8so9345822plc.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 10:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kauD4FOOR6/hbuX3l2OVlUeByGdEP776ETEiI7obxFY=;
        b=k+oE6tlymeqvgZxqzlx1oVUAzlLtSFVplzf++LfMmIBoMBAk1M6hW0kdnLcPTvk1XU
         /beLBkHFlg/JyJta+FVdSiZU1hx0Tg9GZWZegQsQM9YAqvgMMEmrMKIPSTpPlRwG5MEV
         wk06KfIz6Z7MJnqOK/05vrvZrfA6WTVZAHe/d8/UjsTb0fsUVvt0wo3v3kWSihFipRuf
         M6eOYf+etSfXjawdirCafK8K7BHWrwnuZXEHLWgMdOgqYGpWBpUZUrh6PoAUlXMxHIJA
         qxvuXRPj9EOh+kWr6Ns4DIpzfe4ZgbetWwCipSdlnT5kPABkO4VxMWw0vgYIpVFKJ+uN
         molg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kauD4FOOR6/hbuX3l2OVlUeByGdEP776ETEiI7obxFY=;
        b=B2AL/WEN2HlRN5gUZN1a09M/HbpxSZmWH1eiXx4Y1RN6BYv3NHMOmLQ6/GvEDkjdjJ
         TrHJmOyH0DkP606KXnSMe51BlkiB0V8QXDcaYVKMJXQIoUXrU2c7kqOedXjW1kN9f4Rf
         NiBQ+wW2AphmopVHtBujkz0W8m0OyC8gT/Jig5yOQXjDLZZbaktAv6E2Eqnb68hfkjNu
         Ps7/F8bYysvui3/To1ZBZg6vtvK8QeLpr1XGlj2nhouDwWhvWnY33IXrB/Uq6U1X6ea6
         d5pYKNKqSHrjb6npBibHn9y2yjCNFgA6gu62+ALcWwTjxs5nalJcmZeoYHKGccMiBpgj
         XblA==
X-Gm-Message-State: AOAM5338DZuu793PT3nb5+asTR58sYfkLdiGhgixcuASNSnw925usTNa
	DZoBezYhvWwPXjUbRA3hs48CkupxlhuwxA==
X-Google-Smtp-Source: 
 ABdhPJxMjolqxbSSlueCztV3MqDrBDh3ensi0SjWkiYhyRIXWC61HDQx/6HvvsN52XJHHFB3GX9AuA==
X-Received: by 2002:a17:902:b681:b0:14a:9cc:d9a3 with SMTP id
 c1-20020a170902b68100b0014a09ccd9a3mr5115007pls.121.1642789807676;
        Fri, 21 Jan 2022 10:30:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 g8sm7625267pfc.57.2022.01.21.10.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 10:30:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] image-prelink: Remove bbclass
Date: Fri, 21 Jan 2022 10:30:01 -0800
Message-Id: <20220121183002.3820051-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 18:30:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160848

Upcoming glibc 2.35 is dropping support for prelinker, this just ensures
that we do not carry non-working classes. [1]

[1] https://patchwork.sourceware.org/project/glibc/patch/20220121172951.285848-2-adhemerval.zanella@linaro.org/

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/image-prelink.bbclass | 76 ------------------------------
 1 file changed, 76 deletions(-)
 delete mode 100644 meta/classes/image-prelink.bbclass

diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
deleted file mode 100644
index 8158eeaf4ca..00000000000
--- a/meta/classes/image-prelink.bbclass
+++ /dev/null
@@ -1,76 +0,0 @@
-do_rootfs[depends] += "prelink-native:do_populate_sysroot"
-
-IMAGE_PREPROCESS_COMMAND:append:libc-glibc = " prelink_setup; prelink_image; "
-
-python prelink_setup () {
-    oe.utils.write_ld_so_conf(d)
-}
-
-inherit linuxloader
-
-prelink_image () {
-#	export PSEUDO_DEBUG=4
-#	/bin/env | /bin/grep PSEUDO
-#	echo "LD_LIBRARY_PATH=$LD_LIBRARY_PATH"
-#	echo "LD_PRELOAD=$LD_PRELOAD"
-
-	pre_prelink_size=`du -ks ${IMAGE_ROOTFS} | awk '{size = $1 ; print size }'`
-	echo "Size before prelinking $pre_prelink_size."
-
-	# The filesystem may not contain sysconfdir so establish what is present
-	# to enable cleanup after temporary creation of sysconfdir if needed
-	presentdir="${IMAGE_ROOTFS}${sysconfdir}"
-	while [ "${IMAGE_ROOTFS}" != "${presentdir}" ] ; do
-		[ ! -d "${presentdir}" ] || break
-		presentdir=`dirname "${presentdir}"`
-	done
-
-	mkdir -p "${IMAGE_ROOTFS}${sysconfdir}"
-
-	# We need a prelink conf on the filesystem, add one if it's missing
-	if [ ! -e ${IMAGE_ROOTFS}${sysconfdir}/prelink.conf ]; then
-		cp ${STAGING_ETCDIR_NATIVE}/prelink.conf \
-			${IMAGE_ROOTFS}${sysconfdir}/prelink.conf
-		dummy_prelink_conf=true;
-	else
-		dummy_prelink_conf=false;
-	fi
-
-	# We need a ld.so.conf with pathnames in,prelink conf on the filesystem, add one if it's missing
-	ldsoconf=${IMAGE_ROOTFS}${sysconfdir}/ld.so.conf
-	if [ -e $ldsoconf ]; then
-		cp $ldsoconf $ldsoconf.prelink
-	fi
-	cat ${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf >> $ldsoconf
-
-	dynamic_loader=${@get_linuxloader(d)}
-
-	# prelink!
-	if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
-		export PRELINK_TIMESTAMP=`git log -1 --pretty=%ct `
-	else
-		export PRELINK_TIMESTAMP=$REPRODUCIBLE_TIMESTAMP_ROOTFS
-	fi
-	${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -am -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
-
-	# Remove the prelink.conf if we had to add it.
-	if [ "$dummy_prelink_conf" = "true" ]; then
-		rm -f ${IMAGE_ROOTFS}${sysconfdir}/prelink.conf
-	fi
-
-	if [ -e $ldsoconf.prelink ]; then
-		mv $ldsoconf.prelink $ldsoconf
-	else
-		rm $ldsoconf
-	fi
-
-	# Remove any directories temporarily created for sysconfdir
-	cleanupdir="${IMAGE_ROOTFS}${sysconfdir}"
-	while [ "${presentdir}" != "${cleanupdir}" ] ; do
-		rmdir "${cleanupdir}"
-		cleanupdir=`dirname ${cleanupdir}`
-	done
-
-	pre_prelink_size=`du -ks ${IMAGE_ROOTFS} | awk '{size = $1 ; print size }'`
-	echo "Size after prelinking $pre_prelink_size."
-}
-- 
2.34.1


