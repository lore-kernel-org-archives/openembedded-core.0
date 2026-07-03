Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E71C43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:30:08 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88745.1783067405919176846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XdIzj9lM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4720d22c94aso295415f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783067404; x=1783672204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bd415es3mjzIyc57c/a/ey1eJTnwks38upqN6o9REIg=;
        b=XdIzj9lMfzKyhWVzKDAXJgg2kChN7PaWs87jtt+iogQB/T8KqFQrjiPtBibAOhivWH
         bW94Qfl/0wjup9ISiwNMOUmBKzQZ3qt0B3E/7on5eW5OmDde6ZnlN2tklaRNnZ5QYVal
         BbfTc8brLYFdQcrgGH0DlFLcbMwOh0caR1yAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067404; x=1783672204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Bd415es3mjzIyc57c/a/ey1eJTnwks38upqN6o9REIg=;
        b=kvbQm1WLqppe8ix98xMjHqUuOaNHUyVI5siwKRLa1acS0kPB/INYmYzURrIzFO6pja
         hg1mT+Ue+WlsszYBMvRWNVWQ3IgqfZbV3TBSOVmsGXq/VicMPQW2OYZN4ICzaeuQNO5I
         pWYZsMcFQrjiFiGrcF3bJjMGpkLYkJIB6FyBtZ9fN49eWn/ZdLltShdOiS9qtvyaA/s4
         FAarKEX65uNp+FDekr9oAWnO/qjYFM0cAVhvft8xVwc7C7jF+Ctq3RWAmHBvy4Du2msW
         ZJXGgBCVRYEncRPerGSQeWT+Gqd4LNifuw9xSk+ma3U4TGS3d4RrU1unHCwJTLrR0cix
         /GHA==
X-Gm-Message-State: AOJu0YyOruYZyhgfMCRq88bf391hl9woK+4C2UJitvarUGBNNBdgzj5U
	rEfmLrvCNAB5cJDk+3u1TFEgXfvxf6ypTT9NZRsEafrvWHQMpIoBWdjbx6ilLmNuKW5/e7XBDx6
	3bT0Pmdo=
X-Gm-Gg: AfdE7cnLv5Ft/567xtObFHXQ9RmfS2+Ke+oneCwWByibUhw5ucdkv/w7K48RZI3F53n
	f7eTgHP7Ng1YdW6i21DgZBuDj5TKtVDZcEiBj+qL9gqvY9NIAtU9C/sdsXWg6PrSGf6GCS3C2k1
	9lGgVhYvX0BZZYTwFDc+LDnwcpG6Rmm91jwLJsULU/l805HIncIDv0/4FJqANsH/0WE2FGXb0uH
	ePeL9solx1cHpojkp8QiUBPvUnoKB33lMRwV1g5WZi3OcCYfG+zSUhGgS3LGMgeEnWYIl2EMzYT
	ii7MQHHHfiF5OLjzhIhzzTboQqPCO8iVqQYHwC3A8QujjNm4utbMxtdJHa4jDV4hZOiWWetktlR
	dOOBr60tAsXY1fzVMipWxgLWjThCdPAy50N5+glQgI2pEcp7hNLmmIbJjzkvTt/UwwMLoDNDzbk
	9VsEuNw+q16EnK3xUZMgdR7zDv55EZaOPaBnrQrOh88Q==
X-Received: by 2002:a05:6000:29c6:b0:46d:d90b:bbde with SMTP id ffacd0b85a97d-477b10fff8emr8645817f8f.38.1783067404046;
        Fri, 03 Jul 2026 01:30:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm15684554f8f.2.2026.07.03.01.30.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:30:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/15] enchant2: upgrade 2.8.16 -> 2.8.17
Date: Fri,  3 Jul 2026 09:29:47 +0100
Message-ID: <20260703082955.1585712-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240089

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../enchant/{enchant2_2.8.16.bb => enchant2_2.8.17.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.16.bb => enchant2_2.8.17.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.16.bb b/meta/recipes-support/enchant/enchant2_2.8.17.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.16.bb
rename to meta/recipes-support/enchant/enchant2_2.8.17.bb
index e2c6eed602f..4ba65529634 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.16.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.17.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d73162b5eff401a6397e1215e2b103bcef83f921c396c7f6b1394d2450d124e2"
+SRC_URI[sha256sum] = "ee40256e271d0bc1f212ecbc8b8d3da9066b33c9ca987d266759665eb0ca694d"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 

