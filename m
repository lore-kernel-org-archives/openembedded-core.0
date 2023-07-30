Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD862C41513
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:02:01 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.78416.1690740115182293741
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=u2QloVYG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-686be3cbea0so3057414b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740114; x=1691344914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHJrOex0fW+ihQ6ZY3zBJOpR+hPjP/hYjmlVq+kloi4=;
        b=u2QloVYGAyJ08JImzJsbfNRHiU991k5wc33LNLtr2YnrE/U47RTCl/FT1sEq8HIsLP
         sWpshkD6uXeJ6LvAIsX+cvDSm8Yp4GbGvQZbQ2SAQW3H/2Of0NjwIkKnLPb5H7T5OZJ9
         b6Cx7o0bFEVZBaHXWtnezjAAMuqqNRmbtQTETAZKgGAXmWecXhU4x7qI5ebf3DicDTAW
         CQfOuwnA4r8QFU/O+VkRnqtzCiX7BCucXIkXhqoJ6b8UhYn28MKSthXfsghjDLHYTxAO
         f0fhVjp1LmPfjPrZhucNfYbH4qQUb81ZtHP1wvcP4SAS7dAWoVCIjr7QImsbjdqeQ2Ri
         JNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740114; x=1691344914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHJrOex0fW+ihQ6ZY3zBJOpR+hPjP/hYjmlVq+kloi4=;
        b=Npg01wSKJYgsFXQRn3417799qp2ek+MPo5M/eB74gmRn+UgYpiAjn+Weu+XmoaIuhe
         wBHLz4f17/H4Au0QruWKJjAIjj+MPbsoWultCU1jYV8Y4t0p87FRzCxn8dkVs3sT4r08
         q96bTpZCZ7Y9VUqvVzN6XkYGc5/o0pVaSC2okr/T14KRCWHg99JGVOJu8TVsXtAy5uT0
         sa5nZUhf+P1PPKgB2AmSa3JoqHbccO1LpVpq1oZoZ9uvz83EqgAdkD15jBqoXQUo+4Y/
         514t1nSbe4uyorxgC6h573bnaMfscgopl95rRHvksq2xdNE82clggfW3tJ0CL+3EiyfS
         4GVQ==
X-Gm-Message-State: ABy/qLZ3vq7qBguD8FcTde03dCAqqylcxqmL9efRF3+fT/alrUjR6O8V
	MLbi5U3X7avkDsyJKwM6outTOeXNNAl15wbIDCa1Kw==
X-Google-Smtp-Source: APBJJlF0NX0s9EbqZgvNhqxKjZHPP2HuHkXLR9Ag6BMbIOYGoLJSSrgEyucvVqXOGm0/5jXVZ8JrWA==
X-Received: by 2002:a05:6a21:6da5:b0:134:73f6:5832 with SMTP id wl37-20020a056a216da500b0013473f65832mr9846059pzb.16.1690740114358;
        Sun, 30 Jul 2023 11:01:54 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 30/30] util-linux: add alternative links for ipcs,ipcrm
Date: Sun, 30 Jul 2023 08:00:53 -1000
Message-Id: <2ebee54793f9f75fdbfdf3c16bf6c50f89dc354f.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185108

From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>

When enabling ipcs and ipcrm configuration into busybox, both tools are
built and then deployed during do_rootfs. These operation lead to below
issue (similar behavior happens for ipcs):

do_rootfs: Postinstall scriptlets of ['busybox'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().

update-alternatives: Error: not linking .../build/tmp/work/board-poky-linux/board-image/1.0-r0/rootfs/usr/bin/ipcrm
to /bin/busybox since .../build/tmp/work/board-poky-linux/board-image/1.0-r0/rootfs/usr/bin/ipcrm exists and is not a link

Binaries enter in conflict with same named util-linux utilities during
do_rootfs step.
Adding ALTERNATIVE_LINK_NAME for both tools fix the issue.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e4d60408b869c9cc2ccff794d4e271d993ec8a97)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/util-linux/util-linux_2.37.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux_2.37.4.bb b/meta/recipes-core/util-linux/util-linux_2.37.4.bb
index f6d3ea2bc1..8866120eed 100644
--- a/meta/recipes-core/util-linux/util-linux_2.37.4.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.37.4.bb
@@ -233,6 +233,8 @@ ALTERNATIVE_TARGET[getty] = "${base_sbindir}/agetty"
 ALTERNATIVE_LINK_NAME[hexdump] = "${bindir}/hexdump"
 ALTERNATIVE_LINK_NAME[hwclock] = "${base_sbindir}/hwclock"
 ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
+ALTERNATIVE_LINK_NAME[ipcrm] = "${bindir}/ipcrm"
+ALTERNATIVE_LINK_NAME[ipcs] = "${bindir}/ipcs"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
 ALTERNATIVE:${PN}-last = "last lastb"
 ALTERNATIVE_LINK_NAME[last] = "${bindir}/last"
-- 
2.34.1


