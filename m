Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE0DC7EE32
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:18:27 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.27556.1677860266661907687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=o9ycjaGE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id m20-20020a17090ab79400b00239d8e182efso6620275pjr.5
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXTeQqtSXgrzFWaokOzJPOP5+fWaNs0RET6ns/kdRcw=;
        b=o9ycjaGEBp3B5wOIJodXzplvoyIl+IhXi/GA1+OG0+NiNWytCK499cC+3QKg9Jofh7
         l/Oxxx4OnKq7CF07WkyVBgsaz+5s890CqT5xgc/N/ZmIN1XRz0JDhv1xvc7CTMlBXM8Y
         1zsaKFTsaRFwKuRqy/tJ+geMLoJ9xskOts4Y6r3PiAYyWds0L02YS4YwKocFkcRXc8gV
         n/OtYO4pS/sXiypHk/F37l/miWimGgpRuOxfXZI8OVwr/Hqetg9ut5P7jllUbC+aEQop
         ChXUClwmSHPy6BJlU6J5gqb85tkZT9MZyuxbksV24yQm1u0QAItZJLVVEJZ2s8cwwwgK
         033Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXTeQqtSXgrzFWaokOzJPOP5+fWaNs0RET6ns/kdRcw=;
        b=XHGFDVkZmqZV426wI3t9t5kkNq3V4ICthBn4n58eIZv/i8tQd3sj4ISo+9Ddt7o8he
         qwZWBx3OkwRBggmyw5SW7e71JUs6eRQlKk0Ru7C2rAvKQxSDhJpMfRdUx6hF9zE16C5C
         mEcYoH5oVT2tdJTdv5s3xg6P2Borg3q6xTe7q18d7O7DjwNyO6yYfwHCxDoL/NKOye1J
         jV9lADeVveb78z3n6WBmPRP37bCFZA1d+7ANUS9SW9db9n97SvfxCj7kXTmQAbl9g+Lv
         Uo1tOYgJx03c4pJJ1viWPYHMguQijGEvNsynjfqCqOPjr4l3wjP+YeNbMk1kBHFypGUP
         o9PQ==
X-Gm-Message-State: AO0yUKU/OKrnpsYRNn6yV251XUu0OeNWs9UF6PCrgKfwXDFARKMhEL53
	/AfkXte/TYjo6/yQh+5s6U/4QG0dZ/+8qEuTf2g=
X-Google-Smtp-Source: AK7set9BCJ21L800YqQWYiMqnK2viEMia0PGCJZaK81VrMFvLrWb3KW8XlH35sQfxdLZ4ITHbF5y7w==
X-Received: by 2002:a17:902:720b:b0:19c:cf89:b7ee with SMTP id ba11-20020a170902720b00b0019ccf89b7eemr2051026plb.69.1677860302326;
        Fri, 03 Mar 2023 08:18:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.18.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:18:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/29] nghttp2: never build python bindings
Date: Fri,  3 Mar 2023 06:17:27 -1000
Message-Id: <b1c5ea7de0a2df0dc4c80238b052bf8766ef4d10.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178018

From: Joe Slater <joe.slater@windriver.com>

This has already been done for oe-core/master.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/nghttp2/nghttp2_1.47.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
index 58ce08084d..becacd4502 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
@@ -19,6 +19,10 @@ PACKAGECONFIG[manpages] = ""
 # first place
 EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF"
 
+# Do not let configure try to decide this.
+#
+EXTRA_OECMAKE += "-DENABLE_PYTHON_BINDINGS=OFF"
+
 PACKAGES =+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
 
 RDEPENDS:${PN} = "${PN}-client (>= ${PV}) ${PN}-proxy (>= ${PV}) ${PN}-server (>= ${PV})"
-- 
2.34.1


