Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.5890.1591152854644784645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 19:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SnRB81kI;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id g3so970192ilq.10
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 19:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yaTwAoxJJA5o2bHuTyf563bPNpYA2Imn+ouU1F4Y+uI=;
        b=SnRB81kIGpBN650vlP1hasSYKhlGHstVQiXUA/8L7zO/l4RRirhTB1p1QcaQTTv/5V
         8msccu+g3lodO42pLWk7t4hRqokYFxqBpgG2Olt/5Hz1qbQjkKdutln8wNL/jEpw+3ou
         6fFm5KSINxRU0AgUXqHeUy4O+J/lICtCjV/Chid1deq2/G/WFokGVx4+n245knSbwSGG
         7WElp+fTkYY2kgfkGTymBNnE1tAwNkxMYBvuHw94zCP2kdHwA7EKHcNvvVS0OTBfdiP4
         k9EswbwCT0Mu+hAhi3GYOQM4+5Sb8qVxroot6Mf/E9jerfMmytlSKFOlHw/b3zaJTaDc
         Jw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yaTwAoxJJA5o2bHuTyf563bPNpYA2Imn+ouU1F4Y+uI=;
        b=b2QRlN/IH48Z/yvhKwo6wJ/DuWkOePmOuZLqyxu4iVnIQU/mkdOcrsAd41r/6u9BOz
         AnU7Kz9xDj17svhOUWXUsNLyuIv/rsNCBMS5Aey32hgtte24+pM8uFBeY0W8UPQeUSz3
         UsOgvJoNtrPFRJDVv7zNIcPSMS5eIO3mK8pKREtNu1WQqYSTUJvViBC9u+Sl675sORE3
         Cy4+awsUnkvAtgg19che92Ot5qUNrNZXLnPeU2PFU2kVBUndKV3JHp8jUf5M5oUqCEsx
         KW9ZXm8ytmqQpd9I4lJPeMi/jd22s0+iUtujubIdEUXzUEfbMaakTVG3SihquzP9dRLk
         lIpQ==
X-Gm-Message-State: AOAM533Wa/gWizWttcOB86MV0PJW4ktzAXIrKlU9ns5UbVaGeECiTedZ
	oGC8Ncxhf2QM+DUaztqSTU59OGcjtss=
X-Google-Smtp-Source: ABdhPJy6COAZt66CiKFSEcozIe1Wgwyx5ptqQTJYZp78WlXepnQqn0Li3CsZtCZX4Vhb/ADlTqHOng==
X-Received: by 2002:a92:854a:: with SMTP id f71mr2083380ilh.28.1591152853794;
        Tue, 02 Jun 2020 19:54:13 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:b01b:daad:c850:7bb9])
        by smtp.gmail.com with ESMTPSA id x15sm355643ilj.78.2020.06.02.19.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 19:54:13 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 4/8] bitbake: lib: Add PrefixLoggerAdapter helper
Date: Tue,  2 Jun 2020 21:54:01 -0500
Message-Id: <20200603025405.26885-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603025405.26885-1-JPEWhacker@gmail.com>
References: <20200601202807.26357-1-JPEWhacker@gmail.com>
 <20200603025405.26885-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a helper logger adapter to add a prefix to all log messages. This
is useful to distinguish log messages between multiple instances of a
object.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/lib/bb/__init__.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/bitbake/lib/bb/__init__.py b/bitbake/lib/bb/__init__.py
index 2e2966c3b9..1de32041ed 100644
--- a/bitbake/lib/bb/__init__.py
+++ b/bitbake/lib/bb/__init__.py
@@ -84,6 +84,14 @@ logger.setLevel(logging.DEBUG - 2)
 
 mainlogger = logging.getLogger("BitBake.Main")
 
+class PrefixLoggerAdapter(logging.LoggerAdapter):
+    def __init__(self, prefix, logger):
+        super().__init__(logger, {})
+        self.__msg_prefix = prefix
+
+    def process(self, msg, kwargs):
+        return "%s%s" %(self.__msg_prefix, msg), kwargs
+
 # This has to be imported after the setLoggerClass, as the import of bb.msg
 # can result in construction of the various loggers.
 import bb.msg
-- 
2.26.2

