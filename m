Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77723C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 22:29:54 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.2412.1647901793515440849
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qUZ/oVBv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id t5so16721251pfg.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5r8YY9NdGMzh/Hd85dR6xZg0EaGNSzvK5brognfYlVY=;
        b=qUZ/oVBvvpACb7e+hUmLx2y4GwlYM45xKSFT6RjdynP7fceBrdQxVeuL34o3nQZTGb
         ndXolsGzZyItn8EuoH6R4ikiAPuBhBInxVqi/hewHiM9y58NIM/4A9dO6rrXId+/AlM3
         ZN/WP8XXELYzR/nwkU0aKQKBzQxeYsnVZrxlGK4OA1looxiawfvxtZk5pRi9/T8b19Fc
         jRQriPtzHSOpBmgvHuugsUIf9+76aSFR3UGMZ7RG8X0apBeDkS9AGZCROa2kE41to6cq
         0zYFJaSgyPhxUZB4PZoVWUW5qK0SS0+jIe8ZZvyM/fyowHCgpZobgLF/MMOFMYe+0vPh
         8qvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5r8YY9NdGMzh/Hd85dR6xZg0EaGNSzvK5brognfYlVY=;
        b=7lnO6iF2UYXkqq/3fMPpnPRtocnXxCXovbSnbX7y2HeFjDsehKQVLQNnkIFf0nLIxn
         XEejdDGrI++M8/XIlVxubW6OBRdQ2QmI5rG99YZFhS3kSORc4Ht2LcXIvOU1tgyjjE1+
         8TTGLfNhkEjIoLq1c4LMbh9NasXprEc3XLgmqVz+c14KHC1H25vNsz4we4iXJuhTAfka
         sL9P6hJG0cUi1IPHmfV4ruRXDjHK6nWxgmsu41ogKHgh7kjwHBNTRrYW2wuC1S+Yr9G0
         0FwbvB83RVFRQz5DsaejBBs10mmTHqNuiBRXmYXSPa/JdaXpZ2JTvzuwivq/f4SsAC9E
         XsPw==
X-Gm-Message-State: AOAM530Ha4YNfw6k4yaHiINkVciPwgENjEfUPO6vB14lXu+GH9hNivfy
	0gOo5QIS3aO5fXMQWLGjebigPOOhn6aCkLhkTDA=
X-Google-Smtp-Source: 
 ABdhPJwdCt1txR9PHXsGBqIywAnEZLlpydjdMEALmSzKS6rk2oYaGYRlnEC78m7DhsdvPfs6ffOb+g==
X-Received: by 2002:a63:8948:0:b0:37f:f087:9cac with SMTP id
 v69-20020a638948000000b0037ff0879cacmr19912658pgd.120.1647901792584;
        Mon, 21 Mar 2022 15:29:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 k13-20020aa7820d000000b004fa72a52040sm12352649pfi.172.2022.03.21.15.29.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 15:29:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/13] oeqa/runtime/ping: Improve failure message
 to include more detail
Date: Mon, 21 Mar 2022 12:29:12 -1000
Message-Id: 
 <df98e96c7a1601798caf7f4882b09406a4fdacd6.1647901591.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1647901591.git.steve@sakoman.com>
References: <cover.1647901591.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 22:29:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163525

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When the ping test fails due to a timeout we only get limited debug
information. Tweak the code to improve that in case it sheds any light
on intermittent failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d81704057950e1970ef7f673fa771834fd2b3f1e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/ping.py        | 20 ++++++++++++--------
 meta/recipes-core/libxml/libxml2_2.9.10.bb |  2 +-
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index f6603f75ec..498f80d0a5 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -6,6 +6,7 @@ from subprocess import Popen, PIPE
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.oetimeout import OETimeout
+from oeqa.core.exception import OEQATimeoutError
 
 class PingTest(OERuntimeTestCase):
 
@@ -13,14 +14,17 @@ class PingTest(OERuntimeTestCase):
     def test_ping(self):
         output = ''
         count = 0
-        while count < 5:
-            cmd = 'ping -c 1 %s' % self.target.ip
-            proc = Popen(cmd, shell=True, stdout=PIPE)
-            output += proc.communicate()[0].decode('utf-8')
-            if proc.poll() == 0:
-                count += 1
-            else:
-                count = 0
+        try:
+            while count < 5:
+                cmd = 'ping -c 1 %s' % self.target.ip
+                proc = Popen(cmd, shell=True, stdout=PIPE)
+                output += proc.communicate()[0].decode('utf-8')
+                if proc.poll() == 0:
+                    count += 1
+                else:
+                    count = 0
+        except OEQATimeoutError:
+            self.fail("Ping timeout error for address %s, count %s, output: %s" % (self.target.ip, count, output))
         msg = ('Expected 5 consecutive, got %d.\n'
                'ping output is:\n%s' % (count,output))
         self.assertEqual(count, 5, msg = msg)
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 976eeca1d4..c45cf4423e 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -31,7 +31,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://CVE-2022-23308.patch \
            "
 
-SRC_URI[archive.sha256sum] = "28a92f6ab1f311acf5e478564c49088ef0ac77090d9c719bbc5d518f1fe62eb9"
+SRC_URI[archive.sha256sum] = "593b7b751dd18c2d6abcd0c4bcb29efc203d0b4373a6df98e3a455ea74ae2813"
 SRC_URI[testtar.md5sum] = "ae3d1ebe000a3972afa104ca7f0e1b4a"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
-- 
2.25.1


