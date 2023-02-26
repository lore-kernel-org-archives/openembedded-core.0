Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C374C7EE31
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:02:56 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.69603.1677430974558418261
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=QrvgX+zg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so3259269pjg.4
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mz68EQ68oaxziinxgENWcbOJGHNBLHCGOd3d46qRCSo=;
        b=QrvgX+zgZ6Ge+rJFjnynvwjehDQiyZagJjjq4LVoCfXK7FzUetB9bJg7xbdCqTmvC1
         X1yLtHUNOVxl1QB+ujl6JLUUwZHc3Tqd1E0dlBg+dExtuNrvPm1in4vEFt0sqn/0cb/i
         UspFlNi4X2kA8qXHm5Or3yWPLPX7XbWavTsuvOThHbkoBLJxS6HsP8sUhh3JyqHq3ZSv
         3bIA1V78yR85trNFiuD30ZDPs2Du6cijBG7/uQlIagiBbuPXw3qaBOJbmXXyyMBKlnio
         D7qz1hNx50qqB9bQZXs2lnS75YX9dLxJiVHmx6t0ENuC9/UyVmD7XHDmxSFDelbjrJeN
         vf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mz68EQ68oaxziinxgENWcbOJGHNBLHCGOd3d46qRCSo=;
        b=HpDrD6+D3CcyaAmbcSdzlpTykC7OMyW99u/WVxSM+PkU9tVco2JYR2rzL9yWPG+qnn
         UvBwN55YeKg4F6FGfdCDmSlT1DuR8fmWv2ZxKj3+R3ncGPCM6BGBzBxkgghGmTAfjgjl
         8giC6kYqi6abS67x89c0I+XZKqsqc29guNTMcH3AtZWkQWHgp/fBcfrGhv10iGwlMXey
         m2/963pRtHRGyB5h/O2s5s4Oc7HntPuWn7qDADlO71RaP2OvatgD5uFW+pk3IXzxHD3N
         9FDPkZRd4oLNqpXve0z1aGunwa1S577EbjDctom3GKa9txOMYFLc3hDd4Z6TfPOag54m
         9jdg==
X-Gm-Message-State: AO0yUKWLUxvnZOPK8+S30auQOLnUp1wXOLb9t8BB93eQMyv0Yij7+eFl
	xnVCrD56OQW1rB69aH+fquqiozpQ9X/OvErN0mg=
X-Google-Smtp-Source: AK7set8OvBH4RhJLsdQPlAJCakBldYI6TWG1SwMcp8uU93dSCYOjwlrodjsVV1a9AjJymUjL1FOX+g==
X-Received: by 2002:a17:902:f283:b0:19c:94ad:cbe8 with SMTP id k3-20020a170902f28300b0019c94adcbe8mr15826908plc.36.1677430973620;
        Sun, 26 Feb 2023 09:02:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.02.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:02:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 13/28] curl: fix dependencies when building with ldap/ldaps
Date: Sun, 26 Feb 2023 07:02:09 -1000
Message-Id: <6a4f55bb305e3cb2fb3f60471ff0adaef5adbc9f.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177751

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
 meta/recipes-support/curl/curl_7.85.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.85.0.bb b/meta/recipes-support/curl/curl_7.85.0.bb
index 846cdacb41..4e05434a12 100644
--- a/meta/recipes-support/curl/curl_7.85.0.bb
+++ b/meta/recipes-support/curl/curl_7.85.0.bb
@@ -46,8 +46,8 @@ PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
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


