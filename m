Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A876CCCA47C
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 11:41:23 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.59408.1656848479893451363
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 04:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jEeK0fV6;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id b26so9533575wrc.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 04:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cGjGdklO9Lbkk8DxIJtghinkYm/LJU76LJ20ywNVTCo=;
        b=jEeK0fV66kk/I0BIyu0qdB0Id3WQFR75tmuaI35uyCFDIuGBAeDDYQa+yLopBO0czw
         6LPmyyKDjjpyLIHX5AP0Me7/v39CbhF84F207kqRUwwAJveV1S8dL/sCUhfLFrSmUDAc
         NQzacZiN0subRVHuLdVHBp/vszwVDfX15h2ydbVc46eGYz2b12bWQupp2KB8HjDHU+9s
         hUWYYITkA4pvAnFijNKePuc8cy6MczKeglEBx5S0WI05MS7cWKBByOiEXV2LpJqhCPbZ
         N/nUwEHJkA1DmW1DUfUIERSBtPc2brp8AZEgNcdjEuKxaNgeIb+T6s4AEVg/aFF972gk
         qINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cGjGdklO9Lbkk8DxIJtghinkYm/LJU76LJ20ywNVTCo=;
        b=mKLIrMTo9pd7BEWC/GRvfddMjGK4y7H7/EwCkzrgDhEeLVR2xA2mpds/0/XHgHYrzi
         PN8wmzGfEltffqKYE6gDFJfQBqTGbADgiC/Zip05ZY+c80wWPFDFwPgOLJqzfWK5TuLl
         f/2Ruf6wTt/AzAT2y7A/E/oFtbPosjoOCiVXSg5RwK5XbjHRMh2FL+/CuMATdWdBkRKg
         ToA6SSKbqKwdbk92GbXkzX2OD+68Uh1Q/ZZPaDRfYwfZoJCcRDZCofLJajNZxllRQKrU
         zo7Lqh8gBqM11Qbf6sM8mc0kIIH3jG9F06vBwO//q2TEq2dWs9R9IqVrFJzwjHcANHRL
         oz1A==
X-Gm-Message-State: AJIora9HpeyELWnwV0PijauJ/51oLcs2qoIKUEao6Y2WelnYvk1QkfWM
	O6nFiLwjHJiJysnKeDU5TpQyl9BVpwNL
X-Google-Smtp-Source: 
 AGRyM1sXEZP/v0OFlrKR/7zIuBqr4QwEmyHBnwE2UwdU6EiQWPn45p6b6zkujRcRHnXvQmP0KolZVg==
X-Received: by 2002:a5d:4d02:0:b0:21d:31c5:ed18 with SMTP id
 z2-20020a5d4d02000000b0021d31c5ed18mr20661302wrt.673.1656848478306;
        Sun, 03 Jul 2022 04:41:18 -0700 (PDT)
Received: from localhost.localdomain (83.11.75.211.ipv4.supernova.orange.pl.
 [83.11.75.211])
        by smtp.gmail.com with ESMTPSA id
 p28-20020a1c545c000000b003a02de5de80sm12413142wmi.4.2022.07.03.04.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 04:41:17 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH 1/3] utils: create_cmdline_shebang_wrapper whitespace and sed
 refactor
Date: Sun,  3 Jul 2022 13:41:12 +0200
Message-Id: <20220703114114.2313369-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 11:41:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167553

Correct whitespace to match the rest of the code in utils.
Refactored sed expression with a simpler equivalent.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/classes/utils.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index b617632d9f..b58c22771f 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -188,7 +188,7 @@ create_cmdline_shebang_wrapper () {
 	# Create a wrapper script where commandline options are needed
 	#
 	# These are useful to work around shebang relocation issues, where shebangs are too
-  # long or have arguments in them, thus preventing them from using the /usr/bin/env
+	# long or have arguments in them, thus preventing them from using the /usr/bin/env
 	# shebang
 	#
 	# Usage: create_cmdline_wrapper FILENAME <extra-options>
@@ -198,10 +198,10 @@ create_cmdline_shebang_wrapper () {
 
 	echo "Generating wrapper script for $cmd"
 
-  # Strip #! and get remaining interpreter + arg
-  argument="$(basename "$(head -n1 $cmd | sed -e 's|#![ ]*||g' )")"
-  # strip the shebang from the real script as we do not want it to be usable anyway
-  tail -n +2 $cmd > $cmd.real
+	# Strip #! and get remaining interpreter + arg
+	argument="$(sed -ne 's/^#! *//p;q' $cmd)"
+	# strip the shebang from the real script as we do not want it to be usable anyway
+	tail -n +2 $cmd > $cmd.real
 	cmdname=$(basename $cmd)
 	dirname=$(dirname $cmd)
 	cmdoptions=$@
-- 
2.25.1


