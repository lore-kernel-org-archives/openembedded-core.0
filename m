Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A524EC43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:51:02 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.28057.1658155854945849641
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NH5D8oMK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id a15so12032051pjs.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AAJ2qhgqaL07IQKxnjsxkB2PgpkR0Y7k5SVkYAQTIzQ=;
        b=NH5D8oMK5zq/MAyuuX0sgUM1qlkahw9FBRY4aUQWLPcSOrZrtUDU+MlWG/RH0s66xA
         gGITNjKZO8+QRig2WYTlq2smBCN9ecvNs0G1eXPhIebgB4itb5CNG1mNVkVTzZ/Bkycv
         TTzqbsa9rQ9/RpgWWfPqODuZVdubry9QLEm1RpsgGZXmlscqgR3s1jC1fSRHuKenfDkL
         jYVWmwQxZQQ1vHLl8Rr0hWIHCQFMD56qLRrNh0bSEuY7SXBDcXzGKIuArxoTt2L4d/yE
         Oi1Io7FP+K81bBG/+NM+o7TP4Dk3zMM20ZV3JsnZc7bKl3DPpwZhGtedKAKKKg52VLIG
         4t9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AAJ2qhgqaL07IQKxnjsxkB2PgpkR0Y7k5SVkYAQTIzQ=;
        b=hhGiewKwbooTY05VLfrPd7fOVEPvrnSQuZhFTzOiGZAQwC4/nw6V0xBcFw8wPzyhkw
         ldwEewM7YPrQIq7t33AmWJBKwErYSCOxeNzcNk85YH01U9QzG6T3xzaGTT7ATK+GfkgO
         cxkY7/SqM+2nWz81mhV3OQ7BrjU1xaqrK/N5P1yw2CRCscV1Alq9jjiDlG4VY8TbuHJz
         5gPpevMVRIB8jmplBypwGmWhFz4NMgFm8ZaNVS/evQsA59HZID03EJm+AzIn7NlwuVzF
         +C8G8OCqcqAtyUZHTxX2MFiphNwqctL/i7CGFK1E13mrADiCF1IzznUfL/mo1F49Sy98
         Lz2Q==
X-Gm-Message-State: AJIora9msz6vwLmNoeWOEFWDO0hXArJ7RPQsWILKVw9Z2eB/UN0Pl3Zy
	sbD95e0/IPRtnjbFLycbrQUj4RjwAzEvgmdq
X-Google-Smtp-Source: 
 AGRyM1t8IinxAhRSmF+6y93pIK8gbsXW9n0BOzvMQrkNVsi8tRwy5Vs525ygCa7eS6sKqkV+BPeLeQ==
X-Received: by 2002:a17:90b:8d:b0:1ef:74c8:1541 with SMTP id
 bb13-20020a17090b008d00b001ef74c81541mr32849042pjb.103.1658155853839;
        Mon, 18 Jul 2022 07:50:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.50.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:50:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 30/35] gcc-runtime: Fix build when using gold
Date: Mon, 18 Jul 2022 04:48:55 -1000
Message-Id: 
 <f842dbc478cb007b5f3e2f016959e2b597a4d0be.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:51:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168230

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If gold is enabled as the default linker, it errors trying to link
to our dummy library empty file and this turns off things which should
be present in libstdc++.

For example, _GLIBCXX_HAVE_S_ISREG isn't defined and HAVE_S_ISREG in
libstdc++-v3/config.h isn't set properly.

Instead of just creating an empty file, create an empty elf binary
instead which addresses the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2070bcd10aa3a05c96c8501c6a8c1e129fb1d440)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index e9f2cf16e8..dc903c2b88 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -68,7 +68,8 @@ do_configure () {
 	# libstdc++ isn't built yet so CXX would error not able to find it which breaks stdc++'s configure
 	# tests. Create a dummy empty lib for the purposes of configure.
 	mkdir -p ${WORKDIR}/dummylib
-	touch ${WORKDIR}/dummylib/libstdc++.so
+	touch ${WORKDIR}/dummylib/dummylib.c
+	${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o ${WORKDIR}/dummylib/libstdc++.so
 	for d in libgcc ${RUNTIMETARGET}; do
 		echo "Configuring $d"
 		rm -rf ${B}/${TARGET_SYS}/$d/
-- 
2.25.1


