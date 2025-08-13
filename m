Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2ADCA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 10:33:30 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.98160.1755081205255807630
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 03:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K9YSCdra;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-615622ed70fso10351944a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 03:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755081203; x=1755686003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dlUD7JEfdxn6G53GCeE9izSXmwA30W7ARNPUwTqZMrk=;
        b=K9YSCdraUmFx101C9DVQ3axHa+/bL63IdiH26VZ+qeS04hLLeG1PJlmp5zK08pUF6r
         CWCPu9wVsxKd5Zfh2+tjx9dInyJD+WD7IVg0GhIevoXgMxOVQIyZN74Do+20xsB9x3MC
         GkDjUqPnedOBbTlRWRnMhdtmGOOmU+MrcAwcWVuPT2JzNjZfRDgwc74lo19eKU6fPzVa
         vCc1Mk9W78v5w6ZzrGMi6wBHMRJ4aY16W3MrZfMeXCTar8rEV+OdCAWI9wZyCFz/bkVU
         1v67eNReLhjH44ICFrOpKiabd6+2m+Tgssz10FbY4znhYY/PKCVMQT85+ghoOfFHefA6
         2DkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755081203; x=1755686003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dlUD7JEfdxn6G53GCeE9izSXmwA30W7ARNPUwTqZMrk=;
        b=SmGW/tCqTjsbfjC98NuArXQvnwXbdlyVai6xTuxpdJfMSBVCJbSsCmVYiO1bk7cM0H
         lBLrofKxAHF8cErdwgp2nBONcY3yD+9Cbgwcjzin5R6ZhqiCeCvcEdUT2VSlRcm846qe
         WwuND2tGzpYJvqg6/pzVZNGAq/RTpqrudB1cCBfBlizPpG+gP+Msieq+K4XNzRzlLdl5
         Kumy2cs8VMoYFBUowcuOdYl70Z4f0JzOiETgePOo+2QLwQB6XrREfQYfR4E6oooie4mQ
         SlovdUDwZ16RgDG2l71r16aKOyysmvn7A6ufINucvR6GOIRBfzFlNHIvhZ6MUMO777j0
         Trkg==
X-Gm-Message-State: AOJu0YzSF7afz7XMMO1hfrpvzr853Zt8z7o+POROnOOzwaTi5PltDx0u
	g8HRBa0ZfhZaeUM1yKaO9ygnzX1lo6K3WM6cNyU0i/qBYREn0Z1JyKWdYg3zsg==
X-Gm-Gg: ASbGncunkie4nkNX1WklBSAGBcWSo8tXGDFT+Q9zYLFlx+IMx/v4E6T1XDSbSHtvngi
	qx0J+Um61ArPVUfojk8yZQorDBAe191sxT4HsZI3z/5lWW1XrWPEUdzsj0GYAlYnj9GNseSXNN8
	8guaWWKyKQ3IyXs3utn5CmpkNbHre0hKp6dE7wNsAK21nCK3j4z8OMT+FWh8arTW28gnjRMm9yq
	lVPYh84pTdCEDecjJma0KFw1I4nDxJ/vpCjrmmGIewZ5+Sge/zLCuNDAqTmUG4v4ehAnL6uKHby
	JUc/Jx+xPUEEgA6Rgom6uwr0YBWivBIi+DYK8DqW+uFqBr9YVge2OVwTgu9CNr4K0y0qCDaVXTp
	cnicVWx1xjsg6Du7Cp82q3mJX6Uh5bw==
X-Google-Smtp-Source: AGHT+IGPigDKBBUXRqX6S+CNFrR8ltn2J88GKoSvvv1fg1Dlaab23aJNZuX/WyolO8+L6TrQGNRVdQ==
X-Received: by 2002:a05:6402:5252:b0:618:6a0:69b0 with SMTP id 4fb4d7f45d1cf-6186bf87c26mr1915074a12.14.1755081203165;
        Wed, 13 Aug 2025 03:33:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6182b1e51f8sm5341883a12.10.2025.08.13.03.33.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:33:22 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bind: upgrade 9.20.10 -> 9.20.11
Date: Wed, 13 Aug 2025 12:33:21 +0200
Message-ID: <20250813103321.291681-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 10:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221802

Changelog:
https://downloads.isc.org/isc/bind9/9.20.11/doc/arm/html/changelog.html#bind-9-20-11

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../bind/{bind_9.20.10.bb => bind_9.20.11.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.10.bb => bind_9.20.11.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.10.bb b/meta/recipes-connectivity/bind/bind_9.20.11.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.10.bb
rename to meta/recipes-connectivity/bind/bind_9.20.11.bb
index 32f0bdf7b5..8d230f6e95 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.10.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.11.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "0fb3ba2c337bb488ca68f5df296c435cd255058fb63d0822e91db0235c905716"
+SRC_URI[sha256sum] = "4da2d532e668bc21e883f6e6d9d3d81794d9ec60b181530385649a56f46ee17a"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2

