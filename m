Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E5DC43217
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:01:59 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.11878.1651248116273944240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=owaALsfq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id e24so7503034pjt.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zlSAYchHOwNmfpM4swGhbtR3rrEmx8GnlGqH8kRNkSs=;
        b=owaALsfqG1q5IwTjWtXVqER7E2kkcyt3XzimyUlGpbUPYwz1Wsu5bL3jc6FNraQlmK
         d7HA+3xBBWBeDVJidkAo/rC0DlgcnfO3MPWvU9O4RSrKm4o/edSaxHo2pebmPtVoZzdO
         v03glv+KezhQaLJVEOAKFDTj2EHT+w9cuYhxxZmjzSUa6vt4L776N6fsz2wzIE8WkOQ1
         fFtpZwL/RjhnjBr7H1p74ct3xgVkVHRg+4GwzJAN381nH3nCuo1daq7QiSBT3bEE8odt
         q1u/mFdgMKCFzBphILKVrHjQBUl8E2PUELQDDk70WOMcJPmgx4NfG6/u5FniDSFqhW6c
         EFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zlSAYchHOwNmfpM4swGhbtR3rrEmx8GnlGqH8kRNkSs=;
        b=JeJtylpTuX/AI47ZQB4qEJMNgUisn8y09V/4iBZhvG8umtvAjgKQ2R+O38K+O+fR46
         w2gFBrnqcV/Bs3AlV2P8mnF4AYjIZP1hVxNoyQK6Y6l9NPH2EPPMkYGKkQh+uxypQ266
         npHhNFU7cu18wEjgkpbcNhUEkBjWEugLB1AkgGLU5oYQXfWoOamlSK90jrlq1qLZrZJt
         TVIDkQ0u1ytpWb89u9hUdoaWUPCBy3md+Fj8IcpihUJET4/mkxGNkjA+PVDrzvPzfP0r
         cbfrlT9APGE9r4AkX9sKUodptrhsrsYXhyf3Ya5h9P0R7AG/gNwmZNwsVY866soYWvam
         jAGw==
X-Gm-Message-State: AOAM531hoYOUPuUtKtqqBRSBgZ5K0Pbz94ApOdUkqUUoQuZRI831NJbL
	U8bZjIvsirksZ/M/KyyHuJVL2stsooucUBKj6mA=
X-Google-Smtp-Source: 
 ABdhPJwFWBevASPABy3XrAcdk4lZ05rLFidg/MC0zJ9LGaXsRHRLprphYLhr2Z4Ytb/Ki2L0BZSQHg==
X-Received: by 2002:a17:902:f54e:b0:15e:6c3f:5b5 with SMTP id
 h14-20020a170902f54e00b0015e6c3f05b5mr73027plf.99.1651248115129;
        Fri, 29 Apr 2022 09:01:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.01.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:01:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/34] gcompat: Fix build when usrmerge distro
 feature is enabled
Date: Fri, 29 Apr 2022 06:00:33 -1000
Message-Id: 
 <34a710cc8ebb18bb8443d635e06fefb7f6a003c2.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:01:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165033

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1154d5fe7e75bb46132165b13ed76ce95413b25)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/musl/gcompat_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/musl/gcompat_git.bb b/meta/recipes-core/musl/gcompat_git.bb
index 962bcd8c75..b051e43b6c 100644
--- a/meta/recipes-core/musl/gcompat_git.bb
+++ b/meta/recipes-core/musl/gcompat_git.bb
@@ -37,14 +37,14 @@ do_compile () {
 }
 
 do_install () {
-	oe_runmake install 'DESTDIR=${D}'
+	oe_runmake install 'DESTDIR=${D}${root_prefix}'
 	if [ "${SITEINFO_BITS}" = "64" ]; then
-		install -d ${D}/lib64
-		ln -rs ${D}${GLIBC_LDSO} ${D}/lib64/`basename ${GLIBC_LDSO}`
+		install -d ${D}${nonarch_base_libdir}${SITEINFO_BITS}
+		ln -rs ${D}${GLIBC_LDSO} ${D}${nonarch_base_libdir}${SITEINFO_BITS}/`basename ${GLIBC_LDSO}`
 	fi
 }
 
-FILES:${PN} += "/lib64"
+FILES:${PN} += "${nonarch_base_libdir}${SITEINFO_BITS}"
 
 INSANE_SKIP:${PN} = "libdir"
 
-- 
2.25.1


