Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75980CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 08:37:22 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.7675.1757407034729198723
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 01:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DUq94QpA;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b04b869abb9so412735966b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757407033; x=1758011833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UD6dihpx5JHyr6K3Cn25IUQVRafDKeKCtR2t1lXyqWE=;
        b=DUq94QpAgY0vBByTwk0bAE/CuAAGFVfr7FqtJnFYFmOHGGwbfpagbwIGl/7EHjUAkb
         dC4vfpRSbuRPVKtO6rbZAn/8FvO3gCaRHR/LFMnSzcT9xnAAg8aNZzbBq2wpSVZD1iVt
         cwI5Q0JxT8bLPFVJCZi20CR6nhtyApfzmRBDAibrupAKQMeS8gMgll2t2K1IxSgJJ/en
         mIFzkzNIQFmPxHDHeU/SbffsIRleIUlht4CFgFXs/nmVB/B4/KfgnvcDGYrLeLivFIZ5
         Zlk4wLdn5I722ScreUSBA13KoykEP4NBuAAmTEPLaI0LV5RNi6UfmYegKr35dPAvQ1Ea
         5FRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757407033; x=1758011833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UD6dihpx5JHyr6K3Cn25IUQVRafDKeKCtR2t1lXyqWE=;
        b=DI1HuVT8Q+26XdzDci28zT4fCt9bOxuNW/D3YMgfE1+4kZnDqOOFfPrtcfXR58dxgO
         wMbFhi1iWtdTnNzyPrsd/nYmUtSlSgkKwSeneoY8NOowae8GaPm86QRJtyNZTgWxvgmZ
         z8DZIgLBj3UqbS+6cAjQkGWsSgubiq/XKsYgD4+1QyJNfyEl4cbxVExvBnBJWRaJBC0e
         CS5SO/i1kjUtSZpXNvE18p/T2yycJGYgrkFpiDgKrGd3iLACYj4ppVo/3TOdI88XXOar
         uBj7hwtE5SP9oIyIOXJsEkRJbEGnNhoj6KN889FmxebidbCAQEg4uyp4nlLQC9bQk+qf
         A0GA==
X-Gm-Message-State: AOJu0Yy9Wde3nx3IDwvWuPD4qJvopjZVMnYXp2eUXy/PdI9V+icKaM0e
	dwosthSYW3EgrXdmV04cd98ky9rfXIzmPKQ7KPkcE3SpWxfD4Fw+fJQNtqAppg==
X-Gm-Gg: ASbGncu67rUUIS9LdsgjTn4/kygYlHJjM0hbfHrc6V1ZBaukqK9W4PQQfHcQAOohYE1
	pR9fn1sfDoHZ4lriQ9H5VCMz+dFQS+AKdRDvCsvEZOCXsE8V7Ws4tnZWLiF4DLYOqb6G7QbrzsF
	7tqb70ZgIToQAGxj9Wa2wkEJCp5EnsaKqyXO88z5a4Caa/C65zsGDECLvWUkjn4OSDBb2dQq4DY
	zC08eiZmQIUL+e6W3DoRR9CwbmoFb4AMP6ivPS2KkcjasfrUF2wPjSSPKSRCF1WiXidtGFZDS9E
	souFXt84hDq9PG9pxqGNsJTLB2sKpiKtp5F/GubqUFduNM9eA8cEEufahBc07RT3QR3mC69z0XG
	VfmvHVF994T+QhmOK/Jqq
X-Google-Smtp-Source: AGHT+IHQeKXu1equbcYtNRJzTK5yqsteXioVxEJ2EwNx2bWaHc0WG9S217g760/R4r7X5l7429Xabg==
X-Received: by 2002:a17:906:6a2a:b0:b01:8f7c:2362 with SMTP id a640c23a62f3a-b04b173d90cmr929707066b.65.1757407032530;
        Tue, 09 Sep 2025 01:37:12 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040d44c9adsm2336527466b.9.2025.09.09.01.37.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 01:37:12 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ofono: upgrade 2.17 -> 2.18
Date: Tue,  9 Sep 2025 10:37:11 +0200
Message-ID: <20250909083711.3491778-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 08:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223094

Changelog:
Fix issue with QMI and handling SMS message acknowledgement.
Fix issue with handling SIM7100 modem ready detection.
Add support for forbidden operator list.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/ofono/{ofono_2.17.bb => ofono_2.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.17.bb => ofono_2.18.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.17.bb b/meta/recipes-connectivity/ofono/ofono_2.18.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.17.bb
rename to meta/recipes-connectivity/ofono/ofono_2.18.bb
index 36bbe9439a..e2666b3e7e 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.17.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.18.bb
@@ -10,7 +10,7 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://ofono \
            "
-SRC_URI[sha256sum] = "70bb50997d3a7657edf133355677f8e04b2158bcb031118a67b296107f6ea73e"
+SRC_URI[sha256sum] = "f74c3bba7ebac488fed7bcfa6113b0e39e723d2e1a24b53f79c9f18a1c85dd00"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 

