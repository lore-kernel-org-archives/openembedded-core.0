Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2B0C982DD
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:04 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1564.1789682877024684893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NCetk4aH;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso577575e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682875; x=1790287675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4yDq2yG86NEYD1rLTU8XWE8gZLbm7TeN8CXaOjdMOa0=;
        b=NCetk4aH7feMB8gmQ+JTgCFD3Co99D0qLWr5fMZkLur7zN501N/HXVD012+eXjLsS/
         3/9N0NOEWAq7S6ipFdBb+6nxX+LJyOjh829FAJMIY11zXENNhjdBrCxUXwxQ1GPr5cdl
         oUOCV+3dOqg3sP6eSRvYocu0nlNoHAqkh1Yvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682875; x=1790287675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4yDq2yG86NEYD1rLTU8XWE8gZLbm7TeN8CXaOjdMOa0=;
        b=BybMkSkHRx/dyLIREOzVQlO01n2MMbN8m3kn1w8t9bkl4532L2yjigMUpKoMVSYZGI
         qPLs3s32jXmcYLohE8CczzTY5nehzbQ6527gr5WKvmuzLCPDB91lCrH1GVeP0c9EDvfx
         RL8vkbuHxyfgZckxTbldWh1WcGg42oD8QYbpm0X3IBZ83vIrfSdIwdz3yEDqs1PzKPB8
         fDS1ns5+KQS6J6LHMTfZFMSghPNoN9blm/VaWHI7f+tV9nsyJrV5iKf1+G95gQpD9jQa
         prJ5hxd8ECrlHOR8t36De3dZwGAW951AvwDh2pnsYF2LvtoaCTmkW10bzdtjIPrm5i8U
         t2yA==
X-Gm-Message-State: AFuF++nldTsu7LNZBpkeEqZB6Pl1ilbn5ybckyEBUTYxQh2mVWWQGDxn
	OJ69ZmBRihVG+gfHBagWWpHVpN5k0kbvslJVsiKdAZd7PsOiolHnD9UjjBP0tYrruG92xudZ5Ca
	pb9peZ8w=
X-Gm-Gg: AYBFou0qYASPt5OErw+ZaJ2cpUeG+pPlklhOTiPwqxc9W8RlIttZdoFdmOch6uRRuw3
	AArM22TNMKQdYtb/ujUFEIA7oCYlP4BCimbWOKgiQtCAVVavakshLschQUc+dvHCDodXxHThRDS
	xAkqvtoz7dFJz10HcpNF0GePi4oP/hwMc4b6CGQySlo1C6nzSk7Q1rr8sY6hgjz8Hib4obaAdRp
	gYINzkFC4KIvr+PkYAiab1PyFuQdwSii8A7khKvWsz8Bx0P+bao8zpofTSUwwGMDFG845qaPjtC
	RL4dLOo0UqO3i8/8bR4/r+gOaZJkvKEV6d7NPFMlyF8hP+mx/VpR3wMtPVryxUA6jYFgXNSEMGo
	f8GYndUk/KLZkYWfEKhmaZTkYPsRIoY/YxsbqGDHy3Zs//ZGcJ+rB23DCDW8sKITqAxhS86VIlA
	JBG/RdAC5+tWIqZK9RVM50XefmLi2PXHjcjE9ED2JYYEh6/OG9ytv0IMm9DTifATsvXG/JDUfBG
	c+SMBLREhURoil0sOYCkUEiTp6N6XWnhGdW0jRiw2hYtpDLxSsm+OliltZ8ACV/lnA2x8dDJxtU
	iXFPmtbG8Q==
X-Received: by 2002:a05:600c:3ba7:b0:49c:fc6c:be00 with SMTP id 5b1f17b1804b1-49fc57509f8mr3808235e9.23.1789682875362;
        Thu, 17 Sep 2026 15:07:55 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/79] golang: fix homepage
Date: Fri, 18 Sep 2026 00:05:56 +0200
Message-ID: <8ec3d1b577b22e04b42b40775c2e7efca0e11945.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246106

From: Peter Marko <peter.marko@siemens.com>

Leading space leads to SPDX document validation errors in some tools.

Example:
SchemaError: \" http://golang.org/\" is not valid under any of the
schemas listed in the 'anyOf' keyword
(components -> ... -> externalReferences -> 0 -> url)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: cbf36f436b477d81b58ff605846a2482308aefa4)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-binary-native_1.26.7.bb | 2 +-
 meta/recipes-devtools/go/go-common.inc              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.7.bb b/meta/recipes-devtools/go/go-binary-native_1.26.7.bb
index 753f1b13bb5..034c051cee7 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.7.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.7.bb
@@ -1,7 +1,7 @@
 # This recipe is for bootstrapping our go-cross from a prebuilt binary of Go from golang.org.
 
 SUMMARY = "Go programming language compiler (upstream binary for bootstrap)"
-HOMEPAGE = " http://golang.org/"
+HOMEPAGE = "http://golang.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7998cb338f82d15c0eff93b7004d272a"
 
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index 5d0177bdb68..a96e67617b4 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -9,7 +9,7 @@ DESCRIPTION = " The Go programming language is an open source project to make \
  fast, statically typed, compiled language that feels like a\
  dynamically typed, interpreted language."
 
-HOMEPAGE = " http://golang.org/"
+HOMEPAGE = "http://golang.org/"
 LICENSE = "BSD-3-Clause"
 
 inherit goarch

