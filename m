Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988E7E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 16:44:22 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.24069.1734021860465814811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 08:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JtN99MjT;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361ecebc4dso6185895e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 08:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734021858; x=1734626658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4bGxSjcz5OAd10C5THP+4ZJLwbECSLQ5Y5P7eNOZSBk=;
        b=JtN99MjTfN8HHGV7T63srkAbukrE7UtfsOucFjZKzuiZ/Sv/25kKefytUuxzsN90eX
         sEC0VAk3HLqe7GSWP8FJADKQ2gOaN63/oVfLSK7XYYVcU/CR43Cuo7MksdQgjWRtIWiJ
         JBqGu7wTBhqv9ZwCCzPMnafK2BzS6GXunS078epggGKFgdf7NDDSovxRpuT/in4nFOdr
         yBgffyTZfkhZvi24lbihHI3RRjofurVGWu3A9i3RqTAHBXZiW1vw+nG4f0n3hOvwArrW
         A72Y1rgCLEkEYRkYoYt5V1s5N37oliISuwGjQ2OgLCJJOEvBnTYYFSEqmrbvRJRj/Yrs
         9oYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734021858; x=1734626658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bGxSjcz5OAd10C5THP+4ZJLwbECSLQ5Y5P7eNOZSBk=;
        b=q6Y28eBd3JPL+2BzZxmtssZ0HOCkO9j9WvqrNUjR9jchGIbpn3+SI725eg9KLeWriL
         Vpdgn7/pmRDKY9LRMB2JaIShiMgQSsIFjK4MpZQiLThmnQ51h/BJTJa1oMUFzJwKGs6F
         FEmnf2+6bnTIxUWknEBuoIWhGUl5y3QslqBr+rDj1wgL6oOx6i1crdJOCWvnGvZeP/oH
         oHLEePxEMNsPoCNqPz5ywOtVcKzH+s13qQQpUu/1ix4WRhXQQqIwM7E/IClNxxnNVGIA
         LRDKMWFcXlMu2xtDRbkbS1v9xZL0BARFbhRlxfXGR7aFJDN8PRTEBq617jdwT/pCVPJi
         gn6g==
X-Gm-Message-State: AOJu0YzLVH83RvQXlOQ5/IlP8IzEi3/DE9mNlVwFLzS8B2+wSQrJ965m
	vWjqujrVpiddBTn1HAUbcRHoNxBX7C1TkffhPmbVp2IpMYK7pReD3JxvoQ==
X-Gm-Gg: ASbGncuxffJ6fxGcdtIYylCd2fH18vUjPV29JKQAS79qJRlglBD5l1DW2P0c6ES+3C0
	9rZgspAsYajsgi1b6OtGu25T8OjYccggc/7gGZTsVnWRphOO60ErrLQe1Psh5XByhTgD6vdP7tR
	/HePV+5SwYUyNL/kt0t6A96V9UcgBJJdvuzGO9dhAQ1DjhuAD/pfbHGikHZXaTBKJJl8Z9ZzpU+
	idhUVNaJACJOW5gjh9wfVZmZwysHeq/3Tw+MGPEdlT4AwORlbUHBgjuB4q4Sq9bbtKf82S8R3+/
X-Google-Smtp-Source: AGHT+IGAp6eA/iFwNVpIz5vi+uCCuHlpwzbVVQDXUH4x6DWf8eViY3G4G8KDAB2xhsnmJZZTWWeoRw==
X-Received: by 2002:a05:600c:1c84:b0:434:fdf3:2c26 with SMTP id 5b1f17b1804b1-43622845d8emr37469605e9.19.1734021858309;
        Thu, 12 Dec 2024 08:44:18 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4815sm4473331f8f.26.2024.12.12.08.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:44:17 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>
Subject: [PATCHv2 0/5] systemd split networkd package
Date: Thu, 12 Dec 2024 16:55:21 +0100
Message-ID: <20241212164407.2904755-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 16:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208653

v2 fixes the build warning

First of all, this patch series fixes a bug in systemd.bbclass that
forces service files with an Also= relationship to be in the same
package. This may often be the case, but as long as the RDEPENDS
between the packages are set correctly, it is no problem to distribute
the service files over several packages.

If service files referenced with Also= are no longer automatically added
to the list of FILES, build errors caused by unpacked files are
expected. A bitbake world has shown that there are only two recipes in
oe-core that use automatic packing: busybox and dropbear. There are 2
patches that fix this.

Also= relation are probably most often used for sockets. Consequently
the systemd.bbclass should also allow to split socket files into
separate packages. However, that's proably practically not used and
would cause tons of packaging errors. Therefore the automatic packaging
feature for sockets is not changed.

The latest patch splits systemd-networkd into its own package. This adds
a little extra complexity, but splitting systemd into packages is a good
step towards making Yocto more usable in binary form.

Adrian Freihofer (5):
  busybox: add klogd service to FILES
  dropbear: add dropbearkey.service to FILES
  systemd.bbclass: refactor adding files
  systemd.bbclass: do not automatically add Also services
  systemd: split networkd into its own package

 meta/classes-recipe/systemd.bbclass           | 28 ++++++++-----------
 meta/recipes-core/busybox/busybox.inc         |  9 +++++-
 .../recipes-core/dropbear/dropbear_2024.86.bb |  2 ++
 meta/recipes-core/systemd/systemd_256.8.bb    | 28 +++++++++++++++++--
 4 files changed, 47 insertions(+), 20 deletions(-)

-- 
2.47.0


