Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3C1C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 16:16:43 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.37640.1749226593389812751
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 09:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JwpDk5KU;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acb5ec407b1so406001266b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749226592; x=1749831392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pYP89WTt/QuGgo1mCZTHXYdZDNsMBv4wWLX7YrlzdsI=;
        b=JwpDk5KUH8QOU1TaeoBijaeUyvR+rxr6xb6vdEKij+BMACkQwV5DZXMccNVi0mHgss
         For60hRWRfhQ+LIjA0SYORewRXx1EhulP38Bwl7CCyLQUffkWUOuLizXiXQScPLu43p1
         phxT05iPEiYs8ghmmAaC1kNWuXhaYAymbyuA6Ha2a0izDMnGkJcFAHBprA5fOhr1MXFw
         ReESfITWTfTvektrZ7VJCee6R838ciXL9UNr7W0fymj6udafbqkzSFv1JP21FRb5kZ9f
         wct549GbmQdF9s1oljwp3gZpEUEet1pEeuaYzYTbatCJxwajJ/xNfL1p1m42psZll/8Q
         7FUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749226592; x=1749831392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pYP89WTt/QuGgo1mCZTHXYdZDNsMBv4wWLX7YrlzdsI=;
        b=gIw92SGRpxaHDC9nbfaJ+szKOwxC0rD/7N63ddfEjpE0TAFClsXm9+e6vZH5GMBaXN
         cbzU4zzZNpHecy0OjV+DYX87OWdxX6gHWux8hb3a8yVBrmMGlzWB0cSqemyOnZSK5BFL
         +S9exvJs1Ml3Q6clbP5jgZj5lqveo4ykTBzg8gz+XtXdZdPYJsyRwxWJzB6iTAfDCGR4
         dGTyDS3M/NoGRsa4LpGmRS3CXK+fc2U5VU+W10Q6MoXUGziw3haBjOTM+q+x3916vwuZ
         apVnFTpt/EAKRFPYnNWB5iSClZeQAFsTdRotDW9VucTty6Zmbse4KuPfrxtODKtBiZhE
         cvqQ==
X-Gm-Message-State: AOJu0Yy/sewM6NuGIGiJ93as8VUTvGTh/vb8862fQtaSL22SASi7sRBu
	aiKsTlqQ3h53HMN+/HWhS8ZJ5ckMmYdIfm4gLN8VjrWmNdCLHnHQAueTgVRw9cyW
X-Gm-Gg: ASbGncsSiyBLfv7LSf6XWO84QrcUT7UoB64vaICIbHUHrw2KfqnAOIzQZpI825rnXaJ
	0xOQxUJYuOXuFm0eV780bwHDaj17MUnxbaalERxy8K8SkXwM+h4ERgvpLAXInJwJrCXth8A0ylK
	H7e4pVoxI+Qq+pWNU7tjnCIBrqDR+bQWvgUu7MMDYW6trB+5sJ74e4jKDck+z+VMzEw5yPsNkBV
	VqErRNE/u/TWJe/nZ/ncba+NuoeVcKN49sX9I1wpjzlf2i49lUEIFaL7wOgtUnTqWuKKgaY2B8L
	SxMXNNiGv0inCc5i+pA19Ro2HF3GYJdcDrr5Rsmlmm3w0rMJKatiWYRM+FPPR6ru/1wWsxRFHTC
	ZmA==
X-Google-Smtp-Source: AGHT+IGF4XYZR0XzS9kw9p4drBGXLQmWCd6IuincegmYRXLIoV+fMdZP4hGyvpnkyYEcAjyG8MUmjw==
X-Received: by 2002:a17:907:7289:b0:ad8:9428:6a32 with SMTP id a640c23a62f3a-ade1aab8dbdmr328146966b.26.1749226591510;
        Fri, 06 Jun 2025 09:16:31 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783c05a0sm1200260a12.44.2025.06.06.09.16.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:16:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] seatd: fix packaging error with systemd DISTRO_FEATURES
Date: Fri,  6 Jun 2025 18:16:30 +0200
Message-ID: <20250606161630.4027025-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 16:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218175

The systemd unit file for this recipe is only installed in case
the target system's init system is not sysvinit (the recipe assumes
that in this case it is systemd). It is achieved by inspecting the
VIRTUAL-RUNTIME_init_manager variable.

However the systemd class was inherited unconditionally. This caused
a failure in do_package task, in case systemd is present in the
DISTRO_FEATURES but the system's init manager is sysvinit: in this case
the systemd unit file is not installed, however systemd.bbclass is
still trying to register is as a startup service. At this point
it failed:

ERROR: seatd-0.9.1-r0 do_package: Didn't find service unit 'seatd.service', specified in SYSTEMD_SERVICE:seatd.

To avoid this, inherit systemd bbclass only in case the init system is
specified as systemd.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-core/seatd/seatd_0.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb b/meta/recipes-core/seatd/seatd_0.9.1.bb
index 87e1c3b67d..ef9364dc3c 100644
--- a/meta/recipes-core/seatd/seatd_0.9.1.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
 SRCREV = "566ffeb032af42865dc1210e48cec08368059bb9"
 S = "${WORKDIR}/git"
 
-inherit meson pkgconfig systemd update-rc.d useradd
+inherit meson pkgconfig update-rc.d useradd ${@bb.utils.filter('VIRTUAL-RUNTIME_init_manager', 'systemd',  d)}
 
 # https://www.openwall.com/lists/musl/2020/01/20/3
 CFLAGS:append:libc-musl:powerpc64le = " -Wno-error=overflow"

