Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D28C433F5
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 21:38:54 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.1318.1633297133455159796
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 14:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lQ/gCBxG;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id z2so11834370wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 14:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tk603o9gCsk5n/T1wYUyXuWzeFUHqk+LWmo9ufHVDG4=;
        b=lQ/gCBxGzoSNQIKRFIfdTdqkDHOttE5FBza5+PLsGNezGZ759mv5wkaEjSRynNH3l2
         LPDeZqutHAOLTMQCdf1yQ5mVvx3eBf5vBeOrF1ccjmYgeI81Li/etpGof/PqZsC0FIZ0
         CFQmQc1hrsfcvwOSG0XvqNpHBBsKQVF7tO1aIFH/vLaOgs+OHzV6xxdlRuxzBycsUraX
         AZ6RC4sBOtLPsljQ46YyX7aYS8yDWXhABxO7kf/Nbhera3drsJbt5n03odkBGGMgCy/+
         JWWiWElLoVNMY+SRAXIUFgziZaEeKVH8zcySVx85AWno4gSfZiyLIqHS18NfHJtIXRQw
         9PSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tk603o9gCsk5n/T1wYUyXuWzeFUHqk+LWmo9ufHVDG4=;
        b=7PcPgOITJgulH1QYE7KtpIcp9OM6wYX9zRmNqD66JiKy0O6MabBfyPiHI6oxzyLzej
         sH/rFZjKqQKtd2Z3ZhIwqUG+RE6YiBIEo/WzMkrhP8C1Rzb8x3VpZoWyqNaZX8PBOBjl
         QR3htoytz3fKutvmPzQhFBRmnCSE5nj5rEl5Q5c83JF5Bhv5KpTjTyvfvt1Gcx6sqbhZ
         45NBauM7g2DDMvnQX9U+fKJz8/A8iDxzbqPNwawvcCcMWknEkCOaczvB5gslnRszyJG4
         ltZh5JlEUJKDhdNW9j/IF+mfCzijnhKId7LGz3aRwM/rFbS4GuXa7A+g2WhsuZjZq1gH
         K0JA==
X-Gm-Message-State: AOAM533qHGrFzYno5tcqjwusydsgDXkuRm/ZM1l0AhQZ09V1sjR8yI5U
	Wm4T2SV8KPJVAls69SutOIVvhxOLuidOtg==
X-Google-Smtp-Source: 
 ABdhPJw+O3/Ywol0ecjq69FZPozCbOy6c8Kbnj16P5fKDh7A9Zt3Zi74iFABqIBZP6RMGpU79oIiZg==
X-Received: by 2002:a7b:c409:: with SMTP id k9mr15306832wmi.153.1633297131599;
        Sun, 03 Oct 2021 14:38:51 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 z6sm17453759wmp.1.2021.10.03.14.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 14:38:51 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] sstate.bbclass: adds warnings for the exceptions of os.utime
 in siginfo
Date: Sun,  3 Oct 2021 22:38:34 +0100
Message-Id: <20211003213834.934065-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 21:38:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156561

When we can't update the access and modified times of sstate siginfo
it is useful to infor the user about that.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 92a73114bb..2deecd8777 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -720,11 +720,15 @@ def sstate_package(ss, d):
         try:
             os.utime(siginfo, None)
         except PermissionError:
+            bb.warn("Cannot sets the access and modified times of sstate siginfo %s, no access rights" % siginfo)
             pass
         except OSError as e:
             # Handle read-only file systems gracefully
             import errno
-            if e.errno != errno.EROFS:
+            if e.errno == errno.EROFS:
+                bb.warn("Cannot sets the access and modified times of sstate siginfo %s, read-only file system" % siginfo)
+                pass
+            else:
                 raise e
 
     return
@@ -1165,11 +1169,15 @@ python sstate_eventhandler() {
             try:
                 os.utime(siginfo, None)
             except PermissionError:
+                bb.warn("Cannot sets the access and modified times of sstate siginfo %s, no access rights" % siginfo)
                 pass
             except OSError as e:
                 # Handle read-only file systems gracefully
                 import errno
-                if e.errno != errno.EROFS:
+                if e.errno == errno.EROFS:
+                    bb.warn("Cannot sets the access and modified times of sstate siginfo %s, read-only file system" % siginfo)
+                    pass
+                else:
                     raise e
 
 }
-- 
2.33.0


