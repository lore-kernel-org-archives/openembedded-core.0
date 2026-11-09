Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6067.1794231915956854289
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=KNhaeVWp;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 90B443D818F3;
	Mon,  9 Nov 2026 08:45:14 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id rAEKYaB_a_RH; Mon,  9 Nov 2026 08:45:12 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CBB6E3D8182D;
	Mon,  9 Nov 2026 08:45:12 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com CBB6E3D8182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231912; bh=ay409KLYrf3A22d+PdLgMsZExkkSMusxcG26DJ3qKBc=;
	h=From:Date:Message-Id:MIME-Version:To;
	b=KNhaeVWpgG63TMxmyxdOhnQ63NpybwU2XdJE286Xe1SjBxIl9i6za5+BT0gesFRw2
	 5PcLABEmeD1T/DYAzwkjK1p4RXGGhmmHj1tUcnc1HI17h80LK4QpsE9wx0y6eF7p/R
	 z7myrNNwo1p/Gdb3qkBBtSIgsD3tr3jrHqziKGM3hMVNhiMHclyTD4sn0BiPdCT069
	 H+ogiNDyN1ahx5rJKUHxTiSMy7mHbl491J3ahJ2xFYM05cSOTgq8uVKHZWXEfv0HuE
	 D6Yiq+eEsWoFS9KRg33d0cPd9b+cYd8hkJgnEAyD7RV+gCPQNHRn2bEHboot4SAgfu
	 nYogX6a2KirfA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ISQ6HyfT808i; Mon,  9 Nov 2026 08:45:12 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 385233D80F35;
	Mon,  9 Nov 2026 08:45:12 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [PATCH v2 00/18] devtool: ide-sdk: add support for Rust recipes
Date: Mon, 09 Nov 2026 14:44:17 +0100
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4X0bE27AhpP/ofhUNsFVpGaLjQYw
 r9bMB49vsnMvFkwBkIW52wWASMx+T4B7DJhW9M3KMklFqCg1ApAOoyD912KUbJ7SGtC46VT6qC
 Lk0GotUjbV8Capu33Wn2Zx9sd7bCerY2WePDhvYmjXns/R/nHEbVU0uWFylFD7tTxwiZ6CrWhg
 B3147S3/imqZVk+NW1iXdcAAAA=
X-Change-ID: 20261022-devtool-ide-sdk-cargo-d003158ae2f1
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249829

Hello, this series introduces support for Rust ide-sdk VS Code
configuration against the Yocto cross-compilation toolchain:

 - editor symbol resolution and linting
 - build task
 - deploy task
 - debugging

It introduces a cargo-example recipe following the model used for
cmake and meson.

The generated configurations can be portable to standalone SDK
installations by manually updating the paths.

C/C++ IntelliSense could provide navigation for native code compiled
by Cargo build scripts, using the recipe compiler and sysroot. This
first series defers it because no mixed-language fixture is available
to validate that workflow.

BitBake generates the Cargo configuration consumed by ide-sdk. This series
updates the parsed configuration and writes its supported TOML values
without adding a new dependency.

I reproduced the selftest coverage expected from other recipe classes,
including configuration analysis up to actual debugging symbol resolution.

I largely used AI generation to write this stack. After many iterations,
I am finally happy with the code and commit history quality of this series.
I also have a documentation commit ready for the manual if this gets
approved.

Any feedback is appreciated. Hope this will help lots of Rust developers
working with Yocto distros :).

Cheers,
Enguerrand de Ribaucourt

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
Changes in v2:
- Replace Cargo config in-place update with a simple TOML serializer.
- Add Cargo config parser coverage.
- Generate Cargo config for all IDE modes.
- Route ide=none Cargo debugging through LLDB and explain GDB limitations.
- Configure the rustc problems matcher.
- Map Rust sources with STAGING_LIBDIR_NATIVE.
- Discard C/C++ IntelliSense mixed-language feature.
- Fix bbappend always being modified on re-runs
- Fix '=' ordering in remap
- Fix install task duplication
- Link to v1: https://patch.msgid.link/20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com

Thank you very much for the detailed review Adrian, it's been really
helpful!

---
Enguerrand de Ribaucourt (18):
      cargo-example: add minimal selftest fixture
      devtool: ide-sdk: capture Cargo cross environment
      devtool: ide-sdk: export recipe Cargo configuration
      oeqa/selftest: verify Cargo config serialization
      devtool: ide-sdk: recommend Rust Analyzer for Cargo
      devtool: ide-sdk: configure Rust Analyzer for Cargo
      devtool: ide-sdk: generalize binary install task name
      devtool: ide-sdk: extract install task definition
      devtool: ide-sdk: order install after optional build task
      devtool: ide-sdk: add Cargo build task
      devtool: ide-sdk: enforce LLDB for Cargo
      devtool: ide-sdk: remap Cargo sources for BitBake builds
      devtool: ide-sdk: map Cargo workspace sources for LLDB
      devtool: ide-sdk: map libstd-rs sources to Rust SDK
      oeqa/selftest: share source breakpoint lookup
      oeqa/selftest: run IDE tasks with configured environment
      oeqa/selftest: debug Cargo example over QEMU slirp
      oeqa/selftest: verify Cargo rebuild and redeploy

 meta-selftest/recipes-test/rust/cargo-example.bb   |  15 +
 .../recipes-test/rust/cargo-example/Cargo.lock     |   5 +
 .../recipes-test/rust/cargo-example/Cargo.toml     |   8 +
 .../recipes-test/rust/cargo-example/build.rs       |  20 ++
 .../recipes-test/rust/cargo-example/src/main.rs    |  11 +
 meta/lib/oeqa/selftest/cases/devtool.py            | 347 ++++++++++++++++++++-
 scripts/lib/devtool/ide_plugins/__init__.py        |   1 +
 scripts/lib/devtool/ide_plugins/ide_code.py        |  83 ++++-
 scripts/lib/devtool/ide_plugins/ide_none.py        |   4 +-
 scripts/lib/devtool/ide_sdk.py                     | 249 +++++++++++++--
 10 files changed, 688 insertions(+), 55 deletions(-)
---
base-commit: 39b27e524f3c092e5018cbed23ddf1829390ae65
change-id: 20261022-devtool-ide-sdk-cargo-d003158ae2f1

Best regards,
--  
Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

