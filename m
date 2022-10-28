Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8635C38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 08:58:35 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.4123.1666947508816352141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 01:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=don1fzsY;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id kt23so11380623ejc.7
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 01:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3d5XApMOkQfzkhtN0e0Xpyt2LRoshP2p90MHz7pmt9U=;
        b=don1fzsYyZnTrKtLMddy9ScttChXnhW/8bOyYl60vFN+xXtIl6g/+CDBG7kUCLm1dG
         jIUThg9Z19G4MA/5kMk1uFYDiBAmre2rKJcLWyL9vlJjTIJtIZdDhwhPHxr60frE6Jy+
         LT3zHAWJIRsClV+Cqyis/q1GXMQZ/m7ExQkwBzJE5egwao04cCmrHZbYiJru6vXaIRAd
         JELPZq/LZvgu8cD1cVvy1gWSsM09nsAcJRj/mVp7v3HK2h+HoBvAg6QMC6LtIo7pw7pd
         A/djk6V6Evj2BsqzWTXOI3Z/uVnY5nRXMGZIsiQiNu10jHTxIUfL4kidRk0TVDRKxLzq
         8guQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3d5XApMOkQfzkhtN0e0Xpyt2LRoshP2p90MHz7pmt9U=;
        b=3RNfD/VoHpop0mMxbg81djd2Pk94BrMaHhAT6tj8X09o5SQQnroX0lOK1R7XnnaGda
         lL4+/6OiEcQ6ClESgfDEbDT7xOW7Dy2sn3RZs6qIouU/BtWlQfPzmNQ9l0CNS2p7gYDh
         rl+cvV5iOTCtS0+5iRSDxyid66KEM/wEsS0oN5+H22YgXBiZR1ApYoX4hm2ww17Cgkmb
         +IEljg6IJvPjmgnl4Qw+ohpk3zqhphvEYN1CAQpnPb3Twjb+GHmNRyo8PMYgR9OOFL3E
         w4aoXTROLK5XqOBKONv1c40Gh6Y/glaAir7VGH9dE4IObtZuQ+ZNgE6UlTxGl7kBK/eW
         KkHg==
X-Gm-Message-State: ACrzQf0sYJT0RSm12vq9Opy4h3RGrenLRflq+PEIW7AY+tL/nnI5RiLy
	MUAA39Rkyg6zudltDfkKV29HROXAKIYvCQ==
X-Google-Smtp-Source: AMsMyM7S9/cfrELXBYaRVt5xZd0V0z8tNOwwXLIPvUe26yp8jvqX1yX8Fk9/Xyb0KBwTBK3nOq0jSA==
X-Received: by 2002:a17:907:3d91:b0:78d:f675:5659 with SMTP id he17-20020a1709073d9100b0078df6755659mr45097128ejc.92.1666947507168;
        Fri, 28 Oct 2022 01:58:27 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z19-20020a05640240d300b004617e880f52sm2416031edb.29.2022.10.28.01.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 01:58:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] cargo.bbclass: avoid calling which ${RUSTC} with undefined ${RUSTC}
Date: Fri, 28 Oct 2022 10:58:23 +0200
Message-Id: <20221028085823.1971805-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 08:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172239

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
 meta/classes-recipe/cargo.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index d1e83518b5..e884ff8b64 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -15,6 +15,10 @@ inherit rust-target-config
 # the binary we will use
 CARGO = "cargo"
 
+# This is normally defined in rust.bbclass, but rust-target-config doesn't inherit rust.bbclass
+# and RUSTC is then undefined when calling which in oe_cargo_build
+RUSTC ?= "rustc"
+
 # We need cargo to compile for the target
 BASEDEPENDS:append = " cargo-native"
 
-- 
2.38.1


