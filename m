Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C8DC3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:23 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.1431.1746804259548186898
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VjnGwubQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7376dd56eccso2438184b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804259; x=1747409059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=meztH4kJJXT/uAEUWM3d38R+PzSFgsa3giuLrE3x51M=;
        b=VjnGwubQ7K6dy4X123FTMQjt9SJomUvml4MP8+scB1wveoFd6IaA/WutYW/nX5dzfx
         RRsGqfbVwjV4Y1ebFY8cZid+ypWNvBVkxqu6WSYwrFNFPAuAimXH1AVz/pg2s2XnxEIh
         zHRZR/OSCLgz0tOKQx/r7NF+ybTUguMwM7Iflvy0IMH9jHPRSW3xhcNtNtbnd9xiC841
         5BDYn4HWU9VkkdySDCWOdmg2DQ3XP71yeAxBvQ0mUzt2zOVyE+IG0SluyFC+N00ARcmH
         Dpc7Aroq58bsP0djcPA70WPoLZJWzAeWCuEkyIu00kGogRCImA8pR/8LzkTJO6h29ZNU
         9G3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804259; x=1747409059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meztH4kJJXT/uAEUWM3d38R+PzSFgsa3giuLrE3x51M=;
        b=A7mOkl9lt9N7bPa4WJLVTVAKzjhDgW1cQG4yWT3sqsEJ0WoOftquelWhXoLTQvJdTy
         6iqFol47uONrEOqq5tcsT6rKaWRqYQLf1S88DXcYo9ySyRa9BlPVNN/7CM8R2j5ukzkT
         33Mz5i/Tzx94y4eME7yKc9eZEQv3qj0geskztbzHotHeInfq+Y8WPM98SXQz35FVqztQ
         Awbp/0ahTZUJ4QGWoeWU/231yrcDGUTVixv8o0KO1fAZtYASCISCJ4pH0Bwkh6bK5oAt
         UdOwCAUs2gFr9pUHcOjVscIvT1+e6utP5oH8A/U2wrcxFvNdsewuj+mFDUhN9SHV04qe
         Nkzw==
X-Gm-Message-State: AOJu0YyPgAk/JubIIB/76JAc3KI7YZAbioral2km/+XLEADJFEegiBvS
	/EBLsrO5YPz79RSK2CW4HJYXnyJ/knPjqjOl0gdp4K1d7MFE3uCUI3EWo3OOfCwiA0QSGGyqR3h
	8
X-Gm-Gg: ASbGnctyHfseDSkM4vzZpz9XalQ+4WOV5cOb/auKk4Cn4FSx5klVQYU0z0mPtEN3eiL
	is9qWK0TifFTFa6r4Ks4mQkp7vWLsWrZSarri5YM8sIPCiEJ86Uc1LNVkm2SEN2kLbbKCVQoU+V
	xv+JnQH/UMD5qxWI1x1/0YnXRezdw7ajx5Omf6w/Nk4tT4WpZsvn/XEnENRo8ItS4MhKgNfbr9g
	ckwSV3pO6xx7yZromPuT+kl8mqeUCJVPDtalwLZwpG6dd/Xq6Vbhq0ib1uNoQeeCIIvroyBe28K
	oTwpyIwbdfqSXn6WQbaD7pEPBllbyW0V
X-Google-Smtp-Source: AGHT+IEA7Urm2uGe53kRHAQdfiS1eiijxepfK6v2MIRm4uwZKdaocgL7PT7zuzqRO0LiuIanWq/+Sw==
X-Received: by 2002:a05:6a00:198b:b0:737:678d:fb66 with SMTP id d2e1a72fcca58-7423ba8740cmr5334760b3a.5.1746804258784;
        Fri, 09 May 2025 08:24:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.24.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:24:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 17/17] gobject-introspection: Fix wrong PN used in MULTILIB_SCRIPTS
Date: Fri,  9 May 2025 08:23:33 -0700
Message-ID: <5e594b3d074900580fa83ca50f7d837937c17856.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216225

From: Jiaying Song <jiaying.song.cn@windriver.com>

The current MULTILIB_SCRIPTS entry incorrectly assigns
g-ir-annotation-tool and g-ir-scanner to the ${PN} package. However,
these scripts are actually installed in the gobject-introspection-tools
package. This leads to incorrect symlinks being created when multilib is
enabled. Therefore, this patch correctly moves them to the ${PN}-tools
package.

Error log:

root@intel-x86-64:~# ls -l /usr/bin/g-ir-scanner
lrwxrwxrwx 1 root root 27 Mar  9  2018 /usr/bin/g-ir-scanner -> /usr/bin/g-ir-scanner-lib64
root@intel-x86-64:~# ls -l /usr/bin/g-ir-scanner-lib64
ls: cannot access '/usr/bin/g-ir-scanner-lib64': No such file or directory

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gobject-introspection/gobject-introspection_1.84.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
index ac5f4e9370..f6797cd2e5 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
@@ -24,7 +24,7 @@ inherit meson pkgconfig gtk-doc python3targetconfig qemu gobject-introspection-d
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"
+MULTILIB_SCRIPTS = "${PN}-tools:${bindir}/g-ir-annotation-tool ${PN}-tools:${bindir}/g-ir-scanner"
 
 # setuptools are required to provide distutils to build the tools
 DEPENDS += " libffi zlib python3 python3-setuptools flex-native bison-native"
-- 
2.43.0


