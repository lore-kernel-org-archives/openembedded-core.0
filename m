Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2005CC25B5C
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 05:33:33 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.4770.1715060010506807770
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 22:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HqkKAq/4;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e65a1370b7so24737295ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 22:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715060010; x=1715664810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yk0jkyZkFA5Rx0RKWWpX4rmtL3NQrUbKzy6KCis/XJc=;
        b=HqkKAq/4fGay6Y/Te6ziNQQmwUe5/+wnlEWC4kGBoyMgrLOf9VGarWTnjOtLG5AQ1U
         TyXy85Xn4nLCYYwUldDso1fGSRac03aaWAjlGEbweKiCfekCY5nLSwDNC/6A1Xit1r8P
         wAgkZT3dmkBtY0kRm+BQgdFWDEXB52wyDRrKH2qDxTZcmFbdKPsN/l/kY/oceLkTYFQD
         hW8l5e8cAAzxNcJ4qxxGnUmneB35pGlXzvlEV9jKfH6LcrezHqMts/MQs6YdZ12wqiPe
         BB9yuwMYbS+3Lh5NtzNA+UcgKdvRzZqnH0I4ssKV19/6KP+PSIHpJQnaDDvpcWKm0+P4
         mFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715060010; x=1715664810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yk0jkyZkFA5Rx0RKWWpX4rmtL3NQrUbKzy6KCis/XJc=;
        b=AZfPpfniEB7gVmeKQZ7cO1PiczTFgL/LN3ohIY0KxvKRnhTiu6FCTxt96Ve3bhcFK6
         9K3sTdlwZvsEKhH3cg7OuJeiEJ2dLpV5luDsfaVjsbR0XlyZhLJ35RH3FKJciB2Wb1Lh
         AmCL42mrNK2PeBguriDLCjzavR1sKG4nXH89xEbUxO7JdNcFDFq2iVf3bdURFuXf+zL9
         zcGRbIZKdyuZhti1fFy1oMWD6VSBwcxH9NRDAlEdrjyVjcoVDNjHqrzHfZcrX5QLNFxc
         /gwX408Ndiua5XTH/oL+DfU4SfvYDMeWC94RzQ0nA8G8HL948qQ6ruQQUOaFN/RSA5wv
         r4ug==
X-Gm-Message-State: AOJu0YyWLqwmYnsy6UwmQpjKBsu2Ez0qHfhDWzhQfdwpCx4A9r6GPPJy
	slX/SE+m7yMc/ho1NUNAmSuc5vcemLmx//uiJmBmQ7TA3bOSK6Hy6G+q4DVb
X-Google-Smtp-Source: AGHT+IHbgLcgG0CWYnvi2SJt4XdxMNPJVdAP7KRvis79LsVdwHapGgbrLQXkImREnkym44QND/3Ojg==
X-Received: by 2002:a17:903:246:b0:1e5:d021:cf58 with SMTP id j6-20020a170903024600b001e5d021cf58mr16563100plh.36.1715060009738;
        Mon, 06 May 2024 22:33:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001eb4a71cb58sm9221483pla.114.2024.05.06.22.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 22:33:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH v2 07/11] kea: Remove -fvisibility-inlines-hidden from C++ flags
Date: Mon,  6 May 2024 22:33:18 -0700
Message-ID: <20240507053320.1566814-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507053320.1566814-1-raj.khem@gmail.com>
References: <20240507053320.1566814-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 05:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199076

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
index 6c1e457938a..19309ce3144 100644
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


