Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.12738.1587278149595019611
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 23:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ONlEXxSh;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id b11so7966968wrs.6
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 23:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7UwqtOJB6MzWIPwqdmSVwhByl7COX1zKYclhyAgRO8w=;
        b=ONlEXxShkmQySacdvMkoqBnt2VyJqBcvI2c/fqEM0xnI16K4tHKl2Zu0fU0ebIE5iy
         MlsRLMYaEUwYYHOkm+4PacMTccJ8NLuxNKem397cX+zuivDeDc+YTFumni8t1KU31znz
         ygf6wKBN+Dm3ZCZB/C/My57eDWcSDxI/T14FpJ97eUpHLVv3LC5wmV47S7T4jr8Ov+bB
         3FwanejWqWA1AC3sPR3bbzjWwh2OdUZ9uyXxXpWE+KE12lrr1lums8nmH881qnbjtwlq
         ZCH9rftJnFd/aPGCYz31n2k1+xsJZs0HQeByQVkOvSM3XSJ7zi++4RgGQ9c8ubtvYKDH
         Q3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=7UwqtOJB6MzWIPwqdmSVwhByl7COX1zKYclhyAgRO8w=;
        b=dI2rWHneEwQNex5UBCILLiomFuqMUcalWeQ3T1R+INIVU2degmrX5AZ7jfOoZ1TyA3
         y5NKN+eYn13pGkCkvL360eQ612QkoFHJOPkXbum1ePjTLpLLnXLBCmc9RtmSrDOKIp8M
         r/53fKLsr6voLyT2gjx50PBYucwNXwTT07sk3Sgo78eCN33b6HMpSVNcuQMkd65XdkM/
         aNNfwJhTm18QlS/CnWdX4ydwTjElj/2bVBJtsCgDkenzKcxT1zcurh9fhGk9OlGqspf0
         TkcIQkdfQPNHJdKW3Fo+H+uwLjmHuHny3SDn3Y6gubW6LCRM+cJzyvXwRy/9R3ML34WU
         95EQ==
X-Gm-Message-State: AGi0PuYAjwBWKElh640DXTjTc3N47RXtlcDkXqbDnHebUC5QkOrywNr4
	SpKCMARAK57szQmSxX0SNIbAV+V14sE=
X-Google-Smtp-Source: APiQypIefj5yp70FfVrz5ZYF7E9V0acO3aCiv0q8Ed8+orU7FqFxbcJ/aih1hYgryKy8mquvReOJcw==
X-Received: by 2002:a5d:428a:: with SMTP id k10mr12324951wrq.59.1587278147833;
        Sat, 18 Apr 2020 23:35:47 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id n6sm13980266wmc.28.2020.04.18.23.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 23:35:46 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
	Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v7 04/10] wic: Continue if excluded_path does not exist
Date: Sun, 19 Apr 2020 08:35:32 +0200
Message-Id: <20200419063539.1467641-5-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200419063539.1467641-1-ricardo@ribalda.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

If an excuded path does not exist, continue without an error.
This allows to seamleasly reuse .wks among different projects.

Eg:

part / --source rootfs --fstype=ext4 --exclude-path=opt/private_keys

Where /opt/private_keys in only populated by some of the image.bb files.

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 85c634f8a1..247f61ff7c 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -136,7 +136,6 @@ class RootfsPlugin(SourcePlugin):
                     sys.exit(1)
 
                 full_path = os.path.realpath(os.path.join(new_rootfs, path))
-
                 # Disallow climbing outside of parent directory using '..',
                 # because doing so could be quite disastrous (we will delete the
                 # directory).
@@ -144,6 +143,9 @@ class RootfsPlugin(SourcePlugin):
                     logger.error("'%s' points to a path outside the rootfs" % orig_path)
                     sys.exit(1)
 
+                if not os.path.lexists(full_path):
+                    continue
+
                 if path.endswith(os.sep):
                     # Delete content only.
                     for entry in os.listdir(full_path):
-- 
2.25.1

