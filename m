Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.30555.1607925692587403948
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 22:01:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E3bq/L/6;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id n7so11779528pgg.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Dec 2020 22:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pOyuRSTJ6PhVLdNSwCPcjnPOA0gMzRFbm+ta9rh7KHs=;
        b=E3bq/L/636Vu3R2kHQWDHAwbwoFlgjQJxNljbW64AWBuZ9L2omsC8cjZGgo0DCe/Wf
         QHXKFUdnhBh6jtGmaK3n0SbniuLwF3qT4fKDL6+2fEo4XxRlshLqdVZEb5XJBQl5YK7E
         qsYyJQce5AJsGh5wJ266GA0en4yf37CZ8AVk+NnVOxvhAloRVtmdtMxrH8vVfL/IBipA
         Y2Qmj9ssMh0ducpzQ5rttAMYyNyQ4xjORH96SLO7sAGHLC5Dy9XOy6+2bqmcJbcCzafm
         JNWPoNYEPK+RdCl84h6+AuzoFW3q74tPbvCA4HRuuCeLB/8VUblX57pbx7raf7tDwxua
         7h7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pOyuRSTJ6PhVLdNSwCPcjnPOA0gMzRFbm+ta9rh7KHs=;
        b=fVN+T5yKnjtXGm3FnE9UNuh45BSBJBjh+fZkIrYU2iOTJQUi33JF7MtYlNqvTqp+6d
         5QGmlPkgBMaV4ulHaePbITeWF1x9KNipHB9zIeITHHTLP1+7As0UyCCjx+QKvHriLybD
         uw0ZfprycYuQDyIuzn1rRNOLSZ9j/I4QHFZGAv4nbHCJM7hblz/Iv3QyTur8adk8kJZG
         DKxmy8DDPd+CA7eS/ooq8KxO4Yfj8cgj0q8/RitW7cS5JCz69rmnUoWYpEC7kGAIzg1j
         gZg2WYiHXcBhvltTevEdogjf71C9hvFjpfavOlODd3UKawDBUagP+F+ks79Nntyd1di9
         ko/w==
X-Gm-Message-State: AOAM533kjgR+4oiy/hUeaa/ZpX8QwFu1mKjuMFjlgXGkJp4ZD+DhaVQt
	Omr4jBT99FQcVX9xe1CZGn4ZK+Ex0GwjvA==
X-Google-Smtp-Source: ABdhPJy7uBEdK/HK0s2OO1q17sVZgZgw1vcGrAmqrhbNPHXteWSE3lG7rg6MaiTgbWo7cvQfpPFnoA==
X-Received: by 2002:a62:844b:0:b029:19e:62a0:ca18 with SMTP id k72-20020a62844b0000b029019e62a0ca18mr22475956pfd.46.1607925690834;
        Sun, 13 Dec 2020 22:01:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::64a3])
        by smtp.gmail.com with ESMTPSA id l13sm11663016pgq.51.2020.12.13.22.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 22:01:30 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 1/3] qemuriscv: check serial consoles w.r.t. /proc/consoles
Date: Sun, 13 Dec 2020 22:01:25 -0800
Message-Id: <20201214060127.1727-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qemuriscv enables hvc0 along with ttyS0, however its not enabled in
/proc/consoles, getty tries to enable it in inittab and erroring out

Fixes below message with sysvinit

INIT: Id "hvc0" respawning too fast: disabled for 5 minutes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 0e88c91aa6..47d7e9b174 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -10,6 +10,7 @@ KERNEL_IMAGETYPES += "uImage"
 KEEPUIMAGE = "no"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;hvc0"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 IMAGE_FSTYPES += "ext4 wic.qcow2"
 
-- 
2.29.2

