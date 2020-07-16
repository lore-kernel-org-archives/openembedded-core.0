Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web11.16337.1594908656218060994
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 07:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ojM6jm5Y;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id i18so5137588ilk.10
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 07:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+AuWThOYQMuDD8jFyvyNWQmHc4Jf5e6XN8AvusOFsvU=;
        b=ojM6jm5YQVimQ14jfzib5MQKrktKnOQunZt5IJii/6cLLx5emKKQyDSXuyX9x/+KIv
         CR1KbwIi7+yC8E6iIf6XEZISpuCvPuNgLrvcUb1V8ly1pHdhq66wCKboEqaRkDt0eyC9
         jzuF8PvYelXlxfMJiojCdipNimyRB9IQkpLvJxMugDvWa2mMeoXPdZDvq+e8Mb9md8uS
         IpTV5UipXse+vkWhRKXzXfWktTEMv3UEMqD04llCqkFCtXRtBAjozllgm7MDWaipLuQI
         5Qccrv7mTQWcjrDGX2HT3noCdBsMsSHPyaEtxoQa+58BkxYDhYkxOaef7dhGgfSXiuAx
         2yvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+AuWThOYQMuDD8jFyvyNWQmHc4Jf5e6XN8AvusOFsvU=;
        b=OWYJqvCV0jYAa5RfbvkzciVubINVsZzIS27mjhvCeDNIWj1gWCOjZYpOuo54a2d3SU
         C8PLXNK6Xta9a4Jyg1aHwKEsNVEUD4O2eD2j+o7SzFwzlnRX5nU+IwhZg2h2zxvXRaT7
         uCOGPxma9Sf7vi5NpIEr6qHekCNV/LzHLXx61fIlXXoKhDAPe1BqLrCMTswDZTtTFn3N
         e5MOMoCzOuIxC79TglHMmdtSRd+7vdQ9hDx7oCC1Y/m5cBB1dqtw/ZfcS0EFT+tEGVkW
         z22RzZHGrW2dLD5b0UyguRiHzOGhOa+GImkYlWF9uwIZnT/Lgqo9KZbmFV6I42N80BtL
         SQBw==
X-Gm-Message-State: AOAM533v7y1132AmhXVDiwwhtgIzrqotXza16sA9BTAmsOiCSNwgNOGh
	qk1KV0auqz6OTuF93jC7zzuuCfnd/AA=
X-Google-Smtp-Source: ABdhPJx66XdX/aj1TtjNVUzqdvP8NdQT981Tp657k68YN4PY9ZzlovApYbb+X21HQIdo2z0scEFE4Q==
X-Received: by 2002:a92:300a:: with SMTP id x10mr4503913ile.124.1594908655223;
        Thu, 16 Jul 2020 07:10:55 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:8425:3b41:f78d:f429])
        by smtp.gmail.com with ESMTPSA id s11sm2782705ili.79.2020.07.16.07.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:10:54 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] diffoscope: upgrade 150 -> 151
Date: Thu, 16 Jul 2020 09:10:52 -0500
Message-Id: <20200716141052.27340-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* Improvements and bug fixes:

  - Pass the absolute path when extracting members from SquashFS images as we
    run the command with our working directory set to the temporary
    directory. (Closes: #964365, reproducible-builds/diffoscope#189)
  - Increase the minimum length of the output from strings(1) to 8 characters
    to avoid unnecessary diff noise. (Re. reproducible-builds/diffoscope#148)

* Logging improvements:

  - Fix the compare_files message when the file does not have a literal name.
  - Reduce potential log noise by truncating the has_some_content messages.

* Codebase changes:

  - Clarify use of a "null" diff in order to remember an exit code.
  - Don't alias a variable when don't end up it; use "_" instead.
  - Use a  "NullChanges" file to represent missing data in the Debian package
    comparator.
  - Update some miscellaneous terms.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../diffoscope/{diffoscope_150.bb => diffoscope_151.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_150.bb => diffoscope_151.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_150.bb b/meta/recipes-support/diffoscope/diffoscope_151.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_150.bb
rename to meta/recipes-support/diffoscope/diffoscope_151.bb
index 58bd60a2c2..9b39b44350 100644
--- a/meta/recipes-support/diffoscope/diffoscope_150.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_151.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "0b9e4ae401fe4cbb8ce89b0bcabe608581d0ed53b91a28f18337179c7494af57"
+SRC_URI[sha256sum] = "f15e04aa537f0a3d91c99bf631c604668f4eea8f6552c5f93ea9be2bf014df84"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.27.0

