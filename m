Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.18856.1593438518054070700
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 06:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Cwm1qby3;
 spf=pass (domain: burtonini.com, ip: 209.85.221.44, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f44.google.com with SMTP id k6so16634820wrn.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 06:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FLHbAxmBacCaPqXtMaSH5V6XdZTfRk/ZFYjTNZMy0b4=;
        b=Cwm1qby3UM8Sn1dFl9tJhlH6qY4LLk4GGsDRHvuq19GmGlt/iei0/0HswwFg+B60Yb
         f8l3zDILoQiE1vTa1d/zfcQDB4ucp/1ErjLqNwtudx311gjka05u0Y3KdsdZQAH6rhte
         ygahbBJjPO/Fn0Vj9XGDQ56PvztyxECs8RWnZhPhoJlV9IXbDtI5WB2TufNMQiPvpLrR
         +JqeoPHIzghEHebFCh04sSXFWWB5FeCYodW+Z6WfXB5KO8964xYD3IqM8fE/f6Ses6TN
         qFinQHNbOEpayZK84dVSNHgN4HaG/IfqtGoE+Z/QlEBA3al08ZOULleGVsPZTqZZ+alA
         qfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FLHbAxmBacCaPqXtMaSH5V6XdZTfRk/ZFYjTNZMy0b4=;
        b=dF47M+KII6jwtBPqegBAc3/gL5P8N6p7ayBVerj+3CmQsF93jwXJndm6n7U0iJmVyn
         TsdkaTcNTmvAuI/D9uHwoEUMGh6eXpZgCgyLK4QRwMVtEPQyyUuO1AsY5zhztrxtvMWW
         P6jQAun/VaORo25MuyUdR7XY5QhtJ0CEueaWIF2jfxjmTnVRAjXUaZdn2MssUN8vgWbB
         lYLbrhsuyxcXA28EKCzn9e1lBwmydR8WG/6rHxbGAeT2EolC8CcxbrtSpSoXwWbpivGu
         QTsHHkyWSf3RWNjoHmHv33iZOrIb/UtIoqvsFK36tZej8et/LQsb293d3OpfElVupilz
         hTZg==
X-Gm-Message-State: AOAM532XK/xyuDVRS2Upuro9CFLyOYKnhkjCa0SB58yRgTom/ekrcX1+
	ReeC8PNP4au9S4WfTr33Ei2vfDtvyCyhMAmJ
X-Google-Smtp-Source: ABdhPJz0q8zEfNmAx9oJRc3Q+I9F07ZMQ7Qg6SeB+e6EgyqH0ueCRUSicXLlcEw7RlOGXfOKo9c0Ug==
X-Received: by 2002:adf:ee05:: with SMTP id y5mr17718459wrn.185.1593438516097;
        Mon, 29 Jun 2020 06:48:36 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
        by smtp.gmail.com with ESMTPSA id z2sm30549400wmc.2.2020.06.29.06.48.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 06:48:35 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 1/2] scripts/install-buildtools: Update to 3.2 M1 buildtools
Date: Mon, 29 Jun 2020 14:48:32 +0100
Message-Id: <20200629134833.83684-1-ross@burtonini.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This fixes issues with openssl certs not working properly which meant error
reporting to an error report server was failing.

Also, all our downloads are now standarised on "sha256sum" so adjust for that.

(From OE-Core rev: bc8b44e19a05f499f5cef049eedbed1fede2e765)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/install-buildtools | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index a9173fa096..1a458a2cc7 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,9 +57,9 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'http://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-3.1'
-DEFAULT_INSTALLER_VERSION = '3.1'
-DEFAULT_BUILDDATE = ''
+DEFAULT_RELEASE = 'yocto-3.2_M1'
+DEFAULT_INSTALLER_VERSION = '3.1+snapshot'
+DEFAULT_BUILDDATE = '20200617'
 
 # Python version sanity check
 if not (sys.version_info.major == 3 and sys.version_info.minor >= 4):
@@ -227,7 +227,7 @@ def main():
         if args.check:
             logger.info("Fetching buildtools installer checksum")
             checksum_type = ""
-            for checksum_type in ["md5sum", "sha256"]:
+            for checksum_type in ["md5sum", "sha256sum"]:
                 check_url = "{}.{}".format(buildtools_url, checksum_type)
                 checksum_filename = "{}.{}".format(filename, checksum_type)
                 tmpbuildtools_checksum = os.path.join(tmpsdk_dir, checksum_filename)
-- 
2.24.3 (Apple Git-128)

