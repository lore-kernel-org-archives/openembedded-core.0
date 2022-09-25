Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1CAC6FA92
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:52 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.20399.1664133524550251963
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Aawz3Dfb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id l65so4738835pfl.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=ZVu5Ldijw9Qrno22k5nK2qBeytfH5kPDmrUiFg+Jc70=;
        b=Aawz3Dfb9zCCTYYgKpNYQ4XNdftySECdV4FMupEFKsQvei1g7gHNj0UKULwaoebLSu
         +pViODunzAfNNm/dnbMq9zf1pTktD/xBFwn5ioCeEu9o9iWljZ2VOdirj9Ex74sH6ods
         ak6BNt+3JN2BFwLQ4eh487sX7QrVjHjrt02+GxnBt6qoVb/FuMKWVI4wlnzrGgQyIB+C
         Mls5MOs+WFSAsfiuPkhYQ7BmpDIRcI9D0rlNa2tDBbEYhtXoYrwE9caukzNkv6Od662Y
         wKgVNQ/9hbMT3MdeMe7eWBKiazJMyYN9BLof4EV+JjulFzHrdLl4OfZNlCuminoh4Sa+
         EyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZVu5Ldijw9Qrno22k5nK2qBeytfH5kPDmrUiFg+Jc70=;
        b=OpUaAxH/2/9exZK9YnN5E7SKcz3YJtAjdm8lEQTYF39vHgLz6ntdYZjgMGSNcac7mx
         O5ZiB4qRoT6gvmxAznjs1fl9kluAoobFbW+sdIpJLIJK4IFsMYCMX7GIy71q0Ihew++u
         ofYgPBXbzbtjAyOxPJFpOuuqJuAW0kflEXrlTVbIVVvU81Mxhpl2MX5DxKz4NXPp0j4n
         aooe0Gi34+aWC05Eh17yItEC3DtZN35HlsGyBEA2eWNlkGN4Yirb7qgcT/RsEu5J8xD5
         JVjBG6yA16U6VxR415AAiqFE726gYA+LHjdM6mTzU46EUvnAnggeqDeduTcgZl3nTZMr
         6qDA==
X-Gm-Message-State: ACrzQf2GZClLxOkbxlhEi2VjynvCMA+3/MoZKPnch2x5rBMj8bR2NGCF
	G5PCMURQZD+jjFROVcD7rJyR3+Hy8hVLhhxO
X-Google-Smtp-Source: 
 AMsMyM6MysoEfr/KggV9MTNnYk1spa2zaT4xUau6SbcnDADQJOU6+F+C8+vQEJOaUEvu016maKPyEw==
X-Received: by 2002:a63:2444:0:b0:438:63d9:bd65 with SMTP id
 k65-20020a632444000000b0043863d9bd65mr16515460pgk.560.1664133523417;
        Sun, 25 Sep 2022 12:18:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/33] glibc-tests: use += instead of :append
Date: Sun, 25 Sep 2022 09:17:34 -1000
Message-Id: 
 <98513137092ff259b163556167f034971b89fe64.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171037

From: Mikko Rapeli <mikko.rapeli@linaro.org>

:append can not be modified in bbappends and thus += is
better in re-usable, generic layers and recipes.

(From OE-Core rev: da88406ba592504a718f516b985adc0d4553080d)

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c9676445c942b95cc2bb71085d1648c02d774479)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-tests_2.35.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb b/meta/recipes-core/glibc/glibc-tests_2.35.bb
index 96d0569ff6..97d5dc29a3 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.35.bb
@@ -4,7 +4,7 @@ require glibc-tests.inc
 inherit ptest features_check
 REQUIRED_DISTRO_FEATURES = "ptest"
 
-SRC_URI:append = " \
+SRC_URI += " \
 	file://reproducible-paths.patch \
 	file://run-ptest \
 "
@@ -30,7 +30,7 @@ python __anonymous() {
 RPROVIDES:${PN} = "${PN}"
 RRECOMMENDS:${PN} = ""
 RDEPENDS:${PN} = " glibc sed"
-DEPENDS:append = " sed"
+DEPENDS += "sed"
 
 export oe_srcdir="${exec_prefix}/src/debug/glibc/${PV}/"
 
-- 
2.25.1


