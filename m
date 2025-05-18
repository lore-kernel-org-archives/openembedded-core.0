Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7477BC3ABC9
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 19:52:57 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.36480.1747597968881028417
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 12:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g93YVWIS;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e7b943bcf0cso652946276.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 12:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747597968; x=1748202768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+EGqrQcASY8VPjJS6C9rsj/ti6dO6tgNDb2pPJII/g=;
        b=g93YVWISfWGQ5GU4GZbs3N95Um9nA4z3cIn2za+WbXd483E9Rzk7LmZgXphgsnZAdr
         3LU6oTf0mUzZWXDZ3AYqpXlUITgP/EaCFEpe9o/jrvwOSspoklfG7g591xJIdJA6UjCm
         5RCApoRJGtGj75ifDUNC27jQguioFzFE44IjuC8au8lG7TzL/yKQm5GhzQvhgjz7jgXv
         DgL7WXHyTaZb2RmkIWfDEAFAru2ZN0IDPMrnfT26w5klqQkUg83qo/oYLAQVuiV+/flE
         qB0DZ3hbzT4mYBr2xKNOFFSros8hSf5fPl3iKUfwEflZ0fvEhJVqwlK/BdIvCIUBEprk
         cekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747597968; x=1748202768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+EGqrQcASY8VPjJS6C9rsj/ti6dO6tgNDb2pPJII/g=;
        b=DV2Rk7Lm8bQJp8OnOWU+rP/DLr3vxlkkqejYWlTjdFbchsjUiBpumqn1fnYMBEP/94
         2KVO+aczursZPu2q2biQA+0eQJN+l1zrleq6L8CEDSUa8Bk+NmewrQjW+3+iq1HYcNBU
         YDJtUeu3LepiLkIAcJursao1aO9T+g7/WrVfIZKN2G6Rc+C5eGgnnYkjUnfRtyD2XFId
         UbNcgT/OQ8Q9/6h/7MrB4lxUZNOSol9N2PHYnCJQyI0ej4aK50/AZbRGSJvztowD/EPH
         VePndrBnKo22TW2mCBtekr8GLvgM+RFf1sOyXoQXw7B77FsMPyzvzGwyt2T9Dtn+TUvC
         FRmA==
X-Gm-Message-State: AOJu0Yy6K2hIChZ+/htVF6Es1EtJWIZ48Sn59UymX9JRZ4u8qO45LW+2
	quZmzv8A9Dz+ob2e6pMD/e/asYdhj//BZJtnQHcZJM7kt7SBaJIi2tFjrgMYRIrJ
X-Gm-Gg: ASbGncuKkYSNmkZktKs7B3ZoSHl3WAL0+Hv350JXXjTvPZjQyhMuLv0Oyg6b+5epgTy
	eH3Q7A+Mm649qzZQvFUaIUFn9ciSxrtOFz5TGob186MKH+WJ4LhnIVSdaLcOdyF7+qQ7yy7Vy1U
	6uDl9cWxqm1k5Txj9rYjUioFh0YybqTudvmvcdnJBmDwdtAsiZ3WBxZIaSEgO2gdCMu+uNFIA4N
	P2C8gSG/clHP/WVHMtBvdbUzczvfDL2oGjI5KS0YMvmSaulvcbKYUPVTneAvvJzkwdps1L9Htp6
	+7U2zgqSjzdtyATaAZNVIXdvQ9Adm4MNBimcMZUjg3thYw6eQjaHQPlJWZJq0dYq50k=
X-Google-Smtp-Source: AGHT+IGWnq8wDPdWTVfvFB6rhytRslLQ3gAxTfI33fu6XzhzHu6vlE06a70W0EZpZyoriOQNSi0okQ==
X-Received: by 2002:a05:690c:45c9:b0:708:bb0e:5a06 with SMTP id 00721157ae682-70caacd21a1mr142896307b3.0.1747597967483;
        Sun, 18 May 2025 12:52:47 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca831c44asm14766187b3.35.2025.05.18.12.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 12:52:47 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [oe-core][walnascar][PATCH 2/2] perl: update 5.40.0 -> 5.40.2
Date: Sun, 18 May 2025 15:51:29 -0400
Message-ID: <20250518195129.448725-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250518195129.448725-1-schonm@gmail.com>
References: <20250518195129.448725-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 19:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216783

This fixes CVE-2024-56406 - Heap buffer overflow vulnerability with tr//

https://nvd.nist.gov/vuln/detail/CVE-2024-56406

 From https://metacpan.org/pod/perldelta :
   "There are no changes intentionally incompatible with 5.40.1.  If any exist, they are bugs, and we request that you submit a report."

 From https://metacpan.org/dist/perl/view/pod/perl5401delta.pod :
   "There are no changes intentionally incompatible with 5.40.0.  If any exist, they are bugs, and we request that you submit a report."

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta/recipes-devtools/perl/{perl_5.40.0.bb => perl_5.40.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{perl_5.40.0.bb => perl_5.40.2.bb} (99%)

diff --git a/meta/recipes-devtools/perl/perl_5.40.0.bb b/meta/recipes-devtools/perl/perl_5.40.2.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.40.0.bb
rename to meta/recipes-devtools/perl/perl_5.40.2.bb
index 0d4338f29f..95c230060d 100644
--- a/meta/recipes-devtools/perl/perl_5.40.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.2.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "c740348f357396327a9795d3e8323bafd0fe8a5c7835fc1cbaba0cc8dfe7161f"
+SRC_URI[perl.sha256sum] = "10d4647cfbb543a7f9ae3e5f6851ec49305232ea7621aed24c7cfbb0bef4b70d"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.43.0


