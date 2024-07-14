Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9B5C3DA4A
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:39 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.15289.1720960774925693084
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=y3tsjmYa;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70b0ebd1ef9so2283397b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960774; x=1721565574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZsX8GPGK2byPlOXqoujJDNTLUXAyErOrmp8ltFeeTR8=;
        b=y3tsjmYadd1Toniw6lf/jeEOzGmcHXo2aE4xU0HQfPyt+GzPWhSDdOqdxlUJrGsv9+
         a+vEYzxlM1t0OdJc9lgvosT6yN7wRb8/jAUlM8aVbVm7Z90JpAqca6pDbP8HHA8+Q+mN
         px2ngrkI2JJR5NC1ZThstfFlhaFOPTj8dwDRFCUXWPJEAuQ1U5YW1Fx52E2HkiGjwRap
         UYgletpj8wg/sq9e/YD6qnJfIGTWt9kxF27cZFP+cGYjjzzQ/VNjRAJyrGf/qRUHta+J
         tTHzBkire0XC4fWd5kHybDHsbUrcjMWnSRuj65+kT4cx858UpbgMxlzNM9855qzoXQgP
         y5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960774; x=1721565574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsX8GPGK2byPlOXqoujJDNTLUXAyErOrmp8ltFeeTR8=;
        b=ecHL+ZsC8aIXZw92VirFScj5aQglFXU92Mrt9wB8wJycyhNLG7RAtyn6SgTZ+/NIZL
         tsIPbq1VK4zaT7c1HBkHZsRhWELLuLhpK9q9oVQF9Q2xZOrSoHgQZU+88tGgV4HQ2UbP
         4AwzOBCpghT+3h7WzFgfJet+ziqWQqTiXPpqxKn13yOaRlICjMz/d33jvCwoJ18KNtKa
         Pp7SJJkwtQB7wKbSd0WAokBWWhlCR1MhgTH+objIUxBlycnA/ZM3RsVh2a+1rsTl5lqg
         5I58fr4NgIwhvkfDPHdBvbcFqATYr431JWZryb8D+FpNUJmC8TPD03i6fxRbSRht3e9L
         AFhA==
X-Gm-Message-State: AOJu0YwacBna+u0H7mN1yexdSI97oJtdrcBWm3Z9dfaCFbtn2Z8KAcbS
	qD1ciA1SaUXjOss008owpUYRSVZ96YrpmyElMALPHRefhjQ8Wu79KhOFhi5Qt+5byrc4HNCmoHv
	r3+Q=
X-Google-Smtp-Source: AGHT+IHOb5VzmqbJ2nvZkwEwUOb++6lqzHsA3pRrT6LZGQnvD9qSP3+nEUid8GVtAtf3tWNrgXsIwA==
X-Received: by 2002:a05:6a20:734a:b0:1c0:eb1e:868e with SMTP id adf61e73a8af0-1c29821acbemr17905288637.19.1720960774172;
        Sun, 14 Jul 2024 05:39:34 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/27] ncurses: switch to new mirror
Date: Sun, 14 Jul 2024 05:38:44 -0700
Message-Id: <506673555fb4dcf06606e2b49c2268ece33a71d5.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201874

From: Peter Marko <peter.marko@siemens.com>

github.com/mirror/ncurses is not updated for over a year.
Switch to new mirror from Thomas Dickey (ncurses maintainer).

Sources are identical.

Updated upstream check regex by:
* changed dot to underscore as this repo is tagged like this
* added v prefix to not propose updates to some old tags
* removed third part to not propose updates to development snapshots

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ea801be31d051b558fde52f7d6dccf2cd416afb9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ncurses/ncurses.inc    | 2 +-
 meta/recipes-core/ncurses/ncurses_6.4.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 761b6a3d31..3b72f3efdd 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -13,7 +13,7 @@ BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config \
 inherit autotools binconfig-disabled multilib_header pkgconfig
 
 # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
-SRC_URI = "git://github.com/mirror/ncurses.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/ThomasDickey/ncurses-snapshots.git;protocol=https;branch=master"
 
 EXTRA_AUTORECONF = "-I m4"
 
diff --git a/meta/recipes-core/ncurses/ncurses_6.4.bb b/meta/recipes-core/ncurses/ncurses_6.4.bb
index 97130c06d6..61558ecfa8 100644
--- a/meta/recipes-core/ncurses/ncurses_6.4.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.4.bb
@@ -10,10 +10,10 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://CVE-2023-45918.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "79b9071f2be20a24c7be031655a5638f6032f29f"
+SRCREV = "1003914e200fd622a27237abca155ce6bf2e6030"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)$"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+_\d+)$"
 
 # This is needed when using patchlevel versions like 6.1+20181013
 #CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
-- 
2.34.1


