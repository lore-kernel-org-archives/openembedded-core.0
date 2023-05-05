Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D025AC7EE22
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:21:14 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.30364.1683300073885161354
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=L1Z7Sx0X;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-643a6f993a7so435994b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300073; x=1685892073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFO4vt0yutBSa/nNqk6LbdgHLTYKn2rU8CRS7nOFWBk=;
        b=L1Z7Sx0XIhXyZyhI64Otf6lmUV2o0sICBLDTsmZ6PuPKv6DGXWvspg+ZqSDrzq0Nrr
         cYdKOrdJfex0gilkWdXrHr6u6wfD7DoZuAjdMrCxIwCjm7dCPlWsNjRFkmKeTgnyhPR5
         dVcve5Pw9+8vDDRSeHoH5/k9Oy+SRUKucpeLz8yVz3mfyLnXw87hsCNd9fowCxrB1WPQ
         JWcMbEzpOv6WXyh6esbEOBZVcoeSbFj0fxZw11JqKVcT/9PYEoSkceibkVZOEPkbB9Pt
         rSxrVO/lWQjeon5PiukfZiFcQh0Tb3vGksbMsEByV0VfL9Kf2KMVHjo7nVylj1PeSdh6
         4uaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300073; x=1685892073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFO4vt0yutBSa/nNqk6LbdgHLTYKn2rU8CRS7nOFWBk=;
        b=I2pEJjfiGBVCv+K9QzXtB6XUhuV2IRp3ncH1dzbGKwDc2uBymB1/fDqyFVawc8401Z
         FxLUldo+RAn7IdIuLzyfR1tYE9y9VYahs0ohA83SQLgxlCGOgPNxzVT8uupS6Rm/rrA1
         /wAfq3mkCLy7eHfRt1WPpzD8qc3wZ8wvmKTqWhATaCeMNxnn6nw6s1yQulESKS7a6unN
         OcGXBrz2TIWJQ2lVHgl17J8Z2VFR/SMdYZU3D9YxB2owB7a3QfIsnauNS279djuS26QQ
         eev0aqJvPXiRR4+GDKU5DglSHgAw3ndqsrkVZYmL3Enq9w4IN2sCEXk8Pscp/bplHLuw
         KP2g==
X-Gm-Message-State: AC+VfDw2Hcxv6oIKWNr24AHcZuzOjK7btCq9roT45vPymUChW+dKIlCL
	9aznYc1PVGKb6oAS/6ZEmg+57v7MvSgTVkqqML0=
X-Google-Smtp-Source: ACHHUZ7tK++S47N0wRRLH/wEfcXNVzc6ayO4UukeJhGHiYm7bZmuAevxq+VLgHU20EdPuHhCPnh+mw==
X-Received: by 2002:a05:6a00:10d2:b0:643:96bc:b292 with SMTP id d18-20020a056a0010d200b0064396bcb292mr2744374pfu.5.1683300072942;
        Fri, 05 May 2023 08:21:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.21.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:21:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 33/35] oeqa/utils/metadata.py: Fix running oe-selftest running with no distro set
Date: Fri,  5 May 2023 05:19:44 -1000
Message-Id: <9e576ab7035d52fba961c400d53657608ad5b99d.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180953

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


