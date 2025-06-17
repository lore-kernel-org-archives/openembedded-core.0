Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4BEC73C66
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:00:22 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.23113.1750176021807026235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=btmxEtGI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234f17910d8so54781375ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176021; x=1750780821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mosbVl+94m9g8JPEeEHyWowHxJVKiES9YXqMEfvVQI=;
        b=btmxEtGIqa+X2ItpG7d9WBuJb74gILIsmhEEjmgZKJuSgtjEbz6FzjCWPfD++7Hop9
         aoCCLGLL+yQ9Jk6TaYr9nIMXetreegLaZO1XKlnFh7EdVclUpCrlkoe6XqlA31Z/MHrb
         TRD/P0yFb2LhfxHlSPOpBQDA6WRNP4ufSs+ByeJfcYnbYC9e+CTliWGs4c8QNgPNcPUK
         auruzQiLeupan0QoGLTkydPh7NfQKXdtJli+QNDyeXdshR3r6MnNoxuYlDrP0DUeFzTm
         v1YEhBXg68Uz09nEJDCQ7R0YApQapXHNpw8T/m44crBkCX3ES5cniRuaYQwqqezThnqK
         lo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176021; x=1750780821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mosbVl+94m9g8JPEeEHyWowHxJVKiES9YXqMEfvVQI=;
        b=tkuLTm71YvZFb46mbF8MssG+lxn/eRDcgQbc06c9gf4hHPbIfB4OV5uLC/pnDPTd9f
         ykXIXqz4yp23of/p+Zfu+w7/aS3WGZWkxd0xOTi47EHOdl8pb8INvcURmDCVApDv9ran
         EiYjG4FhS8VwyhDb715nW8E210KiN5f4/DqOJwT60VMPaFuSXIHD4OPk/aUnxjT0jnAX
         gA45I/J+mqfH7MEXqVZNQLWYZgQbqTUC75WxwssNqqSOq8mATtSFwQahJqNRJuCAF0sx
         AMdTCsZCAeOnD9j8N9sH1YE+KC02N4zM9SzVCwt83U2NuQtVtdsSFOMHl3ta0YpHnQHh
         NwpQ==
X-Gm-Message-State: AOJu0Yx41LGcVXPnh5tayBt4ZcR3Ynd+OCpGq7PAk6oAJiUcN6KmBDiC
	EKoZl4m3l3iPSJ4utPpyCikjlJozVCOY/6FfI+I3OtFVBlpiqxo2VZvi7+o4rnEZYB9x0mOOnUF
	/yzmg
X-Gm-Gg: ASbGncvxGCxcuDQI+yq3TAgtYGF1UvGfCO1a8ZbTeHFIvfvu/fOP14AbvO4xv6gW5+T
	t/FqwfFyY/DLdFVYnv1+hLWTekGBKk29lQGZ4NsyeGOj/KDOSvG3DabRxuvZkxMmVJp3kvbQ8LD
	SjKoZ+ZdCp2uOrnIjk0jN9xtDQ8D0dJZUA54wVglxrU/QywTYXD25uISYXRSLQEzuPoAqkPtZYe
	14w3/naCiwU0g/EQ0gcTvoXhofYLbbD0G7Nmv+n18hBdxL+c+2iL7RZm3A//IPIde1efwoCwohz
	QPT0lYCVnQkGOye3kbMsC2AjFMwq7X6CIKoCk9LypVFeFck8HD463A==
X-Google-Smtp-Source: AGHT+IFBTS0lt3Uc84ZzlsNMW73AXuyalBlasBQ8Fw2QJs0aBz1nV7QVBteBV6X/Lta6SP2GQuqgPw==
X-Received: by 2002:a17:903:32c5:b0:235:2799:61d with SMTP id d9443c01a7336-2366b14d3e7mr198451605ad.33.1750176020677;
        Tue, 17 Jun 2025 09:00:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d82sm81475515ad.146.2025.06.17.09.00.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:00:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 11/12] testimage: get real os-release file
Date: Tue, 17 Jun 2025 08:59:51 -0700
Message-ID: <93efeca19f53132fce84d914b7ebf21070370127.1750175857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750175857.git.steve@sakoman.com>
References: <cover.1750175857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218899

From: Peter Marko <peter.marko@siemens.com>

/etc/os-release is a symlink to /usr/lib.
Symlink is retrieved as a dead link which points to nowhere if also the
original file is not accompanying it.
Fetch the real file in addition to this link.

Alternative could be to use "tar -h" (supported also by busybox tar),
however that could lose some important information if links are relevant
for failure analysis.

(From OE-Core rev: ed43f9ccb3c08845259e24440912631afd780d12)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/testimage.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index e090b1ef4b..847a6f18a8 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -26,7 +26,9 @@ TESTIMAGE_FAILED_QA_ARTIFACTS = "\
     ${localstatedir}/log \
     ${localstatedir}/volatile/log \
     ${sysconfdir}/version \
-    ${sysconfdir}/os-release"
+    ${sysconfdir}/os-release \
+    ${nonarch_libdir}/os-release \
+"
 
 # If some ptests are run and fail, retrieve corresponding directories
 TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${libdir}/*/ptest', '', d)}"
-- 
2.43.0


