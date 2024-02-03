Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61727C48298
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 19:15:13 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.23483.1706987709675134701
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 11:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IQIyA+RX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so3142323a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 11:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706987709; x=1707592509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5JH1Fpxb0CgZ+B1stvXT9F3fw0af9FepBlXGW4slnQ=;
        b=IQIyA+RXD0G0xBUiluJ6DA+jwtkLdSZC6ss8ewY9QS19tQv/SkVHF4Tz0KdBv+43X6
         tJI2TjQcBx4u4ftXb+LVeDIzaJpEtUxLN76OChX7LpX8/KBLqTmZAsc56JqINdO2QNS8
         YoGTY+B0gycPg99F7EamKwo0r1biGw+9o5ROpwtXsPeqiTqrz3wpPLf1ruCgpjbbZrx5
         6h7nejq4LudJHSIjvg2rVmPGuvhXiVesRWWh3D58xH/5rJ+mzvWTUnjY/Au+wEONvHTz
         fSJMpNHVsYSv65n/FhElAappeDXAixxjfPwNEHPJ3Dbh88Qmewl+3ptaY4k4bnRncNWB
         ycTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706987709; x=1707592509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5JH1Fpxb0CgZ+B1stvXT9F3fw0af9FepBlXGW4slnQ=;
        b=bbyQiupAYBclgGrFQpdee1rxzMV5QmO8yc9HBVlXs+OGqo3Vo7qIWPQTmc+w0uuC0/
         p9v+XK4eoO9Pkio8AvvoG3MzkrHO5gPBJAzcDCcbZkEHwY4bYUYYcPvNymkFA6OvCLGd
         3gXhNFx/NvNPRYOdoOamc5s9SN3oHxoAChAQvuIWY0fyJ2VChEBf+UBOaZ/K7ptiTEEr
         J94JQc1q27tkqdSZ/0MAN4tkDTufHoDO8gsa4Zntv6KOWFVQ9+vQ9880bNH1tnxn80J3
         ftYMJQYxp6zb3238V2k6g46gUgVcbV/TaXGCq2dlzKHntfrMTgkAk5J29agE3kv4Y7Rq
         eEnA==
X-Gm-Message-State: AOJu0YzGWcp+bWcGo0V+ETydWFpj+cmEPoCbUcm8iI/BLwFj6VI06+P1
	Y6m7jqV7OdQFdL1T8pXHph4yMx1ldLtrhUm5vZtjzXXdKyO6Te6goo86yaVxM4UO4bEstjX2tB1
	BDAA=
X-Google-Smtp-Source: AGHT+IF1pEbmghGIzbG6qs9qc11QWt4zpyy1lgki2M11OAecPNH/33Kt18Kh+VMjTxjtwKj1d1892w==
X-Received: by 2002:a17:903:2447:b0:1d3:d0ff:f49c with SMTP id l7-20020a170903244700b001d3d0fff49cmr7240057pls.21.1706987708877;
        Sat, 03 Feb 2024 11:15:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w63-20020a17090a6bc500b00296443780d7sm2376863pjj.47.2024.02.03.11.15.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 11:15:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 11/15] qemu.bbclass: fix a python TypeError
Date: Sat,  3 Feb 2024 09:14:38 -1000
Message-Id: <3ccc642bb36373e81d80d41b4f213328c7bfb9cb.1706987549.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706987549.git.steve@sakoman.com>
References: <cover.1706987549.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194855

From: Ming Liu <liu.ming50@gmail.com>

QEMU_OPTIONS can be empty which will trigger a exception TypeError:
| can only concatenate str (not "NoneType") to str. Fix it by setting a
empty string.

ALso removed two useless blanks.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b619197bd52a4a99a9989e7ea6fb7032415b1e42)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/qemu.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.bbclass
index 874b15127c..dbb5ee0b66 100644
--- a/meta/classes-recipe/qemu.bbclass
+++ b/meta/classes-recipe/qemu.bbclass
@@ -34,7 +34,7 @@ def qemu_wrapper_cmdline(data, rootfs_path, library_paths):
     if qemu_binary == "qemu-allarch":
         qemu_binary = "qemuwrapper"
 
-    qemu_options = data.getVar("QEMU_OPTIONS")    
+    qemu_options = data.getVar("QEMU_OPTIONS") or ""
 
     return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
             + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
-- 
2.34.1


