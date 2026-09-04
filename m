Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A107BC61DD6
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 14:23:58 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14937.1788531830320761298
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 07:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YpQH0GAv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b965570d7so11964275e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 07:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788531828; x=1789136628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KhuU7MXbbI6P2sc4qmkgHoQZGfJrsUxuDH/ndQWRKRU=;
        b=YpQH0GAvRLplz6GUqs2GjPCh6UJvA1dKwQLaDUbQxiJLlHP2HnsZ/GVtrXQuEBV9++
         0Me21zPPvGE3Tc+dStdDi2v24fGQ0jxPVEBHM8JXJVgm2zmQpCzWsQyp6VacjGTjys5a
         m5WuqNb/EYnf+IrQefkPCyLrf+M3MdFka3NwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531828; x=1789136628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KhuU7MXbbI6P2sc4qmkgHoQZGfJrsUxuDH/ndQWRKRU=;
        b=cBnJItTB5PGcdMavvzMP00MaMcyr//1MrmomPFhrD7f0jrgOh4VbtaYf2uKhdlDRoF
         2AqixjHjfLwUjwMAL/U/qlTFED6ukU3XVmfZ5k+Nf0K09tW+Rne8dR2nuUDjCL+m/RlE
         I7xg9vT5DD9JQSw8R0E5D/M9aVyrViKm0CAE93KTh0suV2kKtzM2JW5NOyMujKtnj5C/
         tKrP+4Fbdt7bBXCz8YThnq4FakRIORB7mFd6z+bWw1C3K1QNkYPq5XWJZtJlAFL4do/c
         T0iZuaRokLR3LDfxBhayCfVB1BO8mGknQEb66kaF6/E0Hex10pYFBtD+S6IgKOvF9omt
         Vj4A==
X-Gm-Message-State: AFuF++mgmpgpBuLUduS5huBwizNylfHqhrnc89tBIP7LuzvAOLRNhT2i
	8dI89GhSWRGOoaW07ogdHww+viw9IritzfoxlNwhEqg9n9h2X4GGJo/5G5gLRdNplegq4Zvo5XY
	k3MERbJE=
X-Gm-Gg: AYBFou1ctTFsf3S7YYuheu7bkM+45NCbZaf4t91DYW8sp5hB61zf9We9qa4QMQ1EvUY
	tE3/0Ea0yp6MNgwWzI9Iqn0afnY9djqGt9mxfqmMaaCegPdvN4yCtAPNFjoDt59UMeYklDyDwt/
	MaBHJrLvQri5tfJii1cn8VaqfopPHhveuCh7LfuQH1+VQN2MVkyuUBD9hHZVtISe2v/HVVfSsrk
	AxnrNL70zTR45m4csnX+KMslANlvMzY7MbIIExhyvcvLs6wmU3NbjB3GVSuVKkl/OIc0bQPGYVa
	KFM0+IhQzmt+9NwFuVIg4ezbyyxVz7NwqpOopqo1Q+DKabKGkT7ilfWJGmfFg5VhFK1BbaUpLAw
	NJ7f6mnTUWQkUG260KE7skya/lnXmY6M7eGggpjG0Jk75JXCK5SXzlzhP+aFBOFyrjUcevvaB4h
	BRJtAf79QI6t6sr9jnaE7II+jw6VSDWyWw62fCTRq28Wxbob17Wty/BRdo6oyz/anAgWQWvGitw
	xw=
X-Received: by 2002:a05:600c:350c:b0:49c:ffec:1af1 with SMTP id 5b1f17b1804b1-49cffec1b2dmr3664005e9.14.1788531828532;
        Fri, 04 Sep 2026 07:23:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:23f6:3417:15e4:9ee4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm137868375e9.3.2026.09.04.07.23.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:23:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] python3-vcs-versioning: upgrade 2.3.2 -> 2.3.4
Date: Fri,  4 Sep 2026 15:23:42 +0100
Message-ID: <20260904142343.1608107-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904142343.1608107-1-richard.purdie@linuxfoundation.org>
References: <20260904142343.1608107-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 14:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245119

- Ensure the vcs-versioning testsuite passes without setuptools-scm installed; the egg-info
  vs PKG-INFO discovery priority test moved to the setuptools-scm testsuite, which
  owns the egg-info entry point it needs.

- The `semver-pep440` and `semver-pep440-release-branch` version schemes now keep the PEP
  440 epoch of the tag they are derived from, instead of emitting a version that sorts
  below it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-vcs-versioning_2.3.2.bb => python3-vcs-versioning_2.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_2.3.2.bb => python3-vcs-versioning_2.3.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.3.2.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.3.2.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb
index 57ea6a92273..e358c722d73 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.3.2.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "24abddff97aecf44cf3fec727eae8d76d9c6f70f5acb39afc41f824d69f2aac5"
+SRC_URI[sha256sum] = "f3443da15a34a32755b04324e33c6166add300c7661f45902225190c9337f711"
 
 SRC_URI += "\
     file://run-ptest \

