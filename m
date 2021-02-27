Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.5302.1614440103265423281
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Feb 2021 07:35:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gfcIJXAz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id b3so11483923wrj.5
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Feb 2021 07:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dT90KLQH/nGurwSOSfh0o9U217yzgU5bBycKOxkh/4Q=;
        b=gfcIJXAzX/3x200gTpJZOlCCqektdQQS0qEClUpfJx/+JP/sS0YltduccfVo5Vn62n
         /ug11E+W4mQqocHZzlk0+BJt8gvjragKyxZrxn8dR/zFoX4zYJKm8NoQRDgPH54u0b/P
         ts0Fv44wjpuH7SoVaZlPbhT9rAvNKaVlZtUS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dT90KLQH/nGurwSOSfh0o9U217yzgU5bBycKOxkh/4Q=;
        b=DrNNWjM6Kqmtt4AIi5TPQVIx95PL0xIF9BFhiAAuHyKY9JA5XnU5t6KEvyr4OzMW0s
         vMn8JHvby1Qrv6zmeIKbhbF1eU7SRZkrNhB1TCF04hb6OyMJWwcu3eglKewmLOyJGrcx
         9fm6ccVu4Wkg4Dv1eyH4yt1l/KwTc4UQCg3DeD2bkxf/oJVOPMrj9igwpuTGGoCLfmDJ
         5XvtupQYNCRlLT30CtaVbLQFmhDQQXqYv8apfuHUkJ9Ek+u0ZokwJGLYulFgb+K6CdqF
         tfbpmFaVxu6H75hA1MedIynb/+iq22rmrGGvZRE3FWZeqI/UHPwk17b9Bxq4zg/ArOv3
         +3VQ==
X-Gm-Message-State: AOAM532HAc/J8dh7Lsd7eez2HfiUJ2dFbxRzQOAWiZcRegQzVBDL5fLH
	s+VCHnHJKWtjZfAsdJo+uSBryYRUohTpYQ==
X-Google-Smtp-Source: ABdhPJwYfGSF065bKeMJ+rFOk4oR4cp97wuiFE6D1eLA2uEMX38lHhbOh1UTFM4n4cSgN5jjyoYf6Q==
X-Received: by 2002:a5d:4e85:: with SMTP id e5mr8630640wru.218.1614440101502;
        Sat, 27 Feb 2021 07:35:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:78c6:baba:ab09:bdce])
        by smtp.gmail.com with ESMTPSA id 18sm1955708wmj.21.2021.02.27.07.35.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Feb 2021 07:35:01 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] bootchart2: Fix manpage reproducibility issue
Date: Sat, 27 Feb 2021 15:34:58 +0000
Message-Id: <20210227153500.3963357-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compressed docs contained a timestamp of the original file which
meant the SDE clamping during package creation didn't work. The
benefits of compression are minor, decompress the files to avoid
the reproducibility issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py          | 1 -
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index b622a33481c..10bd37cd258 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -28,7 +28,6 @@ import datetime
 # ruby-ri-docs, meson:
 #https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210215-0_td9la2/packages/diff-html/
 exclude_packages = [
-	'bootchart2-doc',
 	'efivar',
 	'glide',
 	'go-dep',
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 6571c199387..f6a77b46060 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -139,6 +139,9 @@ do_install () {
 
    # Use python 3 instead of python 2
    sed -i -e '1s,#!.*python.*,#!${USRBINPATH}/env python3,' ${D}${bindir}/pybootchartgui
+
+    # The timestamps embedded in compressed man pages is not reproducible
+    gzip -d ${D}${mandir}/man1/*.gz
 }
 
 PACKAGES =+ "pybootchartgui"
-- 
2.27.0

