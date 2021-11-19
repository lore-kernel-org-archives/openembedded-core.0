Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C370BC433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 21:06:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.71.1637356009141271767
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 13:06:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Et9S1q8y;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso11453629wml.1
        for <Openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 13:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ctbc9LcTOu95Fd3/pj0rgyjcGWMN3jonqnA9rguebLo=;
        b=Et9S1q8ylWtLjdLD7Bp1/yAXO0WizTNuadsw5uxeO6ffLJQlR1xWdDQ/ttmfnDXhmZ
         9IrQodBYCv2tfVr+uQfc5575xL0a+BdgmbqBkhiWnngLZ3XwOii45tynuK5XrbsU0rDo
         qqhxplSleJWRuce6mcIzGXM1vXetVu7ZT8exj+fR3N2WRjIoaPHj+2KKRlcIgMecDRkW
         LwPH3Hwg3LMbjePdvKukuOygncc9UF0zobfwZrNn9cS7hfnBnlaQzU+ybtXKar5uSZNy
         dbK0qAzLfmwUhURWNOb88J0YVLAt/Qtum9ItNnhorkXc2GmzFKeahjUJQ/kDWAIlt0c+
         fvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ctbc9LcTOu95Fd3/pj0rgyjcGWMN3jonqnA9rguebLo=;
        b=1SxwbivMeAQECf7SbUVP7jKaGXg/mwJgAZPAtXMqeVchSxhJ5RjSHh8Cfw5DUJJ0Yl
         C6r5PIbN1tPiJyMAkC0ifBE75T7MUf+MLWwVcCRuRH5cGZ3N8WEpbwwJyY1eIBENmbkR
         8GuuNlswErJN2h2DdaYglcOjldKGb5jJnIyFVLNXOD3wQDUQqWD9LXXSMqeFpjN5bOcA
         8RQPUNIrCFu5A36dqAhUvKzED4fRWLysRfbh/SC9hR48HuvrxqJZvf5I2sGHIntbA8Vv
         rzfAhSwc1xLWKwqkF4L8hptfJcHp9wB3biukhR+l3vhLqZZl29RX62GNnv7HknevY8b7
         bWuA==
X-Gm-Message-State: AOAM5307kGWd/0vW6a82talZlLkAn+Y+5POpvzH9MfFqe06/czH1Q/7L
	10fGjByvxkvFjhGWJ9goZF8BFqH6uEa7yw==
X-Google-Smtp-Source: 
 ABdhPJx92Xn53Y2q3BlsrR2urDtljiuSRN9qwc3FaLc/421Sn73XDVwhwCxVBczFkMbmd6h6J/KpSQ==
X-Received: by 2002:a05:600c:4113:: with SMTP id
 j19mr3601678wmi.48.1637356007313;
        Fri, 19 Nov 2021 13:06:47 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-197.002.205.pools.vodafone-ip.de. [2.205.7.197])
        by smtp.gmail.com with ESMTPSA id
 p13sm13318143wmi.0.2021.11.19.13.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 13:06:46 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH] rootfs-postcommands: update systemd_create_users
Date: Fri, 19 Nov 2021 22:05:39 +0100
Message-Id: <20211119210539.20318-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 21:06:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158527

Process all systemd-sysusers configuration files in order to create
users/groups at build time. systemd-sysusers would try to create them at
run-time, but for read-only rootfs that's not possible and results in
warnings from different services:

systemd-udevd[166]: /lib/udev/rules.d/50-udev-default.rules:39 Unknown group 'render', ignoring
systemd-udevd[166]: /lib/udev/rules.d/50-udev-default.rules:40 Unknown group 'render', ignoring
systemd-udevd[166]: /lib/udev/rules.d/50-udev-default.rules:42 Unknown group 'sgx', ignoring

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 7fe9e3d8c8..a3f96ef7ed 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -62,7 +62,7 @@ python () {
 }
 
 systemd_create_users () {
-	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
+	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/*.conf; do
 		[ -e $conffile ] || continue
 		grep -v "^#" $conffile | sed -e '/^$/d' | while read type name id comment; do
 		if [ "$type" = "u" ]; then
-- 
2.28.0


