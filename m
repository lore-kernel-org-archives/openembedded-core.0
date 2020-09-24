Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.25990.1600975883018355135
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2020 12:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iM4vGBiW;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id v123so592018qkd.9
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2020 12:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XJFywjkajsHBTHWFTkZnlqQuFUzbDXt/jjRAWsQTHSE=;
        b=iM4vGBiWfv86oJ71zdaKpAwEAEKxaNYLB4Zr4ehY3YyzkRxdmMwA5hMD6ofHrn8DQd
         iZ/iTwjwVVjjTunY+AGiqh7J9sY1x4C5Gg4XRxAhg0ggVqA0ljICxioT785pFOhZ1M+2
         JWeQ3W1sSCCdpqc0k/i6U3QY2efR9G/shNf4ihFTLu0K2+NBGaxUf3lFnLn6wT+U1yWt
         rKc1yZHkzI0sNbajft3K4Ail/AlpCz4WwMOATpcCe39anDIozBt2dvvqNPIi3f7FZ90d
         pqN8vSUQUABExCcXF4fifhP3/RmXrVDwwJWP+Orpx/Uz5sntIsJ2dyMQmsnNm4Fz/Z+P
         Rcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XJFywjkajsHBTHWFTkZnlqQuFUzbDXt/jjRAWsQTHSE=;
        b=qvp0XnFHPwSzHLzv+e6M+UY7IW0q5coUJWSJMh8pXCS+O17qjPAapyBU99IYWMnEbB
         J2Ro+h4bptj5dm37y+7O7La6Ti7Cb8bH3zFnkZEpHTmw6brafikBPyUP1eb2b/+d2b2n
         LBYrBUwrf1B0OpEMkV63JliCRcZsbK44xE8dfvMGD24xyZXWZCb+ddtki+bcPSUMVOh6
         pt0GbME7JicpRK7+78roU8e+Hk5r5cafK5b4W9dM1N4j7/iedq7oayUmsR/xfDdO0akr
         6r0mM/SytHOEDeCWGyrR02jMKxTCsIVQ7YQwc0GAeVmEoCouWOE6ErE1KIO1vFTrMFdq
         CbEQ==
X-Gm-Message-State: AOAM530V53mjeL3cOmPbVM84pxL7XEn92obxi6XklNX9sp9jMRvkQ3I+
	iKL1Bu+Aui762jyz5tUJyYQ=
X-Google-Smtp-Source: ABdhPJyXdrkYKk3pCxZeH2GgeP1z1sT7fdhNY4xq5bNctfJlk9laKlBwPYKEUWOCCmtG/GIyFV2fQQ==
X-Received: by 2002:a37:51c2:: with SMTP id f185mr648084qkb.171.1600975882044;
        Thu, 24 Sep 2020 12:31:22 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id l19sm385721qtu.16.2020.09.24.12.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 12:31:21 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-yocto: add KBUILD_DEFCONFIG search location to failure message
Date: Thu, 24 Sep 2020 15:31:14 -0400
Message-Id: <20200924193114.54441-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

It was pointed out that since the check for the existence of
KBUILD_DEFCONFIG knows where it is looking, that should be part of
the error/log message.

We only look in one location for the defconfigs, so add where we
checked to the message.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 3b82321402..cf78ae2d18 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -155,7 +155,7 @@ do_kernel_metadata() {
 			fi
 			in_tree_defconfig="${WORKDIR}/defconfig"
 		else
-			bbfatal "A KBUILD_DEFCONFIG '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree"
+			bbfatal "A KBUILD_DEFCONFIG '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree (${S}/arch/${ARCH}/configs/)"
 		fi
 	fi
 
-- 
2.19.1

