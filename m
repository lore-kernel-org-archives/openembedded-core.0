Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05077C43334
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 11:24:38 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.41147.1656329077282156488
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 04:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UU55EjLq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 o19-20020a05600c4fd300b003a0489f414cso1875930wmq.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 04:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gh/26XZI3An/ogCuZiCKLwlHZcB1f5x5WCpAm7UIDHM=;
        b=UU55EjLqkNU1ScyIqyMfYNPARfwMfq8XWpqH0GxalxO0cmiUg7S+SO2BtCHL5e//EV
         V1AxR+dgjaTRbZCWZXWPM14cE4PCWtQYULgL5VUzmJ+REZTBWHt3sZXOzDFYb8QDstx2
         kkPlY215Eaij2FaDgDYLYthU30XGeQCReE2Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gh/26XZI3An/ogCuZiCKLwlHZcB1f5x5WCpAm7UIDHM=;
        b=uqBnYV6at/0yXWpz6H95OuoR882hsxu1K/O33zuFdcc90eAnHVHOYn67C5rmfmaAv8
         tgY01AaWqrYK4P0kjzrMO5xrnSLQ7j1flDs4YUWBYZIlLvxkcBebGuIO64L3L0cPZY0V
         ufX7gyWD6QeZrObTyo+O7pwJjbVHCarcnfmS0YutBIU24OLSzmvojMksfCLflG3MtJPp
         B91PzYl5mMlLjs0hhKJVhB0VzX70WAvJ++j9YzxnXwYhm8vrz5LIyoP5ejJqJ8q2sV5H
         GonmILlkxiBTqcLmeKD4b4dxc/tOa7I23qWlagIL5lUquWXqaBAIf+IuazYfkDYyteO5
         OlWA==
X-Gm-Message-State: AJIora8S8Pcw4K0/2RRKZxhF93MQ4E7ei2nKb/Y6NqwOmbzh9f01pkLf
	CsLbLyOOkqioPWJ6Yw6zFffwpiJd/sTCoQ==
X-Google-Smtp-Source: 
 AGRyM1tvcUtB9CouET0RzjTmJjuXOmYinl20MtEdFIgA/Yuf7WXGCWYswm2UlZkGjvjAqX2qdILmGQ==
X-Received: by 2002:a05:600c:1c11:b0:39c:80b1:c3d7 with SMTP id
 j17-20020a05600c1c1100b0039c80b1c3d7mr14865208wms.2.1656329075106;
        Mon, 27 Jun 2022 04:24:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8950:ad6c:6fd6:5033])
        by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b002185631adf0sm10331051wre.23.2022.06.27.04.24.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 04:24:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] coreutils: Tweak packaging variable names for
 coreutils-dev
Date: Mon, 27 Jun 2022 12:24:32 +0100
Message-Id: <20220627112432.421296-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 11:24:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167317

PACKAGES uses ${PN}-dev so be consistent with the addition to the
variable to avoid weird variable conflicts.

The flags variable used here is messy, key expansion and overrides are
not supported by flags. The plain variable access does happen to work
though, so leave it as is for now and note.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/coreutils/coreutils_9.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

v2: Add in note about key expansion flags issues

diff --git a/meta/recipes-core/coreutils/coreutils_9.1.bb b/meta/recipes-core/coreutils/coreutils_9.1.bb
index d57e147a7e0..55663c77136 100644
--- a/meta/recipes-core/coreutils/coreutils_9.1.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.1.bb
@@ -171,8 +171,9 @@ RDEPENDS:${PN}-ptest += "bash findutils gawk liberror-perl make perl perl-module
 
 # -dev automatic dependencies fails as we don't want libmodule-build-perl-dev, its too heavy
 # may need tweaking if DEPENDS changes
+# Can't use ${PN}-dev here since flags with overrides and key expansion not supported
 RRECOMMENDS:coreutils-dev[nodeprrecs] = "1"
-RRECOMMENDS:coreutils-dev = "acl-dev attr-dev gmp-dev libcap-dev bash-dev findutils-dev gawk-dev shadow-dev"
+RRECOMMENDS:${PN}-dev += "acl-dev attr-dev gmp-dev libcap-dev bash-dev findutils-dev gawk-dev shadow-dev"
 
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
-- 
2.34.1


