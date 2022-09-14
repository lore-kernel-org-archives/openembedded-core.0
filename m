Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914ACC6FA8B
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 19:11:06 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.1130.1663182659180953945
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 12:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1ZQpJ+4i;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id ge9so3993314pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 12:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=Is5clB+FjJBc2HVlc4JoDUmfDAN32Db0U9DgBy6TdKY=;
        b=1ZQpJ+4ibSjfF/Phf9AbQJQwXYxbYYi+lqEWYhZLKQNbvmTQ2tqdu73zVyhDyYgcd+
         1j0Xua4x8DDGsTkb1phzeXgkjMG0JSpEhixUfivEmCmaWTlUQNNVdMvi6Oi+okaBk/E7
         nR3ZfUI1eT7Ktr5cbqBU5jegE7iNRzepoIthKyjdeBFua2TS+jPbkIOKtnJUv7n75AUp
         PL49o3GMmlPs1a350upCa/T1as9eWA76cla1CTJVFnjJ4TIXpM0JzSkC+yVi8uwyQGMW
         Ottq/NEsOT/q95ZRbNAymahJDBjSDMVMkrKMlO+ohZGpnYUiwVES5b/M08/kvQ0mQLH1
         F4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Is5clB+FjJBc2HVlc4JoDUmfDAN32Db0U9DgBy6TdKY=;
        b=3qq8q00xPeNdo1dadIEZjtST/sCZxoPoh5BKvbKyuqmT5McSBikejE5OPDCDm3Ap6T
         uL0eCP2G4elUHNOHEwTY9QYQ4BabvNCog6zWftCRyfQ7Sji3RhJRfCPg3Iq9LeB1XhVQ
         PY/901WSwnc/0+juO4RXwecZIs94m7TWacHJ3ujrM0j3FFKQGirCXzQhs7b5C+O5DCoB
         iJkaYCi3/Cbp0UwWH8R27IFWpnY8bJUAPzUBH9FV7kqt4cn4S720U0Bch1kReS3IN4QJ
         2qEYRiycnjkRebmXIwLmfjD5bbsZ+BvEsZipVsRn+AnQdQyLvQRN0Gb4nraeXvJDWrDe
         rf0g==
X-Gm-Message-State: ACrzQf0N273oOtDepsQGGvNaKKQ8Hky/DJCY2pm4aJLI7yTpQaQkfVQh
	dpRGGQVsbqkC+3Tw9P3DB74WqH2zW5FGJ7YW
X-Google-Smtp-Source: 
 AMsMyM6+a2RhZ6b0EP+ih51/Ug5vFyt/EewdPVi16ErkJP11VF4hn0cC4Pt0bvwpELvZhbi7sLJg7A==
X-Received: by 2002:a17:902:f606:b0:172:9c81:d788 with SMTP id
 n6-20020a170902f60600b001729c81d788mr468800plg.42.1663182658265;
        Wed, 14 Sep 2022 12:10:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w14-20020aa7954e000000b00535e950aa28sm10551156pfq.131.2022.09.14.12.10.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 12:10:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/5] systemd: Add 'no-dns-fallback' PACKAGECONFIG
 option
Date: Wed, 14 Sep 2022 09:10:30 -1000
Message-Id: 
 <71f09bc00029acb3f368244bceb1e20b02cd9129.1663182524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663182524.git.steve@sakoman.com>
References: <cover.1663182524.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 19:11:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170670

From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>

systemd defines a default set of fallback DNS servers in
https://github.com/systemd/systemd/blob/v251/meson_options.txt#L328-L330

By adding a PACKAGECONFIG knob providing a convenient way to opt out,
and then adding that value to systemd's PACKAGECONFIG, the output from
runtime 'resolvectl status' command no longer contains the following
line:

  Fallback DNS Servers: 1.1.1.1#cloudflare-dns.com 8.8.8.8#dns.google 1.0.0.1#cloudflare-dns.com 8.8.4.4#dns.google 2606:4700:4700::1111#cloudflare-dns.com 2001:4860:4860::8888#dns.google 2606:4700:4700::1001#cloudflare-dns.com 2001:4860:4860::8844#dns.google

(From OE-Core rev: 2b300d6b9ec6288a99d9dacb24a86949caf99e55)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_250.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 9923312830..5d568f639e 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -165,6 +165,7 @@ PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native do
 PACKAGECONFIG[microhttpd] = "-Dmicrohttpd=true,-Dmicrohttpd=false,libmicrohttpd"
 PACKAGECONFIG[myhostname] = "-Dnss-myhostname=true,-Dnss-myhostname=false,,libnss-myhostname"
 PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
+PACKAGECONFIG[no-dns-fallback] = "-Ddns-servers="
 PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false"
 PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
 PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=true,-Dnss-resolve=false"
-- 
2.25.1


