Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E612BC00142
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 15:36:07 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.1817.1698766562731807414
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 08:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xqbd7Dux;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cc2fc281cdso24094265ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 08:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698766561; x=1699371361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53bEA/XVQ6hmeKggOPFNw8XtPe8xy9jDqn9ibWbavMg=;
        b=xqbd7DuxFHWns4q4wODL0CF8NQ+kZAs6nueg1J8QL94zb2N/hc4JKfiX9pNUHaWNxn
         PAy2zon7pmLh+PUCYCaVtwyegT3w29uhuMEGNlfzX7sOf1nK16hwom8p3+32lpqt5WAw
         RJPqrTwOrotcdAaiPqllzzvr5SsU4p3G7k0XBRsw0RIavjk0rTWehWw6iYYn64rpfbrh
         UmxWZzg7bAh3e07Hb+eXClO96D1U+IQogn4sTz7AWdVb0GyKu2EroVlB45FSZLPqPtdw
         VC+sU0OTMuTq6cZJ0mSeWZEIQv+3J6V4qTcK5BMaDa3UFUKajvOiKnSxnNZymuqT3aOO
         GV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698766561; x=1699371361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53bEA/XVQ6hmeKggOPFNw8XtPe8xy9jDqn9ibWbavMg=;
        b=hx3Utt3SNTD9GRUJwjvXbxvVzaf3krwk0VdK6bMiR2CC4BfRc8N2D/Yf3gKOnuGIv3
         QdWKgHWSFrD+9a90aSyQIDCf+zi1WNBfexJjQY5cbYbSxfwBlH3VcasbfqCPyLy+i94T
         sNkzxTTGpM1+OHSibIcBZPmrTYq33RLwY65rj9h75cVpVvfOWMXzZ8aXnQHzapOBsAQE
         awsd422kev5jauGUyIKfgZ2aGOZW+5K+CTWA8gdowsXDjfNJg4FwBgT/CX2+mg6WEbcC
         P1FmczDwiiJd07t8D3MpmhLGLqQbFa60UTvdTLhhGsSHfeY22T7DAFRwfVMSQRh+Ft1P
         I0mg==
X-Gm-Message-State: AOJu0YyS1KtMPK/GStbIPbye716BOcIk6yIUg8wLsCaW9Qj4huU/i5wS
	2843F2mTDIYY69iF4WtmwFsOwBihI3D41hm8Z9ZMnw==
X-Google-Smtp-Source: AGHT+IHhSL8hCRJMNDbgudsVI344cdD/vYF8cCYtV46oUZISJToPVX7DUtTLtypdXZkSScIpUbgLdw==
X-Received: by 2002:a17:902:e0c5:b0:1ca:8b90:1cbd with SMTP id e5-20020a170902e0c500b001ca8b901cbdmr9767421pla.0.1698766561407;
        Tue, 31 Oct 2023 08:36:01 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f10-20020a170902684a00b001ca21e05c69sm1498048pln.109.2023.10.31.08.36.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 08:36:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 4/5] openssl: Upgrade 3.1.3 -> 3.1.4
Date: Tue, 31 Oct 2023 05:35:43 -1000
Message-Id: <da8e63e4d0075a377c515345602201967e48bfa1.1698766338.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698766338.git.steve@sakoman.com>
References: <cover.1698766338.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 15:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189856

From: Peter Marko <peter.marko@siemens.com>

https://github.com/openssl/openssl/blob/openssl-3.1/NEWS.md#major-changes-between-openssl-313-and-openssl-314-24-oct-2023

Major changes between OpenSSL 3.1.3 and OpenSSL 3.1.4 [24 Oct 2023]
* Mitigate incorrect resize handling for symmetric cipher keys and IVs. (CVE-2023-5363)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_3.1.3.bb => openssl_3.1.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.1.3.bb => openssl_3.1.4.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.3.bb b/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.1.3.bb
rename to meta/recipes-connectivity/openssl/openssl_3.1.4.bb
index ff9df693b8..72338b0022 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "f0316a2ebd89e7f2352976445458689f80302093788c466692fb2a188b2eacf6"
+SRC_URI[sha256sum] = "840af5366ab9b522bde525826be3ef0fb0af81c6a9ebd84caa600fea1731eee3"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


