Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43281C54EE9
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 02:26:30 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.1788.1663122379267986142
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WMfCn0fe;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id b21so13703018plz.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=TpjW3N1clB3i3nrCPwVh1SZAU5PhSyoBE3LDBqFYKMo=;
        b=WMfCn0feouseTzOJ99AeQYYFR3iTjS2wB6uPjOrB6B1oMcn2YW9V/NuUbM8cT5q/06
         FtGJjh2UhH2XRn5kSK6YZHQnt7uGc3FzyqFTajZeuifnMoLuL5115P/BB9JYdkkzWjpw
         gn2GfT8+Y5ptL0ZjbN0BfQW+CTH/0jWmhUiPXSOMwfUofkCcX5FB1Q/YHEz2x4+qO+80
         IdL7UZk2TbI4avDgUb7tO483l+ubmeEo6RdFhd4V+U/4uSFfHYV7qDraB6OJDMxuLf8F
         rFOO074brOHe31u9h/zgBo3Mbkq69SMipvQHoelLRFWViNnK/Rwz8cwKXKIYGNv5F2We
         5eBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TpjW3N1clB3i3nrCPwVh1SZAU5PhSyoBE3LDBqFYKMo=;
        b=w2WZG/Qe6skYwt2JyeEof6zJRVgi+XVyoAHsg2mfUPvjdCnhHkoWrE05tw+4MFcluH
         XruqgQUI/+M6KEHcPfmbtL+rsRiRr2V+8a8m4pY6CFJdT6vj6sqHIZ/f2qgMMLYj0cu/
         xdTZDPNy7+vrum2npZHY8JM+/e+OID+JuPDI9yqLPlOClqqx837Wm4vt1hKmQZWRAB1R
         KgJm+vprUw/nnGu3qVpZaYZ0SVICSMNyXGHm4Dqw9tOK/zjchXmqcGGSoadORbHNURAa
         HYxUIfOr/S5C0iThM9R+Y2CQyxrC+nqLybVi65yH4IvDjstuZ4KwOliQbWd7gwEb9K5I
         c+Pg==
X-Gm-Message-State: ACrzQf1brRFKuXFaxg8W4TTV3G0HHPCr2kvERBnanNs+KeiC52N0NIMr
	tbUpgiH94flyUFV2YH6FHviET+pEB3790Hbp
X-Google-Smtp-Source: 
 AA6agR7ZNOr3gH0viPtq+U6rK/ZeWu6pTTJLCkCfDumEbU4MeWv5vvFz8fVo+vgjjx3SRYFx0zYKnA==
X-Received: by 2002:a17:90a:4a91:b0:1fd:64ce:f8d5 with SMTP id
 f17-20020a17090a4a9100b001fd64cef8d5mr2331243pjh.40.1663122380264;
        Tue, 13 Sep 2022 19:26:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s14-20020a65644e000000b00438fe64d61esm5259871pgv.0.2022.09.13.19.26.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 19:26:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/9] systemd: Add 'no-dns-fallback' PACKAGECONFIG
 option
Date: Tue, 13 Sep 2022 16:25:18 -1000
Message-Id: 
 <834ccad676b3d8d58d1a66bbe813a331599435b4.1663122098.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663122098.git.steve@sakoman.com>
References: <cover.1663122098.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 02:26:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170626

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
 meta/recipes-core/systemd/systemd_244.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index a648272bc0..f3e5395465 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -162,6 +162,7 @@ PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native do
 PACKAGECONFIG[microhttpd] = "-Dmicrohttpd=true,-Dmicrohttpd=false,libmicrohttpd"
 PACKAGECONFIG[myhostname] = "-Dnss-myhostname=true,-Dnss-myhostname=false,,libnss-myhostname"
 PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
+PACKAGECONFIG[no-dns-fallback] = "-Ddns-servers="
 PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false"
 PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
 PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=true,-Dnss-resolve=false"
-- 
2.25.1


