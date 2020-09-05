Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.18586.1599314965950510900
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2020 07:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I5bNlC2t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id t10so10249776wrv.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2020 07:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ztsD38dSUSBIItPv8G2BhLj12luMWlnjzFVzOXVB1E=;
        b=I5bNlC2tAqQJE1p8wDgTA7hDHFtwG9H6OqvHB/UBMbRD/IRikp1Mc+LjjLiy3fVC6S
         W9mt97IOHEo1xQiKgXacSo+6q42HG+Jcgk3wteHdxJqrfQJjPP4Z+FEwHkmNXLc8G5dw
         02IINNT+9gsiLTNnkCr06jcUlQjRGzT6bkRro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ztsD38dSUSBIItPv8G2BhLj12luMWlnjzFVzOXVB1E=;
        b=uWSxKgNYjc9XDsCSDbVKapoNmIelzOHg8/F9LL7vP4er8ggk/kwTO6YgaSDKBDbiPG
         bDNubNC3PEjjWX5bf3ZeyhXWEAxIsK7Qc+h1bF1l3qKPIkzQU23rpyAzauSFn++bE1PT
         4XqpxvHG2BMoawPjZ6p5AjhilGu5jZJbVjd+4jixkKvrfXzydoCaE3Yoi3j3niBDPM03
         wKI5QgjFgCYbtBZAkhDvLjpDbw+5eNCpI/UoEGBz1d5o5GWavfcsxJ4m8+pw79q4Phzh
         JzH/XBwMmxLQm1YlPj77NhdFPjWlkv7S1uDElyQm1Id+i2s9W2/ac5w1F0A1vdzVyt1/
         b2tA==
X-Gm-Message-State: AOAM533IECSpRyekqzfB2GAjcmnHJmQ3iKGUiRAphHNluqScgPP6it+B
	Y8JJshEWvspfyMd/TlBuAXzHOK3r+8uV1Q==
X-Google-Smtp-Source: ABdhPJxOBPTEvCgNGbxLAonLb6UnzTyX9+W1GhWKthnMMv7RtNdBXg+DgKAMY7hHzZhA7uXuuPAMlA==
X-Received: by 2002:a5d:4e03:: with SMTP id p3mr12490015wrt.354.1599314964054;
        Sat, 05 Sep 2020 07:09:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.f.d.f.5.0.6.0.0.2.6.1.6.b.c.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7cb6:1620:605:fdfd])
        by smtp.gmail.com with ESMTPSA id l10sm16852552wru.59.2020.09.05.07.09.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 07:09:23 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] runqemu: Add a hook to allow it to renice
Date: Sat,  5 Sep 2020 15:09:21 +0100
Message-Id: <20200905140921.1857067-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have an issue where qemu is being starved of resources on our autobuilders.
We can't raise its priority without special capacilties, therefore add a hook
which if present can allow this to happen using an executable
"~/runqemu-renice".

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index c71f3c4df57..37ef7c4f942 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1519,6 +1519,11 @@ def main():
     try:
         config = BaseConfig()
 
+        renice = os.path.expanduser("~/runqemu-renice")
+        if os.path.exists(renice):
+            logger.info('Using %s to renice' % renice)
+            subprocess.check_call([renice, str(os.getpid())])
+
         def sigterm_handler(signum, frame):
             logger.info("SIGTERM received")
             os.kill(config.qemupid, signal.SIGTERM)
-- 
2.25.1

