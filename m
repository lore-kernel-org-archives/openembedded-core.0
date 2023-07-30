Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD768C001DF
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:02:01 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.78415.1690740113446209277
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Gfevgj7w;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-686daaa5f1fso2614861b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740112; x=1691344912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pirtQ+SqWWNU8KDa1zIi4q6CnUebuqwX6zrxAwYvlk=;
        b=Gfevgj7wiDavNNj5yj7BvZt7AS86E+N2mH/d+k7mg3cjiDg1XGDj+JQeQj5fmxSh1D
         HDUnVOwJogsIxNPKJfYZ5qWoP5fd1znZI4vUwxmOZmR63+rR18boIZAcsRNCEXwWKAhL
         yELlvKoB5Tcr+vUuCVD/ew+AoNpLhUkU34ZNBbjNYDrFyVTe87MHvIihNr+CNHlU49X/
         K4zZRqNcrOs16KtXFcbWhuhn9lEe0qOxAizCp3kdpOUH5fqwWvUWkgMUSjlMG1b6aZur
         iN5jDFzsDT2Tox+ISvrRwDqaBJZvkS0MvkZMpbgRcalK9dKjmR7V0XItgRo91CVBJNY1
         bFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740112; x=1691344912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pirtQ+SqWWNU8KDa1zIi4q6CnUebuqwX6zrxAwYvlk=;
        b=GeXAy5acjkt0hLCiG8xmzvQtIxYNAmL73gB/lEWuDpHU5JO4GxaF7PuGd9yZ2fduiI
         rgFneMyLhKMzH0DVK5N5r1YnEBesPAuK5wThx5rMwutC8AlMOXbC6mGhjgU+LhU7fZv3
         rg1iIGOuqaXtkJ62AuCQT9Bh6PuQbFveDtmyRQVa1J7mrRTCEfHxk1IXlB+1QTIBKmFN
         ewUQo3LjX2ManCY/TdRtvcpYYlaDyYAdpcANAkrRoQOch6KuO74Pcfffbvu0XREOOV3D
         3Cx3yAp0lfGhFPjCOLj195PJ1sy+WRlHu7SzAzGXbdCqWDTAhoGrQ4TFDFscW/1GA4ka
         58Fg==
X-Gm-Message-State: ABy/qLbi1IZTqP0jVNAoFysdP0idZ0eEcV6vbINbfQgfHC6Mfsl+oXOK
	AjYSZQKHiKDv3eP30hZuMWemy3Ww8V7fksvQPWmc7g==
X-Google-Smtp-Source: APBJJlGcg5/oy9pvvv1vet+sbbv9YEZf7mZlHZ3DRZialybu8F3r7tIDS7jk/diRZ+0+1xOLvy7O4Q==
X-Received: by 2002:a05:6300:8005:b0:12c:de85:94eb with SMTP id an5-20020a056300800500b0012cde8594ebmr6622842pzc.17.1690740112500;
        Sun, 30 Jul 2023 11:01:52 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/30] openssl: use a glob on the PERLEXTERNAL to track updates on the path
Date: Sun, 30 Jul 2023 08:00:52 -1000
Message-Id: <515191fd8d9b2720af224c8d4fa6a895fc240d74.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185107

From: Jose Quaresma <quaresma.jose@gmail.com>

The Text-Template was updated from 1.46 to 1.56

| ERROR: openssl-native-3.1.1-r0 do_configure: PERLEXTERNAL '/build/tmp/work/x86_64-linux/openssl-native/3.1.1-r0/openssl-3.1.1/external/perl/Text-Template-1.46/lib' not found!

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b9a7739b01e31d0cc8358d99255e3e1b02a0a1a8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssl/openssl_3.0.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.9.bb b/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
index ba31418b4a..9738d36902 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
@@ -137,7 +137,7 @@ do_configure () {
 	fi
 	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
 	# environment variables set by bitbake. Adjust the environment variables instead.
-	PERLEXTERNAL="${S}/external/perl/Text-Template-1.46/lib"
+	PERLEXTERNAL="$(realpath ${S}/external/perl/Text-Template-*/lib)"
 	test -d "$PERLEXTERNAL" || bberror "PERLEXTERNAL '$PERLEXTERNAL' not found!"
 	HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="$PERLEXTERNAL" \
 	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=$useprefix --openssldir=${libdir}/ssl-3 --libdir=${libdir} $target
-- 
2.34.1


