Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D8DC4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:26 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.58162.1702626736701874862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gGVzU/qb;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-54ba86ae133so285306a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626735; x=1703231535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wTitm7JwfdRL9ubWpTF03UVIC0Xa1uPJffff9+xCXp4=;
        b=gGVzU/qbES1YoAbptB+QdZmAWsZtKaiExRdzYxfgHsV3tJbhVmyIJNPOq/SAA2xi/V
         0t0jCH5wjYtyZHx5eA1azJnn5QYJLtIwuhFA8AfGCiHXK2RuhXnofiwTN+KgVdmCphoV
         CMIvUkYtcLuaWRc9kwCoLBXw25Xdt/928Q3b5bZw4gRhglwFSjrpkLpDnDphcOS9F1kb
         zN4d1T6zn3gD36g0jw2KuNH97DvOm7SBhEOWu0SUxZh1DXyEnyb0kGX4gvrXXfl5pprL
         smAA1lIy8Vc/j5O16eyCQtxhBRPwHV0WTdNe8Xb7e7w5zops/4ee3tTh3m2kH6J7EVgF
         PmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626735; x=1703231535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTitm7JwfdRL9ubWpTF03UVIC0Xa1uPJffff9+xCXp4=;
        b=MjzzbvhoJM/kPqYblLE5AGo3ANxs6Fp+n1PXgFa8W+MuHA4D0aSV60v7hz8ory9+9D
         FQKUba12FC7hRiCGQ60NhOQRxyVHvEkoHLPHM0R79X7bwbg8A9V94XBuHiFp+bQwOkSx
         3IwJ/S4/pJBWiRCtB87ttDeBubl+aFWZipgr3eNudfRws9K+ylvLb7e8rauwhvX6zg/i
         JYqR1W5UmY6bbMokz5tEDJLbtxZNZJiW02YpWgK1Wj7YIwnKyyU5BSUuuifdbexOabmP
         6SU8WrFf/DBotDW6yk93J+3+S4q70qtpVuuukDE5KNL2r4uOra/ZSAqCNMSTtP9rDxnF
         M91g==
X-Gm-Message-State: AOJu0YyR1cosT+vjiRoByLCn6iSPExVqI/J88H5QmhFaOMkhnNRzQF8S
	Bx7BqURLfDAkXKbHsezS3gWXf0DpENc=
X-Google-Smtp-Source: AGHT+IHFGOMietoxIzJHa+fZITiqgzA/0ez0uhZpGeC6MjLgA/owjmokDSf0TsH7MmW5HVI/EKqn8A==
X-Received: by 2002:a50:d559:0:b0:552:7612:d2f6 with SMTP id f25-20020a50d559000000b005527612d2f6mr1322781edj.48.1702626734833;
        Thu, 14 Dec 2023 23:52:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bt13-20020a0564020a4d00b00551d6d51401sm2961885edb.53.2023.12.14.23.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/10] gobject-introspection: depend on setuptools to obtain distutils module
Date: Fri, 15 Dec 2023 08:52:01 +0100
Message-Id: <20231215075210.3049785-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192413

g-i still uses distutils in various places, and upstream MRs and tickets
aren't getting a lot of traction. As distutils is gone from the core
library in python 3.12, rely on setuptools copy.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gobject-introspection/gobject-introspection_1.78.1.bb      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb
index 2c6fb7aaa3e..05a08a50e08 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb
@@ -188,6 +188,7 @@ FILES:${PN}-dev:append = " ${datadir}/gobject-introspection-1.0/tests/*.c \
 FILES:${PN}-dbg += "${libdir}/gobject-introspection/giscanner/.debug/"
 FILES:${PN}-staticdev += "${libdir}/gobject-introspection/giscanner/*.a"
 
-RDEPENDS:${PN} = "python3-pickle python3-xml"
+# setuptools can be removed when upstream removes all uses of distutils
+RDEPENDS:${PN} = "python3-pickle python3-xml python3-setuptools"
 
 BBCLASSEXTEND = "native"
-- 
2.39.2


