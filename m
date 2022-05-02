Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3DCC4332F
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 23:03:29 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.4268.1651532606036144150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gYEVahvw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id j70so1835822pge.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ibq8oAokb7xi3qFrUEepHX9yDnhX2skPTBvluBceuOk=;
        b=gYEVahvw0E6GL6JM45GN1QaOLKoScdJhdo8JmFTOl7775/TRD48OfrPOPtOjA0j4gr
         0HShdfcFXeWqhRzw1Oz9suUZGD98kc5bWDfzav6M4xgQoov7KcWOC8qqbIbZkWrE3eQ3
         Noi/9Z0Cw8DdytmullNH2z6Rxf5JQ+QyHT/Yx64QPfcsgrtFDt5YNvDCaY3l09I9vYwn
         eyOBIYCz16bTgVsigozOpFUA3JCO5gGPpFqJf81Je+TCcTHP+BHcYaKGU1FQE3XT+sc2
         43U7KSAGslMfi3SvYaB4GpQZw3v5sYamQswZruNs3h/hHjBZ9de5ojWN/0GToKnrIWs5
         rRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ibq8oAokb7xi3qFrUEepHX9yDnhX2skPTBvluBceuOk=;
        b=PV5vuUFCvmmZagDDvphlcIu1i2Bmz9fxibYmLSFiM+rWDYWiO3OLpKghAI0AcxINCA
         XQgN05YNpb+S9xWq6ylyUaelP/NiQxOF7uAsuT0cPL8H8rhn+cM6TOruQuzTEQG9IIcQ
         Utz8gTr4XFK/GTU2fCWeSI2Vscx+qT3br5YH6OwbP0c3ZntB5jEhHDRURO+1B7NVM1Gg
         XbKlv8+IJiD+VVYLo6ML9yV+qYt+PfMF0v0VEpv4P7Xxu8qoXmL14K1UoX2i6piG9m9K
         XDlS8UR6CbiK5lgKTDLgWmPUtI0z4zY4ZNFu8altGd13r1cpRvy1LipnNItY8sroQblx
         OLJA==
X-Gm-Message-State: AOAM532o9wPEGOf/wc17QjbsQXJP9KndETkS7puo4NUdM8dTg+URONyQ
	zCxQ0ZqyiGMCIHaqA1E1uo71cVUTexXwNUCBGJY=
X-Google-Smtp-Source: 
 ABdhPJwxKYyKA6kWkNm6Hn432VEE2uxFuqYoFnYB+Y9SPPPuSHZVQcLflN7+wi4m5ovdebe8QRF3uw==
X-Received: by 2002:a65:6e0e:0:b0:399:26d7:a224 with SMTP id
 bd14-20020a656e0e000000b0039926d7a224mr11576520pgb.437.1651532604871;
        Mon, 02 May 2022 16:03:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0015eaa9aee50sm2002945plp.202.2022.05.02.16.03.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 16:03:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/9] bitbake.conf: mark all directories as safe for
 git to read
Date: Mon,  2 May 2022 13:02:52 -1000
Message-Id: 
 <74229771436d2da0f2dbf821360e1c4ba82624e1.1651531749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651531749.git.steve@sakoman.com>
References: <cover.1651531749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 23:03:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165186

From: Ross Burton <ross.burton@arm.com>

Recent git releases containing [1] have an ownership check when opening
repositories, and refuse to open a repository if it is owned by a
different user.

This breaks any use of git in do_install, as that is executed by the
(fake) root user. Whilst not common, this does happen.

Setting the git configuration safe.directories=* disables this check, so
that git is usable in fakeroot tasks.  This can be set globally via the
internal environment variable GIT_CONFIG_PARAMETERS, we can't use
GIT_CONFIG_*_KEY/VALUE as that isn't present in all the releases which
have the ownership check.

We already set GIT_CEILING_DIRECTORIES to ensure that git doesn't
recurse up out of the work directory, so this isn't a security issue.

[1] https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb7e7d9

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8bed8e6993e7297bdcd68940aa0d47ef47120117)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 91f003d6dd..2b94e37861 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -726,10 +726,18 @@ export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
 export PKG_CONFIG_SYSTEM_LIBRARY_PATH = "${base_libdir}:${libdir}"
 export PKG_CONFIG_SYSTEM_INCLUDE_PATH = "${includedir}"
 
+# Git configuration
+
 # Don't allow git to chdir up past WORKDIR so that it doesn't detect the OE
 # repository when building a recipe
 export GIT_CEILING_DIRECTORIES = "${WORKDIR}"
 
+# Treat all directories are safe, as during fakeroot tasks git will run as
+# root so recent git releases (eg 2.30.3) will refuse to work on repositories. See
+# https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb7e7d9 for
+# further details.
+export GIT_CONFIG_PARAMETERS="'safe.directory=*'"
+
 ###
 ### Config file processing
 ###
-- 
2.25.1


