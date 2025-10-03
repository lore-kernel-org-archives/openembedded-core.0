Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98120CCD187
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 16:48:13 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.918.1759510092986070709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 09:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WgiUkwao;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b5516ee0b0bso1802223a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759510092; x=1760114892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mH0daU8evIcc0twldgd2SFlXd1ZxXP+DYnyrRnrqtio=;
        b=WgiUkwaojpFx6Vubs1CJGyPVtNnOD1imKF6h3jKNjlc0VY0wS7m/GPWE7AVJVgLDTH
         Jp4wfiquqfSLYMcFa7zGXvHZd0WWKNuVg5SStAXnm3CxN+Ks0wV94dDSYtBkjkxyemlo
         xz4U8RUhn0FAcWoNRDfbuR3B22VMwsc4U4bX9DGAvz6xOOyfeSXvS5ebxF6Fg59L8hno
         oIfwqquQ3j4L4+Gltyo2Zfpc0DZix0UcU3ImNfUe2E3h/HAolnVZyuDo+dw3UTpPjuSZ
         FrEdC0anO2sXBdeVadrYl5wgEVtOETJHfWMOiP60CW/Up4pbc4KLkqmpKtJsOjmP3lxD
         hAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759510092; x=1760114892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mH0daU8evIcc0twldgd2SFlXd1ZxXP+DYnyrRnrqtio=;
        b=lMFtCQCpgMMASoIuwUxAzATHGHbvnG4N1d7be4+pv2GB4B1xFov18XEDi9/ASt3y1Y
         e2gUC+ibvweBndFZxm4J9UTOrXoZaUbANf7bsEeBr6i10NMyVuNwbC1cnuqMt574F/TY
         Y/3S7VaLvIQOMYbItk6MNgmxMHop1D8ve5RgKn9pDj3GlkMq8Erv+VkwFYqeCW9MTqJX
         aV7pA4DM3MUqI+R8cHgjCHr0S+dvC9PFF/NszbK1w6quwGqLo4Gcc3F+0rWOS+EgUEtw
         NZMEfizu5MvSgzQqjwA5aiZ6idYwGHuNZ9fWe/2FMSi0uKhutGJdPks4aVWRg866Ptq/
         NhrA==
X-Gm-Message-State: AOJu0YwVlAWiu+APUWWqEWzFzg1W1owx07HjW2FKg9sG8PHgvfjbxQNi
	TMUuiLHQc32fzdoeuprUGkF43+r4mAAzuD26Ap1ge4LnIwIkYhAyrpTvdfJNiTXkRecJd0fmVI1
	jVyE9
X-Gm-Gg: ASbGnctZkhO8Jn1xu6yaGdh+zDHC0DD8Wqo6fnSLejluqr7KlMxOSrbnGSyaihpaT2k
	ABoEWEjxrRCrXHoBqyv8iGmxPHIvK/KEFLM3QJ4k+eNbmse3hulL/AZkhio0pkNp4WlOSpvO19H
	Z8Tjc3MBdeGUfvjw0XdjROK1qe0dKWJ6e2uT9ycLwjsazDkze69CbtYfGH+E9bJ3IoN3fbNWkyk
	lqkpijPDIUpwl6XYAkH8get6W3iRUTK077OdR6DD7lEuAzBaq85Jj7hdY7u3Eb4mgHy3RJmKdHu
	J5IjVcWBjo/+2B/jk3sF27qBrdsH5V37rYaKkB4+3E6WWXg0kiYHVkYsjh+PcwcE0Z592x8mOG3
	l3YRaHXXEJ04O7fLJRDnYcgxEazpteUUXVH33cHTkEaatA4phzpsDsRwg2pM=
X-Google-Smtp-Source: AGHT+IEz077hJqmnZeEqt/8FqXu8bpG4pTrTvo6R46UoLQPAzpDYyp03OSzeEuV3GEp+SNFNVgMZNw==
X-Received: by 2002:a17:902:b785:b0:28e:7e7e:fb6f with SMTP id d9443c01a7336-28e9a546377mr28072275ad.10.1759510092257;
        Fri, 03 Oct 2025 09:48:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bdb:26c8:eafe:889c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d568bsm54352445ad.100.2025.10.03.09.48.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 09:48:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/8] expect: Fix build with GCC 15
Date: Fri,  3 Oct 2025 09:47:53 -0700
Message-ID: <a1ac756f2f55c4f27a95cb8b1e63ee2db06dd327.1759509931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759509931.git.steve@sakoman.com>
References: <cover.1759509931.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 16:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224409

From: Khem Raj <raj.khem@gmail.com>

Stick to C17 standard as GCC 15 switches to C23

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 48f7e1a539..a89b48ef1c 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -41,6 +41,8 @@ S = "${WORKDIR}/${BPN}${PV}"
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
+CFLAGS += "-std=gnu17"
+
 do_install:append() {
     mv ${D}${libdir}/expect${PV}/libexpect*.so ${D}${libdir}/
     install -m 0755 ${S}/fixline1 ${D}${libdir}/expect${PV}/
-- 
2.43.0


