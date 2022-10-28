Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F57ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 09:38:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.4338.1666949900522220721
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 02:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FUrJZvt2;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id bh7-20020a05600c3d0700b003c6fb3b2052so3323432wmb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HptKP18vjgm19djNUpYfKwWCpakjg8nCm9zAxS2RL4c=;
        b=FUrJZvt2x/vIDY4m+OXGzgIsMytOEEHuCSctXdowoOamfmYQzGc/32QudNv7oZY5eq
         S7qqM4AFTA2n0yPMqbfm/Fc8WtU2p8RBYz69PA18Zs5T9IaBsY9wWgPCfYUxVVBakAj8
         6Jsgn/wQB951w1sHaKl/Uq1lH2744QktLAd2RHL57S4MySWo4maYjaZ0/9/U+VsKK9/u
         RX3SXf5h/MebaxQhIA5KHSw7o81wRyJHKY53jENE7+Vvp8pEbPja1cBgOkSQGuJAMLiJ
         oxVDaUuMOJmha/R+xci1U0dGnfaNTdn+PTl0a8MzhrX6TnTEwn84hCOwlRM0K9Tf0gXq
         FC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HptKP18vjgm19djNUpYfKwWCpakjg8nCm9zAxS2RL4c=;
        b=yIOSZegJCXtH0llD0e6bYVAMT0bO81Dsqn47lEzLVWHZZIzbTo4ZHSECQ6Tw2PxIsy
         bNqJOnzc2cCLCZqRQAtGM5HbtViTfaQL4a/dJ57c+/RlS0YPXOq9e6Zpzl7Ew2nitzDD
         BrJzYqJYFvCzVlW/jmrAVdKFH9WaQaOnBGMjCsxpENZ7zPuM9UObxhw/9iewmNZ3FOln
         PHl0TlBfI1bSVyR+/ddyVS5Y8uxhHV7qpBkfEg7MxiYZbITmuSpnF/AIqB4nPDa33Pyz
         iYRF2hQhptI8BAlrESTvlMhfJCVQVZnewO8ZoDT4c+LZJLjipM/gceoiD3jwV+ecNc/K
         7qJw==
X-Gm-Message-State: ACrzQf0E+IQEsMIEiHNLzwP1SS3kkCvS3II7X7vbcpf89+yWNrZq2X8j
	784CmnRauNboyFdlT8NgfdhlibsoaePm9Q==
X-Google-Smtp-Source: AMsMyM59Q8p61LDifbZ3IJthUjJ7zFeuSzf+6ex+8MSI0wl8w3vJdcTk6A+XEdiMYOAfya0v76ZrlQ==
X-Received: by 2002:a5d:59a7:0:b0:230:3652:1aa with SMTP id p7-20020a5d59a7000000b00230365201aamr34460400wrr.308.1666949898777;
        Fri, 28 Oct 2022 02:38:18 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w8-20020adfde88000000b002366f9bd717sm3944963wrl.45.2022.10.28.02.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 02:38:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv2] cargo.bbclass: avoid calling which ${RUSTC} with undefined ${RUSTC}
Date: Fri, 28 Oct 2022 11:38:15 +0200
Message-Id: <20221028093815.2403890-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <7da31600351db0da8ccabe7b4ad490dbe4a1902c.camel@linuxfoundation.org>
References: <7da31600351db0da8ccabe7b4ad490dbe4a1902c.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 09:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172242

* RUSTC is normally defined in rust.bbclass, but rust-target-config doesn't
  inherit rust.bbclass and RUSTC is then undefined when calling 'which'
  in oe_cargo_build

* causes which help text ending in log.do_compile, e.g.:

| DEBUG: Executing shell function do_compile
| NOTE: Using rust targets from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/openssl-sys/0.9.77-r0/rust-targets/
| NOTE: cargo = /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/openssl-sys/0.9.77-r0/recipe-sysroot-native/usr/bin/cargo
| Usage: which [options] [--] COMMAND [...]
| Write the full path of COMMAND(s) to standard output.
|
|   --version, -[vV] Print version and exit successfully.
|   --help,          Print this help and exit successfully.
|   --skip-dot       Skip directories in PATH that start with a dot.
|   --skip-tilde     Skip directories in PATH that start with a tilde.
|   --show-dot       Don't expand a dot to current directory in output.
|   --show-tilde     Output a tilde for HOME directory for non-root.
|   --tty-only       Stop processing options on the right if not on tty.
|   --all, -a        Print all matches in PATH, not just the first
|   --read-alias, -i Read list of aliases from stdin.
|   --skip-alias     Ignore option --read-alias; don't read stdin.
|   --read-functions Read shell functions from stdin.
|   --skip-functions Ignore option --read-functions; don't read stdin.
|
| Recommended use is to write the output of (alias; declare -f) to standard
| input, so that which can show aliases and shell functions. See which(1) for
| examples.
|
| If the options --read-alias and/or --read-functions are specified then the
| output can be a full alias or function definition, optionally followed by
| the full path of each command used inside of those.
|
| Report bugs to <which-bugs@gnu.org>.
| NOTE: rustc =

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes-recipe/cargo.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index d1e83518b5..93e185f2c9 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -49,7 +49,6 @@ oe_cargo_build () {
 	export RUSTFLAGS="${RUSTFLAGS}"
 	bbnote "Using rust targets from ${RUST_TARGET_PATH}"
 	bbnote "cargo = $(which ${CARGO})"
-	bbnote "rustc = $(which ${RUSTC})"
 	bbnote "${CARGO} build ${CARGO_BUILD_FLAGS} $@"
 	"${CARGO}" build ${CARGO_BUILD_FLAGS} "$@"
 }
-- 
2.38.1


