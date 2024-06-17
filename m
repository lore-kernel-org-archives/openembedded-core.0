Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3A9C2BC81
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:44 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.54582.1718625944331554533
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oftgNJTt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-704090c11easo3526899b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625944; x=1719230744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gubhcDeHQybf37Ub4w491RJyZqZG1EgnJExVYU7Lbs0=;
        b=oftgNJTtARfaZbu5QBVzw4HU/+yyyjbeBXBmomov7PMqxtu0s90WvOPO/9+EvO3wd8
         peo49HvwgpMdEVSorGIUE+1uo2jtrsHInlMk8iIV/1ETg7o8rpACXnTM9FhgziZtkTs8
         UWwrYRlkHSwBgjYrjQuu7S/aH6irkqU8CcIMgzs6N91b6UrdvnTFsVfa2uYmBLq7be5f
         jT9hp/wXW8KmtxuUrU9zu3wG875jKa0Q9PHG9Eh3lXoQkxM5/sf1rdWQl7W5N418S4o2
         el8YnHIOeWT2HyJuLLJ1eNdqeuZZxU0CpTLnoOA12itdSTPbrjT0ATUlNnlqZHktUxRA
         tghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625944; x=1719230744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gubhcDeHQybf37Ub4w491RJyZqZG1EgnJExVYU7Lbs0=;
        b=YFZdhDcMxSYEnoT5o3w1t9I9JCmR+0BqT3NeTOtGl7SJhVpXuUqTmyOxR77NI6y/Lg
         pTrwHsfmeObOPVpcCL8amWpliQbbnbU6b7LDoPE/d8PqGy8ZsSMmAzVex0mxzl0canXG
         4z47JUpzudKyVfJydaRIg9NGiwOFR/kdG/S++zRZBm2u85kEZpjIaSBP+Wy1cOU0bGnw
         iysu/aiwJnj1C8WkrddNbh00M0IUFg1bQJa0q7HJaAQlHrQnvFggzWgs8ukGlhl7ZrBi
         nfvSLjUxDRotb75ZJ/FLfEc07KlOEtkEA6NZlgAZJ42r8kUJIOJ90gvKxi13Vuwtg4pa
         7p9Q==
X-Gm-Message-State: AOJu0YxKgHk1CWNTMO3n2b5dljmRqciIDHOg3bBnRfvoTLooKNye9WTl
	5SaHUs1EYn9u9iVlZJ8J695rXkPz+v+uahr9JMbg6m7GIt7yVUU8cm0UopMmeCUnARIDsqY9iep
	ApT4=
X-Google-Smtp-Source: AGHT+IHwqR6wpo/MXSIz763vGVj6tQwKWs7pNfoc3dEdxqAv353E4oIUBojFF+kY8mFfPYNfKm6DiA==
X-Received: by 2002:a05:6a20:914a:b0:1b6:d9fa:8cd with SMTP id adf61e73a8af0-1bae83c697amr9972191637.46.1718625943549;
        Mon, 17 Jun 2024 05:05:43 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/22] kea: Remove -fvisibility-inlines-hidden from C++ flags
Date: Mon, 17 Jun 2024 05:04:49 -0700
Message-Id: <a68a3d40bf9226158d2c6433d3124be82eb02c63.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200822

From: Khem Raj <raj.khem@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 584940c2f3234bfaf579429e162e683934e86538)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/kea/kea_2.4.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.4.1.bb
index 9f8758f379..fcdb4889d9 100644
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
2.34.1


