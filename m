Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id BC2A4782DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 17:54:21 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o77so575988qke.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 10:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=i5H0gVHDEl15278m6YmCleFZ1cu34fCoflByxv0qTA4=;
	b=A18GbPIQ0NyUEt+gUTwVhjwIsNZYV7w3oiLbJYZKQ699V798ZVV6bemWei07dPm3az
	SUJoEHxIVrVgg2r8JXZB9RLzRc9eJzG5lYQQhvBVyp063qDhTwji9b3pTvIOCvBDja4j
	n7ZRTN1pPTq7tcWG/iCyc/ERnc+6zI/BG7KzsfSSe9iepJOU2LeZ/wA7BrdT/HSFH7Fe
	n69cie960iHgbwzVIpZwA2F46TWze+xX7nXekexEFUkYLLD0re+Vs13RqAyxFzaKdswC
	K6VWqwlLumQ0WK8D8cU/C8zuBIJqz7G9bNz3buoSPnYdOzfFXrudU7rnFAcoaR/mlv8M
	hqSw==
X-Gm-Message-State: AHPjjUii7qUFE0CsWTCXTOxWp1NryJTJYqtdqs47SeqlnJEIByNebPD1
	TkDZn0z4X4msw2Ts
X-Google-Smtp-Source: AOwi7QAN6ulIvxwI7qKUXgcLjiElLguLv4nX+wVUh5C73s9ALgptknsiAnRqfT6CibiyJkSj62FJrg==
X-Received: by 10.55.200.210 with SMTP id t79mr26887694qkl.140.1505325261773; 
	Wed, 13 Sep 2017 10:54:21 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	u133sm9604441qka.92.2017.09.13.10.54.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 10:54:21 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 13 Sep 2017 14:54:11 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Sep 2017 14:54:01 -0300
Message-Id: <20170913175410.23041-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 0/9] Revamp the Go support
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
X-List-Received-Date: Wed, 13 Sep 2017 17:54:21 -0000

This improves the Go support on OE-Core.

We are trying to port as much as possible work done by Matt on
meta-golang back to OE-Core and also to avoid carrying old releases as
there is no need to support more versions of Go toolchain.

This fixes issues in existing support as well as add support for SDK
generation which supports Go.

Changes in v9:
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch
- new patch

Matt Madison (7):
  go-runtime: extend to nativesdk builds
  goarch.bbclass: identify archs with Go dynamic linking support
  go-1.8: add patch for set soname in ELF shared objects
  go-runtime: build the Go runtime as a shared library
  go.bbclass: add support linking against shared runtime
  goarch.bbclass: set ARM_INSTRUCTION_SET to "arm"
  go: update to go 1.9

Otavio Salvador (2):
  go.bbclass: Add "ldflags" to QA skip list
  go.bbclass: Add ptest support

 meta/classes/go.bbclass                            | 75 ++++++++++++++++++++--
 meta/classes/goarch.bbclass                        | 11 ++++
 meta/recipes-devtools/go/go-1.8.inc                | 21 ------
 .../go/go-1.8/armhf-elf-header.patch               | 23 -------
 .../go/go-1.8/fix-cc-handling.patch                | 50 ---------------
 .../go/go-1.8/fix-target-cc-for-build.patch        | 17 -----
 meta/recipes-devtools/go/go-1.8/gotooldir.patch    | 30 ---------
 .../go/go-1.8/make-goroot-precious.patch           | 21 ------
 meta/recipes-devtools/go/go-1.8/syslog.patch       | 62 ------------------
 meta/recipes-devtools/go/go-1.9.inc                | 18 ++++++
 .../0001-make.bash-quote-CC_FOR_TARGET.patch       | 32 +++++++++
 ...CC-and-CXX-environment-variable-construct.patch | 67 +++++++++++++++++++
 ...h-better-separate-host-and-target-builds.patch} | 52 +++++++++++----
 ...w-GOTOOLDIR-to-be-overridden-in-the-envir.patch | 68 ++++++++++++++++++++
 ...05-cmd-go-make-GOROOT-precious-by-default.patch | 41 ++++++++++++
 ...d-GOTOOLDIR_BOOTSTRAP-environment-variab.patch} | 26 ++++++--
 .../0007-ld-add-soname-to-shareable-objects.patch  | 46 +++++++++++++
 meta/recipes-devtools/go/go-cross-canadian.inc     |  1 +
 ...ss-canadian_1.8.bb => go-cross-canadian_1.9.bb} |  0
 meta/recipes-devtools/go/go-cross.inc              |  2 +-
 .../go/{go-cross_1.8.bb => go-cross_1.9.bb}        |  0
 .../go/{go-crosssdk_1.8.bb => go-crosssdk_1.9.bb}  |  0
 meta/recipes-devtools/go/go-dep_0.3.0.bb           |  2 -
 meta/recipes-devtools/go/go-native.inc             |  2 +-
 .../go/{go-native_1.8.bb => go-native_1.9.bb}      |  0
 meta/recipes-devtools/go/go-runtime.inc            | 27 +++++++-
 .../go/{go-runtime_1.8.bb => go-runtime_1.9.bb}    |  0
 meta/recipes-devtools/go/{go_1.8.bb => go_1.9.bb}  |  0
 28 files changed, 443 insertions(+), 251 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.8.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.8/armhf-elf-header.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.8/fix-cc-handling.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.8/fix-target-cc-for-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.8/gotooldir.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.8/make-goroot-precious.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.8/syslog.patch
 create mode 100644 meta/recipes-devtools/go/go-1.9.inc
 create mode 100644 meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
 rename meta/recipes-devtools/go/{go-1.8/split-host-and-target-build.patch => go-1.9/0003-make.bash-better-separate-host-and-target-builds.patch} (60%)
 create mode 100644 meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
 create mode 100644 meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-precious-by-default.patch
 rename meta/recipes-devtools/go/{go-1.8/set-gotooldir-during-bootstrap.patch => go-1.9/0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch} (55%)
 create mode 100644 meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-shareable-objects.patch
 rename meta/recipes-devtools/go/{go-cross-canadian_1.8.bb => go-cross-canadian_1.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.8.bb => go-cross_1.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.8.bb => go-crosssdk_1.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.8.bb => go-native_1.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.8.bb => go-runtime_1.9.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.8.bb => go_1.9.bb} (100%)

-- 
2.14.1


