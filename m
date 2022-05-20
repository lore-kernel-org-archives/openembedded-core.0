Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAD5C433FE
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 19:47:39 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.1943.1653076051465882817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 12:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b0n58ML6;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id i40so12031113eda.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 12:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=51Jj94NqtrZBhyefsv6evOl+jWjL9MQaD9swyVGc4JU=;
        b=b0n58ML6NPi++2zIoXKOxIrjHtucAmskXU/H8qfIirja2MNOVCp3X+7CE0fk8kBjt6
         zF1nMSfYELvMCZv3i5R56hk2/kCzOp/iQAkowEAjJtnApWJSb3nHJuVG4ZiBmZ1lCn57
         XlzfKPk+UUaJ2QvX6uswV8rN6dTtQLzD60PvmxR4I35ebR5O2AUxLg/EHVwfRilEywBB
         vhGsSWYeE6+LyF8egtVmlA7N6I5fDNOJWS8LV6w5HpUAMj0I/A3+A772EenpSdEv6ATS
         4Vil5unfShr7H71z2jJv4AB8FnADB2/YNp0b8ew32lvxWP/Uv6xZluUzytVgzexUWJSj
         O42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=51Jj94NqtrZBhyefsv6evOl+jWjL9MQaD9swyVGc4JU=;
        b=QlfG2KLc0J8+tl3wkHzXvB3YAI3AfHLdHTy2MaRTatfzXxTZ8NPORniwfnp8/+dYK5
         8czLQheq/2Hla3gHpegdUPF47M6/pYVnMjPCe5IZr5Q+/mfXIocq+DNDN33yiAILJd2S
         Rul+36KryEFDTpZDDsM39IyN7CWnD47sGuQBp2YeqoEj/Kqcpvy2j5pdkvlfIJGgOPpQ
         o/4R5jzhTpxbU16pPosYh3hO73WUj2QryFvsBuaS4KPwJwt+mle366fypUreJD3s/YAT
         NuJ6N7XlQHUJ7sWQw7//cMlN1Du/j7Tmd6tMR7Knf58bal3gJbgyRUQZnOPLhu9kzxRR
         QN5g==
X-Gm-Message-State: AOAM532jY9wh8+nkQsWHi/lvjzyIh8UFSBInUY/tEPxrCX3tS7i1BEWy
	EbDd8yC0BMnTjTMk1x9OzmVeldwuhGw=
X-Google-Smtp-Source: 
 ABdhPJwgglievgdCYSNvU/2gsblolguKTrhLwYA5FCdBINB7u/IAmS5PaFlI3iDq/CpsC1L7+uNGbg==
X-Received: by 2002:aa7:dd48:0:b0:42a:f46f:6b0d with SMTP id
 o8-20020aa7dd48000000b0042af46f6b0dmr12134854edw.406.1653076049905;
        Fri, 20 May 2022 12:47:29 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 n24-20020a056402515800b0042ad0358c8bsm4732528edd.38.2022.05.20.12.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 12:47:29 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alex.kiernan@zuma.ai>
Subject: [OE-Core][PATCH v2 3/3] eudev: Use PACKAGE_BEFORE_PN/${PN},
 clean up spaces
Date: Fri, 20 May 2022 20:47:19 +0100
Message-Id: <20220520194719.4727-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520194719.4727-1-alex.kiernan@gmail.com>
References: <20220520194719.4727-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 19:47:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165949

Use PACKAGE_BEFORE_PN for packages which need to capture files early,
switch to idiomatic ${PN} for additional packages. Swap spaces for tabs
in shell functions.

Signed-off-by: Alex Kiernan <alex.kiernan@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-core/udev/eudev_3.2.11.bb | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
index 1b6705ba3058..2d4c44b1dd7f 100644
--- a/meta/recipes-core/udev/eudev_3.2.11.bb
+++ b/meta/recipes-core/udev/eudev_3.2.11.bb
@@ -62,27 +62,26 @@ do_install:prepend:class-target () {
 INITSCRIPT_NAME = "udev"
 INITSCRIPT_PARAMS = "start 04 S ."
 
-PACKAGES =+ "libudev"
-PACKAGES =+ "eudev-hwdb"
+PACKAGE_BEFORE_PN = "libudev ${PN}-hwdb"
 
 FILES:${PN} += "${nonarch_base_libdir}/udev"
 FILES:libudev = "${base_libdir}/libudev.so.*"
-FILES:eudev-hwdb = "${sysconfdir}/udev/hwdb.d"
+FILES:${PN}-hwdb = "${sysconfdir}/udev/hwdb.d"
 
-RDEPENDS:eudev-hwdb += "eudev"
+RDEPENDS:${PN}-hwdb += "${PN}"
 
 RPROVIDES:${PN} = "hotplug udev"
-RPROVIDES:eudev-hwdb += "udev-hwdb"
+RPROVIDES:${PN}-hwdb += "udev-hwdb"
 
 PACKAGE_WRITE_DEPS += "qemu-native"
-pkg_postinst:eudev-hwdb () {
-    if test -n "$D"; then
-        $INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX}
-    else
-        udevadm hwdb --update
-    fi
+pkg_postinst:${PN}-hwdb () {
+	if test -n "$D"; then
+		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX}
+	else
+		udevadm hwdb --update
+	fi
 }
 
-pkg_prerm:eudev-hwdb () {
-        rm -f $D${sysconfdir}/udev/hwdb.bin
+pkg_prerm:${PN}-hwdb () {
+	rm -f $D${sysconfdir}/udev/hwdb.bin
 }
-- 
2.35.1


