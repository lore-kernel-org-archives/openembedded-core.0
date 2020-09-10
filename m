Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.20714.1599740676342518222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XeAbZa9C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id c18so6463457wrm.9
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UMyqQIQe/+McsCzeB0JMjlCRgip2SRR35THuiYqjKzQ=;
        b=XeAbZa9Ca5ctGbcVDeOPdPUcR+VhUeBbjgOAdAreQY+3VaHtdZSsI5ruAu7HEsP8QS
         ewwRLrz7GDaGGsyWfk2oasys0MMNlUSfwEAgLm5MsdOjpKl57KAlWRCgN5+svxIQ6Hf2
         tBjlesWEyGYz1uJ04GaWjmW65MC/KbE06c5qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UMyqQIQe/+McsCzeB0JMjlCRgip2SRR35THuiYqjKzQ=;
        b=eHuHzF4ftk60IW69kORQR9BUkNt+0IqYsIk3f3n/+YN639ti+o2Qj2FZJAVXXvcnxI
         tVcmdfOkNO8ekDs2SOvZKxBqqFoA9AF+JLILmV0Vjf+9f+ysdh3QTddjz9pkZ29KaGGw
         k5fcdS/aMiG/g53Fkle8KjXOyPBOZATCOIHIC8QPcfb4k97ss49MNN8+1KesMCOVqFuz
         UxaBf6vnvUzxDsPfdRAKWiTWF8+kd89W7bb1EzZd170VCWP1piOD89P1fmbfCH+OpHyY
         e7o9DEDjIkyuVI6yza0HCWprPBxCuXlWvRiWOrHUjCs9KLEHMOtlDtFxQX/vctdmwGvi
         OJwg==
X-Gm-Message-State: AOAM532AEeXciGily3c6lG1ln7d3jEXqINvparsSX2A88WsjBHBR1PPN
	mfh+Dp/imxCMVTJZRUio4L/P9QV+LFQXng==
X-Google-Smtp-Source: ABdhPJyR0oKKgaHDAswQQtnM7ATGVheFVssTZlTxdkg3CD0doPDlSdIcFD1yKYALLn1KqKoL2nic6w==
X-Received: by 2002:adf:ba10:: with SMTP id o16mr8885609wrg.100.1599740674501;
        Thu, 10 Sep 2020 05:24:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:34 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>,
	"Jeremy A . Puhlman" <jpuhlman@mvista.com>
Subject: [PATCH][thud 01/29] utils: fix gcc 10 version detection
Date: Thu, 10 Sep 2020 13:24:05 +0100
Message-Id: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles-Antoine Couret <charles-antoine.couret@mind.be>

Utils can not detect GCC 10 correctly due to wrong regex.
It generates this error "ERROR: Can't get compiler version from gcc  --version output"

Sub-version numbers should be 1 or more digits instead of 1 only.

(From OE-Core rev: 1d6f50a5e58f46f8af6e83c4e288d93a717187ea)

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 186fe4a3d390a52b87282c3e694ce3251e45ee78)
Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 8a584d6ddd5..96ebc36b8b4 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -370,7 +370,7 @@ def host_gcc_version(d, taskcontextonly=False):
     except subprocess.CalledProcessError as e:
         bb.fatal("Error running %s --version: %s" % (compiler, e.output.decode("utf-8")))
 
-    match = re.match(".* (\d\.\d)\.\d.*", output.split('\n')[0])
+    match = re.match(r".* (\d+\.\d+)\.\d+.*", output.split('\n')[0])
     if not match:
         bb.fatal("Can't get compiler version from %s --version output" % compiler)
 
-- 
2.25.1

