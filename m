Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971BAC46CA1
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 21:45:41 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.75797.1697319936460993242
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 14:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=H9SJSz/V;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c9d407bb15so27921905ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 14:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697319935; x=1697924735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQZGUxEMYp+rXLv4cxCc35LRFGHxwXvxjsAjgQGMWw8=;
        b=H9SJSz/VKkRxYMZZCmtQM7NmbPwrvUtd9cuNOlxB8k2L9CHz5JF5stoe2HERlHiDg/
         2+lbW+TKmoMt+SzJhDJ1Ml4Vg+A9+Sz+moTne6HWD4MDOGeWsoI9EADCXXGF3LjYPYt8
         6aXxiVmMP7Nfxbsqsw86U6jYEqHh5hVo/l0Nf+n6PmXjqpWZxOFqC+qoPMukGCWUnIDJ
         q4vXWOZWqOagsN/I+EBt34J+SMQFOTmSTRe7nbG7VOdW+HP/JsDSqYOUm7kUlgiZ2hBm
         mkoWc/HUQplhSczesHit6W9ZeWl3hmirH8uqmz3B+Z9sNOoSsCtln/DSPvpjLMky6WwY
         DvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697319935; x=1697924735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQZGUxEMYp+rXLv4cxCc35LRFGHxwXvxjsAjgQGMWw8=;
        b=IooQua0m+UkYxEPLKI1ehMwqMI/g1eQjbuEW9Bu9JGTWWE80I1Eex16tPNTgl/l28Y
         wBp+v9rklkfiDvgSX183qNAQHb17gfclcncge2uEQgBFEGuS1UKE5BO3Ae8gL6tJ2CxJ
         SU9VJoWa/apygpOChE5sEdZ01+KSsXElSr2PpVCfaIUU76vaF9U/blEWiDc0N2jpSshE
         lnXi4nIWp8Sv54aHHGgomytVlmuwfW+argv542ZjxPb042otYYZALm5ynCsvKhywTsYA
         jCcyCYyy+ozOAKvRFfiXhDDzMv1Il8cJUHxQVJmWXQA8Nd/MDeD1fhdpz51Dz6v/lgL+
         fohw==
X-Gm-Message-State: AOJu0YxypUG/Ez14fILlGrIXWYgeHVeY1VDKqweJFFrEbigplx7Xcqus
	JkHHtYOMBsqm7AqJYdPLK+tmjmclWvxkfs+SdIQ=
X-Google-Smtp-Source: AGHT+IFQEseqwZGQpRRYyhjtKYgIpnYdYxHhHNmRJIcZRBtRRmfttj8w67ckXxbHyS1vbFNI3nUEgA==
X-Received: by 2002:a17:903:1c8:b0:1c8:a63a:2087 with SMTP id e8-20020a17090301c800b001c8a63a2087mr22347727plh.65.1697319935469;
        Sat, 14 Oct 2023 14:45:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jf9-20020a170903268900b001c898328289sm5943411plb.158.2023.10.14.14.45.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 14:45:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/13] python3-urllib3: upgrade 1.26.14 -> 1.26.15
Date: Sat, 14 Oct 2023 11:44:56 -1000
Message-Id: <a335ccbcc9913e79bfe958c41690b7efa189ae93.1697319777.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697319777.git.steve@sakoman.com>
References: <cover.1697319777.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 21:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189135

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix socket timeout value when "HTTPConnection" is reused ('#2645 <https://github.com/urllib3/urllib3/issues/2645>'__)
* Remove "!" character from the unreserved characters in IPv6 Zone ID parsing
  ('#2899 <https://github.com/urllib3/urllib3/issues/2899>'__)
* Fix IDNA handling of '\x80' byte ('#2901 <https://github.com/urllib3/urllib3/issues/2901>'__)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8e062efbac29a81831c3060bcae601dc533d65dd)
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-urllib3_1.26.14.bb => python3-urllib3_1.26.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.14.bb => python3-urllib3_1.26.15.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
index f35a141df2..d2de7c4c02 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "076907bf8fd355cde77728471316625a4d2f7e713c125f51953bb5b3eecf4f72"
+SRC_URI[sha256sum] = "8a388717b9476f934a21484e8c8e61875ab60644d29b9b39e11e4b9dc1c6b305"
 
 inherit pypi setuptools3
 
-- 
2.34.1


