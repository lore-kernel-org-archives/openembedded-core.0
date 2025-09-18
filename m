Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE9ACAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:28:01 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.665.1758230880416517244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eHi9BjuM;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8287fedae95so193691485a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 14:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758230879; x=1758835679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vcEYYYxN0trghC1lOw0StMHxbusXXBGsszO8JBo1qjk=;
        b=eHi9BjuM/VAJx1YRqa+6Voaj1x6bjVvrFgRZaqXLT+FYJVoW2/cijiTh8GacHRpBlR
         iB3XD7GdQB/fDjm+Zy+b+mihx5FCNacak28sINm1B68g9PTiaWF9f/yppZS5OpOxqNKa
         7+6ZdU20DupHOgR+Y/bRRFtuOQ2ZAvs3esgXj3SteHr9S17MPIkkOE0U3/2ZioiRmiCX
         9dPA97uUr8wdHK8eTu5dw6J6OE1nnR3zZU53ygQVtQK8YEHVvCuoYyJn+1D6VKKmiu2T
         cYNTFLKXqPfXt0WpaIY05i0NOdWJ55+wwaYI1exmzHnZx++16X6wiNjVHqXv2iZWzOe7
         lkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758230879; x=1758835679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcEYYYxN0trghC1lOw0StMHxbusXXBGsszO8JBo1qjk=;
        b=IElIQGAxRClZQTt7aztDDx3DP7wGF3JSv9vd6v/hPc163ULcREbcLiFQ35qX/sDehi
         i86E/mq/KcJ1FuKoWEivsAeA5LkQFMZYOiSYyhyV6C6X1DSNes/q9rRoeUPEkW5Nhw3Q
         xMkiTmvljItXbZ4SK6A43nxxezWs4Ie3HD1ZYYPbjkwO0/swB52EvEaPcA2Aakp2FV63
         KEPA94TGISZKweIGGX6Q3R04yeGi6QFfkRDlvPEe3Sl/kZZt2nTQ2skl1cqXvBpnPiC1
         h/Q3vQBr6+iIXpJFuQSR49rSucIgulNibJpghjif48YpC+EArgMhepLqki/I7xREEXS0
         lP9g==
X-Gm-Message-State: AOJu0YxzOB89s8qmVKUc8HgbIH0O4b+nUZxeX12myIXQEaNQ55+tKQfa
	F9qunXjDtmgZD7hadISux4j5S2/mlzNULf3fioKMYvLWkqD/u3CiAPMwDU8miw==
X-Gm-Gg: ASbGncs4d2n+IG1i7FzaRtnKI+aS2GxT8lnoHjFhypwmk0JEWpyq3TwxU7RK1dTx49F
	xotDQo7sTxqE2jsCJx9p4J5OUUjkZA5uAdT6VMHoV+p4RsFTJplSJfCNT5bYBZLSuj4uEskf9wT
	oC93vTWYd0Ns67zG5rjqkbnV6pT3FBUaOpM0FPqEQsMfnTAv6V013ejHeyVSBIoZFN6aidTQdeF
	Ftl7UcJrg0q+LM4OGOorUfqwxNh6w259xkfD4U3PLiA7cOP3kV6+LSpjdg2hBGHNMNORdminebj
	EDoF21IhV2x5zGPnRX2Q4Kf854/d+OSQJk2B64HprttM6a95XXAwvF21ZqHmHWpRghR2RbQ0hcm
	TGeU12613gYmLTMjlUb5fS6tt5acyv8qmUjcMM644Ww1KLjlUekWnKPI75UolrqJOCFOIDQlLrh
	UnIu8=
X-Google-Smtp-Source: AGHT+IHJc2nircbVZtu2qHSaEgRpQcMOA8Trp2PsBRz4tDecOY4xgxo6evQZInZkdD3kkWJuJ6bILQ==
X-Received: by 2002:a05:620a:1902:b0:82a:6bde:30c7 with SMTP id af79cd13be357-83bac4aff02mr115270585a.84.1758230878657;
        Thu, 18 Sep 2025 14:27:58 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-836263ab544sm235016185a.9.2025.09.18.14.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 14:27:57 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH 1/6] patchtest.README: trivial fixes
Date: Thu, 18 Sep 2025 17:27:24 -0400
Message-ID: <20250918212743.3960-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0.193.g4975ec3473b4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:28:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223680

Fix two small, trivial issues in the README.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 scripts/patchtest.README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/patchtest.README b/scripts/patchtest.README
index 3c1ee1af1d6c..1c674e23c9ab 100644
--- a/scripts/patchtest.README
+++ b/scripts/patchtest.README
@@ -18,7 +18,7 @@ baseline for development of similar suites for other layers as needed.
 Patchtest can either run on a host or a guest machine, depending on
 which environment you prefer. If you plan to test your own patches (a
 good practice before these are sent to the mailing list), the easiest
-way is to install and execute on your local host; in the other hand, if
+way is to install and execute on your local host; on the other hand, if
 automatic testing is intended, the guest method is strongly recommended.
 The guest method requires the use of the patchtest layer, in addition to
 the tools available in oe-core: https://git.yoctoproject.org/patchtest/
@@ -33,7 +33,7 @@ by running `pip install -r meta/lib/patchtest/requirements.txt`. Note
 that git-pw is not automatically added to the user's PATH; by default,
 it is installed at ~/.local/bin/git-pw.
 
-For git-pw (and therefore scripts such as patchtest-get--series) to work, you need
+For git-pw (and therefore scripts such as patchtest-get-series) to work, you need
 to provide a Patchwork instance in your user's .gitconfig, like so (the project
 can be specified using the --project argument):
 
-- 
2.51.0.193.g4975ec3473b4


