Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6780DE6ADC5
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:26 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87803.1766434101886291182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bhqU1Jqa;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64b921d9e67so5287412a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434100; x=1767038900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRBCcoGQUkWcT/cgtq4QCRsqhxu1SCpCGhhHvg2yAT4=;
        b=bhqU1JqahLvR+rjyDCYZc5kt3nIFtVshEseQTDSesYdO4gIZXV85Ufiz0KeJwBMMp2
         57bxY7Z/PAAgvagsbph+tGyYf0d1tg/IjJ94ndtDEgtKWSDWh4Uf2D3Mm7tEr4lTpdU/
         uxlOZofZ+eBEiUeY1K3lKM1wMtt3/PgcUoLwrDSCJyPKVIszCZQiz6v8DzWLzC23nn+X
         Nc7SLhrENdBLpV1AacaJthT6NzMm0iYty7GDtWC2rHDMaV3I+yX/yGn5ANLuvgRUOk/V
         5aGyzlJsb2NfaX4hucXRcXgIr2FKQdqm7DoZM4YY21t1J/tzldcvFsUjnSCNz50/ktiP
         mFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434100; x=1767038900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zRBCcoGQUkWcT/cgtq4QCRsqhxu1SCpCGhhHvg2yAT4=;
        b=Y8YwFQm4UNxHUHfJVpjnw9rcrv6z/bb/1jkOg6DIZXi5uzQTAoJ/pnjs15Ypuw+y/6
         GiZUnSSN7xi/Pm8Jj0C34nDKXX45wFBW9tS3vNL98XOVe5BJN5rZt4+d28ODcoBeQhaw
         uwSHrAu8Sbf2G3vKUnClo8mM1+J3umaZuv7RqkD1IemcK0Se3gmgdYY92G4efy+GomZL
         UJp+MngC4Kh5ZTw0SP3dKJ3TjB3KSED3/uq2YUzUGb6na/dCdx0dSRISs1+8ljmixs5O
         An778zga7IoOmI4umVJqRfwYaHdKCu5EQMLW1Kg++sP2OnDC6+09V423vgC/3K+SUCfd
         XwRg==
X-Gm-Message-State: AOJu0YzzGE1yOHeLPKaM5yyC26rXNIJRBI9mqNnN6RwJ1i5PbBgT5ajq
	71bxmRSRn3aHdwg/xjugYE6BTpyuKOka/NnnLxWXielUHZGmpmtZX3WsNQCZ9Q==
X-Gm-Gg: AY/fxX7jBRuGWgQtmpR1o9n7v/a9pJBYp4mLfo4rxRRiR+yjUZoYANzFZb/d0H+HpUz
	sCq5ptg6PKRok9Q/N5AFBceO6C26IdGTCJenO96LykV3koaK+l2sikRZyNuUlhvvAiGKHrfB5se
	W9u7+FpqDECkLP1r22hadlqavTitlOZGsXPdCbraouhnTv3MD/B/ZLyYhNT1w6Bdzo48RoP++tg
	8tALYz2F1HJTGMHYRHGAqIp4HVAquGDtMlXBO5nW2G8imp2q1yNnCLXwvr/X2TqnfdDAuvNEkWb
	RhH3DJKw4lJAcs8QVNZ/bLttn0cOIgCJttNZvhHlkd/NRYXVjC6v8z0CXMGSjmxXg4k8D7FE9bQ
	//5OhgTlgL+z7ohCzpV1IAjD7mxxdYD/zu6VXj9jDxzA8iSglvXRGDGV6S9STNBH09u/VOrYNuN
	6cAzh+sfCNOk3dDZwRpV4Bi25TUBkRUaZYNNoUL7QFhevZ67Q=
X-Google-Smtp-Source: AGHT+IHFCeCvqEWuaG1YxPCvH4eHRr6oGHiWlHFSAVKxGDN7GLpmQBU1Y6sKbTzUwy5aDvQYtk1bqw==
X-Received: by 2002:a17:907:7fa0:b0:b80:413:16d6 with SMTP id a640c23a62f3a-b803717e275mr1325054166b.44.1766434100082;
        Mon, 22 Dec 2025 12:08:20 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 049/114] p11-kit: upgrade 0.25.5 -> 0.25.10
Date: Mon, 22 Dec 2025 21:06:31 +0100
Message-ID: <20251222200739.2278706-49-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228374

From: Alexander Kanavin <alex@linutronix.de>

Package datadir where /usr/share/zsh/site-functions are now installed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../p11-kit/{p11-kit_0.25.5.bb => p11-kit_0.25.10.bb}        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.25.5.bb => p11-kit_0.25.10.bb} (96%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb
similarity index 96%
rename from meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.25.10.bb
index 1c982a2aab..656ca1cf26 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb
@@ -10,9 +10,9 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https \
+SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=${PV} \
            "
-SRCREV = "0dd113361057e477f40ff4d8788f3e7e400af5f9"
+SRCREV = "90dba4ded391c6232a78ee14db0da76efda7b1c3"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
@@ -25,6 +25,7 @@ FILES:${PN} += " \
     ${libdir}/p11-kit-proxy.so \
     ${libdir}/pkcs11/*.so \
     ${libdir}/pkcs11/*.la \
+    ${datadir} \
     ${systemd_user_unitdir}/*"
 
 # PN contains p11-kit-proxy.so, a symlink to a loadable module
-- 
2.47.3


