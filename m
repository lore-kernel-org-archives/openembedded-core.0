Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 98F7177E7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 14:55:46 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id h21so2328888qth.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 07:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=6FJsolA5ZnM9AXeVoTD4FtNxU+uSTXjHJhswovX2Mps=;
	b=giP+oY6Mn2QA5ZaTtxM9owvpPqfeCU9xGPmruMw1eRUWouODpPO4mh1Jfq3/R0GqPd
	mRK8BHutvzfmg+8yS8RQv+sNTtQdY/dEnheicL9Pft6p56pMLGlagezhIKSNdT2LTpVw
	c37v+z1RhzyGLmu7Ml8c/1mAD9fQGyGqAqX2oWauC8eS0FwKW64lWSK5nL6ycqpo1NT6
	OyqZupFo1rLLAfo25sTRIlqcg4GuEGG+5PEZYXrJqjUJILNkptDyfJ1TSKrJLTv6YyU4
	4zV5T3XnDj67g8PaiIpjuf1vtxVqHmdFMrUyYyCpBI3k1LLj10q4ny9w4md981UCdoLf
	3+Fw==
X-Gm-Message-State: AHPjjUi8MwvpLl5v3PhY+dT4hE3klh3MNIMBBf7zcyVckuqBk5O2zg+h
	uVX0fCq/ndw/M5pj
X-Google-Smtp-Source: ADKCNb6fWvoIjuVCAWezYfUA8ouSy1mZWUzsZKVvbGdnHd+C4ahrdxGeQyDSujkjJFVXGOIE9HZr5Q==
X-Received: by 10.237.34.25 with SMTP id n25mr5900941qtc.144.1504623346879;
	Tue, 05 Sep 2017 07:55:46 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id s37sm508185qts.27.2017.09.05.07.55.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Sep 2017 07:55:46 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 05 Sep 2017 11:55:37 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  5 Sep 2017 11:55:28 -0300
Message-Id: <20170905145536.21149-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 0/8] Revamp the Go support
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
X-List-Received-Date: Tue, 05 Sep 2017 14:55:46 -0000

This is not yet complete but does improve some parts of
Go support on OE-Core.

We are trying to port as much as possible work done by Matt on
meta-golang back to OE-Core and also to avoid carrying old releases as
there is no need to support more versions of Go toolchain.

The first commits on this serie does fix errors in current
implementation, the others are improvements and clean ups.

Changes in v2:
- New patch
- Remove -x flag (madisongh)
- Remove GO_EXTLDFLAGS for now (madisongh)

Otavio Salvador (8):
  goarch.bbclass: Stop passing True as second argument of d.getVar
  go.bbclass: Fix binary installation path detection
  go-dep: Add 0.3.0 release
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
 meta/recipes-devtools/go/go-dep_0.3.0.bb           | 20 +++++++
 meta/recipes-devtools/go/go_1.6.bb                 |  4 --
 meta/recipes-devtools/go/go_1.7.bb                 |  2 -
 20 files changed, 60 insertions(+), 552 deletions(-)
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
 create mode 100644 meta/recipes-devtools/go/go-dep_0.3.0.bb
 delete mode 100644 meta/recipes-devtools/go/go_1.6.bb
 delete mode 100644 meta/recipes-devtools/go/go_1.7.bb

-- 
2.14.1


