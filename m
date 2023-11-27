Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0855C10DC2
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:07 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.91942.1701080282224336175
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fW2EUya8;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-54b7ef7f4d5so552692a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080281; x=1701685081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKRV2p7W9Qsk1nn/93RpoBWcvMT8PsnUv62ShOAnmc4=;
        b=fW2EUya8gCByf+WEjn5Zrz8N30AtRsqohSU1UGXxo26kltcS3OEJK/M4rDSi4qIVKG
         noJC38DcO54wZRSj1NtfrQMYMs2332bdi+G/dYxGy4qbxbnz0dar7de5E4gj5C6EdppD
         qM+D1PGIdSua81etme+TyyLkukiCpk9ReBSXBSJ3Q3Yi4AVXageor8jZBeFLRCPjp9yl
         FGSLioZLxK7uBQDC1Lm4e7Jfwtv1llHqBtUtdZuKnOSqhzUUF4OTI8r0FDVVT/uMMppy
         636oSqxVyDQ3UfmXkK7VNgvcdE0SNuqiOmgEJs3M39pGYDJjG6OL5xOdeG8wa7o26BmM
         7qFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080281; x=1701685081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKRV2p7W9Qsk1nn/93RpoBWcvMT8PsnUv62ShOAnmc4=;
        b=M43IDmzuUcixHAAQbaWIBTYQjgzJuyKA/SPgxHFbdnn1QWEuO6yQmGf8Jt2kCJ5olu
         6PHbvClGQh/J96R8JaNfhJakgC9Y/0F0tybksWu5f0FJRbWERGVBkA7KVNp4TDC9RZj7
         KAvUqdv1suBHioValgWelHQLqQIPTv0B5uVbHP39CNmrWvY9ri/N6hcevtrHWt7+Dgbo
         Hay2L8Z7kbD6XRo+V1DYXs6F3TPhj+GJB3kXfMM37Bz6qkrsH2Mu+IJUD+teHGniDUd/
         b73+QZYqk2lYvH7nrj6OKeSRreLx6pjQ1NsDoXQfpGiZ9hqjuZtyQ3rkCOklfuWXfJwf
         9Khg==
X-Gm-Message-State: AOJu0Ywzj2eLKkgaaBI81nsiZ8ULNjLzB0jF1vQWDVeNNEHRDzUzKSym
	ARXc64bJ+HWLlvQK7mM21l9WfWBKOwg=
X-Google-Smtp-Source: AGHT+IHnX0CLLBvKeiBEPmDeREvQI31qd6FxcGn+/ASvqTtUlMe7c+riD/0A+oL52njn7CwU4w7yeA==
X-Received: by 2002:a17:906:738e:b0:9ff:cdf3:553 with SMTP id f14-20020a170906738e00b009ffcdf30553mr8541997ejl.61.1701080280614;
        Mon, 27 Nov 2023 02:18:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/19] useradd.bbclass: list all needed items for package_setscene task
Date: Mon, 27 Nov 2023 11:17:34 +0100
Message-Id: <20231127101751.3187950-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191269

Latest shadow-native links with additional libraries;
I was unable to find a way to resolve those in setscene context
where tasks do not contain such dependencies.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/useradd.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 4d3bd9a5f56..a35785c9c23 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -179,7 +179,13 @@ SSTATEPREINSTFUNCS:append:class-target = " useradd_sysroot_sstate"
 
 do_package_setscene[depends] += "${USERADDSETSCENEDEPS}"
 do_populate_sysroot_setscene[depends] += "${USERADDSETSCENEDEPS}"
-USERADDSETSCENEDEPS:class-target = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene pseudo-native:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
+USERADDSETSCENEDEPS:class-target = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene \
+                                    pseudo-native:do_populate_sysroot_setscene \
+                                    shadow-native:do_populate_sysroot_setscene \
+                                    attr-native:do_populate_sysroot_setscene \
+                                    libbsd-native:do_populate_sysroot_setscene \
+                                    libmd-native:do_populate_sysroot_setscene \
+                                    ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
 USERADDSETSCENEDEPS = ""
 
 # Recipe parse-time sanity checks
-- 
2.39.2


