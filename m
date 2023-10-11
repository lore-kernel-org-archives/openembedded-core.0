Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F050DCD98D1
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:02:06 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.5123.1696982522993414615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mKwdPlae;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bf55a81eeaso43470015ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982522; x=1697587322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H16AVy4mxItTzlG3ugFvilgunjOyMd8scCcEx6GdYmY=;
        b=mKwdPlae/o1yuNZi4Z/GvskmIUexiKq+xWF7/M3TIbNuCjXG8UPgK5uTdIWaTyWEp4
         YIgNiGddwavj4n21qQb07fwvbMjoZ9YX2aZEkoYLXXXRvOHsnxKZCfcmfic/tpx4KWR3
         GSw7jTPV4oG1PDj6MG4CAz2x2MyGfBONaL7jpkgg5WRCFghq8wqMFAshgnRzIfeOx0Ja
         d/IBwqBzSen6oO7Idm1xbMkMU8oJ8nr4x6mWdRdqco0hjmA4knOGYYt/AFhRS3ek0O8p
         qP98gsRId2qpQMksx/sJLOud8RmM3jcMjwHNlIcLxudiIQu4YwnWxWFReYgAzUQ5o1RQ
         EQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982522; x=1697587322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H16AVy4mxItTzlG3ugFvilgunjOyMd8scCcEx6GdYmY=;
        b=DzXjWkYum+lV/3UtWpGMlYhWIA5bUd/xFMM2P2aafBHYYNiYoOOkX3Y4SXY8Zg6krC
         9SABDP8CQ2HKV57HhW6pRzB5BmEjrnDaqDfqJodFHJKmBY390LfP95ylVOIkyPj0OP9F
         L5kLf2XX4kTljiJzkof4RPEWP3Q1lDMNfQjDUPrvZ0KQf4WF3IDxCcINZKkhRjWSYe5l
         9lpEX3Wldcs8dqsFqd0BUlzIZnCcZqesj4GbsS+FtEHgUMFHpNkhNqKx5lF7FZWQttHr
         /6fvXtS+EdLBydAX0vTu3V7Y8mMYSj7ROvZQF3uNHdqiL38okcG+jMLhTs7gG5x7BAgw
         dvmw==
X-Gm-Message-State: AOJu0Ywks/oNoORa6qn+p6sYs4co8IlLyduuUu4yAqNR4yhfyzM3VrB0
	tY3RYcznnB90TQh6VDztjao2hUeQtRejkfYrSk4=
X-Google-Smtp-Source: AGHT+IHxxeApocCBnKwaxJZzfaj8sht+09U2nRq3W5svKqL0SiS2PeLdNozd8CeLVO6ucWM3TRV1Sg==
X-Received: by 2002:a17:90a:8804:b0:274:111c:c14d with SMTP id s4-20020a17090a880400b00274111cc14dmr16503041pjn.13.1696982522039;
        Tue, 10 Oct 2023 17:02:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.02.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:02:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/20] mdadm: Disable further tests due to intermittent failures
Date: Tue, 10 Oct 2023 14:01:21 -1000
Message-Id: <d72261b4827f9cdfa9ca5e199028c88c1b525257.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188925

From: Richard Purdie <richard.purdie@linuxfoundation.org>

I took the mdadm ptest enabling as I was told the tests were fine now.
They're not. Disable more of them as having intermittent issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2993a0bd6aca81d4382c3de5ac2fd9b5dac94868)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/mdadm/mdadm_4.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index c367b633a3..e914d31341 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -105,6 +105,11 @@ do_install_ptest() {
 	do
 		install -D -m 755 $prg ${D}${PTEST_PATH}/
 	done
+
+	# Disable tests causing intermittent autobuilder failures
+	echo "intermittent failure on autobuilder" > ${D}${PTEST_PATH}/tests/19raid6check.broken
+	echo "intermittent failure on autobuilder" > ${D}${PTEST_PATH}/tests/20raid5journal.broken
+	echo "intermittent failure on autobuilder" > ${D}${PTEST_PATH}/tests/21raid5cache.broken
 }
 
 RDEPENDS:${PN} += "bash"
-- 
2.34.1


