Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20CEC0219D
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:40 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.92294.1738600900454471392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FIcWSIG4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2373302f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600898; x=1739205698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHtA2YOgy1eoohyV3josan608ZfaJVtpyiQVXD3F7Uk=;
        b=FIcWSIG4cEcAIpj2lvSAX8Z/UaKNK3zF75UCjJ+OTN4vqzQzcxcCG6wrf5gabLqZdr
         RJ7jXiVOaKj+a3vr/EY8zpjTg5SVxSZ91R3JTjcldwekeub92kIE+Dtr3OmS7qmmIKVL
         7XXjbz5hEEaGYF1Bye7xfcMQZyGS5q/3R4Ly4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600898; x=1739205698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHtA2YOgy1eoohyV3josan608ZfaJVtpyiQVXD3F7Uk=;
        b=Xfpx023OVPQOqwxpnPKsWI4I2jcH0C0EE4bsUMb0vXkrJSjubJpMWqNIULYCQxjEwE
         OaEB+bmhAH3NEPCjUDoFqfCSaWVuw/EjtfFjd4WHdQTaTlinKMSDPJso2Fnx7IJlkoLN
         8KElEsjpKC7Qk7CdUnCB+vFGOZl9QBPSBmrcQRM+CXalW16YZ6uN0ckc+bPwXjmoyPYP
         BXx5+Y6ywIt7YUP3VE5lDBOQASrjjT+LiAtLCMn5gXclrFE/gftf1lZPpYtOYyurOPSM
         +N0kh7W+NNcvgKiewO4oI4X48pBvIuXxzPfBRfMR5TL1PsDaU+HaOBd5GwleiewdGM09
         oH/A==
X-Gm-Message-State: AOJu0Yz/b6iuZYzSfuDw0prQFluglTCz1/+REq1kI/srAcu79jUaY7SL
	WoMay+WKY9reb9R0mNUH+Fx9iRopLd9rtcxyHZYBgO6W4T5gkSnT0PAoqm6oarAORJwenTrGR0+
	M
X-Gm-Gg: ASbGncsQWADcl2RMycvUd0qn9ztrrXw5/gWvC95PWMyzbatKTW6Tovfa0/WJTLTbZZm
	C8U3vjDtF1bubSHMo0MHvCmLULboa08cYPEfM447syVDDKBK2mUhiuVUAeQCO5eR5c5WUmTllu3
	ndIgw9NIEK9xHyRBxuNlajOg6+bFs2UPSCVtKenwqq2UYupoo4r/GqG6ELDd1l22Yku5DkJpDo+
	Of9n1WhsRqvkYgeoQB35GoyoNPctoPJY7GgTSeKLwKql5kfa94msv4W3hNgwzUNyWbvEDdTRemB
	A+eNWXigFNn9kq3FY91M8ZD/+nyJlFBB87fhLpq/0d/N
X-Google-Smtp-Source: AGHT+IHX89Q1g+xJJ0ogpnpjL40cEdGufQiMPFHNaOHrRMolQ9VHZkmQpBMMgDhiKP+sR1OZfBZzng==
X-Received: by 2002:a05:6000:18ac:b0:386:32ca:9e22 with SMTP id ffacd0b85a97d-38c52096225mr20344727f8f.41.1738600898516;
        Mon, 03 Feb 2025 08:41:38 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:37 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/46] gstreamer1.0-libav: upgrade 1.24.10 -> 1.24.12
Date: Mon,  3 Feb 2025 16:40:52 +0000
Message-ID: <20250203164130.3403325-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210681

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...reamer1.0-libav_1.24.10.bb => gstreamer1.0-libav_1.24.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.10.bb => gstreamer1.0-libav_1.24.12.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb
index 629e9516c30..77c10da39e5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4cf2e2d8204e54ba8af9519a8b9b7ffa6e951a7087afa0dfe83c125d49bbb5fb"
+SRC_URI[sha256sum] = "ef72c1c70a17b3c0bb283d16d09aba496d3401c927dcf5392a8a7866d9336379"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 

