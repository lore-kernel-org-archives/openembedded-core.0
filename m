Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C8AC44524
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 12:54:19 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12720.1784292857783790009
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 05:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AzBKlSLt;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69e7a5b61e4so337243a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784292856; x=1784897656; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4FeOA/Gew9yHJuDw/kRLjT1e/hFd3g8p4o/wxH2RS6c=;
        b=AzBKlSLtc3utK/3rWuZZLbO8A0s9Ctxwyep30lJln1kSU/H1u4skSawGeADRRRQbb9
         QCEnxIrOWeeq7yT1FqFqmuxM36dPkka2WBF3V/4WENAa4JNvlRFIeuVEV9EZ6w+U1t2C
         rP/WzBkcutXpk9d+L9poKefLFco/etJnAarRYRmfYWxP7XsyBETCXigHerQ3iSR9NVT2
         wKQ43wAEVob/XlBkvNgM85wvyv48goYD10BuH/7NZQToSrGDYwvUcPJQbWd6DrUwj4KY
         msPbU8G/yAd/yQ0QvndIgpPAJ1CeXl9VOdvHDBVwah9/zszMJZLD6NCLC+Gah0gHtF3O
         P4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784292856; x=1784897656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4FeOA/Gew9yHJuDw/kRLjT1e/hFd3g8p4o/wxH2RS6c=;
        b=cyKYqcJTdwwcqLUznk3ykp9OtxMmwZEPMA+Pm/wPmRe7PHo0vV0c4KkmSUh9rWHxhY
         M6+yheb/7rZHFF0hSA42QaYfZ6kWef6JAqmkSdQUZSv0Q8A9QCDWXen2nvdvIcYFZsa3
         LVUrMQnSHRmhrBaAWPnsVc8NsoyebfcHrQeiNyvKfQrB2wTWxJVOv8N8CC8UHsP28Rh4
         //Rxn8JY2SNL2iTwb90GFdYuIVuEwtEF9XAkjClTVIv/7x3EZJiUbLb/uNRf/ys0F5OZ
         GO4CZm/DdDU84GzXXqMnWOBjFgiSBlY/cgdD9jj2yB7UJgKv+zbF5RJXLc8G4C9CbJL0
         Znsg==
X-Gm-Message-State: AOJu0Yz9XuyNYPattY6dMobYxN3g6qo+JlQICi5FF6XCji02kTzc81+K
	wLS+xx2zeH3xDaInzNbNGbGLMk3FjBaYgXxa3jJ/T8stsA8FBQ4qeB0x4vG0Mg==
X-Gm-Gg: AfdE7cl+VnxZaGQJrh5a3gCKKNImFbpbvEgpbnD04sBdMb82+CF9EoeNlH5oMJaGQVs
	qnuGF6TxXtCCPN+X8Fq9J9NkUkBedhYX9XDl9tmxenlmpOyXty1Z5tWN8QQAGjW8yHx7ii0I650
	ejkOT8M9DSSWYf3GoaW5QRq7zuwKp9xE/D/G6JIP8sTK1v572EMAxOSmE0yebE5q8mkyscdEf1M
	b3nwBZqOc8jtYYAneZd+bHak4Ic2iowHxpLo6Ges+eb7LsYYXmiNYA7NKPFSFlCgSCtobtrs6pv
	ZaLN20E9mufNykrmcTxDm+DVhwmR8OUx6odDLf6ydL84IcC6DCb9io1VxE7fplZCz0p0SJZHagK
	3TrrD3imcGLC7yRDn/YU0ZNfO+VPQ8JPBlXhTW5eZeDzsLyJF48fhEGKJvjpbOSpxNLX0iVXyr9
	zNr15HX5G7P43JLwB5ZZzKyZn2x/+VI/qSoFg0y7ZDWw==
X-Received: by 2002:a05:6402:280d:b0:69a:9355:d1c1 with SMTP id 4fb4d7f45d1cf-69e6531d056mr974255a12.41.1784292855819;
        Fri, 17 Jul 2026 05:54:15 -0700 (PDT)
Received: from [127.0.1.1] (185-164-140-173.cgnat.inetia.pl. [185.164.140.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbbf4dsm618199a12.16.2026.07.17.05.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 05:54:15 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Fri, 17 Jul 2026 14:53:56 +0200
Subject: [PATCH 4/4] quota: Move dbus, libnl dependencies to PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-rpcbind-quota-dep-v1-4-55bc86f09e41@gmail.com>
References: <20260717-rpcbind-quota-dep-v1-0-55bc86f09e41@gmail.com>
In-Reply-To: <20260717-rpcbind-quota-dep-v1-0-55bc86f09e41@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 12:54:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241175

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-extended/quota/quota_4.11.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/quota/quota_4.11.bb b/meta/recipes-extended/quota/quota_4.11.bb
index 8f9464f130..c02ab5ef14 100644
--- a/meta/recipes-extended/quota/quota_4.11.bb
+++ b/meta/recipes-extended/quota/quota_4.11.bb
@@ -15,16 +15,14 @@ CVE_PRODUCT = "linux_diskquota"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/linuxquota/files/quota-tools/"
 UPSTREAM_CHECK_REGEX = "/quota-tools/(?P<pver>(\d+[\.\-_]*)+)/"
 
-DEPENDS = "libnl dbus"
-
 inherit autotools-brokensep gettext pkgconfig
 
 CFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'rpc', '-I${STAGING_INCDIR}/tirpc', '', d)}"
 LDFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'rpc', '-ltirpc', '', d)}"
 ASNEEDED = ""
 
-PACKAGECONFIG ??= "rpc bsd ext2direct"
-PACKAGECONFIG:libc-musl = "rpc ext2direct"
+PACKAGECONFIG ??= "rpc bsd ext2direct netlink"
+PACKAGECONFIG:libc-musl = "rpc ext2direct netlink"
 
 # rpcgen execs its preprocessor as a single program; OE's multi-word $CPP fails,
 # so point it at the cross cpp instead.
@@ -34,3 +32,4 @@ PACKAGECONFIG[rpc] = "--enable-rpc,--disable-rpc,libtirpc rpcsvc-proto-native"
 PACKAGECONFIG[bsd] = "--enable-bsd_behaviour=yes,--enable-bsd_behaviour=no,"
 PACKAGECONFIG[ldapmail] = "--enable-ldapmail,--disable-ldapmail,openldap"
 PACKAGECONFIG[ext2direct] = "--enable-ext2direct,--disable-ext2direct,e2fsprogs"
+PACKAGECONFIG[netlink] = "--enable-netlink,--disable-netlink,dbus libnl"

-- 
2.43.0


