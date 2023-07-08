Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93225EB64DC
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 15:56:17 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.346.1688831773618922522
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 08:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=e1jnPuGU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b89b75dc1cso27354755ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 08:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688831773; x=1691423773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1othMzndnIsqU8PnqUxvHHUk7tQYeerePij3/F/r1w=;
        b=e1jnPuGUBaWvyXnoMLwVcoGeuEsAV1BMvo24aBZnOUowNVZx4uW7iTDmEE7VmEqD/L
         YDi09PW0SEVWv1EGYv71w2e/rvYB37Fg/I0K3XpHwvH5fRjfZypDjAOcjLmmn0I80KKR
         opb2AEpeVbH9OynB77vjKQ10HYoyFiTcnm91xwmyZIn2MbSs4JPEA7d0GnNDcpQxy9SV
         QP3Etvw5X6heqLynH1nxJySOWMuq0PkmC5VY5bZuZcI0GDsy5+MDJXXJ4BM+p8uv8eIu
         QtfEDlUHcd08xqCvh6lkE2t//EO/+LU1MwWAVLQSxLY7EAirfoIg4ImU4TbY9z5eU9SY
         UE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688831773; x=1691423773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1othMzndnIsqU8PnqUxvHHUk7tQYeerePij3/F/r1w=;
        b=ZeoXXATp8iGkg5XtgKFN9O+tAyaippwFKzrw5tlN+bAVJzJuWEGoM+6BIbITe3uEpa
         npuXuwwTPJ4soeOPvQxZV4e5Osf3haWGb6EKZcGDi/jHrpYv/hh5p+i+AXKw7Vtc9ScR
         GjNy9DyzXHw/DeFJECxoFuhzkpZXucPqgwDjD2bI9Zo3RLkrAXFH4/fOalh9vnd/arhu
         DubfukiMRM6RSsAvk7W1GRYdV6eCRqkgHak3mkSaz0hHvd7exuw9Ejoqr5chGTPNtBaJ
         56JLcwb/AwEm4jpz0N+jrqaV6q2NxAQPSAPZt2/aUdKfuqDsuNOW2TBj9QTM2yc7UhPv
         bH1Q==
X-Gm-Message-State: ABy/qLZ9OQ2uOqPRJCcjc2svWMHcyzeUnb0rrxGWlwG+LwW3pTIamM8S
	PF76GVy6e4XVPJtDm6p3ptKz/vyDdsS40baxpBY=
X-Google-Smtp-Source: APBJJlF5wqTg9+oXKNhoyZdXAuY9iXt2GQF+V0GfODJOgeKDLHcC6G99ai99pbwnojB0lQ/9/2SqEA==
X-Received: by 2002:a17:90a:c584:b0:259:a7a6:26f9 with SMTP id l4-20020a17090ac58400b00259a7a626f9mr16866663pjt.21.1688831772631;
        Sat, 08 Jul 2023 08:56:12 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090a410e00b00263f6687690sm3257801pjf.18.2023.07.08.08.56.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:56:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/17] go.bbclass: don't use test to check output from ls
Date: Sat,  8 Jul 2023 05:55:41 -1000
Message-Id: <236a3e0bf753669b4fddbd91be5fdb10c2e6093f.1688831566.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688831566.git.steve@sakoman.com>
References: <cover.1688831566.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 15:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184027

From: Martin Jansa <Martin.Jansa@gmail.com>

* avoids possibly confusing error message in log.do_install like:
  ls: cannot access 'etcd/3.5.7-r0/build/bin/linux_arm64/': No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2f1777e6ac5269a71203b6a2c562a43503be95ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 16e46398b1..21b1a0271e 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -118,7 +118,7 @@ go_do_install() {
 	tar -C ${B} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' pkg | \
 		tar -C ${D}${libdir}/go --no-same-owner -xf -
 
-	if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
+	if ls ${B}/${GO_BUILD_BINDIR}/* >/dev/null 2>/dev/null ; then
 		install -d ${D}${bindir}
 		install -m 0755 ${B}/${GO_BUILD_BINDIR}/* ${D}${bindir}/
 	fi
-- 
2.34.1


