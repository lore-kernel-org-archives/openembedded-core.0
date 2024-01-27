Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C09C48285
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:38:19 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.8385.1706323097055269064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cTy2S0Em;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.169, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc221f01302so1004462276.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323095; x=1706927895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=at2zXF8lidkXLqKR53na8vahRbiHrR3BmGes0ejR7hI=;
        b=cTy2S0EmviwSZOjhPYbA6jK+FlrBdhugX/CK5gbI23UVAJQoj1cKo8Tu1HCyjjEZnd
         FXHekRAZVu6VsOyjKtInsteFa2wJfz8hhG3x4VA32dxg2c2OnZZyDGvDHwuf4oGrrtqN
         nUq3fRHdU9BmdL1E6VkYgrZAodiZy32e5kEs3Pcm9jv6YoDSB5gRSAQgZZMsQeHyh9dF
         O3pItaLjqEADr3CK6MhueKTXUIxkmlJrzWYqRJreXHnJw3a3TZW0VGyojNYB83u0hpvm
         dEwGSi9TPnZeUm42+i7K9e/ikXiD5WNnRfnX/LbioU75Fn/9Y4qJ5bWxsR+daJHHkntz
         wE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323095; x=1706927895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=at2zXF8lidkXLqKR53na8vahRbiHrR3BmGes0ejR7hI=;
        b=d4aCBDcX/4oxP0MZytmaSZbxRY6rKtf5skw+ihDSaGXQDY5JFjykBUZzJ3t0GxXLUU
         Ufh/SEsFi2jrlUp1IbczrQx7EfHQKvna835AHnhvr0TNsh6GY4ogRQ0hISoOYMKv4+p0
         dzKSmsSFulNWWOMYTYP7jk5OUOGXBgTuSyYabYQMzaGU6YBRsZKNfSnZ1yz5X75e42nt
         hs7QQpT9JFTgFoeEVIB1jJlSC/6MBnYA4R9CQsmIC6HUNMG19s+z7UuVdxJPh2Db9Iml
         KxUY10AVjRnWem1BfBIxxmUm/Dmddfs5NLvzGtCiK3YLLvTLRes8OVJbXpZnAZ418oMW
         lWlw==
X-Gm-Message-State: AOJu0Yw5N9pELJnwfimhOdn7oQhbx0zrzkENlYCRwdJ/34VaID0JGWUJ
	zo1ESieFpcaH2dLIYDTo2KXzJmRGCzh5jUfBRuD37WeUugwrd994481oUDCxleVS8uvw4KL0Y+T
	vZaV/eA==
X-Google-Smtp-Source: AGHT+IEft4yYuy5SeSFX74Efg1PBwKiLoR/B/7YBH/f+91czrtbi5+a28y9J9N9sPQNbXT0Zl2AbeQ==
X-Received: by 2002:a81:9143:0:b0:5ff:9555:9668 with SMTP id i64-20020a819143000000b005ff95559668mr1174996ywg.62.1706323095490;
        Fri, 26 Jan 2024 18:38:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.38.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:38:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 20/23] classes-global/sstate: Fix variable typo
Date: Fri, 26 Jan 2024 16:37:28 -1000
Message-Id: <a681f90caec27d4076bdae3b5b19df2d7f5978cd.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194429

From: Joshua Watt <JPEWhacker@gmail.com>

The vardepsexclude was subtly wrong in that it referenced STATE_MANMACH
when the actual variable name is SSTATE_MANMACH.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec5054396f7fafea2a071d2695ae111fc585d6e6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 0f11a528b5..08e6421093 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -336,7 +336,7 @@ def sstate_install(ss, d):
     for lock in locks:
         bb.utils.unlockfile(lock)
 
-sstate_install[vardepsexclude] += "SSTATE_ALLOW_OVERLAP_FILES STATE_MANMACH SSTATE_MANFILEPREFIX"
+sstate_install[vardepsexclude] += "SSTATE_ALLOW_OVERLAP_FILES SSTATE_MANMACH SSTATE_MANFILEPREFIX"
 sstate_install[vardeps] += "${SSTATEPOSTINSTFUNCS}"
 
 def sstate_installpkg(ss, d):
-- 
2.34.1


