Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80F6C4167D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 10:28:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.48888.1699007292451637914
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 03:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GCFX+mQz;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40891d38e3fso13570315e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 03:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699007291; x=1699612091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FufGndjz5XVITAICk+pt8iy4iNJuEI8HmhN8/wwcmLU=;
        b=GCFX+mQzzOuBF3xCJwN0JGw1FgYutOTbLfaS8rst4ksBgxGuwDbxwoa0jt8rpJE5s1
         ZBV6xw0Dgm+BBU5CT4hfiI2eSTrsxZhANT4xMgod1A3u202HYnAc+E36HfRo4LnpAhZK
         VHabtnRyH0vlz/+Ty94uZoQr/T0/YqZJDasy8SiRaYATM5luBX+MBQcuqt70hKOzJqjP
         04Ri98ftBoemMxDgd734ZjL5cgSM+gsEL/uFfncggCz4yXleE6FJO0HG/iuXAXAxTgUo
         Mc/1meQjtgjK5Ea1TeJSF1OtS8hXqLO6M6VfEqERJUf0qJge9qPXbjCnz7Aq06hDSk5h
         0mbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699007291; x=1699612091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FufGndjz5XVITAICk+pt8iy4iNJuEI8HmhN8/wwcmLU=;
        b=Y2RA/x/ZszYZSwnnf4Ji6DMovgr+SZC8hNbnY3BBstPrdYq4/H9fnOmYBBsYYNe6E2
         MSM1OQrguntBITvsaGP8G7ivxCRQ9KBXdqpFu9wiuysxxfOK/fYTikzgZlHdTSsDCPeF
         97sOM4XAk9YbN20GGtQKCLJPXgxqBwhPvMJWZS4xfkB7V1Q5phq340nFt3DFavu1bSwQ
         w8pE+LL7enRtGVPAtb8YD5Sd+raBHudSQagsaqvvuokxFDMgEOSAmZQfXX+CKNq7RRMA
         PlSb6AHur0EvIv4OBfC0SEzou3RoKiC+KcQXqErAjYce8gv9rBf02l9snRYMUdojh7tl
         cmUA==
X-Gm-Message-State: AOJu0Yye9Pk4QDPxLtCSXAB0SIdXqKODaKHZeKjofz+nJ5TPY2U6XpX4
	1YeJ6P96mIH0Zao4Cnx9lTnChWr2Dvg=
X-Google-Smtp-Source: AGHT+IGS0wMmQUZ6QXl+b0piepD8EycfzmHry4bZxZaDsHSsMRJhcEMToVM5S8ikIcCXzYd2ZlL3CQ==
X-Received: by 2002:a05:600c:1991:b0:405:7400:1e3d with SMTP id t17-20020a05600c199100b0040574001e3dmr17219206wmq.32.1699007290447;
        Fri, 03 Nov 2023 03:28:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id y14-20020a05600c2b0e00b00405718cbeadsm1976643wme.1.2023.11.03.03.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 03:28:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] populate_sdk_ext.bbclass: do not symlink unfsd from sdk image sysroot into eSDK tools path
Date: Fri,  3 Nov 2023 11:28:03 +0100
Message-Id: <20231103102806.2332746-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 10:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190148

This was done in 2016 to support Eclipse plugin (long dead),
it's currently broken as image sysroot is not in the SDK
until the image is built in that context, and current tools
all rely on runqemu-export-rootfs which does not rely on PATH
and runs unfsd with full path to recipe-specific sysroots.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 028d0c1ff54..173b3065b00 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -635,13 +635,6 @@ install_tools() {
 			test -e ${targetscriptfn} || ln -rs ${scriptfn} ${targetscriptfn}
 		done
 	done
-	# We can't use the same method as above because files in the sysroot won't exist at this point
-	# (they get populated from sstate on installation)
-	unfsd_path="${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/unfsd"
-	if [ "${SDK_INCLUDE_TOOLCHAIN}" = "1" -a ! -e $unfsd_path ] ; then
-		binrelpath=${@os.path.relpath(d.getVar('STAGING_BINDIR_NATIVE'), d.getVar('TMPDIR'))}
-		ln -rs ${SDK_OUTPUT}/${SDKPATH}/tmp/$binrelpath/unfsd $unfsd_path
-	fi
 	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
 
 	# find latest buildtools-tarball and install it
-- 
2.39.2


