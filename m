Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.22758.1617396407433939039
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Apr 2021 13:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ufGbbzWx;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id y6so6532034eds.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Apr 2021 13:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lS0peMVsH/B80M2aGzmcllL7cATRm5e2NbN8Jpz3JQM=;
        b=ufGbbzWxBampd+iKvU3vyUrWL8SQrQwLFp0hlOxAtUZgNXnZhlwAyo9NPAyxAEIl49
         lnFs7GzFndXsvM6nK8OrEDU4fFdoQhIJ4Y8WO96k9zSVqYCl0+t28OTetmCAaz/Tn8km
         INwNoLLUGTJAzX7RJG57fw7h2VlDDFVm2N7T+idOwODanULc9K/jmFzl3F4bbccEznkr
         TASrSoH6GAFptW+4m3TKUhsmZOe7jzpLuUsZ7VKbM7tXKV0SC4Y58hOGrJVVJW1/d29U
         LI13XNqadGkEAEj1DhPJDpIxgStUfRCMMWYTL1HkNJL+MqwsjMJJwKsKU3n37T0BuLAj
         nStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lS0peMVsH/B80M2aGzmcllL7cATRm5e2NbN8Jpz3JQM=;
        b=PaQbnyhEhoS9u4d2tWLFFnjANyoTwWnmNNyvZj+Vqe5kDklYZyr3FKBivPX4YimTde
         Ad8rP0TxrA+wDxNbLZ9A13TdDb0wy7ej5a/PATNi2dj1l+LLHPzc8WT2tf3D09556wYb
         HpvnbHNNnKTUj9h3JZGQYiEAiHb8HGLKwfPsUQtMirc4UikV9qPEHWoadysQkHffIF9p
         Yy41UuvBiUHimQjVsQi+2rF5PPKUxPC6HB1EJhv52qbblaye0e4NbXEa2dOYp81p+CsZ
         PqarW4yn9t1PxfsZBM4UAfbZkaT9NDh0Cy3qEjy0iXe29F3Ooo6WbRLK7bqTqmACEkX7
         Aa7Q==
X-Gm-Message-State: AOAM533u7mIvQONn9cXOA0GYdiXVa8/jmuicEHZmKi8oeB/KdMQ7VyGk
	8l2TQh3zz1AAarumrnd2trRSS3oy/v0=
X-Google-Smtp-Source: ABdhPJxK1iSykxQOZDAmev6kdwKELg8dK6t09JcFyZzNS7afUp5bF59aelHml/0rgAm+9f65cuAKHg==
X-Received: by 2002:a05:6402:699:: with SMTP id f25mr17491724edy.47.1617396406118;
        Fri, 02 Apr 2021 13:46:46 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id a22sm5845623edu.14.2021.04.02.13.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:46:45 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 4/6] runqemu: do not stop processing graphical options after nographic
Date: Fri,  2 Apr 2021 22:46:25 +0200
Message-Id: <20210402204627.207068-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210402204627.207068-1-alex.kanavin@gmail.com>
References: <20210402204627.207068-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some options such as egl-headless are fully compatible with it, so
there is no need to quit.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index df4ee21d53..35053de368 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1314,7 +1314,6 @@ class BaseConfig(object):
             if self.gtk == True:
                 raise RunQemuError('Option nographic makes no sense alongside the gtk option.')
             self.qemu_opt += ' -nographic'
-            return
 
         if self.novga == True:
             self.qemu_opt += ' -vga none'
-- 
2.29.2

