Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C60CA1013
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 02:13:13 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.13654.1758200869513361867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 06:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NTIdq3L9;
 spf=pass (domain: linaro.org, ip: 209.85.208.49, mailfrom: tudor.ambarus@linaro.org)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62f1eb1abb9so1554412a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 06:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758200867; x=1758805667; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b/IAVXeuzedxY/zwtuKVn9ONP3DcFK193tYOPmcpXsU=;
        b=NTIdq3L9+eCPcImhS0hr6rwgmM0cWkWBHlnBWPaumJ1AKxjfqu3IEHWB8MOLeNkqb1
         Ym2YkaMQBwyGJwDvQgXNZjCUyRK12ALruO/Htf01PhbIAeoVGzNGhgwYIZz4XwIJ+rI6
         tY3ljlV7v9OUIiFY0kn7QYr2z0zX0h6H2k8G2CU5ViIPlTiyvdxLghi4IjP7+cR6hwTF
         Saxjpp280ZUy3WKZNtzqo7C7SHxuet6J7I3PLmozksJ4AGIdjP46HGzKFfvNioSHgO65
         8aPs/PZuVf3EVF0ir9NFfcGq2/FuakIf2AsmXSlb9BOptqmzplN6RuY1JFHKK/KVWW/n
         G7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758200867; x=1758805667;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/IAVXeuzedxY/zwtuKVn9ONP3DcFK193tYOPmcpXsU=;
        b=ev3hPQOvbDeQLBxofLs1DxCSzt18kpxTLQJ2gDX3WMiNYiGqk4iKRqqDiN5wcSrkzt
         V76VQifAgrC280Xl3AeL7I1nMX8FbxfI/jmUsI0t30ETYhIci7C4wWSCoIEkjUtJgBOx
         60nzIZYUTTvm+Ctw5I57OVG/Moj4E4SvlzToPjYtCrh/PNp2yy3AU4j9IdgQ8SN4HUCF
         LXn8N/DH1755ZqwbI4LRF3r05AG1oAwtPPxtGBkG0+udBx/YSeGQtak1hXtiKdOHfP8y
         SjrthUsPwZQLo7/HISTygCMutTIqMiTbavqwNjHGy8h3ykircK0wwW/IX+lChibOe0EQ
         O1FA==
X-Forwarded-Encrypted: i=1; AJvYcCXldsm71fIvqQY975D9C8b14t22F+/x8+A/1ZYMvea3VPbYBulvQMts5WEUH98hAeNgIprxo5tMDqYVTlGiszwdOg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw8cybnIryHqP37rm4uvhUNhdf7yiYyo9rHHfJbD2Pk2ZGxM3t9
	pVDjmo4zIp3MU6v96I7H4scxFHcjLLdab/yIjL4VOFnsYOK4nT0FEZgnDNFrz0Rd2SSJEaMDH2F
	P55E/
X-Gm-Gg: ASbGncvMEmYpgkXX2P6nXtvosd/uUc0FcG7TAxDZD4MTeye5/KYoSCmAQuyRxyFt+b6
	0L0blML9BkjyLjYD98B2/SqhrITc+HznmKj7JIDfyCiFy8gqrmYRSTslgs7e08PAfaolyi0SqVK
	vOQ0hKvA4gBahn3/rcuEfsgVBJmB5fEn8ua7douPjCN+enT7KF57+MhK5eB9p4sFpDo8EvVW0Bp
	OeYVWfBryZbkfFnC/jez7tbY3Jp2fKuyPMUOUNQznSuTAVCJV485ADatnySMdusIk1WDJeQwY46
	qaZfgsnvphMAvsrIUuL+dn+S1NBORovQX6EAaP7sujsgbLSwMua9mwQedRV0vJmm+Y7JK87M8FV
	JmcTemNadyA2ibz5dkRUCEYFMDHN6iDAySBMJe5OKRrOiBQWzu8EQwj7kDzLK2AW/eAk+qijOdj
	sSQPeXpiREFYYokj4qwg==
X-Google-Smtp-Source: AGHT+IEHWh6SwteHOYjGTg7REdWlpUAbfC3N8aklhdS//lLJbRUELS1NLaj0pkTcmcQgyijThZVO8g==
X-Received: by 2002:a5d:588a:0:b0:3d6:4596:8a3a with SMTP id ffacd0b85a97d-3edd43dc793mr3008133f8f.17.1758200477921;
        Thu, 18 Sep 2025 06:01:17 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee073f53c4sm3731948f8f.3.2025.09.18.06.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 06:01:17 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 18 Sep 2025 13:01:04 +0000
Subject: [PATCH] kernel.bbclass: add lz4-native dependency for Image.lz4
MIME-Version: 1.0
Message-Id: <20250918-kernel-lz4-v1-1-b40ccf21bbe3@linaro.org>
X-B4-Tracking: v=1; b=H4sIAI8CzGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0ML3ezUorzUHN2cKhNdIxOLJMuktLQ0g9QUJaCGgqLUtMwKsGHRsbW
 1AEBWjjhcAAAA
X-Change-ID: 20250918-kernel-lz4-248b9bfff0ed
To: richard.purdie@linuxfoundation.org, 
 openembedded-core@lists.openembedded.org
Cc: peter.griffin@linaro.org, willmcvicker@google.com, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758200476; l=1778;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=P3lPExGFe8Lia5zz2/lz+PgFc0LP0voiIMM62IhiIEs=;
 b=uUKA8oKhp4BUwLg9KYqbqRi/EGQ4VYPcpYFkkSNoWmOO8inV03X11/MO43pGvZFBjMDjw2Hmn
 TbEBq7EEyhvA/V8T90rJGA/IERcmEgUZ01DrJctgkRKTj3OHusuwCTc
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 02:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223716

The pixel6 kernel build fails with "lz4: command not found"
when KERNEL_IMAGETYPE is set to `Image.lz4`.

Upstream commit 0c7dc5bae1 ("bitbake.conf: Drop lz4 from HOSTTOOLS")
dropped lz4 from the global `HOSTTOOLS` variable. This meant that
the lz4 binary was no longer automatically provided to build tasks,
causing the compilation to fail.

Add a conditional dependency on `lz4-native` directly to
`kernel.bbclass`. It ties the dependency directly to the image type
that requires it, making the build more robust.

Suggested-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 meta/classes-recipe/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index eb03424dfc3e023842f7b67ef47468210af72cd1..003a155e794388efd3fa29c2c946b18542f4cef8 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -20,6 +20,7 @@ DEPENDS += "virtual/cross-binutils virtual/cross-cc kmod-native bc-native bison-
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.zst", "zstd-native", "", d)}"
+DEPENDS += "${@bb.utils.contains("KERNEL_IMAGETYPES", "Image.lz4", "lz4-native", "", d)}"
 PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
 
 do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot gzip-native:do_populate_sysroot"

---
base-commit: cfbb00657ab961a3c3a8e6619fc08a2a3f4255c7
change-id: 20250918-kernel-lz4-248b9bfff0ed

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


