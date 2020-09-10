Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.20445.1599740685796168987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=REx6237s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id a17so6480503wrn.6
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5puyujH3Hb1QjErp9tpvcugfUKUH3rUfqvANUEEpBpc=;
        b=REx6237ssKmyCfUxiScVZev0tC2e6omVNn66L1lV2rsm+ycG4ADaxI0ZTIiLiuWdtt
         GTprTCZ+dLGyFMgGEd7LOJrRPxSCRfd/5WYph/gOXhBtMFZGFXFBSII6VtL58R5Lq7Xq
         S9B+HYaQC0LVrmQpJy96aX0DvOM+9Q6lIPVKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5puyujH3Hb1QjErp9tpvcugfUKUH3rUfqvANUEEpBpc=;
        b=QGew0CxkKGVYa9gatTPb3NzlLLYWCzyTqeJT/a+7bHhZv5Ya2Huoyg9NYjL+KgaLth
         hlLhGM5GbPtyDIK4RTWmgI7KaA4LJug4RxbInSAEEEm2S1fPHrl1IOByUWqs1EQQCvJj
         obocW8deafk9E6UZ2sSnjlfEb3Oavyh03vH/fLUbBIc7B2U59RCWvDVtc6rrviEsCIMq
         7rsICKDn208BCMu1RcXaZAKR02XgSgfz77ZCLBtKCjPFcVqstzKFdSREjiFFD1eie9dv
         W/tvYgKB7R2dYDnV1ZrC8EmER0daNdES/cXGPuH8fYCBIZXV1KsmzWkX95aveHUvK0Q8
         br+A==
X-Gm-Message-State: AOAM53114ou65K3zeFnw2h4tKuGGcXN38NN42FYYVLOIYt4kiv/j86F8
	+MYMKwEOe0gWjQnDmuvO7BYgAFu6FQKguw==
X-Google-Smtp-Source: ABdhPJyBsISTocW4BXwySkws0UZV/EhvDct5c88YSDpUx037s+MlIVhDNMIj7xKhPOLf8WtWSNa4ww==
X-Received: by 2002:adf:9ed4:: with SMTP id b20mr8959598wrf.206.1599740684098;
        Thu, 10 Sep 2020 05:24:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:43 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][thud 11/29] buildtools-tarball: Add an ld.so.conf for nativesdk-binutils
Date: Thu, 10 Sep 2020 13:24:15 +0100
Message-Id: <20200910122433.2040293-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to search our own libdirs, then fall back to the system ones as our
customised dynamic loader will. Have ld.so.conf reflect that.

This ensures that binutils finds libraries here when linking too.

(From OE-Core rev: ab729c362684474a8346e5256d636200826feb47)

(From OE-Core rev: 8de0aee6befc0541fa40563f63dfe1cc36f064fe)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 91df6f1ae9f..eca9f1c0e1f 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -73,6 +73,10 @@ create_sdk_files_append () {
 
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 
+	mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
+	echo '${SDKPATHNATIVE}${libdir}
+${SDKPATHNATIVE}${base_libdir}
+include /etc/ld.so.conf' > ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
 	if [ "${SDKMACHINE}" = "i686" ]; then
 		echo 'export NO32LIBS="0"' >>$script
 		echo 'echo "$BB_ENV_EXTRAWHITE" | grep -q "NO32LIBS"' >>$script
-- 
2.25.1

