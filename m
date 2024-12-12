Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81310E77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:08:31 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.20329.1734012503068382846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xQucXZ1U;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-216395e151bso4230955ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734012502; x=1734617302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1hCrYzJ1AwsF0W9svoDC85jbS+5NC6ui2C9GcQjZLc=;
        b=xQucXZ1UrFJdIFFGvqSiTdBdYML2xK3vHeh9lORKuZJcDaL1DjjT3MNC6FQcse9FUX
         Xhsa/Ld5rzXXi7OIA26chiMdWXEresbcIx2besp8yIYIOWLzW2izMlLoN/IZWQ4FywZe
         Uf8TX58Ua0pK4EzJGr863pnhoNqHlUe1rIfgm+8xGieCwIJrkJNMm+z6dRcKxXBiXtns
         Cje15uwRlJzblqNNYtAy9joCRzPOlhJyo/PX3qe7Up3u9Wn8ScxBQ4BvkCKzdcM9iOrZ
         frinyaY16najuvPxq+3hUdKJAS3TOitbtFItG2sp0aRg+4odlPp9wAdFFsZ6OA8zsdjv
         9//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734012502; x=1734617302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1hCrYzJ1AwsF0W9svoDC85jbS+5NC6ui2C9GcQjZLc=;
        b=WL2/AgsjyNEcZHRKvh0Gki5sJxJUDWYjSk33BAEuRWt8dXrQflt6HSz0x9dvurefNa
         KvFqoFZKvm5Wkx6VnawOWLMT11OZJ021n79BadVP3Sdm3fTG5oHg01oCl5wZa0tm+aez
         SgH/1D+a/Q0NpCJsKsAeEcqikuH8i2nh7YypuLtVYY6hMv+D97H3UtPeUbzslirR+4/J
         b2qKQ/YJo+aFGNssHTlGLamQug2sgSmX9adiFiOSqlJp4AIA7W03VJG4e5GA9z/Tn3xz
         DmyecjSMNnXuIRMdn43jXHZoOzRswdfl0Df7WugkmGrLYGfPchLCdyk4Z38VMysIjIsr
         7cGQ==
X-Gm-Message-State: AOJu0YxU1mrcB1A47gk+ypY/s22HwKsFK2We6/hftBjR8+IcJbuVit+p
	nmFEE49A5cJ8FEFWUXGPvwyboOsrtaqP47S3mov1kzIJDTKyitTAXoGc7viwBdKcIeuCvhYXewZ
	o
X-Gm-Gg: ASbGnct6l+lwbxTATprD62edmB+4Xu7CFnAJSOMsNibm5FJqzUMF79lOpxrRR9trBQE
	s0WDDRTV5F8xQAwYA8t2NsEnKvPafQoUHXGuRt6g7NHZTLBuhX9pMkPOkKsbU9wZMP9UtoxgNO3
	99YL4HErR9dKklheZPwV/78K5A10pebkLbuiKdzg85DCoLwtxAQyasi8HaQ7d9p7muEWGFmYyYH
	MsbZcn3qrzI4RC6JW9BD9/9f9SDhwabwPa6i2UuanV+yg==
X-Google-Smtp-Source: AGHT+IHioq8C3UqXgdsoJSetQfBpYrjoyfKA75suO3fhLmRdItbfTofFjGy+dwR9YSt5UfXoTA4fLQ==
X-Received: by 2002:a17:902:ec8c:b0:215:a034:3bae with SMTP id d9443c01a7336-2178c874391mr51442045ad.18.1734012502362;
        Thu, 12 Dec 2024 06:08:22 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21630fee27bsm88847705ad.269.2024.12.12.06.08.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:08:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 12/12] shadow: use update-alternatives to handle su.1 and nologin.8
Date: Thu, 12 Dec 2024 06:07:58 -0800
Message-Id: <a12be809144cbca43576d15c0f0f1781eeaf5a27.1734012352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734012352.git.steve@sakoman.com>
References: <cover.1734012352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208646

From: Sid-Ali <sidali.teir@cysec.com>

This patch fixes the following error at do_rootfs:

  update-alternatives: Error: not linking
  /PATH/TO/rootfs/usr/share/man/man1/su.1
  to /usr/share/man/man1/su.1.util-linux since
  /PATH/TO/rootfs/usr/share/man/man1/su.1
  exists and is not a link

  update-alternatives: Error: not linking
  /PATH/TO/rootfs/usr/share/man/man8/nologin.8
  to /usr/share/man/man8/nologin.8.util-linux since
  /PATH/TO/rootfs/usr/share/man/man8/nologin.8
  exists and is not a link

The problem can be reproduced by adding the following lines to local.conf
and then building an image:

  EXTRA_IMAGE_FEATURES:append = " doc-pkgs"
  IMAGE_INSTALL:append = " shadow util-linux"

su.1 and nologin.8 are handled by update-alternatives in util-linux recipe, so
do it in shadow recipe too.

Signed-off-by: Sid-Ali Teir <sidali.teir@cysec.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 198c4582c6391ac87c49e09882189235c44b60e9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/shadow/shadow.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 171d6e27c3..6ba5a9c7f1 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -200,10 +200,12 @@ ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
 ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
-ALTERNATIVE:${PN}-doc = "chfn.1 chsh.1 groups.1"
+ALTERNATIVE:${PN}-doc = "chfn.1 chsh.1 groups.1 su.1 nologin.8"
 ALTERNATIVE_LINK_NAME[chfn.1] = "${mandir}/man1/chfn.1"
 ALTERNATIVE_LINK_NAME[chsh.1] = "${mandir}/man1/chsh.1"
 ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
+ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
+ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
 
 ALTERNATIVE:${PN}-base = "newgrp groups login su"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
-- 
2.34.1


