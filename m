Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA495C3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:10:57 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.2236.1743577851406913227
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aD+RPiAZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf848528aso54505725e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577849; x=1744182649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgQws8kiN0xwYaF5xJ5Z1HEYRqEjcS8n4t/UEPguks4=;
        b=aD+RPiAZBXzAIWUsMR/K1pnuyLhghb7QMvh6/xBETa/l6vIP1HeWGgewirJ5qug/4z
         lSQHZvE9CKMRgJNZWJoPtZAWyrqxegvyPvDcodybJpUH0KSdSOOB363S0NHwGzQu67dD
         sgy/gUvn6Pvyy6HP+aRyw/QFaD8EOU7fDBqz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577849; x=1744182649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgQws8kiN0xwYaF5xJ5Z1HEYRqEjcS8n4t/UEPguks4=;
        b=vv7t3WOHRdi/nDptc2M9ds9jqoyWBComLvw/3L3fK73cINEjlf9Oped5Gej34ejAzg
         aHdZaWR4GwUKcDeh50oJrf124Q+RpUn5cHso7FXE0ojFxyXtPVP2P/vnvBqqAJma/lF8
         c+KxoQFchluK3AYk+bIwKkpmF1lho6q6wg13L7YPTSJUGiy/kFRga3OmmMJtgmQVKxoa
         euixCc7lDe6GtIKvTNMHDx507bb5/HxewFCMZydeLrChC+hfTSZaCQBAs2noC/M+whpC
         m7sQbLoAsH21phbdBZWEfZHC1lw0nzQZ611LLOiWVPsCVVSvuoxPROpz/4d1WIE0QmlB
         WZpw==
X-Gm-Message-State: AOJu0Yybe0KDk1hoATNqkGde4dOM15rx0Cq/P32HzC0/nDfO44beShti
	1+QdVKbprH/JdUV6iucDB+tbhr5lLaPcVUaF+TMsXczHbS+mikueFBO04+8WlWDQg9RYbbrGtZr
	k
X-Gm-Gg: ASbGncsEwx7TUifZoOBinIy8tg0vnL1Qm96UqoMGV4ArVqPF7rKY5ktACoM3nEQR2Vj
	l2GYaPV45tYj2Tmm+hL3iAXXDePp0dKO4ZZ9WfCyzO28qbBZpLmT4Rju4gzAKLmOOXhbZaA7V0r
	vneUmwmhHipNvsL+NFZ9OrFjK2ZU80o2RNRTsffgwr0MDiB6vS5gnBStrxiZl0ZAkjAgysPS+u1
	B+yUxVWN+jRNbMdw89xKVRB86isRTchGKEQMEFgkWSUPvGBnNEyCiOrmBntM7tnB+E0yVV/vAHZ
	Ys0BJkFG03/zbHe/OebPI/Nph8ZOjrGBHVghWPa55SXTYPt/kcnYgKtnv7gYhul+WjyqyS5a9w=
	=
X-Google-Smtp-Source: AGHT+IGUTR9w0VKTnqR1SleTWv8xTjWb1iV4GvaflwUYkkDdl08kCND1Rc6Rx4Vhjl2f/IGyJQUZ1w==
X-Received: by 2002:a05:6000:4714:b0:39a:ca05:55ab with SMTP id ffacd0b85a97d-39c297e3c54mr959769f8f.44.1743577849348;
        Wed, 02 Apr 2025 00:10:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.10.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/48] harfbuzz: upgrade 10.4.0 -> 11.0.0
Date: Wed,  2 Apr 2025 08:09:42 +0100
Message-ID: <20250402071017.2157620-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214186

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../harfbuzz/{harfbuzz_10.4.0.bb => harfbuzz_11.0.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_10.4.0.bb => harfbuzz_11.0.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_11.0.0.bb
index b41e55d7069..ea0819af2b4 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "480b6d25014169300669aa1fc39fb356c142d5028324ea52b3a27648b9beaad8"
+SRC_URI[sha256sum] = "f16351bafe214725fe2c1d5b59f0d93e49905a4b247899fb90d70cff953a2b9b"
 
 DEPENDS += "glib-2.0-native"
 

