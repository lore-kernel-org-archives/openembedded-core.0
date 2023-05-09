Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A01C7EE2D
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 22:33:15 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.3065.1683671586011021361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 15:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=YlA+Oyeg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-64388cf3263so4640851b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683671590; x=1686263590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFO4vt0yutBSa/nNqk6LbdgHLTYKn2rU8CRS7nOFWBk=;
        b=YlA+Oyeg9xgs2we0D2HSAkd2WeHyJD2O8nI0qwk5tjwN3mksdmCLjk5etRpD8bQAne
         D4VS0vxIOdwWzlcNQ0x9kJ9z17a1y4jC3DSqruG7BeLgFKxK1Fh/G/7yCCm5k/EBSAxg
         VVt5jKqchL4cSB5C/BgaChsCAjWGwT78Yuvw7Nwb2LLqIVweJAWf7rsvk/MD/LJ/6bwW
         eXJNaLp3gB9tLDtq9ShdcdguRjl6O3EHuCsd4+vOnzkRxWmm4tqbdo6h74PUgr4peOAX
         HpFbMPkWdo3jW86nif8y80WNUN7xogk6B8JGjyewKE07SdpU4CaFZ8Ni2jvZSsqiDuUS
         Zc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671590; x=1686263590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFO4vt0yutBSa/nNqk6LbdgHLTYKn2rU8CRS7nOFWBk=;
        b=OBXdIFXjX4snbx3HxU5z1201gtFY/BqEmKfpoqPNA9ipjiAVo450OsFB0FnwknWFT0
         At/O49eV4bzd3phtSzmvJZ2cqYe8j/oarjfOOq4RosaBLr4cX2EKXEZtYRMuZMD++hg0
         +EDaRWJ23LRGHlpsflrd5XYot0oahRQpUnv8kD9FBMBZwNusU4CopvC/dpNepvixqvoH
         FZg21SySYoPo99Px+e7sowA8AZMMOFVHhLjAHSAz7sqg0eayn2yPZCcZTXN3c52LtgIp
         0AjdioDAZ4V1Epd8PXojlpd7a3DKz/Y0YEK+ZlwAWdMU/SG5deIzNC1boYCw3lcxS2Mj
         yUEg==
X-Gm-Message-State: AC+VfDykxpuZ/PbiwKTL6mRtDKgqd2rY4W5BNRYQRppU1gMs0oPhjyn/
	vUakLwb6E9/D7d/RBIDYkOByDM6JGVTg43Gv/dY=
X-Google-Smtp-Source: ACHHUZ4ihCCd2XToKvYwpjMC4Pcean/yISEBFSxLItyTjTHEes2WRM7n63PxGj4/xi4EZonGkF1SmQ==
X-Received: by 2002:a05:6a00:138c:b0:646:1f13:7fce with SMTP id t12-20020a056a00138c00b006461f137fcemr11984607pfg.2.1683671589885;
        Tue, 09 May 2023 15:33:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u17-20020aa78491000000b0063d2dae6247sm2263125pfn.77.2023.05.09.15.33.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 15:33:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/15] oeqa/utils/metadata.py: Fix running oe-selftest running with no distro set
Date: Tue,  9 May 2023 12:32:39 -1000
Message-Id: <6e63c48ec31ebf640ea26d0328f4618bd13e625f.1683671424.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683671423.git.steve@sakoman.com>
References: <cover.1683671423.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 22:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181098

From: Thomas Roos <throos@amazon.de>

This will use default values when no distribution is set.

[YOCTO #15086]

Signed-off-by: Thomas Roos <throos@amazon.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 888fe63b46efceeff08dbe8c4f66fec33d06cb7a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/metadata.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index 8013aa684d..15ec190c4a 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -27,9 +27,9 @@ def metadata_from_bb():
     data_dict = get_bb_vars()
 
     # Distro information
-    info_dict['distro'] = {'id': data_dict['DISTRO'],
-                           'version_id': data_dict['DISTRO_VERSION'],
-                           'pretty_name': '%s %s' % (data_dict['DISTRO'], data_dict['DISTRO_VERSION'])}
+    info_dict['distro'] = {'id': data_dict.get('DISTRO', 'NODISTRO'),
+                                'version_id': data_dict.get('DISTRO_VERSION', 'NO_DISTRO_VERSION'),
+                                'pretty_name': '%s %s' % (data_dict.get('DISTRO', 'NODISTRO'), data_dict.get('DISTRO_VERSION', 'NO_DISTRO_VERSION'))}
 
     # Host distro information
     os_release = get_os_release()
-- 
2.34.1


