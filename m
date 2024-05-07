Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CF0C25B76
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 01:15:11 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.1144.1715044504833982986
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 18:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JekkI1SX;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2b4a7671abaso1700179a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 18:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715044504; x=1715649304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDPWRU/xZQ/9o2VHGwc/X6WbwfvgfOBDOaoAbMu7wr4=;
        b=JekkI1SXtM/P1XbNKxG8ZfkKLmoWsJzD3D0myCbIyoEGF6lbaifD7asXCvGmolDCYf
         VtyWhkPEgjE415OWJ0ayM0w2gTK268ATSeK4AdYAGtp/9mTj4BWn8vbxQf6O6osmAOzJ
         8+N8GcXA6FpKsOKHqf12h2vhBse8Vn61ETXykrhCRJ4dKwUYh4260+FVFbEaYpSGUaR0
         UrTnLANhvjIWd3i01YUUi3/doie0dhQOk20sRHL2vNkwFRODuREN4wQDzTFruRWpyV+o
         WVhx4QuE3sWSUyXhHBMTXeP5vZVI2PDNt0514EUJ2rJMbNcbX1iEPd68P/5n6cO2duT0
         krBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715044504; x=1715649304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDPWRU/xZQ/9o2VHGwc/X6WbwfvgfOBDOaoAbMu7wr4=;
        b=f6I1Uf5ggHvRv2m5if8PuNgOoUlsA0f0umzalCwn8rXTrL2e2ROqwVOP4x9j6oP3qD
         4xiWQPZiDFitFn1AteBtjv417Xbk4FX1WrPighO0jwl/Wg5ry7i0PwtfPTSiA+0Noiir
         EU9sZLieoOBvYX5T2iTRLz8sGU09j6saUo/wbnpNmjEjmD2aOTJb901hd8vpb7E8PM3S
         sXG3bh8B53ovPoz14s4OPgUBMJLCw4LyxaaCo5HPAjfklvzJTDp9I9OF64uSsoqFHXPT
         VyRJQ42FtyWFB089C28acx6m/EpuOmIDHMngJbilm/NkIncV/mkxpXAoBIJlnt0GiVH0
         iSVw==
X-Gm-Message-State: AOJu0Yy/nwHwTsULE58oxS4DoV2tp8M1AmXMCnEXCcQV4gON3o7XRh21
	dMGg7qIDn/ynVno1s6Vx7GXdIPpd9d3URJDvmQ6tm1m2YJjSjKYpqecM9sKl
X-Google-Smtp-Source: AGHT+IHL0c1MITy4JnkfX/0hgX4rEfTzy3g5dDfamma/mXlELk9t9O0a5zXs+Sas16/Ii2YuELeYqg==
X-Received: by 2002:a17:90a:d606:b0:2a2:9b37:367a with SMTP id w6-20020a17090ad60600b002a29b37367amr9546072pju.39.1715044503902;
        Mon, 06 May 2024 18:15:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902d50b00b001eb2f4648d3sm8830898plg.228.2024.05.06.18.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:15:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 07/10] kea: Remove -fvisibility-inlines-hidden from C++ flags
Date: Mon,  6 May 2024 18:14:52 -0700
Message-ID: <20240507011455.313230-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507011455.313230-1-raj.khem@gmail.com>
References: <20240507011455.313230-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 01:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199054

This fixes build with gcc-14, where default visibility is extended to
inline functions and getAll() function now falls into this category
and functions are marked hidden resulting in linking errors

Fixes
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/kea/2.5.8/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/14.0.1/ld: ./.libs/libdhcp4.a(dhcp4_srv.o): in function `isc::dhcp::Dhcpv4Srv::appendRequestedVendorOptions(isc::dhcp::Dhcpv4Exchange&)':
/usr/src/debug/kea/2.5.8/src/bin/dhcp4/dhcp4_srv.cc:2356:(.text+0xaac2): undefined reference to `isc::dhcp::CfgOption::getAll(unsigned int) const'
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/kea/2.5.8/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/14.0.1/ld: ./.libs/libdhcp4.a(dhcp4_srv.o): in function `isc::dhcp::OptionDescriptor isc::dhcp::CfgOption::get<unsigned int>(unsigned int const&, unsigned short) const':
/usr/src/debug/kea/2.5.8/src/lib/dhcpsrv/cfg_option.h:609:(.text+0xb288): undefined reference to `isc::dhcp::CfgOption::getAll(unsigned int) const'
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/kea/2.5.8/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/14.0.1/ld: ./.libs/libdhcp4.a(dhcp4_srv.o): in function `isc::dhcp::Dhcpv4Srv::appendRequestedOptions(isc::dhcp::Dhcpv4Exchange&)':
/usr/src/debug/kea/2.5.8/src/bin/dhcp4/dhcp4_srv.cc:2128:(.text+0xc556): undefined reference to `isc::dhcp::CfgOption::getAll(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const'
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/kea/2.5.8/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/14.0.1/ld: ./.libs/libdhcp4.a(dhcp4_srv.o): in function `std::vector<isc::dhcp::OptionDescriptor, std::allocator<isc::dhcp::OptionDescriptor> > isc::dhcp::CfgOption::getList<char [6]>(char const (&) [6], unsigned short) const':
/usr/src/debug/kea/2.5.8/src/lib/dhcpsrv/cfg_option.h:641:(.text._ZNK3isc4dhcp9CfgOption7getListIA6_cEESt6vectorINS0_16OptionDescriptorESaIS5_EERKT_t[_ZNK3isc4dhcp9CfgOption7getListIA6_cEESt6vectorINS0_16OptionDescriptorESaIS5_EERKT_t]+0x86): undefined reference to `isc::dhcp::CfgOption::getAll(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const'
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/kea/2.5.8/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/14.0.1/ld: ./.libs/libdhcp4.a(dhcp4_srv.o): in function `isc::dhcp::OptionDescriptor isc::dhcp::CfgOption::get<char [6]>(char const (&) [6], unsigned short) const':
/usr/src/debug/kea/2.5.8/src/lib/dhcpsrv/cfg_option.h:609:(.text._ZNK3isc4dhcp9CfgOption3getIA6_cEENS0_16OptionDescriptorERKT_t[_ZNK3isc4dhcp9CfgOption3getIA6_cEENS0_16OptionDescriptorERKT_t]+0x77): undefined reference to `isc::dhcp::CfgOption::getAll(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const'
collect2: error: ld returned 1 exit status
make[5]: *** [Makefile:651: kea-dhcp4] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-connectivity/kea/kea_2.4.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.4.1.bb
index fc963e545ad..4fd042cd566 100644
--- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.4.1.bb
@@ -38,6 +38,7 @@ DEBUG_OPTIMIZATION:append:mipsel = " -O"
 BUILD_OPTIMIZATION:remove:mipsel = " -Og"
 BUILD_OPTIMIZATION:append:mipsel = " -O"
 
+CXXFLAGS:remove = "-fvisibility-inlines-hidden"
 EXTRA_OECONF = "--with-boost-libs=-lboost_system \
                 --with-log4cplus=${STAGING_DIR_TARGET}${prefix} \
                 --with-openssl=${STAGING_DIR_TARGET}${prefix}"
-- 
2.45.0


