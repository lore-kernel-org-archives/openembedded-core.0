Return-Path: <c.finck@enlyze.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17585C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 13:10:55 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.10815.1651583453441335022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 06:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@enlyze-com.20210112.gappssmtp.com header.s=20210112
 header.b=DvRAUy60;
 spf=none, err=permanent DNS error (domain: enlyze.com, ip: 209.85.221.48,
 mailfrom: c.finck@enlyze.com)
Received: by mail-wr1-f48.google.com with SMTP id b19so23269219wrh.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 06:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=enlyze-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jy5mW08DhFO3lMhUtVn4kQ7Vuryd5iyMn1HibmFlS64=;
        b=DvRAUy601g/qccq1z1uimSYAp1hoopVpyjHjz+i3YLPiTjCUPGi7fsIVLW0fLj/3mr
         EzdnwJS5/dtO+BWNaWgomwBaqWq2nYJGLUmgb4KzIj759Zd4qpkkEOV7pMghlpLm8Ydm
         m+c3oHwmulefcqouYlGg/Mb3MWNIgjpmWs6p+e3ImV97gIAwEURwLOfclA/yIF6O8KlX
         kUG1pKbPpFryP08psJtu2AFQzI/jm8T6JJdfZ77LieWmmwAPkes44YFQfU+t2cXEunp9
         Z/ODMP0TWKBN+m5Bqj60nWQx6A8P0p95QRtM0fXXCVpRevtjRCC3EZdWU4ovO8Ffb6Y1
         MrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jy5mW08DhFO3lMhUtVn4kQ7Vuryd5iyMn1HibmFlS64=;
        b=pO2ctX8DFR/ExA0oxPW23Awh7ELhHd+U8+r6lLV/6ufrO4qGNgaTWnEpHBVlKU8SkN
         bd6Knvt6lHAuWBycwsP3kd/2gUMofz03vCiw08j+kqnuRcMpR/nCz5MSu4cDH5GYZ2jp
         vTdkOtAtzT9wPmUmtwL8vCD2rHzte79qnWVyB3SaGrGuufvD6upLFAiDpEn2oZCVncy1
         GVWt+vJ816SVE4C/wZVd0Ip0vzXMra0O05/9T1ouRg1xh18s1UX9W9pet+WtqtacNS5T
         j/3oAsSUH/uGL2j/Yw8D4sRzUaitUu9cYY8ZypyrhiCz6ZVYJXxqhIv6qHGDuBskv9ID
         y2uw==
X-Gm-Message-State: AOAM531fiEadtlzEPISHAb1pn1AReIiXyPtq66H81bulmeSnsp7+w4Qi
	pZqalu1Wx+0y57gbVir3eotN5JOBedbyepPg
X-Google-Smtp-Source: 
 ABdhPJyw3XQzqTFAYt33CnIJwtCPhXJLONihhO8moffNZAPc6F8c1ivQhd4UaQRrELCToBFeq/qmbQ==
X-Received: by 2002:a5d:4645:0:b0:20a:db5d:258f with SMTP id
 j5-20020a5d4645000000b0020adb5d258fmr12148725wrs.135.1651583451867;
        Tue, 03 May 2022 06:10:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-89-0-59-178.nc.de. [89.0.59.178])
        by smtp.gmail.com with ESMTPSA id
 l7-20020adfa387000000b0020c5253d8fbsm9292482wrb.71.2022.05.03.06.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 06:10:51 -0700 (PDT)
From: Colin Finck <c.finck@enlyze.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Finck <c.finck@enlyze.com>
Subject: [PATCH] networkd-dispatcher: Update to 2.2.1 to fix CVE-2022-29799
 and CVE-2022-29800
Date: Tue,  3 May 2022 15:09:57 +0200
Message-Id: <20220503130957.282-1-c.finck@enlyze.com>
X-Mailer: git-send-email 2.35.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 13:10:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165201

Signed-off-by: Colin Finck <c.finck@enlyze.com>
---
 ...{networkd-dispatcher_2.1.bb => networkd-dispatcher_2.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/networkd-dispatcher/{networkd-dispatcher_2.1.bb => networkd-dispatcher_2.2.1.bb} (95%)

diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.2.1.bb
similarity index 95%
rename from meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb
rename to meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.2.1.bb
index e929534c3..84aedd410 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.2.1.bb
@@ -12,7 +12,7 @@ inherit features_check systemd
 RDEPENDS:${PN} = "python3-pygobject python3-dbus"
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-SRCREV = "30e278e50749a60a930ceaa0971207c6436b8a0c"
+SRCREV = "41e1d0f123c1113de24bafa3f23359e647945173"
 SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher;protocol=https;nobranch=1"
 
 S = "${WORKDIR}/git"
-- 
2.35.2.windows.1


