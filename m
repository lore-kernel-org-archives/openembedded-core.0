Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E0FC982DA
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 05:06:54 +0000 (UTC)
Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16297.1789839300986568224
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 10:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qj2Yr4q+;
 spf=pass (domain: gmail.com, ip: 74.125.230.76, mailfrom: royzah@gmail.com)
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a354118856so13198381fa.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 10:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789839299; x=1790444099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nc7BDjcBGGzQ2VWL5OY1vm+wXs1f15eGKxUEM/DSFxI=;
        b=qj2Yr4q+gyzDBi09sHUJLYKd0UNQMK34K4LjR7Wmramf12wm02RSBMoVbqnDgfs4V5
         CtdIJY9pLRugbQZ7sqGFjG/y2oQ+K3QHJStN5EyzWjB++UTRAMn8RiiQspFlj5PfTKuK
         +DtgrfB+wQ8bdBClW1LTuMvcMuEMGK2dnU36S1kcnowU5G2OsaJm8pEayFQUtN7G8zqs
         jfi1OZ30wKQ1rN9VjkI9I32vMayZeu2hX16uBexyN6cdE4cxSPfYNX879mvcavuFc4k1
         IZv88Z2jxYVZt8uRswwxZjczrpjTGI6+1RecesG/+LzMur6zC/bm671vdyaV8x1QRwtd
         eG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789839299; x=1790444099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nc7BDjcBGGzQ2VWL5OY1vm+wXs1f15eGKxUEM/DSFxI=;
        b=mJssiO+qDUlSjkEKV0/TXA90svMo/oFmNC/0wje/7ZNymZxmlpYUSw6tR0H3NcuAxZ
         yJvAVKcZhvsEMloL2OiMxi3rO3ZMw1U+ulERTOZOQ3YRq0O5yiBeJmFnJ8PiQQAX28dm
         oA0mO3/BLXa1kwe0TpO6yBNGEFH8zOqG6qQ91ONoiIcKIlnQrjPawjLq5Y5Jq7xq2CAf
         huOppG8atfB1moyv8U1H/BczCDnQ6pDV81ofZD3VqdDNSGjK+s1B450EFVu9Lc/0AtKk
         b857wz8g8eBd2fD3OlrJqQmPkjFNFAhnUsZIAnina1pc3FvMSQ/TdkM3NCvkWRkJaic9
         u/wg==
X-Gm-Message-State: AFuF++lYoEGolTbOCs3IITtLdVvqFSvWm9z0A3n8WkIL6j+jb48ZBMtf
	BHoSByFsUwVEi9HpHXuoM61MphqgBRVOZF6+pRxEnju+6IBLDjyJU8FO3dZZKkakwnGzToC5
X-Gm-Gg: AYBFou1BpBhOEvCo6FmoQOFCOJJbO+vjy6SuPYvWojwrBcOX5/xVBd1R464c0VGgnwT
	jssC8p5s+K18b+MfoBWkGlyOkquU823VDAQrpJJemZqox3LwH/i5TlQLyLakO/oCv012rPgOwM+
	scQboAXsSHWWGSeRPDwVbErWDYFYcFpcDNDjrNXMFEs60sUvbWensXnf5cuZusxtBwVD8NqH+S5
	YANvqmSQn8py6CBMSo9F5DHsVzhVS4EAkcHGlNkeQM5NgY/VfZ9oWuCFQztQsMH5zsnYycmRcBN
	rxmFA5CdfsswIBhba4ffxY6F2P/AyP3sFgFSG0duOPRs515TbTkyJhAQbu6poiWjkoPOKtDOWuS
	hnbDEoOH0WnwY3z8aIF9KviF5vESr+u5+gikBtsxVLxwzaGQjLinkmuUSrTH2vGq6FcQL13jCg2
	Gxpfhk5yRvY4l4ghBC63OKBeOx+ONGGu4YqmeL8gwXvqOocW+b4UDfsmd3qMLfuxf3NImTKYU51
	yZlYoOTLXdlG7Jai41ENNOf7pDXS7n1FZQ=
X-Received: by 2002:a05:600c:6212:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49fc56f8327mr68523055e9.15.1789838953420;
        Sat, 19 Sep 2026 10:29:13 -0700 (PDT)
Received: from royzah-ThinkPad-T14-Gen-4.tail7db7d.ts.net ([2001:8f8:1137:5e38:4ab9:7dbd:93ae:5ae6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd103325sm105361745e9.9.2026.09.19.10.29.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 10:29:11 -0700 (PDT)
From: Royyan Zahir <royzah@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meson.bbclass] bindgen_clang_arguments lacks C++ include paths, breaks C++ bindgen (mesa rusticl)
Date: Sat, 19 Sep 2026 21:28:26 +0400
Message-ID: <20260919172851.1564760-1-royzah@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 05:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246276

meson.bbclass builds the bindgen arguments as:

    def bindgen_args(d):
        args = '${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}'

TOOLCHAIN_OPTIONS carries --sysroot, which is enough for C headers. It is not
enough for C++: when clang cross-compiles against a GCC sysroot it does not
infer the libstdc++ include directories from --sysroot alone, so any recipe
running bindgen over a C++ header fails to find the standard library.

mesa hits this with PACKAGECONFIG opencl, which turns on gallium-rusticl and
runs bindgen over rusticl_llvm_bindings.hpp with -x c++ -std=c++17:

    FAILED: src/gallium/frontends/rusticl/rusticl_llvm_bindings.rs
    .../recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10:
        fatal error: 'cassert' file not found
    Unable to generate bindings: clang diagnosed error

Seen on mesa 26.0.5 with oe-core wrynose, aarch64 target, LLVM 22.1.3.

The missing arguments are the staged C++ headers:

    -I${STAGING_INCDIR}/c++/<version>
    -I${STAGING_INCDIR}/c++/<version>/${TARGET_SYS}

Our downstream workaround appends them to bindgen_clang_arguments in
meson.cross from a mesa bbappend, which works but is recipe-specific and
hardcodes a realpath glob over the staged header directory. It also has to run
after do_prepare_recipe_sysroot, since the glob is empty on a clean build.

Reporting rather than sending a patch because the right fix is a design call:
bindgen_args() is generic, so this affects any meson recipe doing C++ bindgen,
not just mesa. Options seem to be teaching bindgen_args() about the C++ include
paths unconditionally, gating it on whether the recipe does C++ bindgen, or
having clang-native resolve the GCC sysroot properly. A maintainer is better
placed to pick.

Happy to test a proposed fix on aarch64.

