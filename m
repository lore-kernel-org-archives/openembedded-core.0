Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id AAFDA719D0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 21:06:20 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id q8so277706qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 14:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=8Jq5azfdLvPZ8vGmfxQeScDhS77aur5nR2ICu6ein9o=;
	b=f65WFumOBGtPwql+oQMpQnQZYWxkbRm7+NZKUdn3cppSGUAUpdAG/Qs6gscUZRqdJW
	bj0QQ0NKrka98TLnn6BehVOQ5LwWkpVzjXKnHR96UtpxlvURd8C1/tK8w/pLuGE5YpQY
	4hlUde91wYAT+9FWsZWrtwXRTj24Sbzep4pC1c5WMeoxaeQAZxIO0qf8IsU6TSHGLAbp
	KUfXum3ljM32xWLwR9FwtCuaipGlW1sAmG21i+8J2dTm3SrS/AXFjTKbvV9cQg7FAbmA
	V3+59QFifybAxno4LjDA2AnKGNsLM/bKnn0QeTp1D7nXJHvLTzLhc/QZEm4DTrRcrwCZ
	cn2A==
X-Gm-Message-State: AHPjjUiKg/txxnbgTBMQuY7iaqD2nW4amtvtSIalGh1b4isBN6xeHSfc
	TaDQsboLsK7PPFcu
X-Google-Smtp-Source: ADKCNb7frF/1q6UFbUtmUVydE0pPkYyw1BV98mnzIieKejmbT8Uqw/+cBa1JwNz31h1CtdJhi/jy7g==
X-Received: by 10.200.53.236 with SMTP id l41mr2452157qtb.24.1504559180849;
	Mon, 04 Sep 2017 14:06:20 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id x20sm5625452qtb.5.2017.09.04.14.06.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Sep 2017 14:06:20 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 04 Sep 2017 18:06:11 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  4 Sep 2017 18:06:01 -0300
Message-Id: <20170904210608.23764-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 0/7] Revamp the Go support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Sep 2017 21:06:20 -0000

This is not yet complete but does improve some parts of
Go support on OE-Core.

We are trying to port as much as possible work done by Matt on
meta-golang back to OE-Core and also to avoid carrying old releases as
there is no need to support more versions of Go toolchain.

The first commits on this serie does fix errors in current
implementation, the others are improvements and clean ups.


Otavio Salvador (7):
  goarch.bbclass: Stop passing True as second argument of d.getVar
  go.bbclass: Fix binary installation path detection
  go: Remove Go 1.6 and 1.7 releases
  goarch.bbclass: Add support for ARMv5
  go.bbclass: Use a global Go build flags
  go.bbclass: Enable parallel build
  go.bbclass: Use an auxiliary variable to add the build dependencies

 meta/classes/go.bbclass                            | 34 ++++++++++--
 meta/classes/goarch.bbclass                        | 20 +++----
 meta/recipes-devtools/go/go-1.6.inc                | 19 -------
 .../go/go-1.6/armhf-elf-header.patch               | 23 --------
 .../go/go-1.6/fix-cc-handling.patch                | 50 -----------------
 .../go/go-1.6/fix-target-cc-for-build.patch        | 17 ------
 meta/recipes-devtools/go/go-1.6/gotooldir.patch    | 30 -----------
 .../go/go-1.6/split-host-and-target-build.patch    | 63 ----------------------
 meta/recipes-devtools/go/go-1.6/syslog.patch       | 62 ---------------------
 meta/recipes-devtools/go/go-1.7.inc                | 19 -------
 .../go/go-1.7/armhf-elf-header.patch               | 23 --------
 .../go/go-1.7/fix-cc-handling.patch                | 50 -----------------
 .../go/go-1.7/fix-target-cc-for-build.patch        | 17 ------
 meta/recipes-devtools/go/go-1.7/gotooldir.patch    | 30 -----------
 .../go/go-1.7/split-host-and-target-build.patch    | 62 ---------------------
 meta/recipes-devtools/go/go-1.7/syslog.patch       | 62 ---------------------
 meta/recipes-devtools/go/go-cross_1.7.bb           |  5 --
 meta/recipes-devtools/go/go_1.6.bb                 |  4 --
 meta/recipes-devtools/go/go_1.7.bb                 |  2 -
 19 files changed, 40 insertions(+), 552 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.6.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/gotooldir.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/syslog.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/gotooldir.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/split-host-and-target-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/syslog.patch
 delete mode 100644 meta/recipes-devtools/go/go-cross_1.7.bb
 delete mode 100644 meta/recipes-devtools/go/go_1.6.bb
 delete mode 100644 meta/recipes-devtools/go/go_1.7.bb

-- 
2.14.1


