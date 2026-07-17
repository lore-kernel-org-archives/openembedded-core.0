Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BA6C4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 12:54:19 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12842.1784292856761912499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 05:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IrgYDJmB;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so14647660a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784292855; x=1784897655; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKomplvgI6oLM97udThXRZWLNw7XsoZZQqEFTMIbv0Y=;
        b=IrgYDJmB1eyYMtfLZ8PLUn1bSOTjlv+pHPW/aZPsCdxZdNsd9D31M+ig6FgGesDmkC
         aO9w8S/8D0IJSLIqaNKsN2HgIXI8J11cM59uPSrV4BQiWd6DG7pLktQSMfvEdWZJoLUc
         sQLfZJvVmsTrliGn3pC5QhxCbxesD+h5CRttM8/f6J1P7myDCqixIKZLnRRqu8WhyVJ9
         rY77xuyecfXl7xqYw8CH8olNN2NNQsovn1pYUOwBf6ox9jC72TPt6CWAVTM3ZVpxIP5k
         oYwIw+xOm4uSEZuahiPT5BPyXMEMLaxn5dewDqvmNvQv+b2XhvicIH87VJOVrhN26XXQ
         e13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784292855; x=1784897655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vKomplvgI6oLM97udThXRZWLNw7XsoZZQqEFTMIbv0Y=;
        b=P4lrP3b2De4jD7PHu/tHA2zj1PUwL3KFHQL7nQvc5aSR/4fT5FPJTuhN+seqciPRXb
         ISXanaLkaV1riwg0LYqDnNo202D2H4OutO7jmLo/+ORCS/VECSZmJCDDixhGv1Cbwlcu
         J0ruzLRkumBPYEf/ThKH72hnMZ55qpLHNP+RQdIuMELpkD7KxE9QQ47RSIpVgnbIXcUH
         SLYUPDio04R1jIlFdrd/ng6YsUXRPfKk6+TbtDysgsWoscQ77pizCWXEy1SPM5qaPw4f
         ICIxObKrAcQePXipXa8WCF5Waa+18irLC5yxozDij01cAJp5V7R4df4rBSSxPOBUhTj6
         vTEA==
X-Gm-Message-State: AOJu0YzoWWkpqinp9i99z0xX5zkrpFxT4b6BBxOYF6EEI9xntdBmgSNB
	31Y5tIiw/azTxi/6X29oJKNDTicY0k12wpRiPh2OApD8SS6mDDEG6HaqpZvRsw==
X-Gm-Gg: AfdE7clKdHK7mgrUbuANk2Znl2HEhI0RQ5Zp3rMNE7BlY4uFwj630PtsVZv+pkKe3qX
	8NpOAT19D4ZpllkRpLoMQi+46DQK1tuCV8VpOywAxSWEcHtkvqLF2z7vHbNYkzaKaCMuhexpgdl
	luifWzW6DpKkV1c2G+k9+PlOm9YBMVQBJcTN289tEec8CGxAD0CBRQv0G5Scaq8l1NFScm7yPl+
	MuA9+J5IKqWEz3rlirUOosCEQnCD048JFMR9OYIePeU/HpqWGHujzVdNnF+T5PlESR8ZSsNpKit
	UITEHK4RcND6TZt7UqOCa/+onJ3K/erHjwDTfKPs1TsTRqmkuZ/6E6VWC9Re0vyGR/2jAu6ebCR
	YCFeDAgk1RELHbmzAE13A7TpvIxuT0qgkDQr1YEzeZw7PdxHJxJYNNk8t3pB55AEPjc+pWl6Ye7
	TbNMpX0HzydfOEmCbidjgRs1suf7ITeKfOsoDA7pR+Tg==
X-Received: by 2002:a05:6402:3889:b0:695:822c:1083 with SMTP id 4fb4d7f45d1cf-69e652f5ed6mr1026500a12.28.1784292854690;
        Fri, 17 Jul 2026 05:54:14 -0700 (PDT)
Received: from [127.0.1.1] (185-164-140-173.cgnat.inetia.pl. [185.164.140.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbbf4dsm618199a12.16.2026.07.17.05.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 05:54:13 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Fri, 17 Jul 2026 14:53:55 +0200
Subject: [PATCH 3/4] quota: Move e2fsprogs dependency to PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-rpcbind-quota-dep-v1-3-55bc86f09e41@gmail.com>
References: <20260717-rpcbind-quota-dep-v1-0-55bc86f09e41@gmail.com>
In-Reply-To: <20260717-rpcbind-quota-dep-v1-0-55bc86f09e41@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 12:54:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241174

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-extended/quota/quota_4.11.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/quota/quota_4.11.bb b/meta/recipes-extended/quota/quota_4.11.bb
index e120833850..8f9464f130 100644
--- a/meta/recipes-extended/quota/quota_4.11.bb
+++ b/meta/recipes-extended/quota/quota_4.11.bb
@@ -15,7 +15,7 @@ CVE_PRODUCT = "linux_diskquota"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/linuxquota/files/quota-tools/"
 UPSTREAM_CHECK_REGEX = "/quota-tools/(?P<pver>(\d+[\.\-_]*)+)/"
 
-DEPENDS = "e2fsprogs libnl dbus"
+DEPENDS = "libnl dbus"
 
 inherit autotools-brokensep gettext pkgconfig
 
@@ -23,8 +23,8 @@ CFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'rpc', '-I${STAGING_INCDIR}/tir
 LDFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'rpc', '-ltirpc', '', d)}"
 ASNEEDED = ""
 
-PACKAGECONFIG ??= "rpc bsd"
-PACKAGECONFIG:libc-musl = "rpc"
+PACKAGECONFIG ??= "rpc bsd ext2direct"
+PACKAGECONFIG:libc-musl = "rpc ext2direct"
 
 # rpcgen execs its preprocessor as a single program; OE's multi-word $CPP fails,
 # so point it at the cross cpp instead.
@@ -33,3 +33,4 @@ export RPCGEN_CPP = "${TARGET_PREFIX}cpp"
 PACKAGECONFIG[rpc] = "--enable-rpc,--disable-rpc,libtirpc rpcsvc-proto-native"
 PACKAGECONFIG[bsd] = "--enable-bsd_behaviour=yes,--enable-bsd_behaviour=no,"
 PACKAGECONFIG[ldapmail] = "--enable-ldapmail,--disable-ldapmail,openldap"
+PACKAGECONFIG[ext2direct] = "--enable-ext2direct,--disable-ext2direct,e2fsprogs"

-- 
2.43.0


