Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C05C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:51 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.4759.1645478690663250463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FVUyo5Y8;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id z16so9982421pfh.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vKd9KDacdqODRW6o6RKgtKg0k966zg3sVoyPoK6lRjw=;
        b=FVUyo5Y8BMK+lOIB/xBtmimADFKe1k9xh8WnNxGVmAo+SYQjykXsTaZlmLfYneWGJV
         CyL/lN42kEL9pnpljPSOPlvc1Rh4MCST0ZQxkTbqNIVfZDvEe1v7tnTrNsc24ygpDCzA
         S5ybr4Pkm6SokrJEVRR1uZpqie6jr/tOXY6InVorQ1unh7zwSkEX0Rac7AGNayjQAQkA
         wg+EZTiFz9chxVxvYR0shqcvv++ZQk4NB6SwRMCzhMo7RtxSpgok0ZvoLKpr3YtuZrGa
         TUfoUCJssv0jxsbb34HS1g6QIW/kD+q3UY9nooCvJL6fss+o//XTjVoE95W9BgrT65ue
         8vAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vKd9KDacdqODRW6o6RKgtKg0k966zg3sVoyPoK6lRjw=;
        b=46+n8c0OVJhCRaHmCbarZi5iFJz+//DEbfB8/G+UeMQuHPmxMZPG/Fi2X7Yo1lzkhg
         +vCYqdLVI19zTV0jzApxSStqgShqFybpuAk/7DXaKj6cl17i7jVbxdgUFkoqlCFjR3Wv
         gzj2QwpwMRzuzl+POzWnL7zQhvTwRn4DvTKMxkGymHGkzMnQDMu/WO09zcI1d6WTuIYZ
         P55/nrPc17/kswATdw/D0wUNo4XDLBZcGxFMJiX+XXss06HrlcoisDwhXoXfcAPepxEQ
         8XBebRwaEyXfJopYetLEv4S2AShZgzzwguZo+bOeEJ5nOrrmy1sBqNPTTv12oG6qO0bS
         K3gg==
X-Gm-Message-State: AOAM532W3ly+UrcYCPDVkGVP0e+qOcG5Ru1dhcDMubodIcBVnBc7QMXW
	dNtVaScsBDxgtGVwzLNDV7Q5DRjQPPJ4zw==
X-Google-Smtp-Source: 
 ABdhPJxu3EX56nzfDIIS0P+9Y4WlvqEHCGMUv8WHHptWZZax4vT9iK3d3Fbaq2ukU67IV1QItTW0YA==
X-Received: by 2002:a05:6a00:140e:b0:4e1:c81a:625c with SMTP id
 l14-20020a056a00140e00b004e1c81a625cmr21090589pfu.39.1645478689789;
        Mon, 21 Feb 2022 13:24:49 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:49 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 29/32] python3-dbusmock: set PIP_INSTALL_PACKAGE
Date: Mon, 21 Feb 2022 13:23:44 -0800
Message-Id: 
 <c54627dc2aa35c482b25149a0c6696d0dec294b6.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162105

The name of the wheel as built by bdist_wheel is "python_dbusmock", set
PIP_INSTALL_PACKAGE appropriately.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
index 8d97f0d360e..3a9cdda5f62 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SRC_URI[sha256sum] = "6f4ce7650ecbb022684dc158df720e199635f3a3df75f7020f4fe8f6ff0394db"
 
 PYPI_PACKAGE = "python-dbusmock"
+PIP_INSTALL_PACKAGE = "python_dbusmock"
 
 inherit pypi setuptools3
 
-- 
2.30.2


