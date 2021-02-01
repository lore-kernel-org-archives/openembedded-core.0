Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web09.36450.1612196738609813375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YPBwDXv8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id 63so16867675oty.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PaijzYK6+eq+GsXHPxleD8cv/OBcQ6tEviakeJWPMVM=;
        b=YPBwDXv8jkLsaeNb8+J/PajAEXkp6FgWWs8XXCZppETkinweoYtQYLIE6p1Vj1ilXU
         300pcQ5vCKd0qD60VjLvwOwYO/Qq49MdR7FkQpS3PAAe/dA+YfCxJALqFyAOrZVGlgf/
         bJt8Hjb9qhSwO3ZygDs6iE3SAhme0biErqKubX2i5H7vRhOyAHXQEm0oVprnRqmYgdRy
         aTFgse2Y/aHkgCeYYocUqtN6XAjN2c7xqlJ96alVQSWB4R03sfsAeiq+YODKTjDWA6xV
         HogFTV24G4A4WNtkeM6sJtHTIsQBRnTKfnbH86yQBgtHODgame2y/npQvkPAPcPDEnO2
         r8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PaijzYK6+eq+GsXHPxleD8cv/OBcQ6tEviakeJWPMVM=;
        b=Ch1IgD1DnuE+3hDbCCnIo2G4eCu6n30A1FJN5gIdtKeJGZjn+8QxMkqgqMJ9lu9Ebv
         u4PR6LSsFoFkus+oPJfB5Ba6B0FoRvzb/n+YSayddPVXBqfo1XCZu7dCWvGgwZrNqnLy
         7/DPy3R6bke95ozHb8sYTruX36HE/WnZ/GmtNLvU3F22YTssuqmAZeDJoZZiuAcDWHVx
         k3Isxdnv+gHJqPl6sDyEx6u4KJ/qX0Oo7zG4BUBt8EqBtscImgxvRkJbAzXR8RNR74WM
         +vt1JiIMWy8K5ZbCiQcdFcHZduiCQBl847a2bAXDaWXRXVSagBy3bJKtmR4drpIAi2ux
         cfVw==
X-Gm-Message-State: AOAM533WPjohBhmwbFQJ8Nrk3Zc6Th0i9yA8q4wRtbqkaZpIBxl/s9kb
	aTAPtNM9WMnqY0Nvtev1sQaknTEqGPNQ4AwxCk4=
X-Google-Smtp-Source: ABdhPJyxzppbE43pWFYarHuLIxvlrkGy/VwgsipmGJ18DHy0370N6Ps/FDqf3FxRmsiMKkQFJUYOHg==
X-Received: by 2002:a9d:66c1:: with SMTP id t1mr12300408otm.106.1612196737405;
        Mon, 01 Feb 2021 08:25:37 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.25.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:25:36 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/21] sanity.bbclass: sanity check for if bitbake is present in PATH
Date: Mon,  1 Feb 2021 06:24:33 -1000
Message-Id: <9ed5d67d5d50f97072b6054ce913a3f5d981335e.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

If a user executes the environment script instead of sourcing it,
there's an error about an empty element in PATH. This is because
bitbake isn't present in environment variable PATH. Hence, this
patch adds a sanity check to verify if bitbake is present in
PATH and if bitbake isn't present issue a warning message.

[YOCTO #13822]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e08799913a7f207bc63e085eb98196fd61ed57bc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 4dc21bf0a9..b678284554 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -794,6 +794,11 @@ def check_sanity_everybuild(status, d):
     if "." in paths or "./" in paths or "" in paths:
         status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
 
+    #Check if bitbake is present in PATH environment variable
+    bb_check = bb.utils.which(d.getVar('PATH'), 'bitbake')
+    if not bb_check:
+        bb.warn("bitbake binary is not found in PATH, did you source the script?")
+
     # Check whether 'inherit' directive is found (used for a class to inherit)
     # in conf file it's supposed to be uppercase INHERIT
     inherit = d.getVar('inherit')
-- 
2.25.1

