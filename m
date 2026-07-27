Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6993C54F4E
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 06:42:11 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25494.1785134526895019681
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 23:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J6GsIo7C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso15596895e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785134525; x=1785739325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1X0uXY4W8sltZKXeM+rLoQZvXyNCuhDUGvWG1aS8kG4=;
        b=J6GsIo7C2alR3ZuhksEv9PeZxer2aOUSFQIXXC4KBW+u4vqJxkf11dCdfWQQDQVPvC
         cZsSFWE2izGh22DAn8Y4qK8wT8NbtPK866RTwLqT5iDgHY4guqI9FUsMTfi+a2zAysLJ
         El3IFVz9AE/aKDkd/jBalMJSNfMtWeld/RYnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785134525; x=1785739325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1X0uXY4W8sltZKXeM+rLoQZvXyNCuhDUGvWG1aS8kG4=;
        b=YH9C5xE9sIRJD5AL3xKSW2+2FcllgddsOzh0ukexZ+u5/zmY9EnCcWh3/aUAB7t134
         Nx6aRw+vfDkHXbF6JDDPYNiy2QDtvzXjvwerjm5292SqFZrX/QDM2/5Pq7J+CtY5J0NP
         Bl8wWYaQ3Zviocq8eyE3Txgs3ioVlbqPTk/u/eYNFif04ZNXPH57rM87/Mho+iNUjiRz
         q+bcJK4X0UuBvgVtzOK2d49qVPbuB9VUP4wED8mycJLRFSbhhmz2PQFUWE4QG0JlRKfP
         cDv/Y+SA6Bfu5eQv0Q2d2VwNdkmjZa0EXXPqnNl+CDPeYKbkBsjrdm/7Xp3FA7uGdGbP
         1vvA==
X-Gm-Message-State: AOJu0YwkgFZ7inSl3wmi4RbzPeXNJZxiyNmty0yInsiXaPegGNzK9Ovn
	IXOWQTR+UgqF3Eewex96MS0HNEkr1bEohjQy33LD4OKTuKvZUCVfvQAFHXIVtSNO/dC4px+HaOz
	TOlOTsdM=
X-Gm-Gg: AR+sD13yp+VrK1vGforf2UZtNgLXB+msjHrdTSVcGS/88NsLfJdkrX1cukW9Nvevxpf
	WVkhjLjTeNKWix28qlPs/cRGGZ9FGoS7e5dWXmx1ZZ36kgNGf/P44LY/yL217zxFU3eS+vaAGx4
	Sg+6Z4gb1drbKyLmm05NV2+kFLFSoHBYtS6FnIiUc7dHLPRNZjbKvRi+cyGN4BqgRWBYn0iHFIH
	0a8d/mfTIUqLmLETUsUSaX7/7aLw7YEPlRXn2rBDhxrF3M2yJUnf//nkF/j1be7xXj77JrLdZAi
	Uvm4ncrL2kHLUyEHuxnGEhFvDAsFEFhbmWExK2FIZp33ubjgF13jobLp9McyiDKk9kzn3W25xyZ
	9+L4Fl4n2Acrb0WkL5xXJlTiRsjWu9aJsODwCkuuBFWfrL58GSv1tcKUoShEWCg4q34XgAaSHHc
	WLXKPGSSzvtkURYb0NiUKGwx7lPwst8tbA5KjdSVG9
X-Received: by 2002:a05:600c:4e91:b0:493:bfea:2780 with SMTP id 5b1f17b1804b1-496b5f482aemr83854515e9.9.1785134525045;
        Sun, 26 Jul 2026 23:42:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a01:52d:1da2:a363])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4866813sm229103255e9.8.2026.07.26.23.42.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:42:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] sqlite3: upgrade 3.53.3 -> 3.53.4
Date: Mon, 27 Jul 2026 07:41:53 +0100
Message-ID: <20260727064158.3784068-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
References: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 06:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242042

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../sqlite/{sqlite3_3.53.3.bb => sqlite3_3.53.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.53.3.bb => sqlite3_3.53.4.bb} (74%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.3.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
similarity index 74%
rename from meta/recipes-support/sqlite/sqlite3_3.53.3.bb
rename to meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 655f3a2b96d..66132158e09 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -4,6 +4,6 @@ LICENSE = "blessing"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "c917d7db16648ec95f714974ace5e5dcf46b7dc70e26600a0a102a3141125db0"
+SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"

