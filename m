Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8756F782FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 19:22:41 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id u48so206549qtc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 12:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=JTZbhB0su4MACq6YTX+dtl3U7ahQ2LTd0Jegn2hvtR8=;
	b=Dd6S6tEcGPhzOFIygfWIYEL/gMmc68m84t2R6kVeavDwuMGw8lHketL5fpDXKQ7r2N
	xNoDKZR7IkbcY5jPirC6eRT9HpAPGK0j+U83ew16NWA0Ft8cD7r8Q1veKxqThIUjGmzW
	+UHptix2CNk43Yb8D1a2dMxKrJ7xAfRVV7yrJh+h4f+QRPW8Ac6EPO0bxVB5dMJajgub
	VYhG+7QGk3pjkgcyCy6Si4Ta+efOP8pk4IAX/dzTTd92DPAfzLhnv0YImFoexKWhIPw6
	y24MSDGaYqflNygAmFCyOqp+P7gaUKidA4hkgIjPQkHAid0SCnHqvAENpwAwg6avmpnJ
	xnxg==
X-Gm-Message-State: AHPjjUhISbAUuUQgQzLAsNN6QmWK2kxo5Fjt23LRsXU0OCqmVWdagUzp
	htCAB9H84igj4uvn
X-Google-Smtp-Source: AOwi7QDz2tpPQ4yjQfK1Gtezrju9ALnnMZMraQvjOxQ5jK7qm0Vi94LvcDyKutBJ7lKxc2ciL7U9PA==
X-Received: by 10.200.27.226 with SMTP id m31mr34042853qtk.198.1505416962337; 
	Thu, 14 Sep 2017 12:22:42 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	x55sm1037614qth.91.2017.09.14.12.22.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Sep 2017 12:22:41 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 14 Sep 2017 16:22:31 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Sep 2017 16:22:26 -0300
Message-Id: <20170914192231.15002-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v10 0/5] Revamp the Go support
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
X-List-Received-Date: Thu, 14 Sep 2017 19:22:41 -0000

This improves the Go support on OE-Core.

We are trying to port as much as possible work done by Matt on
meta-golang back to OE-Core and also to avoid carrying old releases as
there is no need to support more versions of Go toolchain.

This fixes issues in existing support as well as add support for SDK
generation which supports Go.

Changes in v10:
- new patch
- new patch
- new patch
- new patch
- new patch

Matt Madison (4):
  go-crosssdk: fix host/target references and cleanup
  go: fix linking issues for nativesdk builds
  go: fixes for cross-canadian builds
  go.bbclass: set TMPDIR during compilation

Otavio Salvador (1):
  Add Go toolchain support

 meta/classes/go.bbclass                            | 10 +++++-
 meta/recipes-core/meta/meta-go-toolchain.bb        | 12 +++++++
 .../packagegroup-go-cross-canadian.bb              | 12 +++++++
 .../packagegroups/packagegroup-go-sdk-target.bb    |  8 +++++
 meta/recipes-devtools/go/go-1.9.inc                |  1 +
 ...dd-GOHOSTxx-indirection-for-cross-canadia.patch | 33 ++++++++++++++++++
 meta/recipes-devtools/go/go-cross-canadian.inc     | 40 ++++++++++------------
 meta/recipes-devtools/go/go-crosssdk.inc           | 11 +++---
 meta/recipes-devtools/go/go-runtime.inc            |  5 +++
 meta/recipes-devtools/go/go-target.inc             |  3 ++
 10 files changed, 106 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-core/meta/meta-go-toolchain.bb
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-go-cross-canadian.bb
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
 create mode 100644 meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch

-- 
2.14.1


