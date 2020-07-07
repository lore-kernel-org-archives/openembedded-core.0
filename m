Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.26118.1594155818263836224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 14:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AfTcMHd0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id k6so46755547wrn.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2020 14:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yTLD6ue/SWefF0nD4GZiYv2qqYjcSqZHZVpWR2d+KeM=;
        b=AfTcMHd0FcpfkruTeC+GfIrPbasFtLjStMGjMnVSK0dwX2+bDyoahLZPctNNqU2q01
         /jO9eXJQbe5tJHxuYAh3TPHdfFFy/Scf/h69DV0sK41XBrk9sM1gJflHc8PkbH1A9hhi
         NUq/HUIioOmCGZAvK/AvQ+MLbVU9YokAlp414=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yTLD6ue/SWefF0nD4GZiYv2qqYjcSqZHZVpWR2d+KeM=;
        b=UonESHsd+ALmF6qT/pG5sZYER9oJnD2VUYTO4isaNOrKPQ2wISHSr0GDvrYzeZkJ/o
         P4F3ZH3LnFYrHztv4lazLUMfc+0JdCZB4ihvPgkdHzNrlhdKVBVbSYiLs2pPVL8f0DbG
         U15I2rZ//01jbSbOhkl6tP+0u9vrwCmuF9/B8uZ7H5ZtoNXBEgeS0KNGfYeRgZ0CCi0J
         FLZ+UrHpecZ2anki//Bom1kQPObqviD4j5xz5IC/3e4Bp7xjtRrGyOggRkXNlHrmwY2p
         O9q4LcEHf0/2i+iF8XiGXySlVMOdE6y8td2P4y4NSrJwfh34nbkk7agAE6CRw4CytdDG
         qHXA==
X-Gm-Message-State: AOAM531Fn2quRqFW6Xr53iO5YmZGLurI64ohiKIxJpyw8ClUL0kh1IAG
	qmM3eNrZ7EjTZ0BALcS7NCG3p6gg3I6Daw==
X-Google-Smtp-Source: ABdhPJxp63WAeMEzmS8uOYjahVoAZ9NZzD09bYaLYA+Ul2baeDKwNFnDB0tnJ7NL9GlUjcmH8iIZDQ==
X-Received: by 2002:a5d:4903:: with SMTP id x3mr58931805wrq.351.1594155816588;
        Tue, 07 Jul 2020 14:03:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id q7sm2672709wra.56.2020.07.07.14.03.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:03:36 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] server/process: Increase timeout for commands
Date: Tue,  7 Jul 2020 22:03:35 +0100
Message-Id: <20200707210335.351040-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're running into this timeout on loaded autobuilders in situations
where things should otherwise succeed. Log a note in these
cases and continue to try for longer.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 lib/bb/server/process.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/bb/server/process.py b/lib/bb/server/process.py
index 69aae626eb..83385baf60 100644
--- a/lib/bb/server/process.py
+++ b/lib/bb/server/process.py
@@ -331,7 +331,9 @@ class ServerCommunicator():
     def runCommand(self, command):
         self.connection.send(command)
         if not self.recv.poll(30):
-            raise ProcessTimeout("Timeout while waiting for a reply from the bitbake server")
+            logger.note("No reply from server in 30s")
+            if not self.recv.poll(30):
+                raise ProcessTimeout("Timeout while waiting for a reply from the bitbake server (60s)")
         return self.recv.get()
 
     def updateFeatureSet(self, featureset):
-- 
2.25.1

