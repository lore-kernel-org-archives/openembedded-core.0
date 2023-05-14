Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C933C7EE22
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 16:31:57 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.69676.1684081916061953933
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 09:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=X4S2bBJ/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6439b410679so7791978b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 09:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684081915; x=1686673915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DP3I7fe2lvHoavZKMi6Xx6HnsWXOE9GHD9gJ+fydbCs=;
        b=X4S2bBJ/53+X9rQYv/MBPX6Hl5sK3MTYfaTPsvKrDQVC9kik6cUaMBgLxZt3JL33aF
         QhUItB3ogE/65MzdLaGryCxFoDqGALY/bnw66qw4bv9RtMsqTOSORX0p/eq5rJHrYp2X
         sBGdMdwVBq1vsM7EQPyVFIjZOzY8GkoAuHvSRkCFJgfgovjhWce4QGqgFU5cp5UXNHu7
         3kg15rvJWasgVqoyzPP9UoX/rT7fgLkcWGW9ke0pzuwYc7IVSZd4U7wQSMwZzEhbf8Ub
         W6xULdnAYViVr4b8sHqmkCru0NonIf2Yon/ylmtHhqOzSK22BS//kvKn9Vll7LNdwpH5
         ajyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081915; x=1686673915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DP3I7fe2lvHoavZKMi6Xx6HnsWXOE9GHD9gJ+fydbCs=;
        b=E1GLAR1+QkTXMlPNhzS30wOeuEV5YEaY6MyZVVvo6LDMpUD/Go8HRResPgJFlKDJuo
         X8ZESw15+V4IVB3qhNvnBMlZIe5bXPGmY3LqINcD4YXiRK7VYNLuurGjW5N1dFdInTRI
         9+237ymKMKEuFUAplL7b8rhuApskXrLobitfhu004yhe1tbITtEySyppV7K1Hu5N60GU
         9m5LnIivp3fVi+dbYn0fkEqOAgRCdB8DbeiPyuDSto3Mhg39DnlvRPgYU4xfDNyhifvj
         cXmDQ1sfrZJnw5qkeGl4eeHww1FLuPpzP7rXkS7hUc9+0jfJg4cUFKULjxQME13FloFe
         K/kw==
X-Gm-Message-State: AC+VfDzX5vD/pPT25XqDyzn3Pbj1qTrNYWvSYBQhK7QiOrOqQF7pfpcV
	fClh4JMUQg/1Rq3/eXbSSRINwFEkuMj6ThbM2lA=
X-Google-Smtp-Source: ACHHUZ697pHMjUFIaFwRCIGFsj5nLNPOKYCAT9G3wl7W3lmnwSoWJfHdgtOEuabPhscRzrnfDZi8sg==
X-Received: by 2002:a05:6a00:2e97:b0:64c:9b56:6215 with SMTP id fd23-20020a056a002e9700b0064c9b566215mr2731596pfb.25.1684081915017;
        Sun, 14 May 2023 09:31:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006475f831838sm981877pfn.30.2023.05.14.09.31.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 09:31:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/15] glib-networking: Correct glib error handling in test patch
Date: Sun, 14 May 2023 06:31:30 -1000
Message-Id: <66dc4b94e9fad8d209f12fa64bd0673a42c28ac9.1684081748.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684081748.git.steve@sakoman.com>
References: <cover.1684081748.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 16:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181206

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4ba74f61f38827d82586cf9c993a4b27065f5c6f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glib-networking/glib-networking/eagain.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
index 6dfbb2736c..ac6592ffef 100644
--- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
+++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
@@ -21,7 +21,7 @@ Index: glib-networking-2.74.0/tls/tests/connection.c
                                     MIN (TEST_DATA_LENGTH / 2, TEST_DATA_LENGTH - test->nread),
                                     NULL, &error);
 +
-+      if (error == G_IO_STATUS_AGAIN)
++      if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_BUSY))
 +          continue;
 +
        g_assert_no_error (error);
-- 
2.34.1


