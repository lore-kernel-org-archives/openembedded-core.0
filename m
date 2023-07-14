Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81F7C001DF
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:58 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.832.1689374031108457453
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=NNTZXbyf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b89600a37fso15207225ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374030; x=1691966030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6tR9rMePn3uTN/iCKpmYAfxE/2CnbqtN3N5PnoyVD4=;
        b=NNTZXbyfQqvDIApQUd18miwgPfLZ3gQyHooXBQ8ClY/fitSpDyxNPllL8VatkaC9QD
         AW+Dit1KmEqEnDbN6ov7yM0NY69OXbuIfp2O6LhGYCtgJfXpboNUitV6ikmjnVKv01Ks
         aRMaGxSM+fdM8bTNg8cqwt4584tNmiUe9Vdh61K4Q9CPOdRthXyPx8wlwKaB/pHT+qpi
         jAGo3gCvPFd0Qk1j/6bcP04/IXCAW33ivjCipN3QXPE4lR63MSzIxZGCAiTxSzQ3N90l
         HwwGnOkmh4LH98Jb3ujaxY6fri6M9sCVUZFUJj2wmAleZyV72Yy/UBcVM6QWxVVtPrS4
         ZE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374030; x=1691966030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6tR9rMePn3uTN/iCKpmYAfxE/2CnbqtN3N5PnoyVD4=;
        b=RxmR/Dw6SrBleBHsw7DQ168gt5o6xMk/lQ14vHw/QVg1hKt+qtaE6bCiZ4iDjbVLcY
         x7Jd8NDgPywMf1vrK7UVf3iCY+EmqRjxDRTAJLenOwHNe5GMQjj90pkhRMEOVH8NMmEO
         EKVTpj3g8lF09DChI1vzVSYFKVesVIEdaU7UNy6hd5wgmgSs7EdDgCfgPUgG7kYwKJWx
         QW/OrZsqGZUvNzsyEzkTEarXruvLCYqdhu8G5z8bAcu+wKDkdHWONreYS0HdVy2oYW5A
         BnXVkTZVy9sK/IbBXApPMu22MmsME0FCCjz62fOuoEqE4JQLw6+H3Azq6I+01dmFZEGE
         Z4sw==
X-Gm-Message-State: ABy/qLa0aT/ZOYfp035NndQudK+cG7nlwCJJUQxTnDXDXajokEXHeUrO
	1qsN0vU2vN0qsAEIeNXLLndPivWXFhKSVM+sXgw=
X-Google-Smtp-Source: APBJJlE8AVpmcn8c10otkTDCwtIs7x9JHDv2X0DHVwl5sfba16GhfYP1AxRUMNqOPofgdkifnZi1ZQ==
X-Received: by 2002:a17:902:ef95:b0:1b9:e0cc:1810 with SMTP id iz21-20020a170902ef9500b001b9e0cc1810mr4309910plb.48.1689374030120;
        Fri, 14 Jul 2023 15:33:50 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/26] ifupdown: install missing directories
Date: Fri, 14 Jul 2023 12:32:52 -1000
Message-Id: <c248473e2d60cfa67c64aa586b404119dec728ff.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184300

From: Yi Zhao <yi.zhao@eng.windriver.com>

There are four directories in which scripts can be placed which will
always be run for any interface during certain phases of ifup and ifdown
commands:
/etc/network/if-pre-up.d/
/etc/network/if-up.d/
/etc/network/if-down.d/
/etc/network/if-post-down.d/

Even if there are no scripts in these directories, ifup and ifdown
commands will also search these directories by using run-parts command.

Install these directories to fix the following runtime errors:
$ cat /etc/network/interfaces
auto lo
iface lo inet loopback
$ ifdown lo
ifdown: interface lo not configured
$ ifup lo
run-parts: failed to open directory /etc/network/if-up.d: No such file or directory
ifup: failed to bring up lo

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 277bc7ab1fedd81f4df578e544ec381c819a10f9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ifupdown/ifupdown_0.8.41.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
index 5dbd6193b8..16425ea9e4 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
@@ -42,6 +42,11 @@ do_install () {
 	install -m 0644 ifup.8 ${D}${mandir}/man8
 	install -m 0644 interfaces.5 ${D}${mandir}/man5
 	cd ${D}${mandir}/man8 && ln -s ifup.8 ifdown.8
+
+	install -d ${D}${sysconfdir}/network/if-pre-up.d
+	install -d ${D}${sysconfdir}/network/if-up.d
+	install -d ${D}${sysconfdir}/network/if-down.d
+	install -d ${D}${sysconfdir}/network/if-post-down.d
 }
 
 do_install_ptest () {
-- 
2.34.1


