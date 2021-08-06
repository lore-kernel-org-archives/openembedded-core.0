Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.3361.1628247667695681334
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 04:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FzZ1b5CH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id i10-20020a05600c354ab029025a0f317abfso8619346wmq.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 04:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oFuKRyl1ZzZ8SK9Wqq/5zP8BL6sBHqwxxgyy0Y+55qY=;
        b=FzZ1b5CHPqmLJu6G7x5CA6HNnh/HbMGzx0uDPG1E6ZuOExFf0KRGbNI02VhO3fLLo0
         vlOlD8DgLW5/Qj+cAONMvcKBjbg1fDDGE+1O2Vtw1xPlO92LANQu0O5VV/1uX4gfAKWp
         +Is+9cX+B9GZtbAcWPsUz3suyflv6NxlO0NWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oFuKRyl1ZzZ8SK9Wqq/5zP8BL6sBHqwxxgyy0Y+55qY=;
        b=ep4ZY2FN+XH7yPXaggNl5Srb9GNst5zk7OVYlm/0u2SJYV5gWlXbGe+23gAFhXjv9u
         wRIyTilCw6zBdNQQ1en9JfD7zkhCg8N03/PYirIe+1O7WeDZKWqYSSiYe3JUt1sZgVce
         PlVS09f/W5ewMyjRF8U7PoLrmwf9yWPGBiAeArbUr/8zoAwc2T5Gs64AkX4hyayleVDf
         HhwaQHIZgzS5Fs+imrivNNn2pGNibak2vr2waUrjIpnSTN2ZZ+zluXS2Uj/Cj+hbdIty
         0xiqS1IoVxR3r8OB1H4pVhptDhaDkh63EKVVrSOi1I6Z++C1VeAvZKbMAVr8zemyBZHz
         DKuQ==
X-Gm-Message-State: AOAM530BJqrfYRK+G14Hzq47M5sd6jE4lW5gv0EsK4rRDOvgCZeZk4YM
	wHdQPT6ZnDjesFp0y0h+p0s8d5JVnfK9WQ==
X-Google-Smtp-Source: ABdhPJyU+9yF8tjOM5o2YG/PLxl6QYT1IUECFMz88VO/AruwWZ3QnCOgyAO3ZqFoSKCUEVSIu6Zjog==
X-Received: by 2002:a05:600c:41d6:: with SMTP id t22mr19678918wmh.66.1628247666246;
        Fri, 06 Aug 2021 04:01:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0])
        by smtp.gmail.com with ESMTPSA id q9sm11772073wmj.2.2021.08.06.04.01.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 04:01:06 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] curl: Fix reproducibility issue with LDFLAGS
Date: Fri,  6 Aug 2021 12:01:05 +0100
Message-Id: <20210806110105.3604568-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210806110105.3604568-1-richard.purdie@linuxfoundation.org>
References: <20210806110105.3604568-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we add DEBUG_PREFIX_MAP into LDFLAGS, curl-dev is no longer reproducible.
Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/curl/curl_7.78.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_7.78.0.bb b/meta/recipes-support/curl/curl_7.78.0.bb
index 2e2be661024..dece0babb2f 100644
--- a/meta/recipes-support/curl/curl_7.78.0.bb
+++ b/meta/recipes-support/curl/curl_7.78.0.bb
@@ -73,6 +73,7 @@ do_install:append:class-target() {
 	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
 	    -e 's,--with-libtool-sysroot=${STAGING_DIR_TARGET},,g' \
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
+	    -e 's|${@" ".join(d.getVar("DEBUG_PREFIX_MAP").split())}||g' \
 	    ${D}${bindir}/curl-config
 }
 
-- 
2.30.2

