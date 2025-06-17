Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E34FC7115F
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:21:05 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.31426.1750195264149110391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ON+BZ8i9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-748da522e79so631737b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195263; x=1750800063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MPqEeF0AgrveD9Nnl4XjtNsDzpJyCNbvaDiINEOxQA=;
        b=ON+BZ8i9YF8sv3JypiMHket/1yckJ73CND/ZuFoZfFCY0X/1tVOqP9xHLltpZkmobJ
         970oPMOj1dYitMpjMDDF42Vtm4BXPa0asj18ckgxXrYzHOeyDBf4JHEBWi1E7r52Dee3
         +RkDMnwTEy+yr9iX+zl4GcC01Bofs3/AkoJ15J6nnz/LeJKx4a4lccPusR0CJyc47hlc
         tdMkAols6httm+BuQ2RJ1/zKuMIObSM3BI+jbhIVfHJyPWycyPnpPOMqTGFhPX1k0+qO
         Vxc5QxIKldjWTVDSyJsELeYZRV7d9AUx4iBBDE0j8dc13Qp/eCQDo4ZItL/w3hVKjEtB
         EUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195263; x=1750800063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MPqEeF0AgrveD9Nnl4XjtNsDzpJyCNbvaDiINEOxQA=;
        b=Np3S7gu/yPkVm9gNs1oYfN56TaBytCXwD56AU3j1iokyfB69K/cIMxekvW8AWPYpL5
         DvipPIwSms5j+xfGW+XA43yOsT08lyWCUb8jhfYZwm6SteglkXNgyZmDYgNRSwLezNgG
         dt6BvwRgbeQVqyr6cVfUxqVGGLudBO0NM1cUZ9PUmNBtN9f27uE0uyioSPzt1Lh68gNn
         ylNXIY6PEYcfl5WT9HW5WlA4kSWviyG5oJEQvD9LNhgxYghcyx9ta1XVkMiOsGctMs7i
         hLREyPt/4IOn+Ag+Yyb6uWOu93Hu2I5iw60/wFULkanoiNJUcQb5anOMxWg85U/TJb5R
         vcGA==
X-Gm-Message-State: AOJu0YzehfiCKiaqEZ+Q0IV5qRxbYX6qFM1Tp+OEB/V675Hv+vXlEiMX
	+ZzyDACdvCNaZIjoEYyUXfglsEOkrVF7jfvwQ+yYd/pNTQ6jqu47rdL9EM2ZkDGxA9qYDnX84ll
	oCcjC
X-Gm-Gg: ASbGncsyaurfc3Grvp53ERQge5Yb/WbK5mv8CERVNK9HM+7tdDNwILJU7XrhVAFzJjr
	WF0xgrXNtHktK008fM9N6AojgVQdlnoxMB4jtJZWp01gn3tGQvcSNQeiT9W4zRFHbK57qKagyyV
	I9kMHdqG+dZSVUye6ijexdByLMpJ9Q42R/0gC1JNa0P7IAfr8VNbqET32E2zCqtHqaOZn131zxJ
	OyBfSKhUQ2nNwXzhKW4zgpMNN1hbU6396XkgkTuHa9KgbAXpDWmjJ5uR9NdpVCHp7f5RuShKjk7
	4XWkdqQwwspC2UvoijvYj+eY7LyLgiaaJ+8Z2ymgyiaLOn+YZApUORyl7P0JmK/L
X-Google-Smtp-Source: AGHT+IE8ceiB9nOCZuFYNvloUbM6xevhi1Dklo+4KnSMxsRtXtRU6XOqOoHDxCXsN4svxHn/WMkNcw==
X-Received: by 2002:a05:6a00:2d20:b0:742:a91d:b2f6 with SMTP id d2e1a72fcca58-7489d00b6b0mr19319468b3a.13.1750195263346;
        Tue, 17 Jun 2025 14:21:03 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.21.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:21:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/27] e2fsprogs: removed 'sed -u' option
Date: Tue, 17 Jun 2025 14:20:16 -0700
Message-ID: <fe7fa1ec7d005d858ccbdd81eb6f7bfab04b7e46.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218936

From: Aditya Tayade <Aditya.Tayade@kpit.com>

In embedded box, sed might be provided another providers like Busybox,
hence use generic options whenever possible.
/bin/sed -> /etc/alternatives/sed
/etc/alternatives/sed -> /bin/busybox.nosuid

Here used 'sed -u' option is not necessary, hence removed it.

Fixes below error:
sed: invalid option -- 'u'

Also added 'set -eux' option which halts execution of the script
on any failures.

(From OE-Core rev: 5b3b290baa0a83f493b7ca25d5ffa5ff279bcc69)

Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07caee1829d2a61bc018fe0e37ecd482922179ee)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit d2da6b5c5668dbc84b905ba2fe4c9b57b580fd82)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index 279923db8e..1857a17189 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -1,7 +1,8 @@
 #!/bin/sh
 
+set -eux
 cd ./test
-SKIP_SLOW_TESTS=yes ./test_script | sed -u -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
+SKIP_SLOW_TESTS=yes ./test_script | sed -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
 rm -rf /var/volatile/tmp/*e2fsprogs*
 rm -f tmp-*
 rm -f *.tmp
-- 
2.43.0


