Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.18359.1592228663523637206
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 06:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=2LDXbAjy;
 spf=pass (domain: burtonini.com, ip: 209.85.128.68, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f68.google.com with SMTP id u26so59907wmn.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 06:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nc2z/LG6uCX2qa9Q/mIkVzsrF8JESceFgzT0tGOfV3s=;
        b=2LDXbAjyLpibr9TcIwlsqa3lepDTByF78EGo05r0ofaB0UQjRS/VEc8AqWZnAx+ypa
         S4E1aecbixoZNkk6z6Au4TW1rKusn1suM3/BcJSATRSiazHWLjKm105f6nCAmqFHO3op
         H/PE4Y/H6wmxaZH6L3DS1o768jOeZF2TyjLeGe+o4oLm6NvNT9BaK2sKre66X2YAUNQq
         AlNemVGpIgIRPF6XWcysgFImKbHRGqGXa6iPSnIwljjghpISh5x7g6wqkL/MvlsuMDRC
         tmJybfIQ3d9Dg0QB06YjazZziFnNhTbOPBXfqn4kw3eWtIZbdsOeheObh7Qy+qYhHy+9
         UK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nc2z/LG6uCX2qa9Q/mIkVzsrF8JESceFgzT0tGOfV3s=;
        b=HjRAkDwzjkRlvnEuf+FxQyNxcC7z7Q2fd5PSOoqCnE/itiwhSq74oOSTKGHW59n21i
         HEw/E6jg1rTdDynXDrL/ve6/wKrU7nCde0yBXVIZalk1TlMMmrE19GNFGRuesD/7AV2z
         3HOPjL5pgKl7r/PI9aPiFivH3P5HAWIk0q2pdfmpK3OveHrsZBW0Ut89Q+PMdVaFB36S
         H8STXFXJjdS1sOTvgSf2dW8qwcRl6pRbpRV6Y4TX2m4IdYhS70T745koDpFauQDljX1P
         VlM6RCT8MwIv1+m0pT7elzd9XPpJ1aozaLJsT6dszghERBlHfrDJwAvqswnuOP3RzEfH
         sYQw==
X-Gm-Message-State: AOAM533qoQlB4STTfR9TzTXS+GGQ5a+UsXkbDbB5cYlPL4nIFRH62r5X
	gIdRCUTZY+irkE15V76PQsnhJ7X/lGhDlEGN
X-Google-Smtp-Source: ABdhPJwv+hJIyJ1H/kM8TqhjMWV2sC5SaIGt9d2tFY182EFse8N/ePu5Hj6IIH68WjpqyJY31w7eGw==
X-Received: by 2002:a1c:544a:: with SMTP id p10mr13833578wmi.183.1592228661619;
        Mon, 15 Jun 2020 06:44:21 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id y6sm11572038wmy.0.2020.06.15.06.44.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 06:44:20 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] install-buildtools: fail if an error occurs
Date: Mon, 15 Jun 2020 14:44:12 +0100
Message-Id: <20200615134414.1043782-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Several failure paths were displaying an error message but not returning,
so the install process continued and failed further.

Signed-off-by: Ross Burton <ross.burton@arm.com>
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
2.26.2

