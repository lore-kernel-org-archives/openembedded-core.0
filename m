Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F33DC433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:02 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.15305.1634673301564964263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qh9OQ9ze;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id q19so910542pfl.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=V78bKMxjCkR179sJbZ48TVl3aYCkKhasodohDFUsioo=;
        b=qh9OQ9zeoD8hpS5JeKgo72eOGU9ScveD6tq44eFyFUrLX7msI7R8r8/ZigXKtMci8v
         wfU5eScYMFSxzhbO9IfKpSk9Qt/Rs0tZKz+3oopanV8HgUcKFN/PyIjt15PL5u+ruXmE
         SRFhiYmD1jsqMj88X+SfHRzZTNdFYZ4Kpj8+GfwdCLV5HVsymsXvL1CZaInlQaEHM1wr
         IKFIXzi/LzVElzGHk0AXOyHMjjYOw+rDMID1oPavVBGUB25hc8K/N/1DinOrqpaqOUyp
         93d8l6k5pPGh0UoYE/1Nrt5Z5w3Mtdk+k+baooa8PQ9ONgWMmvH1zKFUuM0kGm2JyA7B
         pRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V78bKMxjCkR179sJbZ48TVl3aYCkKhasodohDFUsioo=;
        b=yzcx8icKJLzYh88bRa5hC6WEJKkb16p2brnbBEawj2WjaAp5kJjCVcgJRDyoq2ZqoL
         lFgJQ4lC8A642vLS8qJMfkPDBG7Am9HNce4ppONxr8ZPF1vsDrdwVyswFd/ZH7XhdYPl
         uDi/Miq2KHCNJuY++OqV6d+YuV4IVKSxrxxMHP+FrOH2FptgwSGWCJT7d0jbq74LUxRk
         QNvIEBRYFwtDwXQWjNhgvXSxi+faItkVpFZ6S7idCSX64Y3djN4hQqwMXDW1V5PfFNR9
         pJh5uFwy5ABVYHiMPnwxYkqddDcZF0zRdr9U5Gi2LBho23o7GM94543+YOZDRXtLob6V
         O5sw==
X-Gm-Message-State: AOAM53378DJFxkeK7IomNFlvw1C7MW/sEMRexUsEagFbAFiGGa219l2A
	raLujDYIPT60aaWlM6qHP+4uXL/dbR0eMD2oVF0=
X-Google-Smtp-Source: 
 ABdhPJzxNrnJseRyYNVb/a3LY+Z5kQ6U/nyPd3bXBJwL4LWDZ40T/6D0A5gC2gpgRYd+9PgDI4sc4w==
X-Received: by 2002:a63:2484:: with SMTP id
 k126mr30179704pgk.297.1634673300636;
        Tue, 19 Oct 2021 12:55:00 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/38] pseudo: Update with fcntl and glibc 2.34
 fixes
Date: Tue, 19 Oct 2021 09:53:33 -1000
Message-Id: 
 <63afcafef78f3d3b95c0d0c9746f9d627b6291c3.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157227

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pull in the following changes:

* ports/linux/guts: Add closefrom support for glibc 2.34
* pseudo_client: Make msg static in pseudo_op_client
* ports/linux/guts: Add close_range wrapper for glibc 2.34
* pseudo_client: Do not pass null argument to pseudo_diag()
* test-openat: Consider device as well as inode number
* test: Add missing test-statx test case
* fcntl: Add support for fcntl F_GETPIPE_SZ and F_SETPIPE_SZ

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 71b549924a7fa7973a8e03e11f3db45fdc29889d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 64cbb40641..28e8a1c6be 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -10,7 +10,7 @@ SRC_URI:append:class-native = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "b988b0a6b8afd8d459bc9a2528e834f63a3d59b2"
+SRCREV = "21ff2fb690efbe57e7dd867c39aff36ab72a6ac5"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1


