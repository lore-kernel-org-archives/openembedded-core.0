Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.25368.1591983211963068221
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 10:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id c14so9706658qka.11
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 10:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=CamIj4aJTIeY+L0hczyRcZoUgBFhPvvtH0W7kJkFomw=;
        b=pGACOq3gxeDLUDfTVRO+WlyI/m6cwr2NiSehHGI4dU9Uh0lWXoC8jriCTB/rNDmhdQ
         QYzg/emMAgEX8DrynlCO/PM3X6LvH9mxQwiaez+bbPse2ZQHKHrBK593Ee6KPinowOzK
         cOWZ9Z5nNEyO2hD4WDxmSvV65jkS8mbaq+fCdpcSy6jZbxLHxQlAxufqwh8bvzzc9g/D
         yuh//tJM4b4dVEXNP+FqFKcmqnx34vWjDWevhN8ugZie/yB57emETcPBv5C4AefIjBTo
         9K2O8J/oG18kcjW275RBpJ12IcST7cMtC5a4XyQDsgt7sXt34Wwbpv38jxx+hI6ZaSvn
         aByg==
X-Gm-Message-State: AOAM5306vEPCGINuvsSFN4ZXdCGNVlfUwstxWTRXGstT8FX0cO4P/L5E
	vgtQqH1jO62c1XX37+9AEdZ7nI+tUpE=
X-Google-Smtp-Source: ABdhPJyU9bnJF4wfKq56s6bMf9GgC7HNVHwbiHlU+KyW/EKQkhsJp33T2ThlmZCzDuQ7LXUvLKIZeQ==
X-Received: by 2002:a37:bce:: with SMTP id 197mr4278735qkl.370.1591983210891;
        Fri, 12 Jun 2020 10:33:30 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id m53sm5404998qtb.64.2020.06.12.10.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 10:33:30 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Richard Leitner <richard.leitner@skidata.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport PATCH 2/9] libtirpc: remove extra "-fcommon" from CFLAGS
Date: Fri, 12 Jun 2020 14:33:11 -0300
Message-Id: <20200612173318.103232-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612173318.103232-1-otavio@ossystems.com.br>
References: <20200612173318.103232-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Richard Leitner <richard.leitner@skidata.com>

commit daed7eedba ("Avoid multiple-definiton with gcc -fno-common") of
libtirpc fixed the -fno-common issues. Therefore it should be save to
remove the extra "-fcommon" in CFLAGS.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9e4546701775fe98532f011f5ad146cfb1b33715)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb b/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
index fc66821ecc..f8e34f58a2 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
@@ -21,8 +21,6 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-gssapi"
 
-CFLAGS += "-fcommon"
-
 do_install_append() {
 	chown root:root ${D}${sysconfdir}/netconfig
 }
-- 
2.27.0

