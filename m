Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0886C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:52:23 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.1535.1654188734778043074
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=CBQ/98vh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id 187so5216296pfu.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8qLkB4PvB4cnE0zDr7JJ479THCsAg8dgwn5URAe7hwM=;
        b=CBQ/98vh6GEDTJkWzsG9dLELLO8tpjE3IoxPabE8zfDY6r5z0MGALnbmCRG62DovPx
         olVPEeHG6xLEKDO667cL9FrJFXCPSprwFPO424cTuqtiFbJYxs4tjL1XfC3H9nuWHa3I
         Nj9Xat6Wgf2ma4CwvAFbOhM5fdbVCsAU+tZ+6YjIEJCs2YUFL+/MCXM4U1zmc4jFCRWw
         zP86dJ1qeqYA36OCJtDySjYnOlfwvlEa/gTtoNudEzHEXhy10ilcvayd9cFPa55c3hbb
         ACeoeKwQZZMz5sMDnS7ttdgvhmZPv8xrSPceqmuJUN4n6mJPtVboENOUbp/bOxGI+XBh
         bIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8qLkB4PvB4cnE0zDr7JJ479THCsAg8dgwn5URAe7hwM=;
        b=EAUgRMM+F6yTfRiniGWC8cZwEbj91P5Qmp1z0Oe5hQUXnFQHPhGkSkr9o1liWaJjlI
         1kITF0LXlJsu60FobxTPrdqegjAmQK9cBqU2580Sk/dWTPL7/R66HFlgl+GLO/nl+oAw
         bUgaMJ+iR0CFhFbPFTW9rD5IZK+vnmxDSlPBvFDTLoBRjYatUv7OZYmfR/qqVFBOtEyA
         /H4YvRvBMnnpAmDoQya8AiDv49mtmfbtmePYdGSSOfSAaFjWY05coxibMDJYsUs9urwm
         E8rEDu214tkcQ1X/SsYJ7Nk9041dZj7FcXjbyl7WRYd+zAVUmeHaACZyx39NcML01du/
         CmSQ==
X-Gm-Message-State: AOAM530rUGBvH2WzmYHSHOfslRpq1ZEBWB8+NyPBfCA5JJbccRw1TO+S
	lgsUXbr3YYlD/UldR0Mf8kNRxKH8isgvVo9k
X-Google-Smtp-Source: 
 ABdhPJyJWWFXskcA+GGznpz7ll7GSBh4/a9evZ9uq+coG5Cfw0cKMXeQ5rJBIHjXmT4+ibdgeWFdwA==
X-Received: by 2002:a65:5886:0:b0:3fb:a6ea:b741 with SMTP id
 d6-20020a655886000000b003fba6eab741mr4937429pgu.502.1654188733608;
        Thu, 02 Jun 2022 09:52:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.52.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:52:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/26] vim: Upgrade 8.2.4912 -> 8.2.5034 to fix 9
 CVEs
Date: Thu,  2 Jun 2022 06:51:33 -1000
Message-Id: 
 <c703b970f614ede46f9d3e24bb33cb4eb77d38a2.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:52:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166478

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Address CVE-2022-1621, CVE-2022-1629, CVE-2022-1674, CVE-2022-1733, CVE-2022-1735
CVE-2022-1769, CVE-2022-1771, CVE-2022-1785, CVE-2022-1796

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fafce97bd440150ac5c586b53b887ee70a5b66bd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index c5922b7fcd..b22e8016ab 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4912"
-SRCREV = "a7583c42cd6b64fd276a5d7bb0db5ce7bfafa730"
+PV .= ".5034"
+SRCREV = "5a6ec10cc80ab02eeff644ab19b82312630ea855"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


