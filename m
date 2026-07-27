Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312FCC54F52
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 06:42:13 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25490.1785134523344025160
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 23:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gGal2C7g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f84023916so2352485f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785134521; x=1785739321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=npq0pWiU0xpzdQgwkpKiGVNW7gAoWd8exJxp8SjyYBI=;
        b=gGal2C7gP1svAo+CsbXXVdAaO4UrdA9i/5pOJAuKOo6K5ukrhLV+Jejynn0TrQCauc
         a257A+t4+F5HLKzUgY/tTraA24wH3uX2pmqbIAGMjZEy2Fzsk7gRTXu2obacjVMbtp0e
         uCA29Ajq4q1I+bOI/P4L0ZrglaUVFBEylyixg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785134521; x=1785739321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=npq0pWiU0xpzdQgwkpKiGVNW7gAoWd8exJxp8SjyYBI=;
        b=EFUQ39QA4VT86VIZaVCjTebNNN30e9LM6rFooYKgj39jD1oZX+N6QNoXUj5uXECQFB
         xMtOMxnlg8TSSi1oKUgDnxzWx1zoZkorRjdqsTGJz3/5K/Hkjk+Ad8kzGFQH2+0OKcfO
         ALMJ8oBhkUjHV/mg9tHgQbBvGNUeh3shFjznMzDZY6g4QAja7xAClWZFqA5+Q5oez3ls
         kD1gzuJk+3c+Bpm9iGmfRGpJvQyb+Bs4rTHNcAx81xulMqPssCNKNHApI8DnUVELlmLZ
         xw4r5iZqnBfBn0TE3YwDJWLKQVsAw2UM+4531qo2COWggq6JXA+hwoyq1/he0jYXOOGg
         MKxw==
X-Gm-Message-State: AOJu0Yxhl/TQBKw2kdxPh41lfUZuNrwMbru2b4VPAvFSjiM25cl0Hhns
	5UYovj1tmrtkA0gcOvDXINmP2LA1KdxlggTrEynqPvVB7x3b1Too90p3QQLUpRHLg+e4VtR5eM7
	h/YU7M5E=
X-Gm-Gg: AR+sD12YDqyV5DO9BSEG6TsIu778QQek92SfdoH3v7VlOZ1psKf+7GQ49tD+Ry6pCN/
	67xpdyW71E9ZtSUUI9ND25nLGBsGBmuO4CNsa9V8oOqjOhJ3UqNW6VotI68qrcf5yqkZJPC/T30
	zkN4vY+cQgK99QzHkcOiBDoxx1qtM2a2iqkMNi86wty4uz+ZNhS1bBd1GP2D55pPcH56u6aXJFo
	JP9Mo456vw0lHmBNIkA5Q1CmnPxs6Fc2ynTaN65/8j3PbokWAc/BD7eiyS4IcDLEzTGrGJFbads
	lWcxe/SSiOo7zgSlmTS//kQ9GmiB+8meRiBc8ZDDPOf8IpqghnIgb5FzSNg8tu/zxtEF2IBzSwQ
	pvrxldI1OPuFoxy3AK1tfU0jMv1yQN10M8dt1678Y1N1eHdCKYXMpW5puTHDpr41CB+v9DvMF07
	uFMkwkqnG87SH28oBbvQU5IkPz7Tary6MvFZ8cdqNw
X-Received: by 2002:a05:600c:1d0d:b0:495:4aff:5fdf with SMTP id 5b1f17b1804b1-496b5708144mr95715525e9.28.1785134521535;
        Sun, 26 Jul 2026 23:42:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a01:52d:1da2:a363])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4866813sm229103255e9.8.2026.07.26.23.42.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:42:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] python3-pytz: upgrade 2026.2 -> 2026.3
Date: Mon, 27 Jul 2026 07:41:50 +0100
Message-ID: <20260727064158.3784068-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
References: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 06:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242039

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-pytz_2026.2.bb => python3-pytz_2026.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2026.2.bb => python3-pytz_2026.3.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2026.2.bb b/meta/recipes-devtools/python/python3-pytz_2026.3.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pytz_2026.2.bb
rename to meta/recipes-devtools/python/python3-pytz_2026.3.bb
index 1365897d856..cfcf33c8376 100644
--- a/meta/recipes-devtools/python/python3-pytz_2026.2.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2026.3.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "0e60b47b29f21574376f218fe21abc009894a2321ea16c6754f3cad6eb7cdd6a"
+SRC_URI[sha256sum] = "3a30feb7a1a04cf0fa0be1624415930843b02f012eb800380f36f906a723e4ae"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \

