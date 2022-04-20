Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40602C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.8145.1650463726697700156
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JeX2Rd4F;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id t4so1736451pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jFJvQzGDNsvDjJpreDIS4wtTBuCBiYius326OFWpfCo=;
        b=JeX2Rd4Fa/zce8cQ4SkpTh2bxnG9ni4o8Uf9ZmX98PcbQN1xv5wVjhb7lKAl/xgwBT
         8tz6AVbmLrShplEJnnZ/6BbLqK4Ja3pUC+GgccRMBYCiyT1lfNn/D57xO0SrcnzlM/Jk
         UWjPbgGJSjAha4xSFWPQgbIpuSTDspGjrdWor2fONLuh8sVZg94FTFEBrGtebtCpehWn
         hABtizB7wY7Eill87XFdhyTGtdrkGdQcohPaU2qBneA2X7AS3Pv0wrqzod/4lfYoaMGy
         Cslq8rQt+smnGaLFXWbI28tAPUqzWL3nhVIeXyDM65qlf1JDzWT7aFkosBxZF61qRCtv
         Z2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jFJvQzGDNsvDjJpreDIS4wtTBuCBiYius326OFWpfCo=;
        b=qjXVxTpjQOk3nvNNxTVGxy4rrq4pUbE8niE8nOyIL8LPSA0KGFX9tG2ye3UfpCwHed
         rUqcvTDD5lW42UOrPXuHrZsklMS+fCBzMOMjVfEeZobL7hkPpSHhEl/pkPSNkQGCtl/B
         qA4t3qwsH4WU81eM7OaTE3eIwSatjYVdeHV2biM0x5MMUI/oxbzLQsIgPbd0WxlYL5AW
         Afs0RnYIi/seJvXL30sPdTDunWGT6pEgKv0ORgY1J6+XYMAcUN4Zl5jYIh5JlBo2tG6g
         dkEEZb/ErPYlDpGfQIp3EJmpLlnO9XA57GtYhV++pU9OAgfhg7aC0Uq2RgHNwsxJv9Nb
         5m8g==
X-Gm-Message-State: AOAM531NZr/w6FhDj7NLXl603/nLTuAAcQjMr+wNm8zSeQbzmxz1lnLs
	hzruZ/UPfAk4JHiWaF817ppoRNFZU3itqL9PeBY=
X-Google-Smtp-Source: 
 ABdhPJzwXMitYsY7lnOjrK20/mMspTKK4/n0wrX+SuYYvoW6X5ZmgSuE0bSN4CICg/6Kz6U0ZaXL2g==
X-Received: by 2002:a05:6a02:114:b0:381:4931:1f96 with SMTP id
 bg20-20020a056a02011400b0038149311f96mr19217189pgb.331.1650463725699;
        Wed, 20 Apr 2022 07:08:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.08.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:08:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/27] babeltrace: Disable warnings as errors
Date: Wed, 20 Apr 2022 04:07:53 -1000
Message-Id: 
 <2d6d5317b4cd748b896a2a43a005367cc83938bb.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164673

From: Khem Raj <raj.khem@gmail.com>

These settings are good for developers/maintainers but for distributions
generally disabling them turns out to be better especially when there is
a knob to do so. This fixes build with gcc-12 which find additional
warnings

    inlined from 'bt_ctf_object_set_parent' at ../../../git/src/ctf-writer/object.h:120:6,
    inlined from 'bt_ctf_trace_common_add_stream_class' at ../../../git/src/ctf-writer/trace.c:1243:3:
../../../git/src/ctf-writer/object.h:141:26: error: null pointer dereference [-Werror=null-dereference]
  141 |                 if (child->parent) {
      |                     ~~~~~^~~~~~~~
../../../git/src/ctf-writer/object.h:141:26: error: null pointer dereference [-Werror=null-dereference]
cc1: all warnings being treated as errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1898d10dd4d4372823e6c8b8c4ed28604e692365)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
index 248b84e98d..b48f07ea0d 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig ptest python3targetconfig
 
-EXTRA_OECONF = "--disable-debug-info"
+EXTRA_OECONF = "--disable-debug-info --disable-Werror"
 
 PACKAGECONFIG ??= "manpages"
 PACKAGECONFIG[manpages] = ", --disable-man-pages, asciidoc-native xmlto-native"
-- 
2.25.1


