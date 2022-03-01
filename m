Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA8D4C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 16:11:34 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.10068.1646151094318857263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 08:11:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e2lFXtUi;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id t5so5594572pfg.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 08:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RV3i6WDMdAibHR136jnb42qR6jxL9ScHzDcPfK7sZrY=;
        b=e2lFXtUiw7v5d4PjMTUlECKYjjmzpXK5EOuFHBkTg/KpRG9S5RbAtoiFpCFNWmTbO1
         p2Agear3LUy/JmBZb2ai9qeGzA1NM35h79Vkb3VXnVOIfdyT/zLX4QcX1Al3GLYePyrB
         U5a0yv2NIRZUhcZ1y5p79wdYeACjyqs0Cdtcaq95m/9CKa+6iJwtqoncGCdz2NGPckNj
         Y4JETmhZ46egD15KVvFQ2GtBNdpsruIfbadSaEss3dzGPE7SKHwSmcDpncKsVYw4JjjQ
         YH83Kv47FeLNEanMJTmlBhcVhKrCsawrue1yd7zxd8CUE9FNlZ8mEiG/s2L4kTN+aEct
         LEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RV3i6WDMdAibHR136jnb42qR6jxL9ScHzDcPfK7sZrY=;
        b=JE9jEpsDKKp2xyPYJ4xDUaVPW5cZ248AUFkbsLMO1NZxe7zQEC521zbAfBwhAxEBjG
         eImGwcr95GuVg0MkRU7xUIwnAhgJNZOyKZ4GqBcLkr77HNZ2XjCmSoFh5ri5j+Z9GHyh
         BWPOJoZIqlA2Rn1AyXQK59xg0kKAO5BJYSzvCKuaXcWzi+2I6Gwu6jMiG1dFd+E2CuSn
         Pvu4AQb6GNreMuXi08fwLx6mQb9uSkGqPN1SI2lhItlM/KqjQHrXTqApq7vVj6+UlSQ+
         Y3XDWIM4QUr30tle7WmPX74+YEpStTu8yXgV1pRlrmCJlCqGHjcKwBCjuhXDyWqcQ5yH
         cE8A==
X-Gm-Message-State: AOAM5314W8Ojx66OC84y2vX/IZrxsXpgP5Nv8Lti/c6svAm8dCOZ3xzH
	hHIMS5VV7TlOqeAQxIrqT2j/Fknfnmk=
X-Google-Smtp-Source: 
 ABdhPJySO9T8Fky6EiudiHeDl8NDDmbK1Oxq1mQWK5bICT8JCmL8GMVsfpPxs8q/NGvojS/A5ezmxw==
X-Received: by 2002:a63:8ac8:0:b0:34e:403c:4349 with SMTP id
 y191-20020a638ac8000000b0034e403c4349mr22697148pgd.145.1646151093107;
        Tue, 01 Mar 2022 08:11:33 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:197f:1785:dac1:56d3])
        by smtp.gmail.com with ESMTPSA id
 s4-20020a056a0008c400b004e1ac002ccbsm17887772pfu.193.2022.03.01.08.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:11:32 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] flit_core: export do_configure and do_compile
Date: Tue,  1 Mar 2022 08:11:24 -0800
Message-Id: <20220301161124.1538945-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 16:11:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162563

The class should export the tasks so they can be extended or overriden
elsewhere (like what setuptools3.bbclass has).

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/flit_core.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/flit_core.bbclass b/meta/classes/flit_core.bbclass
index 8edbd654ff2..819d12457ce 100644
--- a/meta/classes/flit_core.bbclass
+++ b/meta/classes/flit_core.bbclass
@@ -2,7 +2,7 @@ inherit pip_install_wheel python3native python3-dir setuptools3-base
 
 DEPENDS += "python3 python3-flit-core-native python3-pip-native"
 
-do_configure () {
+flit_core_do_configure () {
     mkdir -p ${S}/dist
     cat > ${S}/build-it.py << EOF
 from flit_core import buildapi
@@ -10,7 +10,8 @@ buildapi.build_wheel('./dist')
 EOF
 }
 
-do_compile () {
+flit_core_do_compile () {
     ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/build-it.py
 }
 
+EXPORT_FUNCTIONS do_configure do_compile
-- 
2.30.2


