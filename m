Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E467C0219E
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 14:05:12 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.9206.1739023510989354494
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 06:05:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=L0qoAWjX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f4a4fbb35so34559285ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 06:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739023510; x=1739628310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnhBY+9CB2cjPUSISdliYnoTo/IFA5kn6PLiCJ9KHl0=;
        b=L0qoAWjX7Hyc1HF70DRtHAdvmgm5c75OvKqXfcknirETeZaksOLYIVrna2qVeQw4Gr
         qzBoTS2voVKRtjoxIFggAyUjs5tkMJV1Hf8D9hXktEnbq9Y32lvaHF3G8XLJSJvKI/9a
         IEacjK8pHZJYvv69/UjDNnQwEBXMnHjMtEbnQXp4iD61dy8BEdzXryFORQ+N0TkrFNhH
         L7l5zzILMLBSOeNJBqkGepjEldxHz0J6LhwZeR6aAaDFPPiifl7a8bLn4cE/29Ucf2KQ
         u42YUjOAj5k/eDX6Qzb2IV8S5M50AZp3sRGLr6/Y83184ihjXKG/+bC/QToPAl3fjpYd
         rggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739023510; x=1739628310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnhBY+9CB2cjPUSISdliYnoTo/IFA5kn6PLiCJ9KHl0=;
        b=pEss5R+C7FTCaT3ZhQsE5evcSYq6x05aUqaD3k1lersyqOhFGSdI8IO90GHS+BrLXY
         WQTWv2spRCoFV/7XQxENt6+SkT7p93LQLVTbeY4DwPILax7uYP3tBC90qoFZzzWY/Tgt
         605fL8W8pBDXVAOA6/d5Ihb9AR8EMP908NTOKJq9PDWWppg7PnPie/a7jRUuiZNXwqGu
         NTr5FZmLdo3L54o5cUUwuW5YgtLcaI+5J3o3Uvl6QIwrNYoofi1F/4+8IlYWjtazuqMB
         +JlDSBeu3FQzDHziCxSiUy5ryalxLI7g6f/ZIwTJfSMZDoDXEP4im9Co/8RV81UafIos
         yb+Q==
X-Gm-Message-State: AOJu0YzDX/IgvVIaxnyXWd+1GwfheUybxbjdiXUBncmx9O1VJhEl3Nw3
	/TLzInBocsnQIsi4NrRqcc/lRelI1PUWb4rmQDCsT0IIbo16sSYOIlrBFz0BK/3QchhIsVOtQWc
	1
X-Gm-Gg: ASbGncsl8G9eFnad7eW5OiGzRPo9WjULBX/FnHfnY2IZXdunHhj0s6G96nKL+26N1ZS
	fUbrsQ7RWIO+gYyzR3pjQoSe1zI2tOGC2WDWZ+3Db9bk19I9OBQsGNJ1JMcupyYON2MYOwBOs56
	xyIFoJ77LJNVmhjMXcztqW4CjpWgAJhPm7MfyGrG4CCoUMy0bVxvc8sQuMe8zD6vZegy1s63ePj
	3O8FXXI/wxA8UffBxjS9Gz7utpmEkhf0+pSXy7Jn+Evr1WtmfVnLES/EAirXU+okicJykfhQ0ET
	Ochb
X-Google-Smtp-Source: AGHT+IFK8aExQEV0gI0fRzcQ+pKr+6DagtGYK5xEBc6igjxZwKxK73R6yENBTNKV9k0gFsNxk4+PaA==
X-Received: by 2002:a17:903:32cd:b0:215:3998:189f with SMTP id d9443c01a7336-21f4f11e100mr99897125ad.6.1739023510242;
        Sat, 08 Feb 2025 06:05:10 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c820sm47278345ad.173.2025.02.08.06.05.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 06:05:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/13] files: Amend overlayfs unit descriptions with path information
Date: Sat,  8 Feb 2025 06:04:51 -0800
Message-ID: <9eb6c41e1c5411193a19e73af81f628171b01407.1739023409.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739023409.git.steve@sakoman.com>
References: <cover.1739023409.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 14:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211024

From: Esben Haabendal <esben@geanix.com>

Having something like

Starting Overlayfs directories setup /home...
Starting Overlayfs directories setup /root...
Finished Overlayfs directories setup /home.
Finished Overlayfs directories setup /root.
Mounting Overlayfs mount unit /home...
Mounting Overlayfs mount unit /root...
Mounted Overlayfs mount unit /root.
Mounted Overlayfs mount unit /home.

is much more informative than

Starting Overlayfs directories setup...
Starting Overlayfs directories setup...
Finished Overlayfs directories setup.
Finished Overlayfs directories setup.
Mounting Overlayfs mount unit...
Mounting Overlayfs mount unit...
Mounted Overlayfs mount unit.
Mounted Overlayfs mount unit.

Especially as the number of overlayfs mount units increase.

Signed-off-by: Esben Haabendal <esben@geanix.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7308b4fc6f51bdf2b8f3b7899ff3758c5968e418)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/overlayfs-create-dirs.service.in | 2 +-
 meta/files/overlayfs-unit.mount.in          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/files/overlayfs-create-dirs.service.in b/meta/files/overlayfs-create-dirs.service.in
index c949a6dc73..d8d916365a 100644
--- a/meta/files/overlayfs-create-dirs.service.in
+++ b/meta/files/overlayfs-create-dirs.service.in
@@ -1,5 +1,5 @@
 [Unit]
-Description=Overlayfs directories setup
+Description=Overlayfs directories setup {LOWERDIR}
 Requires={DATA_MOUNT_UNIT}
 After={DATA_MOUNT_UNIT}
 DefaultDependencies=no
diff --git a/meta/files/overlayfs-unit.mount.in b/meta/files/overlayfs-unit.mount.in
index 1d33b7e39c..9c117f2c52 100644
--- a/meta/files/overlayfs-unit.mount.in
+++ b/meta/files/overlayfs-unit.mount.in
@@ -1,5 +1,5 @@
 [Unit]
-Description=Overlayfs mount unit
+Description=Overlayfs mount unit {LOWERDIR}
 Requires={CREATE_DIRS_SERVICE}
 After={CREATE_DIRS_SERVICE}
 
-- 
2.43.0


