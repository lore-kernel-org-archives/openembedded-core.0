Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.1065.1613116796532343015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 23:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PGMs0S+T;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id k13so5324532pfh.13
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 23:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kSXgPyfOG7f1L4G4/tXR+eNYJBbV6Kk2k7xiF3i1qQU=;
        b=PGMs0S+TRtLqsiQ2MQxQLCNr19Y/81x8NjmAQgu8SftSiNM0MQ33dk+t2i+DrokX9R
         tWD7OotlcnN43YwqXbu/Z/SrEXYq49FmvWam5Of41DUyr4fpVyQNPoJju6xG8b4tqG9e
         cTT6wzTkswiT+MgoUg6PyC1DlS870My+XBqnnefwZFzb6nwz4i3OX8J/tJl961qFiLQ1
         SvZYw68FLY3nqUlMX+fwRlRDxevr79IJmpyZvJxALyexC5Z/Ezt7pbfg6DecG9sdUEBY
         mhiOwwkiSPEZ5T5qG1W8q37btj3zhxePNV00AKyH3xm0+o92OiXV6oNuroNLj/rqGfk6
         bW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kSXgPyfOG7f1L4G4/tXR+eNYJBbV6Kk2k7xiF3i1qQU=;
        b=h7VG+ZJtDTvT1qnR2joPYmnPdsK4/r9jrQjtH7gvj2iemnWSwmUVN0TkVA9ibkAuRW
         1FICChnDsZybDoYzbWskbCPsLN7CX2zOALVPJ31vEUbXdO8AMMXfkBFRmANyTSvZa9eE
         bS8HwE2NOFHKXf48nb1XZW0XscE6xwCGVaxGW79ei4nJ3DkMXe+0b/TX8FlSjGFPBiqj
         ZtL5PGk+l8pCp7iO+ntrb7fkQaECapbxmUgbPDf4SNNGlc/lkOcRZHMKpB/o8BUsg3eC
         gIp8jMLw89yKq+kG9z5h+Z0UEVsTmmesD/z3XArKiiijCQ5PbmRiD+5195fvbLa7O/xP
         lCEg==
X-Gm-Message-State: AOAM530uKLS/9PX7MVmZE4SsHDQuVex4l0HMNdDWJ45VuFeuWyTHnKF3
	Q+1RuqShKv8aVkO+5F9AJlTC/asGLMGLZw==
X-Google-Smtp-Source: ABdhPJwXQS6HpUQbGjNRsNZcLHzjnjhqJRJZbwI7aLmc0ITUlSs/sgzcFAPsOkLhoOXEp7bVe72BdA==
X-Received: by 2002:a63:416:: with SMTP id 22mr2009282pge.286.1613116795449;
        Thu, 11 Feb 2021 23:59:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3857])
        by smtp.gmail.com with ESMTPSA id f28sm8776183pfk.182.2021.02.11.23.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 23:59:54 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] autoconf: Add missing perl modules to rdeps
Date: Thu, 11 Feb 2021 23:59:52 -0800
Message-Id: <20210212075952.1032920-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calling autoreconf with on-device sdk fails due to missing perl modules
which are required for it to work with autoconf 2.71+

Fixes
Can't locate File/Temp.pm in @INC (you may need to install the File::Temp module) (@INC contains: /usr/share/autoconf /usr/lib/perl5/site_perl/5.32.0/riscv32-linux /usr/lib/perl5/site_perl/5.32.0 /usr/lib/per
l5/vendor_perl/5.32.0/riscv32-linux /usr/lib/perl5/vendor_perl/5.32.0 /usr/lib/perl5/5.32.0/riscv32-linux /usr/lib/perl5/5.32.0 .) at /usr/bin/autoreconf line 50.
BEGIN failed--compilation aborted at /usr/bin/autoreconf line 50.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/autoconf/autoconf_2.71.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/autoconf/autoconf_2.71.bb b/meta/recipes-devtools/autoconf/autoconf_2.71.bb
index e5098106f8..8526067201 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.71.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.71.bb
@@ -40,10 +40,13 @@ RDEPENDS_${PN} = "m4 gnu-config \
 		  perl-module-file-spec \
 		  perl-module-file-spec-unix \
 		  perl-module-file-stat \
+                  perl-module-file-temp \
 		  perl-module-getopt-long \
 		  perl-module-io-file \
+                  perl-module-list-util \
 		  perl-module-overloading \
 		  perl-module-posix \
+                  perl-module-scalar-util \
 		  perl-module-symbol \
 		  perl-module-thread-queue \
 		  perl-module-threads \
-- 
2.30.1

