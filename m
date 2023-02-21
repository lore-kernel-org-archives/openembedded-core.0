Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFD9C678DB
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 20:45:19 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.53788.1677012309770535473
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 12:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=We/qTFdo;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id m18so2410489iln.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 12:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viFycpahJUM4wqloGmKkKuzWqihfT82yK4VFLvTbEv4=;
        b=We/qTFdoKivutL6oUuIq47lKbJbRvONrZ3+42PzsYn3fcX8Cul2qylCecIf13RunwH
         UOOgR5g/bG7fjtnStQpgqabSBKkxAmQh1LhTmWqeYQhSYYQ8regtn2Vh+wHN9DVQZFDB
         z16hxhnxIdd5bHeJUjSYgha3MB8Nf+JiwfERKs+tIaSygtC30MT5C531/Zjla9xekIJ9
         sSoD4IZXIGcQxswSjIXSo9MBod16PGhX1in90+adbsB7sHm00ISNaa1yqjawyea+Abv/
         ku1oChdbYv2v6+zDZt7EgH3EejWv92KgSdqK7Ua+h4DEdhQtSdhvgMwFk3PrICxcowvu
         H/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=viFycpahJUM4wqloGmKkKuzWqihfT82yK4VFLvTbEv4=;
        b=4VNHM/SJVNj5EhSJsvlGcu/FQMHjA4R/slqmx8r1t0QPceLtKTjwIpFhx/aul8BLov
         2LksYwlubrNZVfuwBm2C1MbzJFAjgiaxcO74aQOuvqm+0llFAFsiw2G7VGbeIw8OJpZ4
         Pq2lyoXGrbD8zj4HtQukbg0mX4yiA1JsV6H1lOOLtBbXAdWoCzQQ1gPVGRnoNQQXry8A
         mqmorIR0KxsU165khIQMWbZzbJROJN5/QPvu+oJnD3zwYc+hlzXBG2ua2paTTDOt0HXK
         TKY+tVwIm0uFFokisS17ldBS4GBuldQF07HrGUkP2sNBlvOfYeQiATJClYWM+aUTasoG
         E+zQ==
X-Gm-Message-State: AO0yUKXqYWI7lkXZcKP0u3+71yVe3lrznFyxnZYzxvHcWyjaxTa+vL5+
	Yc1ooEv40wA5hvcN9zFU0rQllENm9GA=
X-Google-Smtp-Source: AK7set+Y/l1J3FtUhbLYmMIE3fefg34dGjfIlBXJXXwZ0yGP+5g6XlI3jbEbbEevXk8YRnLfApBWPA==
X-Received: by 2002:a05:6e02:16cd:b0:315:8ecc:9c8e with SMTP id 13-20020a056e0216cd00b003158ecc9c8emr6675496ilx.21.1677012316858;
        Tue, 21 Feb 2023 12:45:16 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e11-20020a02a50b000000b003a58ae912aasm414347jam.28.2023.02.21.12.45.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:45:16 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/11] build-appliance-image: check for xattr feature
Date: Tue, 21 Feb 2023 15:44:45 -0500
Message-Id: <20230221204445.23931-12-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230221204445.23931-1-twoerner@gmail.com>
References: <20230221204445.23931-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 20:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177549

The xattr DISTRO_FEATURE is required otherwise a bitbake build will fail due
to a failure with the 'cp' utility:

	Subprocess output:
	cp: cannot preserve extended attributes, cp is built without xattr support

	ERROR: Logfile of failure stored in: /home/builder/poky/build/tmp/work/qemux86_64-poky-linux/packagegroup-base/1.0-r83/temp/log.do_populate_lic.1001
	ERROR: Task (/home/builder/poky/meta/recipes-core/packagegroups/packagegroup-base.bb:do_populate_lic) failed with exit code '1'

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index aa1e87763d57..2321d3a51a24 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -22,7 +22,9 @@ APPEND += "rootfstype=ext4 quiet"
 DEPENDS = "zip-native python3-pip-native"
 IMAGE_FSTYPES = "ext4 wic.vmdk wic.vhd wic.vhdx"
 
-inherit core-image setuptools3
+inherit core-image setuptools3 features_check
+
+REQUIRED_DISTRO_FEATURES += "xattr"
 
 SRCREV ?= "a5507f383cdab99806df131bf4aef191799c5153"
 SRC_URI = "git://git.yoctoproject.org/poky;branch=master \
-- 
2.36.0.rc2.17.g4027e30c53


