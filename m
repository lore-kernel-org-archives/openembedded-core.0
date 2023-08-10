Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B50C04E69
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:06:07 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web10.21427.1691683557965311921
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=PibMWXcP;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.177, mailfrom: steve@sakoman.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3492cd048c9so3802445ab.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683557; x=1692288357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7Fzv9Zl7MiLYM4MKrRaq+9360W83gbtzRA/B6ppGT8=;
        b=PibMWXcP5R9Wu5eQRnL+ezq4qqOPlu6+epMo74cPQbsV8nxOoOrhQN3nMoIMBxhg1X
         fKxgEQCVOO2fXrammo6rQ43os22qyDaIHtYnAOZRdBwCAWzmVkH3FPvUi3zPg7ztuI/P
         LBhEDfLosD1kzDciJUaSu8hlgH/PdVERbj4CzWDyI5CUklCSdA9xXxRL+FQHNxQ0eLsj
         rm2dtGbIqbPt3i4F0SwGvOQM7Ru/BW5hPMpb+G0DjFJyggWaZ8j221fULfMIQepLsDln
         OO8l4pBZJPu6JZba7ZKmBUTt2UT3x/Z6EnBIq0zwOveTV+hdCOEUEgPP2pkMFBE7UD9C
         RzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683557; x=1692288357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7Fzv9Zl7MiLYM4MKrRaq+9360W83gbtzRA/B6ppGT8=;
        b=Gbq8KLH1I+TktYpU1G00IkSphR9t0v7fmvMoO291cCZfhZX8j37MZOz2+fZ0kz8bko
         ALlYYGbqZodOwwrVjAsHgsCkrj4SGkdU1wfUp3Ae1gjw5MmleMWPFd80DkFR7HOcMAD/
         F+zvXZBtK4yzuQvZ3RwEY/vEYnieMp3yq/d5mA/qxzplCRsgz/JAVMC9drHMf2ETgi/B
         G5yKXq2tXZyVy9LFDMeQMOGbqVZ3k5Awsxts1HkWJA/c0cmD5bYMYVA7KrLfgI0na0cx
         +h1YP847hAoJb1Hi8sREgQRlGmGU9k8bf5u0TmaIi7hc3erz93TTCBiZKslOSdhE3uCt
         qXdA==
X-Gm-Message-State: AOJu0Yx9Q94yrQH7lxXIOjqoBRnm5AksLIdybUucaZ6xxzOr0RM/uKmX
	bHSOzWtrcZUBhd0EiSMsw3uKHiOFolLlILyQyH4=
X-Google-Smtp-Source: AGHT+IFslhFwGSL04QyX/SWkXHsem18b3q97nkWcE1rfOyTc0nPHD4vqklzp/VqO/toa2vz5VYVglg==
X-Received: by 2002:a05:6e02:12a2:b0:349:9938:a9b3 with SMTP id f2-20020a056e0212a200b003499938a9b3mr630532ilr.3.1691683556849;
        Thu, 10 Aug 2023 09:05:56 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 33/37] file: fix the way path is written to environment-setup.d
Date: Thu, 10 Aug 2023 06:04:32 -1000
Message-Id: <7ae5c9a17d6f8133fa5b4e127dd4e9cc43454ee8.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185795

From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>

$OECORE_NATIVE_SYSROOT is not escaped, thus it is expanded to an empty string.
This happens to work because we have ${datadir} which in this context is
relocated to the buildtools sysroot after installation of buildtools.

If the $ before OECORE_NATIVE_SYSROOT is escaped, it will be saved to file.sh
as intended, but MAGIC will point to the wrong location because both
OECORE_NATIVE_SYSROOT and datadir resolve to sysroot which doubles the path
like so:
/path/to/buildtools/sysroots/x86_64-xesdk-linux/path/to/buildtools/sysroots/x86_64-xesdk-linux/usr/share/misc/magic.mgc
which does not exist. So, removing reference to OECORE_NATIVE_SYSROOT.

Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c6206249683876670602888e78ecaf719753a317)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/file/file_5.44.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/file/file_5.44.bb b/meta/recipes-devtools/file/file_5.44.bb
index 0834384230..3ce266475b 100644
--- a/meta/recipes-devtools/file/file_5.44.bb
+++ b/meta/recipes-devtools/file/file_5.44.bb
@@ -48,7 +48,7 @@ do_install:append:class-nativesdk() {
 	create_wrapper ${D}/${bindir}/file MAGIC=${datadir}/misc/magic.mgc
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
 	cat <<- EOF > ${D}${SDKPATHNATIVE}/environment-setup.d/file.sh
-		export MAGIC="$OECORE_NATIVE_SYSROOT${datadir}/misc/magic.mgc"
+		export MAGIC="${datadir}/misc/magic.mgc"
 	EOF
 }
 
-- 
2.34.1


