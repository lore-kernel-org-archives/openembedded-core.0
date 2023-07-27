Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CA3EB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:52 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.16781.1690487084019132597
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=BB0jYZp1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-267ffa55791so839309a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487083; x=1691091883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6LfUfBIvrNwoIjyEKx0nBAgb6tnoNhyaDuRomDYh7TE=;
        b=BB0jYZp1GNNf9FPbamZP0P2pMNF9/gsa4GokRfyzVg3UUroMorAkBi/jZni0pzNMi3
         Bs7pwCRlkeeEUwor9VazxlcgoiYGil6IpVhFV6ZOgL+pphRVhgdOfqqHLvrh8DEd+Shx
         QN4oo3QCrWaTMgOXxdXCBXhq+ANgp6uSmxli2gjZBTg4m3TtU2XvQg+mgj70ZrgqFlLQ
         2H6uQF+rB3Qn8xintTBvbDAjn8a3x0CjBU7K9NKyBmAOcc/qQSqJoFBhHzrULn31yqTh
         kOdTHuki8wprnTZrbNYOjYN5vbcx9WBV/jeiMrFKa/Y4v/jKQjhCwPQyJ/J+ZaLtWTRi
         TgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487083; x=1691091883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LfUfBIvrNwoIjyEKx0nBAgb6tnoNhyaDuRomDYh7TE=;
        b=H3FiE4uEeFbaeDlKs5r0zhXiANNlxwP2Pgyl/jJ2wDH7IHNJUEfZIwTEeEsVn899Ur
         mYC7u+RjIbC4+cI7893HeVXQqJUCk2qzlCsWS+vnrRQLiAJJ9uvKe5tNEnUYd9lkACc7
         uJ8woiZh0eb7GaKMc41r/1ulKt4dt6v0xNGAEf50qgm4BgIM85kNYJodb+9lHc6PGH9A
         dHq3TxkHhXAWuX75eXPKd97PHwIbPMVnCCZebeVyQEll4CPFB5Uba6wEvmlRRk14LrUh
         X5UbONPlAE+L2sXrEGUOojJJ0X1YOHBXBDkxJVfjUZxK7glMWdwSqDgpLEFSvhnRqnqk
         Y/WQ==
X-Gm-Message-State: ABy/qLYX9dQyUzEDZIVdnJTfLFZUc1Nc4us4QLpBDQcIhIxhqpnqYBw/
	SNgSPcJRRYLUe+opJ+kbXRkXTumYqfxK7F0lhmI=
X-Google-Smtp-Source: APBJJlFLCn1cXQwGN4DT22L5v9mcdhTaQoEMpKXIpTGb6LaCN2ouzQBnuD1YwqYfNXFKwu6FASqiFg==
X-Received: by 2002:a17:90a:d194:b0:268:4c01:eb56 with SMTP id fu20-20020a17090ad19400b002684c01eb56mr272002pjb.2.1690487083076;
        Thu, 27 Jul 2023 12:44:43 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 27/27] util-linux: add alternative links for ipcs,ipcrm
Date: Thu, 27 Jul 2023 09:43:45 -1000
Message-Id: <dc4099307100de817110958c9426ced4189fd0ac.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185002

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
 meta/recipes-core/util-linux/util-linux_2.38.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
index 9ea7a04e8a..c81405533c 100644
--- a/meta/recipes-core/util-linux/util-linux_2.38.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
@@ -234,6 +234,8 @@ ALTERNATIVE_TARGET[getty] = "${base_sbindir}/agetty"
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


