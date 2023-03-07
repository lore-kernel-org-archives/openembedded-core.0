Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F411FC742A7
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:49:05 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.8649.1678229338482556140
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FCV+9lLD;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id x34so14833735pjj.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9JbCtqZmwTjDmmV3CXF3p0QEBMyeH8WTNR79vhT+bY=;
        b=FCV+9lLDIw0yukNAvARQ+9GD2efGdqr0oMaQuAd8/wSWn6hgPab+w7m94mksiztqE8
         pCxa+dmT+Fav8Ask1wNjt9t8hZYkCFXQe0DgXjg0A3knNlxG+BFa2rzRM8+8CiZeunKX
         KBeEnbPcfr32+yIXVxHUEHHqyptPAIDEESn/gurF7m8xhMJK57MJV26v3hYTdIV6dA5Z
         OptS/nOQ9eqzQ0w89OrLDYUGjUE6onwWKDR0I8CaH5lCNyFUg/Fe63K8a7wsojz8Clm7
         Ebm8hLgVZc5glbOXYtlqF5bCRcNUcBYBcSVIo70J2i0T3vmvZhgwRDuaCRFxWA8oc3bN
         11ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9JbCtqZmwTjDmmV3CXF3p0QEBMyeH8WTNR79vhT+bY=;
        b=DUrs2s8TIdcw1ZkM6veGlehr4S8TrNynE/ELY9UCt0AkVkA1Z7IBP4e7mjtjPcKkJK
         vy/HEIESDzFHO9AmL2eeNneQJIIZ7j06GdrDoePcyB39mogbOT/e0740D4zcgGdu5m+w
         Y18vxSne/YwbnNFCkbj5/GNRCUvYCx21DnLC5EUHGy7Yc2h+0QxeQYovNsbMFxdT7t8b
         23HZG6jV0t+4bbsNw/3P3QDMLkP0T9O7hjXnsLLgwp1DgjO2OSOpZ4MB7L4ge19z4RxB
         19xX4QSdM1qWyLzKFdNovO8T6Y4TiIpZXMGHoj+Wt9JDFZa0D1Y71WWw205blEkinqRG
         7ivQ==
X-Gm-Message-State: AO0yUKVpFB4uzR0cEKY/umZaKHvxl14NeCsy3VcYmlobSNGgtxnDrwrB
	QSIQxgq/AsacFa0PaTxhrfb7TTzC1DWDs2LxoC8=
X-Google-Smtp-Source: AK7set/0d7qxrgJEyNS8FDclwjWPvWqWt8QIRe95Rhg+cCa0XGF9p4v6OIV/hu3UGiGJpzLdVZORdA==
X-Received: by 2002:a05:6a20:bc98:b0:d0:76e3:16e5 with SMTP id fx24-20020a056a20bc9800b000d076e316e5mr1366330pzb.2.1678229337487;
        Tue, 07 Mar 2023 14:48:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/23] image.bbclass: print all QA functions exceptions
Date: Tue,  7 Mar 2023 12:47:56 -1000
Message-Id: <c4e3b86f2bcb2b445efc72bd8e06b1b89d88daa2.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178144

From: Mauro Queiros <maurofrqueiros@gmail.com>

For the QA checks in `image.bbclass`, all exceptions
other than `oe.utils.ImageQAFailed` always print the
following generic message:
"Image QA function func_name failed"

This can be very misleading, as it may hide
python syntax errors and other kind of issues that are
hard to detect without more explicit error messages.

This change makes sure that the error message of all
exceptions are displayed.

Before this change:
 "Image QA function func_name failed"

After this change:
 "Image QA function func_name failed: f-string: empty expression not allowed (<string>, line 13)"

Signed-off-by: Mauro Queiros <maurofrqueiros@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d85b30d8704d38b86f5b006748cebc74bd2a4fa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index a241543ff2..fbf7206d04 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -311,7 +311,7 @@ fakeroot python do_image_qa () {
         except oe.utils.ImageQAFailed as e:
             qamsg = qamsg + '\tImage QA function %s failed: %s\n' % (e.name, e.description)
         except Exception as e:
-            qamsg = qamsg + '\tImage QA function %s failed\n' % cmd
+            qamsg = qamsg + '\tImage QA function %s failed: %s\n' % (cmd, e)
 
     if qamsg:
         imgname = d.getVar('IMAGE_NAME')
-- 
2.34.1


