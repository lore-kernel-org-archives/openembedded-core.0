Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web12.4970.1630678317606627392
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 07:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rg7/KwTm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.41, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f41.google.com with SMTP id a20-20020a0568300b9400b0051b8ca82dfcso6696200otv.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Sep 2021 07:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1jhvIPT3qDH7gSva3fAq6Dii+2rejuUQCXRFECWOnLo=;
        b=rg7/KwTmBah9a1vSkwn4sPSqIxfBAMjjtYhd249C4jkMYIkaUTxANrGUWUv0M+qWSV
         0vMaTVP9Kvld+fWatWzCA9NYkCrKkufNaJI+PK28aa1AZKl5Q2A+n4MyC20EfUMqvfcU
         fFbYeLNU8VYuXYKhcCxyNfDgoO6f71dZxresFmiNSzJ5i0qLrFHmLJvEBLKmh8qKaZtE
         hrUxk7sOaFtWBPe/LJgRhEqACpI/Gnf3A2Vg9bfA8xA7M28G7x6zq0zzA9bngU2BLIhf
         3UHzgQZm3W5HvHaatIdBFXb2j0M3bYzrT1+JIygGzxzo4Pl4H8grLK36OB5b3a7w/Gcf
         KQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1jhvIPT3qDH7gSva3fAq6Dii+2rejuUQCXRFECWOnLo=;
        b=Tck4467kuJnp1e5Kk0SQPP/0ljfyqftOFrq4kCrdNBvpLS0SnMyfTi4Flcru87Zvmp
         8QCHvqGcBoHJ9cVsgSk8/T9xeBq8MO5fm9TcWm81NO0ZrLdjvEsaRlbFbkIKOyXw55mS
         q4ZP1MJ1WIeVBWh566K7tPEtEtym3sqWPeHvWIXOFy21TCpVWS1JIoefBbNqUuEQTrn3
         7rLEvxQOrmyvghKkhPGCBYsE+6DaQ2aXqunNGED9GQXl18CvErqgRj7yi00N5ussuU9j
         8H3UC/LzxIuBL++vMIBg+TMp2BAoL/AacCnXIHIhYDDt+r+aQev87BjpHl/k0viHnuBX
         u1Nw==
X-Gm-Message-State: AOAM531JqK3cj12iZ5+pdRQIbYy2ktZtLIAEaDOxt6rR3cHyzjG86HRQ
	qB+Am7GIsXX5y2qpvGeChdb9rpyotcrBguk2
X-Google-Smtp-Source: ABdhPJzyhibLR3LOHQChDKGDrjeLJeH14w15+OVFW60qS/fjcmQge1PbQ2VLDNk6xAknrSUQzMEG0Q==
X-Received: by 2002:a05:6830:4097:: with SMTP id x23mr3328181ott.289.1630678316453;
        Fri, 03 Sep 2021 07:11:56 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id u14sm998007oth.73.2021.09.03.07.11.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 07:11:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/5] layer.conf: fix syntax error in PATH setting
Date: Fri,  3 Sep 2021 04:10:53 -1000
Message-Id: <b46b059a306b2823624e64adecded9f76430471a.1630678081.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630678081.git.steve@sakoman.com>
References: <cover.1630678081.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matt Madison <matt@madison.systems>

Commit 05a87be51b44608ce4f77ac332df90a3cd2445ef introduced
a Python conditional expression when updating PATH that
generates syntax warnings in bitbake-cookerdaemon.log:

  Var <PATH[:=]>:1: SyntaxWarning: "is not" with a literal. Did you mean "!="?

Fix this by using the more appropriate '!=' comparison
operator.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2e753a12cf6bb98f9e0940e5ed6255ce8c538eed)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 1c432275be..7453655417 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -102,4 +102,4 @@ SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
 # We need to keep bitbake tools in PATH
 # Avoid empty path entries
 BITBAKEPATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
-PATH := "${@'${BITBAKEPATH}:' if '${BITBAKEPATH}' is not '' else ''}${HOSTTOOLS_DIR}"
+PATH := "${@'${BITBAKEPATH}:' if '${BITBAKEPATH}' != '' else ''}${HOSTTOOLS_DIR}"
-- 
2.25.1

