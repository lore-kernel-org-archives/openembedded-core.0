Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88ED6C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 14:37:57 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.9636.1642084676405928440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=r/GrfamS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id i6so10363054pla.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qU/PIAmjla0Ou+9OfNEiZOI+/5xPXiYOl6iCfatP1Tc=;
        b=r/GrfamSB2PfUaNlp+jEoplHdfpHv8KXaMQwjlgxAUz3Maw0oy6kukf8GEA7PXlDp7
         kL2eHGyU6yDu2OyZF8E17GLi4qbcS1EJKxJawP18CWRCggCL6Dt0jkncYx/m1unMCwjD
         HgpLjg01FaEl34XxAqoaasPuCYzgU/+zPUh/F45pjJU+vO0vX4SYnsY0wa9PDQFlpQzR
         Bj02ZVNFhWXWwXeMNVaEz6jweuOu9vy5VHfwWG8quAkUS5DWmib744qwJxjOGJbPTOUM
         Jc0sKw6Uti939h3OrMmyZTwv/rxvMkiI5MHpBoi+FSMMdv4BZz1SnvtW04wIhYui8MP1
         ap8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qU/PIAmjla0Ou+9OfNEiZOI+/5xPXiYOl6iCfatP1Tc=;
        b=ClSa8ePR40nvZOITau6jdwyJoEVGi+Jj/WRJorG43vBA7mgBdtGRRyNT5OXciPhAF+
         4Cc9QlJGqogyzV/fQqd16qxFGgc7xQaqhGJSfZAwTf92JTUjOZwbWbk8fCOO8y6ivZY3
         HQYNdd4jx2qUTrKqc9bqWajDmGHhqt7n+Vimws0eAijZao1xW3YdHDFU2eOvnRs/ho8s
         BZs2FCQK7MQg3whnerzIlKcyfypONUL2cd/Bcd/URnxz2XdnBJ0fNSwORkFIkmWhMxrR
         B8F4b2R23mMtwrpW3kEgGCC+XNvdZmfs0R78A1FCm0leqvXYXpgmzi+0i08JWWwGHE4F
         ARJw==
X-Gm-Message-State: AOAM533U98k9pu4zqUcfXdtcL1/5FklSyXuZ/3RSxAiEiwUtPRTzj0HR
	VF7SGFZ0QPmlY/91SDtkkB03W9Fy7Osg/3VAGK8=
X-Google-Smtp-Source: 
 ABdhPJxgV5apGrGRidPkRsqg9C/J40YlxdArpqcvtC/a4dFujnshO1u5F8VO6gOxwrFeQZ6TlDDNNw==
X-Received: by 2002:a17:90a:d904:: with SMTP id
 c4mr14669388pjv.77.1642084675390;
        Thu, 13 Jan 2022 06:37:55 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 g11sm2541544pgn.26.2022.01.13.06.37.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 06:37:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/11] xserver-xorg: whitelist two CVEs
Date: Thu, 13 Jan 2022 04:37:13 -1000
Message-Id: 
 <c477e35d01e7b8443b680f6456ac92a15fbfeaa2.1642083419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642083419.git.steve@sakoman.com>
References: <cover.1642083419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 14:37:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160520

From: Ross Burton <ross@burtonini.com>

CVE-2011-4613 is specific to Debian/Ubuntu.

CVE-2020-25697 is a non-trivial attack that may not actually be feasible
considering the default behaviour for clients is to exit if the
connection is lost.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit afa2e6c31a79f75ff4113d53f618bbb349cd6c17)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 02daafc098..c891211c40 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -19,6 +19,14 @@ XORG_PN = "xorg-server"
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
 
 CVE_PRODUCT = "xorg-server x_server"
+# This is specific to Debian's xserver-wrapper.c
+CVE_CHECK_WHITELIST += "CVE-2011-4613"
+# As per upstream, exploiting this flaw is non-trivial and it requires exact
+# timing on the behalf of the attacker. Many graphical applications exit if their
+# connection to the X server is lost, so a typical desktop session is either
+# impossible or difficult to exploit. There is currently no upstream patch
+# available for this flaw.
+CVE_CHECK_WHITELIST += "CVE-2020-25697"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-- 
2.25.1


