Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3735DEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 17:16:35 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web10.1691.1689700591815779344
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 10:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=kESLWoXv;
 spf=pass (domain: baylibre.com, ip: 209.85.221.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4815b8b341bso1995236e0c.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689700590; x=1690305390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4DqUZLM8nBWKG2tef+Y4a/pcdMjqh/YHvL3CWj19Qw0=;
        b=kESLWoXvIVetnXDZf7D4BWzxIKNtGyCeVuJp/znKDpwpRcCSg6w1pWGR+b/8iOkx9P
         0lMLvt7G4gXQH8eD8oOWjPlXltcd3hOObkU3yKqEGbxsnPKxQviJE7gPyTdlhpl7sDl5
         Z1bwFIwsjhE42UFm3Lot1+Zjbb9QkyK/wzeSP2ZlmTzR0PESdGPx4p2ChMN9K3sqViGg
         4ijt2uluaJcfj2NN3txJrslgI2LPnI7xew7jx1IDNCpQcLNlKC5tDF6FeEo3ULC+dTrs
         NUtJO4bRZgy95ruD+5pCTzxdm4Nl1P5Wsojox1fzSvZQD16jggB9EO/qoCO74lLOLFv3
         XpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689700590; x=1690305390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4DqUZLM8nBWKG2tef+Y4a/pcdMjqh/YHvL3CWj19Qw0=;
        b=VlQzkDmngsiiFRjL2n2FXRmHQEQhoto0aMAUEBjF3WDZaEnkgU7FVJ9380LEpOenqk
         0W+0ZCqquQcIpNb64HrfS7OFYxQ5GzyxwT6qlVEYlaAs6ZVt187Yf1Lr0hKxaBGmxlTs
         BDUyhDJYABtoqnyBhRHkW+9XZMtfuvCpfqe4g8IJZgtcyjXhMU0m4OAdq55HAPdZoQZS
         JrhSSfFvDA9B0tl6oCGwX4jKpZQFptLQr7YbwD8Y22x7wVnTQTX7BnHwcYROujVfGu9E
         CW0uaW6/S4arsgW8pyLvnQ5atny8ADm4O2bUop5EWcibOskXnN7H0xu0q+IPQ72RTve4
         vhVg==
X-Gm-Message-State: ABy/qLZ2OCK0nFz+HUDks2I8drl8oMOFyKDvSWY2zBhbGSZtW+NB+QAl
	ZUHYrmpO5K+wAcXwY0ggjUsJKBWa1FDvfCwk00I=
X-Google-Smtp-Source: APBJJlHjmA/20RPKSQJxgmUX6ZOEqZI2VchsB97W1xdwbH9jVYAgMg4hzn4tufniQ7WmM62lCnSqJw==
X-Received: by 2002:a1f:5e07:0:b0:481:3f5c:91b2 with SMTP id s7-20020a1f5e07000000b004813f5c91b2mr2429861vkb.14.1689700590557;
        Tue, 18 Jul 2023 10:16:30 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id b12-20020a0cb3cc000000b0063cbb29731dsm292344qvf.66.2023.07.18.10.16.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 10:16:30 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] linux-firmware: upgrade 20230515 -> 20230625
Date: Tue, 18 Jul 2023 13:16:29 -0400
Message-ID: <20230718171629.2883637-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 17:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184552

WHENCE checksum changed because of updated version lists and removal of
information for the RTL8188EU driver.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...{linux-firmware_20230515.bb => linux-firmware_20230625.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230515.bb => linux-firmware_20230625.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index 3470131294..329a3e3c9a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "a0997fc7a9af4e46d96529d6ef13b58a"
+WHENCE_CHKSUM  = "57bf874056926f12aec2405d3fc390d9"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "8b1acfa16f1ee94732a6acb50d9d6c835cf53af11068bd89ed207bbe04a1e951"
+SRC_URI[sha256sum] = "87597111c0d4b71b31e53cb85a92c386921b84c825a402db8c82e0e86015500d"
 
 inherit allarch
 
-- 
2.41.0


