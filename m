Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37559C433FE
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 21:50:39 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.1454.1634248237374025484
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 14:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=1xACUf9/;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id y15so32973406lfk.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 14:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BfVlZkxORC+jjlTrizGmSDIvJkT6VZq0ZPC/Dh57Cws=;
        b=1xACUf9/jrVN9geMUbmbkGR63yunCRvWCqpBmjWs45NFnJ7reRbou8vlZ3OZOlSpQj
         yGZDbxhPGeQmDICSdkGOqBpMENzpic+GRmcpUQUH72bATPh6990N+SI/QInN+eD3Bumy
         mScVHbuyKI0djWQho2j/w8ISeMj4x40fOgMX233KJYmDle2ZrlzV6aXUEsPrCg6V3rPs
         vL/y67lTEoEl4aVQiRKIw+IpbuY7TsPfKKocw+ovW9/uGIEvOboWXUMLZN0tNk4Dja1c
         /UgHSUlIo8r5ME70V2tVno23GZ3+7I2YswxcVaiBc7jh1ileEn5SJi61At1Kt08E2U0V
         1FZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BfVlZkxORC+jjlTrizGmSDIvJkT6VZq0ZPC/Dh57Cws=;
        b=X08I9sWNlPG8D7F0U74nF1r3g8IoWSdpYfnL0+Yvvue/w4PB3J6RsURZlgsuT+Iyrb
         /IPD0ilGa4UW9YpwAy312AwZUmZGkcZlGeC0gdVqppUBhUxtyOQhueEysm98o2EsDQ+N
         o8rAjR+EKnI2yjRrOcSIc9dF+RPOoQ3cZn3uazmyqiL9EsX4NHo+2TulieqPoWOXLeVk
         tHwtOpx/xkgjkxiT42WlaIW7aYnfSsvzXhpJkjzHKFgg8skUPKiOUyq5b3qmxWwXi2KA
         +1HQuBIAb7uWjAl6apvHFap2rK1n8Lj8u4Em2OPb/jL0O/JWfmpVJW9y+u5PBFprn3We
         alTA==
X-Gm-Message-State: AOAM532r7vz/JLxwmdDHSU3lyeF1gtWW9UYWeJVuwPOEdtQ/RiNChi4L
	fiQ2Ep86SSrX0I2YoTWwoaxSuxpvY0o+ycXc
X-Google-Smtp-Source: 
 ABdhPJwxk8rkZ7lmG9NDkb3k+bFw/RNvfmMNefIZgOenXfsSLr3KJvo05mmNI1cDEqMpbxxKvdFOxg==
X-Received: by 2002:a2e:a4a7:: with SMTP id g7mr8781091ljm.255.1634248235092;
        Thu, 14 Oct 2021 14:50:35 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 bd9sm370386ljb.29.2021.10.14.14.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 14:50:34 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] mirrors.bbclass: remove dead infozip mirrors
Date: Thu, 14 Oct 2021 23:48:59 +0200
Message-Id: <20211014214859.3668673-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 21:50:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156977

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/classes/mirrors.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index ba325a658b..1afce92147 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -29,7 +29,6 @@ ftp://dante.ctan.org/tex-archive ftp://ftp.fu-berlin.de/tex/CTAN \n \
 ftp://dante.ctan.org/tex-archive http://sunsite.sut.ac.jp/pub/archives/ctan/ \n \
 ftp://dante.ctan.org/tex-archive http://ctan.unsw.edu.au/ \n \
 ftp://ftp.gnutls.org/gcrypt/gnutls ${GNUPG_MIRROR}/gnutls \n \
-http://ftp.info-zip.org/pub/infozip/src/ http://mirror.switch.ch/ftp/mirror/infozip/src/ \n \
 http://ftp.info-zip.org/pub/infozip/src/ ftp://sunsite.icm.edu.pl/pub/unix/archiving/info-zip/src/ \n \
 http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/ http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/OLD/ \n \
 ${APACHE_MIRROR}  http://www.us.apache.org/dist \n \
-- 
2.25.1


