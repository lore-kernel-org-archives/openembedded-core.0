Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E36C001DB
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:09 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.61483.1688484606591619371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0eAl3MUE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b8062c1ee1so45034725ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484606; x=1691076606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rL87S02wZsp/8GMzbcMiZlo51C9ya3ZjgQFfTr+hOy8=;
        b=0eAl3MUEnEethdICyMrT/Q7bp5OfW6qALQ0l5MMncVcfK9lnhljDFlH45uNyqt3cI/
         1UrYT9/01YmF6SJJaGKw0zf/qRStqGuJW+cKt9M3+K3VnzOPDGbwyVYuAD+2/4/XaEk3
         5aMuDbTp62vOa4ole+3h4GoDAFy06OIERdaQrNuDFRaAhuz831JAxKp3v8qwJ1g3TNlk
         2SeWrymqTtrN2dR8CDenCX353fggGqO+0xtDyLTV+Hc1ptR+baIfasU7kCdQl9pVYFE0
         fGH2rKnQVyhVpjuv2pXh5WTuM9GlG2CaBtMwpsokn5JaI93gqwbAEmYxii7S34Q3a5mh
         lpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484606; x=1691076606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rL87S02wZsp/8GMzbcMiZlo51C9ya3ZjgQFfTr+hOy8=;
        b=gnH9NRfXv44fJQBaDNmm1A4jTdaUQ51qry53I8KEEbQOHNRYQ0PLwXCbSzdT412Sqh
         h1WGWEysP4V1+bW+M2J3g9NxlTokkNEQNqly2ObB+3LQuN834DJYtpVjVBhCJwufUK09
         EAtQMTWTp+IJ3kwQ5q6sO8mlBBB+aKb6xf9LXjR/4b3adc/mICzCwUv2IpXlAALGP+gI
         aLD5H2ONhBPg2f83FR4s9o5DzY6l0EntgN7OtMdThFE7Pg0CTpIWw3arJDTn0TOzYv6o
         5Xa55L2cqsMXhChWqKLmYbkWZqq5y7New3HnPU9HejBPcKuJULPUvOkQIQn8a8MY8ML+
         zZhA==
X-Gm-Message-State: ABy/qLbnPn+n4mYeb2gsTVCzL778fOHaPPq3qCtAMHEZfi2njQ54IPy8
	1OpB8RLzZ88riLZaG3OVdnzi1oiCnx1DYWjYlmo9rA==
X-Google-Smtp-Source: APBJJlFpE1ksn1iSjjNZjSTza6wPqYDNvca447nSDaC6y/TR4r74OGXq8fNo3yoAI6GPmB10T/lb+w==
X-Received: by 2002:a17:903:2595:b0:1b8:a12e:d655 with SMTP id jb21-20020a170903259500b001b8a12ed655mr3956943plb.11.1688484605701;
        Tue, 04 Jul 2023 08:30:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/30] libxml2: Do not use lld linker when building with tests on rv64
Date: Tue,  4 Jul 2023 05:29:15 -1000
Message-Id: <23bcd0dbf3aeaff6b6914d347954bec22a133e23.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183848

From: Khem Raj <raj.khem@gmail.com>

lld ends up with errors on some tests
| riscv64-yoe-linux-ld.lld: error: section size decrease is too large

Therefore do not use lld when building ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 154e81bb6b05b23c0c673b431cb7cee868421335)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxml/libxml2_2.10.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.10.4.bb b/meta/recipes-core/libxml/libxml2_2.10.4.bb
index 288631504c..4f3b17093e 100644
--- a/meta/recipes-core/libxml/libxml2_2.10.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.10.4.bb
@@ -40,6 +40,8 @@ inherit autotools pkgconfig binconfig-disabled ptest
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
 
+LDFLAGS:append:riscv64 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', ' -fuse-ld=bfd', '', d)}"
+
 RDEPENDS:${PN}-ptest += "bash make locale-base-en-us ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
 
 RDEPENDS:${PN}-python += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-core', '', d)}"
-- 
2.34.1


