Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79097C83F17
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 02:51:51 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.5575.1752029511118325961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 19:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=X981fpKH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234b9dfb842so46380105ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 19:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752029510; x=1752634310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3uck+MBQ5BfFLV8Zm2WLiulLLu2fVK4ooXGAP4CpAoE=;
        b=X981fpKHiBTH7Yh0VbXn88E4xLI1TpHM9MwqvaAue4mWP8JSRodS0AkgXZ1c4+CvJO
         XOi6zfLgbYibJglxi6usiZ/aUoIHW8dWxdGQfDYRE9f5JAo1IFGMdjQPSrQlHl2GANbG
         H2BNfNM+mboF87HN4T1wcpiF5YC8EV1sOtK8QEtHG2+NtqU9CE5me8NCmNmy+IFkJBP+
         P8Op4X2wXDSXHb6ZuYsRsjqg/LaTJdUscPQAfpkqXbUar/qF0foJtFIpKMZaRN7bErsM
         r9X8kbGqAWevsaI1B1KxTqV3N1DT4NBD8MomK8IP3d//BEFZcIWgIdTY6CTx2t2nNh+R
         GQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752029510; x=1752634310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uck+MBQ5BfFLV8Zm2WLiulLLu2fVK4ooXGAP4CpAoE=;
        b=WLdM6TJsN1zO/udJtsa3vvAO+Z/jOtrsK+Ta49Hl+dxMfcICP7XTI8BrqbeoW3cRYX
         ecoQLNSfsQ4UeDPKDpbfZoPYrSyA23w24OHP+o3ZOVKkMAfBq2tEo9l7nV7ZezTMSRkc
         LxMc78trUaOK/SS8yejFGD5qDcyQnqRz5e5uzxvw6AvWo4wkC8CwpWmEKdJM1JYkyOrO
         fOIOfXXU9R0Ypn5V8NrLABEMfVXfoXkRsBSSsTnm5UQ5++NH87Em50PjtBiXqe0Tg9Tc
         PeDFdFNWGFN1jyX2FFwOJJ5GVjVNZr7bIMgzjaZdvxUVgIIdm7xPSyoNMkAIBN1h9U7H
         P9iQ==
X-Gm-Message-State: AOJu0YyhkM7KQsVPORr75VbSfhAdHCc58b2RYi9eCNhtVxLljI53i6Op
	U0sx41kC/YaDzqdgj70s8Yv2nsbRWNAhe3N3JQxajhB58LomXg0JtB8Sdkliru20+I8nQ6hbUEj
	QFpK7
X-Gm-Gg: ASbGncuJrqqARS67WPfUj6nh7MrPZj6rDpLUnmkD4IiI7L7aHlf/Jb30+LpbQYtmNmV
	+BdxxdPE95C5KuCWPe9bfrxH5LPCA2ta8PM5TDQHUILFFiP1vr6zEzoz1fbD6uC3AJiW0TH7sAg
	J3HrrfZc/aShls5R+UZXVLL90yWJJOfamxyCSisqoex9reoIakMvvwuw0dEjDVT0JpJzEA0kV74
	2tgG65yTi+3ogkvsSKCEcFAndFcD+vgWIti0/aIZDoYp1IcV/nrLnwAJUVsBBJXe/ErpzSA2+b7
	lZJZkIjK/yyQy1hMP660N17ghB5j5ohkFrgV10UrJGcgtI47A81+wA==
X-Google-Smtp-Source: AGHT+IEs2Ppojjd3oHH/Jwe5UYE8C6zYIrz3pNvN5YnyherLUuGTu2ulIdt1nbx2X3WV8ZbcMzroCQ==
X-Received: by 2002:a17:902:c94c:b0:234:ba37:879e with SMTP id d9443c01a7336-23ddb305362mr14401905ad.38.1752029510340;
        Tue, 08 Jul 2025 19:51:50 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845922b5sm121979075ad.199.2025.07.08.19.51.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 19:51:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/12] minicom: correct the SRC_URI
Date: Tue,  8 Jul 2025 19:51:23 -0700
Message-ID: <49fcec2041071d44289e03cac087de6b929d6153.1752029282.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752029282.git.steve@sakoman.com>
References: <cover.1752029282.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220069

From: Guocai He <guocai.he.cn@windriver.com>

In http://ftp.debian.org/debian/pool/main/m/minicom/, the
tarball of minicom_2.9.orig.tar.bz2 can not be found.
So the old SRC_URI should be updated.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/minicom/minicom_2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/minicom/minicom_2.9.bb b/meta/recipes-extended/minicom/minicom_2.9.bb
index 907d5c79c9..38f517f2a2 100644
--- a/meta/recipes-extended/minicom/minicom_2.9.bb
+++ b/meta/recipes-extended/minicom/minicom_2.9.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2"
+SRC_URI = "https://salsa.debian.org/minicom-team/${BPN}/-/archive/${PV}/${BPN}-${PV}.tar.bz2"
 
 SRC_URI[sha256sum] = "9efbb6458140e5a0de445613f0e76bcf12cbf7a9892b2f53e075c2e7beaba86c"
 
-- 
2.43.0


