Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BF3C00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:30:50 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.6973.1659706246407581788
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZNK2dZ49;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 ay36-20020a05600c1e2400b003a4e30d7995so3978943wmb.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=cfZXcvKPvj/hqtmYgVHjQnFk3iGwgaHpOVM8GuYo6TU=;
        b=ZNK2dZ49B/Fd4GWRN8/ig6u4VVmqNHDWzhongLJ1Y+FJYhkI0XGBesR8Fp0JTZtAdt
         VSDMD59NFZLzhca8LtrqlUsY7jMKN0PTBhRSx6GA+sZUeRKacOeMB5+Ztgn23aBmiFXT
         bm/Xi3sI2cC4AUb/WCnppfM2S1ZpgPthTlpic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=cfZXcvKPvj/hqtmYgVHjQnFk3iGwgaHpOVM8GuYo6TU=;
        b=UltNazi2wYmz5bXtYaayu5/3NIlTDrviOxOeqCwB04OiYh4D2u/o1BMZ+ah6glCSZW
         z4uoBYwMWr0abMjwZiER0gMWkJwnk3SPgmBYN9osGYCiQ9zF/QMeFW/gcabalpnCtisU
         Ud6SzwALfUY1P6pFSkAWPGK+JpvqiqVP2FxESAEFYc7hZBaBJMlvczTTAEj8r0V4SHUE
         CDD/gs8MBDif0mwcqMrAdQPv6qIshe0A7fZIiIqMH4FkpERSHTtA8vcwgl7LkhzzVzfh
         X/8z3c+g9Jqwxc5kI7TQb3Jz39RAxDHyF5SfxBKQypYqKByoi7/I3G1dqy3f7aRqDUQt
         m4Gg==
X-Gm-Message-State: ACgBeo3YB8MpBjKanXUgbx31Q0Uy92BmfxfeYodiA3rcBKEjAkKIrkCV
	9FzyKpSMHZb5XGKhmqa6xwAPzkNO8gup2A==
X-Google-Smtp-Source: 
 AA6agR4f2qSjhz3M73YJa0gE09YRHPMw0cqYP9o45sdJ5bYxq7Uw+K09F4PK+4LI9mYPcZShBswsQg==
X-Received: by 2002:a05:600c:a0b:b0:39e:22ef:1a0 with SMTP id
 z11-20020a05600c0a0b00b0039e22ef01a0mr4828173wmp.46.1659706244336;
        Fri, 05 Aug 2022 06:30:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a?
 ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 e3-20020adf9bc3000000b0020e6ce4dabdsm3842166wrc.103.2022.08.05.06.30.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:30:43 -0700 (PDT)
Message-ID: 
 <c647c10e18a0891912fe897a08a131771e158e7e.camel@linuxfoundation.org>
Subject: [OE-core] [PATCH 00/29] rust: Rework and improve so SDK and target
 versions work
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 05 Aug 2022 14:30:43 +0100
In-Reply-To: <1708751059D0104D.16326@lists.openembedded.org>
References: <1708751059D0104D.16326@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:30:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168965

This patch series:
* Uses RUST_{BUILD|HOST|TARGET}_SYS everywhere consistently within rust con=
text
* Moves the on target libraries to rust's "sysroot" layout so the SDK can f=
ind
  libraries without prompting
* Moves the target SDK libraries into the target sysroot rather than the na=
tive one
* Enables the target rustc compiler to be built
* Replaces cargo-cross-canadian with nativesdk-cargo
* Drops rust-cross-XXX and uses rust-target-config to generate json config
  in each WORKDIR
* Add nativeksdk-rust as the SDK compiler
* Simplifies rust-cross-canadian-XXX to be the environment and json config
  for the target only (no binaries)
* Drop rust-crosssdk since it isnt needed now
* Drop a lot of the virtual/ compiler dependency mess since we don't need i=
t
* Cargo cross-canadian environment config is compiled with rust-cross-canad=
ian
* Adds RUST_{BUILD|HOST|TARGET}_SYS to the variable ignore list for hash pu=
rposes
  (since it should be accounted for in the build paths)
* Adds a slightly hacky approach to make target llvm-config work which remo=
ves
  the need for patching llvm.
* Drop rust-tools-cross-canadian and just build the tools as part of the ma=
in
  rust/nativesdk-rust recipe to avoid rebuilding large chunks of the toolch=
ain

Work still remaining:
* Fully clean up the dependency simplification and removal of the=C2=A0
  virutal/ code.
* Remove RUST_TARGETGENS since I think it is the same everywhere now
* The rust recipe doesn't need to always build stage0
* The rust recipe doesn't need to always build libstd-rs since
  we have a separate recipe. May drop the separate recipe and just copy
  the pieces out of the target rust build
* Maybe drop RUSTC variable, not sure it is used?
* Properly investigate and fix the reproducibility issues the patch=C2=A0
  hacks around
* Fix reproducibility so we can remove the reproducibility exclusion=C2=A0
  for rust
* Work out why n32 doesn't build libstd-rs
* Drop llvm-config patch (only used by rust-llvm itself now)
* Consider tweaking mesa to use new llvm-config approach and drop=C2=A0
  patch=C2=A0there
* Track down and clean up obsolete/unused code. Install pieces in=C2=A0
  rust.inc?
* File bugs for remaining issues

Adding to an SDK looks like:=20

SDK_TOOLCHAIN_LANGS +=3D "rust"



