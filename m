Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.384.1592848837260168925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1iBXe6dG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id v13so13807497otp.4
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yGC3QCeBTD+S1JhhQR3Nmz6tBRCIOAsj4svTm0+1c78=;
        b=1iBXe6dGzyQTxQvGjKunWQVcCEXdFF6AEk4mApnf43sF99LnnIvidOguhdKc3ZF9i0
         YoHtsVSDjLKFCahJA76nkcF4MBAqgFQkx+KEzrNPbXoGHZbCEByJZlEoBFpM5rLAWa2/
         QLMhmhs0CaI8ZF7FASGShGw7uK1WBLk/I7Foup3eLj2AR79RIQ48y8BhI/PK7u3mCk27
         RavKu4DKvyZbJrk4FiG391EssljhG/2ubV+dYOdldCw0KBQV0fBwKqBsmaabIsnXAewL
         X4G+w8GoDECYf+BUi0TxE7rgsvIpCaT4mROSs/AvQPQHnn1EwGkjV7nMzTXQe+ufUrmR
         nUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yGC3QCeBTD+S1JhhQR3Nmz6tBRCIOAsj4svTm0+1c78=;
        b=HhHj4g+hZQZXdpvZjPSihe8niqzibhjI1p5nEjNa6XQRFklAs0z58DMOUx42o7xEzK
         uXHhFekmcKkJV9Okb4EonBlFMYQxmRF7d7VpySeCCeu8mM7uzH/PwPCwUin5Fr9pUDdF
         bBqERxxcWjdN80+60jLun5ct4i+pyU2qk4UB8k2gyIQDRrmnxkzsZqVRneXxrkWY+53y
         S0q4rKfxxJtel0q7VF3FSgMKwLzt+3vO0Wb27dQL6JHER5qJziGj0mcAtLIPTSBskXCo
         t0hOwls3zRj0nTEfNuV7oPWcz5+QqN9to0FF13QNGmG6Q+fIlQzfqgnflkkTrWE3M7qT
         1puw==
X-Gm-Message-State: AOAM532JWPb+nW44xr5hO45qepGBxPhm1kCSSqi3z96ijWS49tex7RNc
	LbA2xaeFIS1Sug+9QwkBBPnIJURKuCT7vw==
X-Google-Smtp-Source: ABdhPJxkV8RLNW0blU+ruf5G6GYEi5OEIrIEyQk0e5QIIH/dcN8eLtrPiPlkfnnrdC7GSIT639aapg==
X-Received: by 2002:a05:6830:8a:: with SMTP id a10mr14393926oto.246.1592848836167;
        Mon, 22 Jun 2020 11:00:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.00.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:00:35 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/33] install-buildtools: fail if an error occurs
Date: Mon, 22 Jun 2020 07:58:09 -1000
Message-Id: <deed12d01fa656ee0cf81a6b7b9ed74278e48c50.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Ross Burton <ross.burton@arm.com>

Several failure paths were displaying an error message but not returning,
so the install process continued and failed further.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b00e28735b64a781707441ec6187dd7f9240d97a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index c6b3a1eed7..d722519f0f 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -258,6 +258,7 @@ def main():
             else:
                 logger.error("Checksum %s expected. Actual checksum is %s." %
                              (checksum, checksum_value))
+                return 1
 
         # Make installer executable
         logger.info("Making installer executable")
@@ -273,6 +274,7 @@ def main():
             ret = subprocess.call("%s -y" % tmpbuildtools, shell=True)
         if ret != 0:
             logger.error("Could not run buildtools installer")
+            return ret
 
         # Setup the environment
         logger.info("Setting up the environment")
-- 
2.17.1

