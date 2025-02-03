Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97825C02196
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:10 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.92266.1738600869145372149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QZBCM6+5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385e27c75f4so3876328f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600867; x=1739205667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qzGFr+pcLfRPc4Wwuv9ZNihxYeQI1FM6ZmgwOmc55c=;
        b=QZBCM6+5zi2eMyXRlb3AnjORfq5dBmrkrEnXzvdEh9jvI0GW6XslR7LWaZLGCy8AR7
         iC867gWVP3K3DcQ+CawEmNFgxipVVC1a/FNZLt4VZCFy85xJEbUHdXyDDvjFbjXq9wmZ
         AppEandsvyS0R1ETpgsGwaDupbHMtVMg36sxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600867; x=1739205667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qzGFr+pcLfRPc4Wwuv9ZNihxYeQI1FM6ZmgwOmc55c=;
        b=s/zmaFsg8j1Ot8JKzEpyt2IQyXoRyMwlWUiCoy79r0NOWpCzFjj9+eUwQeQXBqdmDd
         So/IQ8x3j0u10LgtmiKntKiTz5TxhDIq2bXx9DKPyeL02VYNeYnkz/Yvdyh91wPb57kW
         Dhh+irH0xsKo4ahcmm0f90Pc27icBbfb/S9R8ibb96yKvfT2fLrNCC7/i/USxzp2MWjW
         Q1Se4xZzh+l9jo3hE+OtfOJdylUP6TrzWNrEk5hmI6YsNuriNCzBqZJUTZVGHLzFw/Do
         GPihx13bIWWcFyTT+/UYNlfQ5Uj0C99dCdHARcrDp5yywYIP79ZckFw1wCSbvECsv3/q
         TASg==
X-Gm-Message-State: AOJu0YyFI7wfuCfD8YbJ7twZM3ZmB+QRFu/LLJDRh79th58esvLl5K+S
	LaH7X4ZnMRY1ehCKOK/8e+dGNcSRKmLgrkLIR0FDrt8NasEsbLHO8zKHmNPQZUIzxKhvGunukil
	E
X-Gm-Gg: ASbGnctA3ycKI29j/Q0YzkY+0nRdBiZn60aplEbUy0OM8hIDWi5FY5J/y7HPDNNPZXS
	2DY0O4wTstX15tVgiiTHnvwofzOKCvWumVR9zUZOFgtiCvkCmk+4gKxM8kQ1vin08JUD2BqfiCL
	8AyAoSDMZU5Plq6I8LXcCB771yI1KLK4yH4LlPjY4WPW9ZQwxV7WWSRJElbov/0Ugjbsh3HsSMK
	qj7UhXtdprssqU56DVQVJYjNsWS3KfYZmQpwhYMbcGdW3TDj5pOeSHXbQXg6do1ssZaM3xlbaRZ
	1rKRNaCJTV9kP2HriS2dwZMsZc9aWN8H19IaUoZnI5t6
X-Google-Smtp-Source: AGHT+IHgP/Sp038wWdK78pb0TGF/CQjkuf0H5jjPbvFWZhTd7kjd13PyCRs2g/q5UNSJoVD7EMmNXw==
X-Received: by 2002:a05:6000:50c:b0:38a:8906:6b66 with SMTP id ffacd0b85a97d-38c52097153mr15419835f8f.38.1738600867124;
        Mon, 03 Feb 2025 08:41:07 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1d0bbfsm13479806f8f.98.2025.02.03.08.41.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:06 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/47] at-spi2-core: upgrade 2.54.0 -> 2.54.1
Date: Mon,  3 Feb 2025 16:40:19 +0000
Message-ID: <20250203164104.3403226-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164104.3403226-1-richard.purdie@linuxfoundation.org>
References: <20250203164104.3403226-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210668

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../atk/{at-spi2-core_2.54.0.bb => at-spi2-core_2.54.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.54.0.bb => at-spi2-core_2.54.1.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.54.0.bb b/meta/recipes-support/atk/at-spi2-core_2.54.1.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.54.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.54.1.bb
index 975dc9b959d..7b87783735e 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.54.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.54.1.bb
@@ -13,7 +13,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d7eee7e75beddcc272cedc2b60535600f3aae6e481589ebc667afc437c0a6079"
+SRC_URI[sha256sum] = "f0729e5c8765feb1969bb6c1fba18afa2582126b0359aa75a173fda1acf93c4c"
 
 DEPENDS = " \
 	dbus \

