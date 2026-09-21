Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8B7C982F5
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:21 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43881.1789974432709938100
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CfcL7vO6;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so25895615e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974431; x=1790579231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YVtp32L86Fyy9i8HIyRIwOFKQ9n5eAkSfJ7gGxWBf08=;
        b=CfcL7vO6w3tYQa2XXNadQPsZWi63ugSoOvEKrvLe3XeIFapgG6pbxOlzusn62S7Qv9
         NDzEp3X2Kyh70lu2fqe1+3oGm+gcbLWf4UcAZMIYyfr0wFlEwVePSsLInMLsCxQa1iaM
         t0q5mDsEJD6gCOE3bjzaybKwhUvZvH9f9DmD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974431; x=1790579231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YVtp32L86Fyy9i8HIyRIwOFKQ9n5eAkSfJ7gGxWBf08=;
        b=yOI9X2UrKYLs9vvgd0CNrDl2f89dQQx3eKK3x+cWHGzicYCncnxj62teqYpg5EtVz7
         1jm/04tX7/zZfsP0cnUORH8UedKQLeEqH4Q+NTwH4r6FZpW2SZcS2RyHhEDTG/pKJLGg
         NJtkwR++ii/8+dPHvZFzKPYIoGYWp/b9gGkSZ9rsstqfPR/g6qJc2a4+ibzOY4dKf/TC
         g70TTkDe/YOHNEOiFz0y/C3DvYToihS46S8u+nWH+CnJvygKKXVmZ5K+XV/2MStgo5xy
         jWSRph7RFW9gpcmKuZ4udUwQlmnw8CQ92Kzg6o4ORpHbPFg6LRJxs7ETz/Kv6NstIo/O
         REdw==
X-Gm-Message-State: AFuF++n+1r/yXbq5cIh6LntABYnW0TkB+I9o8O7U+Oa5g+dkYFQ5iG0W
	U5YoTymLVJUL0WIOxbVKgIpdv1lAvpz4W1SPoQSanaqCGQp0CbpCzX5Tvx4MLflJvULDKhyfGi7
	UzmWzEcc=
X-Gm-Gg: AYBFou1MLGdcJ+tpu0RcKJQh8IXyk1Kd0Pejcng7o5YX21CarXep3NegSyXPOgMJ12P
	86gY4LfqL84DvEnZyLLJ1lbNuei4epXHV9C9ZhtRgOyA1u/OVNOJgzzZGiZAdW2QYx4nEWdUphO
	vkDKNYuGj09lZGzlgmcQ348qY/Drg8DSUbZ5VM4xoTnNTf4t5i6VEVZxtXwUrxbOj610F9T6MqM
	VILu7U52x/dsuDqt738iUVrzaxQd+1mO1P1CiDVHko3rm7ML/HO2G/mrzVAOSGFPjxc8ecLq8AL
	FOOkoJGs8r7HgE7orprOgDONIdfRcFjW9Gfi5tdnvRSkrXBPA+CV75Zlt5u1jVaEvkVTQVrNDvr
	p8/x9rhj9tTO6TXHHii+1V6E96CFhxn14msTnZdSV8ZVCOmsAral8GvX7snvQDau9LmfJdmezIa
	FmZfx+MGAGVmrtkS4Flrpihca66KvoISz1tYsrGmX06V8sP46IQNrCteVnLV5+Wc8sM9f3/RtOm
	H+kRYij8c2UkbY1bgSBKxUf7r0qHfW1GNeKNw==
X-Received: by 2002:a05:600c:34d0:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49fc5671650mr132879675e9.3.1789974430809;
        Mon, 21 Sep 2026 00:07:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.07.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:07:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/20] barebox-tools: upgrade 2026.08.0 -> 2026.09.0
Date: Mon, 21 Sep 2026 08:06:46 +0100
Message-ID: <20260921070656.521680-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
References: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246297

"""
This release fixes vulnerabilities in the FIT image code. Most important
one is fixed with "FIT: resolve FIT images case-sensitively". This
vulnerability allowed to trick barebox into verifying one FIT image node
while booting another. The issue showed up in a security audit and is
fixed in this release, stable updates for v2026.04 and v2026.08 will
follow shortly.

Another issue fixed is that a hash node in a FIT image defines its
algorithm. We used to look only at the first hash node. If that says
crc32 then barebox would use that to verify the image data. This is
changed to iterate over the available algos from strong to weak and
see if one of them can verify the image data. crc32, md5 and sha1 are
explicitly no longer allowed. Note that this vulnerability requires
a signed FIT image with crc32 as hashing algorithm, something a properly
signed FIT image shouldn't have, but as crc32 used to be the
pre-secure-boot standard, it could well have leaked into images.

On the brighter side this release adds support for the Novarq Tactical
1000 board which is a switch built around the Microchip LAN9696. Also
the PXA support has been revived, with the PXA3xx as a fully supported
device tree platform.
"""

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index a9f0593e27f..d94798193b3 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.08.0"
+PV = "2026.09.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "5b270cbde7f2fc6a78ff6e748eef788bbc04571682e2f2e964cd15a2e009774c"
+SRC_URI[sha256sum] = "491b504c8a79b5a4e30c419b824916b7329bad8abfe34987ba066bafa1fbcfc5"

