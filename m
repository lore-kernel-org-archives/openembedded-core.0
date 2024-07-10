Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1583C41513
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 19:47:39 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.3990.1720640355061594830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 12:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RvJbiUb8;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: jeremigraveline@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-449537c62d1so540151cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 12:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720640354; x=1721245154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1E5j79KlXTl8EEtwuDqQA2os3mnXCfdmVDCQ1euMi6o=;
        b=RvJbiUb89IqmSu4tH93qF6/qeuDjejGzdA4kvH2GfVyNDonpfAui46+Oik06wEhXgl
         n6ugX0jlVYZFT0Xyed8WMsl6rX4TZ8KLKmljSQKUB4+i/EJR1r2FppJCa7iqc9CvcJrF
         hdjNFcX6X5gH8BopEOm6T/OQlPvR3mCLtom3ukGS2S8wIXcxOWCBbnmm1JDI2Rbv77Kx
         1kslrV/Ff0LwH76HOBfgau+4HMpdA4S8HLW4pABdQax6khvoARH31LtyhS8I9oD1Gbs0
         qzUT/kaP5jEiHw8bYbnIUKsNWCrFW7gHXllkwWNBl2ZWbOFkRrUNs89O5hnOUnCNDOSY
         yN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720640354; x=1721245154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1E5j79KlXTl8EEtwuDqQA2os3mnXCfdmVDCQ1euMi6o=;
        b=LwqeuxxrU8kDSkU4OJB7uQVyRt4nY6jeR17FZOPbiz6BxloxjFHwsLav+hNmS0W86/
         ZlfvwAqKyk+3EweQtyozVdqaDdIHdZOaCJrkWOyxQQyLf5ge1Ks6nXd13Qi8Bj44kRMk
         yHP4oPEQXqdM5LSUQ1vndJljBon/O1+xJu2a4WJZLxX8NvvJ6zlT2BffhLH5RzA99ivW
         YeGA7QEdnbmPQR6zK9FmzVnmtymbjRlCuuNpFlOZfZUMUCenWvzmfgVDrnYE/MsQZgAq
         lXhmL3MixFmZ1K9VO8nvdABEHmwUTwTupfPjpbU4uASpnLkG3ZnrMVTmXAjKsdA7pf7A
         wAHg==
X-Gm-Message-State: AOJu0YziSNMXdEUHwCYSKZ54uc6WpiwNdfpKa35AHSE7VYtyOT2TXp4C
	k12J1DOqSCni24yHcKl8tWSNAIuz7aWDruDhwK84+EwAQKRIyWF8YXAnKA==
X-Google-Smtp-Source: AGHT+IH1NJgGvPiVmg43fxH8TmOI8n6FnGjXcpiKgrndIU3l2cZ72k2L3UdBfZA6P45yr9GqVFaGbg==
X-Received: by 2002:a05:622a:52:b0:446:4c0f:ef03 with SMTP id d75a77b69052e-447fa84b628mr84969741cf.10.1720640353571;
        Wed, 10 Jul 2024 12:39:13 -0700 (PDT)
Received: from CAMTR-LIL0013.riedel.net.net ([2607:fa49:c33f:7d00:d8c1:5cf8:4d86:6151])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-447f9bfb2acsm22896441cf.96.2024.07.10.12.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 12:39:13 -0700 (PDT)
From: jeremigraveline@gmail.com
X-Google-Original-From: jermigra <jeremi.graveline@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jermigra <jeremi.graveline@gmail.com>
Subject: [PATCH] cargo-update-recipe-crates: Use override style append so generated code passes oelint-adv.
Date: Wed, 10 Jul 2024 15:37:43 -0400
Message-Id: <20240710193743.3686800-1-jeremi.graveline@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 19:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201740

The oelint-adv linter checks fails when linting the recipe generated when inheriting cargo-update-recipe-crates class.
It fails with the the oelint.bars.srcuriappend error. See https://github.com/priv-kweihmann/oelint-adv/blob/master/docs/wiki/oelint.vars.srcuriappend.md#oelintvarssrcuriappend
Fixed by using override style append instead of the += syntax.

Signed-off-by: jermigra <jeremi.graveline@gmail.com>
---
 meta/classes-recipe/cargo-update-recipe-crates.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
index a19ce16b46..88a5b0e4dd 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -31,7 +31,7 @@ do_update_crates() {
 def get_crates(f):
     import tomllib
     c_list = '# from %s' % os.path.relpath(f, '${CARGO_LOCK_SRC_DIR}')
-    c_list += '\nSRC_URI += " \\\'
+    c_list += '\nSRC_URI:append = " \\\'
     crates = tomllib.load(open(f, 'rb'))
 
     # Build a list with crates info that have crates.io in the source
-- 
2.25.1


