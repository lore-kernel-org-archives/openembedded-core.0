Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9307CCD13DA
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:29:58 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9362.1777739392408471990
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D56zYK+m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso176054f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739390; x=1778344190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0QRj0L0voS6B89eGTpSrXKUxcpOpctiDEA0XCcsELw=;
        b=D56zYK+m9osWLuZySmmYLz1vKxVdqWglEwAQmGT8OB4NXipb/6GHzvBkb7xAHvq+WA
         bxr1oGhniKOcslRqlBdq7YSjN2RnPO9m4lTZ6ImzTQ0F7Z7aMiEHof+tP9woOQxj9k7+
         oXw3NcOJfs5kg7cygTHjIQ7gG0XwcxeDi6TJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739390; x=1778344190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e0QRj0L0voS6B89eGTpSrXKUxcpOpctiDEA0XCcsELw=;
        b=KPb2m6ODp/A9e0vSNDCMzUxdmXzvqMnXWQgO4NoMkAeuX00PbSnhidxvTe8zzcUlvY
         Za3YSKYrVevuEvpR44RLO/GlcUQU/DwHg121nPxU4I0izGt3ZACDELX+xYON3nnpgY8V
         ti1YCE3iWPx5M6UhRs5BVtM7F061QZHzZrltJkfByvw/keUtvg6rf1Lmti/8NVLVnGpM
         MJ6IiSobUWq2rP9bJtto+HybTy8KLBdeZik8BDFW2UJPfUcSTLx+6W2ib2EwOC8d9n/R
         Eik7YF1fUvI4SQNKpdKLFQZUaSJnrEDpPzXP3SU4YvG1H3mZ5GwwFfLk0Y9KSLjo0N1K
         dz0g==
X-Gm-Message-State: AOJu0Ywf5NEWpblmYb2nGJ+k4Jd6vivyYc1dfsntziVY0stMUBwqk+C0
	axENjpnCkEneRpgyTYO6TfH+87jAgpZEZCbbElnnUbEu+BJqFbHzvAKEKYIaFxFUmU85frWVM7n
	A2BE4oUg5tH1l9s/BgETrNpLl3d8pF+c13TNrInUvf/egccGdYdDV41XfRhcoLZpI33FseD0eBz
	4zmp+i7/WsmtTrggE=
X-Gm-Gg: AeBDiev4bdO8A/SsJ4h7lw6l0pKnab7A5L/tD8glCXfnnbpOWFP/NgWJ5fnSXrOGp+j
	EJrPCwtvY+8GpSG8sDHhdimW87HhmLz6VETjZktKscFzus7OwmloZLigb9FXDwU7w4BaGADeapG
	/QmPgw/Om88NtjX/4sP/eNA3npOg8AyPJ6BRB7avrv/BLtaZCFY4kkDDRbA4VfZ0u5Galu0SmhM
	0jca5iMpC5WihMo7YGop459/I1buYGG8q+HXAgKOG4ZRK07eqeYdmuXd7NgboQzxrgd2mNlRqtX
	oVVVrTAFp+vXNBJ2tMxWSzih3p/YSXuZPfeA2RE4sJnwJP2Ya68Fe2I9BSLHM7l8wfbSk5agSRo
	Wjz8YBEllSRMYAWjy0sZx0lPpUtl9e0+mncq1k+So+24RlW8Q8LgkI0ahn8NVyxSW6jbCaa7r30
	bHfNujFxTbRQm3LB3IHBG3p+ZbmZw9uKf+EfPxyxn8/dx7UOwJWppRCwsekPI1kDc=
X-Received: by 2002:a05:6000:603:b0:43c:fde7:f1 with SMTP id ffacd0b85a97d-44bb558b4d9mr5743841f8f.18.1777739390380;
        Sat, 02 May 2026 09:29:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:29:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/62] gtk4: upgrade 4.22.2 -> 4.22.4
Date: Sat,  2 May 2026 17:28:32 +0100
Message-ID: <20260502162929.1377831-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236321

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gtk+/{gtk4_4.22.2.bb => gtk4_4.22.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.22.2.bb => gtk4_4.22.4.bb} (97%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb
similarity index 97%
rename from meta/recipes-gnome/gtk+/gtk4_4.22.2.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.22.4.bb
index f2cef8d13ac..bb2e0415953 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = " \
     file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
 "
 
-SRC_URI[archive.sha256sum] = "b1c987370a0c30780cde351bdbee02eef816728f1c1c2ec7c8093281c0709ee8"
+SRC_URI[archive.sha256sum] = "51bd9f60c7d23a665a556c7364c21fb2e4e282566b3e7e092455e8f910330893"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 

