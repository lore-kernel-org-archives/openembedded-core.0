Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21471C7EE32
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:18:07 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.27574.1677860281482518539
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:18:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=B+bTT+pP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id q31-20020a17090a17a200b0023750b69614so2727084pja.5
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XR6VwhAk5Vbs96AUV5lHoBl7H0Mlna9Xob7QkBpD1cs=;
        b=B+bTT+pPsbkNUXmAyG/NQwuNBJHH2RdFNwBhNZurQhuECD+JFh9H0KsBrjtiAfB9Dr
         mKtnTfuwzDTu4RbFy0ztF9Vfz2RaHBAkxtFnnKSAsKvGyh6zI0rv2TCFLR5+9rMt0I2S
         WuEJan20+s1ypg3cnq7bZ3m9ANhN8VgG+IxTbj5VXXG8gauYc4Lf5Bmd/aQacCjdEo3f
         /Y7j5GaVQrbtKH/cZ47Z4Mb3OO/WNv13+/4rGJnr0jeJwIn9TkoOWgW5+IMH2Zjm+UP+
         dnJCi79CHDHCbupbWrE60mBwCYeoJ/xd9KfIWYsnNVm6JBUFtPeJo7zBalxTYPEG4aMv
         wuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XR6VwhAk5Vbs96AUV5lHoBl7H0Mlna9Xob7QkBpD1cs=;
        b=ejyHr37nZedwfTNgfxVfRbQBiRaQOJLwvUEgNt/Nzi8lcAviPZmDXokkUTJRs/YbHI
         DtmycGRNFaj0l5UjWENgjsFSQ1+zMGYID33OuHJ9YP/uIEHLDvanJQbpKYdmllNdiLwC
         U80Z6RqNfvHFmThZWb29KPfHwfhMZCde+0+v1f0/G8aJ7ercqEfIxNxWyIa/fCvk6LhM
         R6HoDceTYAOAvBMzAZSmgmF5tgwLQgvVrC73b8qiYE2mNMGDX0csTOQimROYvupQlgK3
         n6MinwWHrCroySKUp0lPnAa3LmENF+DiXS1n5bbJ2QjWxjBUj8KFu8iQiSYnLFMDBm8z
         L0dA==
X-Gm-Message-State: AO0yUKWRtRvNTmcvVahWhmFpat7BUb9ffykEfiYuOp2XcCXqc7GidK7Z
	0WTh2usElN+/NcONCkLT2Jd+GZagu0ZOCs2hb90=
X-Google-Smtp-Source: AK7set/jTilSF/3j6vQASHXG6VkOYGSX2QOTRw14iVVfteopD/R6hKJBtxyaK/wwJ7MoZNDYYo1bOw==
X-Received: by 2002:a17:90b:390c:b0:23a:333c:6bab with SMTP id ob12-20020a17090b390c00b0023a333c6babmr2274372pjb.23.1677860280493;
        Fri, 03 Mar 2023 08:18:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.17.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:18:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/29] curl: fix dependencies when building with ldap/ldaps
Date: Fri,  3 Mar 2023 06:17:14 -1000
Message-Id: <c0713cd50d013faa52d87a455f4faab4d05ba371.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178005

From: Federico Pellegrin <fede@evolware.org>

openldap is added as a dependency so the build will not fail,
as otherwise ldap headers are not found during configure phase

Note: due to upstream bug (now fixed) building LDAP/LDAPS support
with minimal configurations can sometimes not work, see details at:
https://github.com/curl/curl/pull/10445

Signed-off-by: Federico Pellegrin <fede@evolware.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a999f62f5692687a5557f7a50c7c768c50f3d7d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_7.82.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 13f157ead8..b08af29059 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -59,8 +59,8 @@ PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
 PACKAGECONFIG[imap] = "--enable-imap,--disable-imap,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
-PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,"
-PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,"
+PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap"
+PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,openldap"
 PACKAGECONFIG[libgsasl] = "--with-libgsasl,--without-libgsasl,libgsasl"
 PACKAGECONFIG[libidn] = "--with-libidn2,--without-libidn2,libidn2"
 PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
-- 
2.34.1


