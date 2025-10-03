Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25765CCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 20:02:23 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.3457.1759521733196093344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 13:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=G/1aO93W;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b109c6b9fcso27618631cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 13:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1759521732; x=1760126532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NZiDc1X/GXJh6DKJJ6AeZwKAMZ23nOq8vjaTSLIiUlY=;
        b=G/1aO93WDs/wevDIXTj82HXM69O1ieUAtdmE0JMqjiEgYT+obNZJ0QSeXmLyfI/vbt
         nRfzTOyTFXbDxHr8tEuOjZ5XQ1x3DQQpPPoxolfGvjRiqY0o9EgtRvFw7uQKOAoumvFw
         koK6s5qbSxA7OZNzibV5GUHbvHsfhA2cqr3rhZ16E7eNaqON/hBjYBCR8gaqwL56EveT
         ldfdTho+7oyYxXFkgRgR3eiZ1rnVQxFmsaKlcis20KIS/RLm4b2/hRUynQs71kvI4KdZ
         INEfcuYp2HzZiAeIG/MYAFLOjYElXMqiXoMB/L9YCJxZgjCskauvWlAQ7Q5gEXFrvHDg
         P55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759521732; x=1760126532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZiDc1X/GXJh6DKJJ6AeZwKAMZ23nOq8vjaTSLIiUlY=;
        b=mXlDdo4LmCPlk93yHu4qs8E/d0lnX0KJIZhEN8vVlksUS+59oj2RMRV/vLhDaLHiaw
         UV+ErlIn41eHbymg18Dbn6PtpCk1tQfb/sG3xs/kLRlUQz8XczHtIPtTV69vtbDAOVJg
         uvawQ6wBfn4UleA1bS32kpM3usipLLzOEQBTChADe3TdM58ns1eDVcvMTwe5ORspXDSQ
         lZO2VPloC2eOBhBp+oU2n3SSh1/Z2K0Duo8T5Nyn8BIiGvzpdjdURCcZMFE2xIlAl+6l
         M6ey95B2PORxY+jWfb7LTNjxQwFdz3tHr5GscTpaSE8S+l7sBC4LxiuEfete3Sz1Ec55
         PHdA==
X-Gm-Message-State: AOJu0YzQzqRy7eAtDI+3RtfcNh9m6AF9PGPjMyP9eZzygUA2424Hp35x
	mn+eJ/bU/tGHrpecLyBSeDxYWKS2zDMo1FVPth43MELlD8wqD1rxttfigfN4YQxfjiFIccg0j7q
	ZpFQ=
X-Gm-Gg: ASbGnct1+EKG0+bna7SgbNkUMHW6rFYWccWucu9dj086CLJqxwbzW8FTN04Cc/WkDgj
	0ULaSkEYyY429aCugBAw/wha+XY2GK5E2eAxLBrDnuQQy7SsOlV2fNOIvH6YpdYTO4VHiZSBIsq
	nONLlHN66WB7PLEKPXSFEVLjDBZPvER8FXXeziYfuZMi5ymzN7T2T670TSJmtkbijMivKqkLghc
	qQG2MpheeJi7shRBstE7AZK79BNRz76fy5ouArCxzfVW8410drXWrvx9EFhj7w+l+yUmlzKOo7j
	Oq7rooedUazHOQiMlzYYtg04+Ome/FNj7Fbhfv6QDPCAN20Pgcr0+wCo+L0JaOU806kXWamuHka
	YQPaivk5h4mbqBpdbUz+LLls5jIGQksseiPJHYPTcNG986zZN
X-Google-Smtp-Source: AGHT+IETKJV2di+DD46Dc8Wp0yN/L3Q/SIKtPoxcAJ0hSrxVmo/qxH+duHTCfsLEtDqo5zpsj09hkw==
X-Received: by 2002:a05:622a:8c1a:b0:4cd:53ea:2346 with SMTP id d75a77b69052e-4e57e3afe9emr29849221cf.19.1759521730603;
        Fri, 03 Oct 2025 13:02:10 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-87771129491sm525254585a.2.2025.10.03.13.02.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 13:02:10 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gn: remove gcc override
Date: Fri,  3 Oct 2025 16:02:06 -0400
Message-Id: <20251003200206.1201180-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 20:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224422

When compiling gn with clang, the following errors are being seen (with
qemuarm64-secureboot machine, possibly others):

In file included from /usr/include/c++/12/string:40,
                 from ../sources/gn-0+git/src/base/strings/string_number_conversions.h:11,
                 from ../sources/gn-0+git/src/gn/operators.cc:10:
In static member function ‘static constexpr void std::char_traits<char>::assign(char_type&, const char_type&)’,
    inlined from ‘static constexpr void std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::_S_copy(_CharT*, const _CharT*, size_type) [with _CharT = char; _Traits = std::char_traits<char>; _Alloc = std::allocator<char>]’ at /usr/include/c++/12/bits/basic_string.h:421:23,
    inlined from ‘constexpr std::__cxx11::basic_string<_CharT, _Traits, _Allocator>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::_M_replace(size_type, size_type, const _CharT*, size_type) [with _CharT = char; _Traits = std::char_traits<char>; _Alloc = std::allocator<char>]’ at /usr/include/c++/12/bits/basic_string.tcc:532:22,
    inlined from ‘constexpr std::__cxx11::basic_string<_CharT, _Traits, _Alloc>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::assign(const _CharT*) [with _CharT = char; _Traits = std::char_traits<char>; _Alloc = std::allocator<char>]’ at /usr/include/c++/12/bits/basic_string.h:1647:19,
    inlined from ‘constexpr std::__cxx11::basic_string<_CharT, _Traits, _Alloc>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::operator=(const _CharT*) [with _CharT = char; _Traits = std::char_traits<char>; _Alloc = std::allocator<char>]’ at /usr/include/c++/12/bits/basic_string.h:815:28,
    inlined from ‘Err {anonymous}::MakeOverwriteError(const BinaryOpNode*, const Value&)’ at ../sources/gn-0+git/src/gn/operators.cc:202:17:
/usr/include/c++/12/bits/char_traits.h:354:16: error: ‘((const std::char_traits<char>::char_type*)((char*)&empty_def + offsetof(std::__cxx11::string, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::<unnamed>)))[2]’ may be used uninitialized [-Werror=maybe-uninitialized]
  354 |         __c1 = __c2;
      |                ^~~~
../sources/gn-0+git/src/gn/operators.cc: In function ‘Err {anonymous}::MakeOverwriteError(const BinaryOpNode*, const Value&)’:
../sources/gn-0+git/src/gn/operators.cc:198:15: note: ‘empty_def’ declared here
  198 |   std::string empty_def;
      |               ^~~~~~~~~
In static member function ‘static constexpr void std::char_traits<char>::assign(char_type&, const char_type&)’,
    inlined from ‘static constexpr void std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::_S_copy(_CharT*, const _CharT*, size_type) [with _CharT = char; _Traits = std::char_traits<char>; _Alloc = std::allocator<char>]’ at /usr/include/c++/12/bits/basic_string.h:421:23,
    inlined from ‘constexpr std::__cxx11::basic_string<_CharT, _Traits, _Allocator>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::_M_replace(size_type, size_type, const _CharT*, size_type) [with _CharT = char; _Traits = std::char_traits<char>; _Alloc = std::allocator<char>]’ at /usr/include/c++/12/bits/basic_string.tcc:532:22,
    inlined from ‘constexpr std::__cxx11::basic_string<_CharT, _Traits, _Alloc>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::assign(const _CharT*) [with _CharT = char; _Traits = std::char_traits<char>; _Alloc = std::allocator<char>]’ at /usr/include/c++/12/bits/basic_string.h:1647:19,
    inlined from ‘constexpr std::__cxx11::basic_string<_CharT, _Traits, _Alloc>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::operator=(const _CharT*) [with _CharT = char; _Traits = std::char_traits<char>; _Alloc = std::allocator<char>]’ at /usr/include/c++/12/bits/basic_string.h:815:28,
    inlined from ‘Err {anonymous}::MakeOverwriteError(const BinaryOpNode*, const Value&)’ at ../sources/gn-0+git/src/gn/operators.cc:205:17:
/usr/include/c++/12/bits/char_traits.h:354:16: error: ‘((const std::char_traits<char>::char_type*)((char*)&empty_def + offsetof(std::__cxx11::string, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::<unnamed>)))[2]’ may be used uninitialized [-Werror=maybe-uninitialized]
  354 |         __c1 = __c2;
      |                ^~~~
../sources/gn-0+git/src/gn/operators.cc: In function ‘Err {anonymous}::MakeOverwriteError(const BinaryOpNode*, const Value&)’:
../sources/gn-0+git/src/gn/operators.cc:198:15: note: ‘empty_def’ declared here
  198 |   std::string empty_def;
      |               ^~~~~~~~~
cc1plus: all warnings being treated as errors

Remove the toolchain-gcc override to allow the cflag
-Wno-error=maybe-uninitialized to be applied.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index d8896609b193..2443ea7139f4 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -49,4 +49,4 @@ BBCLASSEXTEND = "native"
 
 COMPATIBLE_HOST = "^(?!riscv32).*"
 
-CFLAGS:append:toolchain-gcc = " -Wno-error=maybe-uninitialized"
+CFLAGS:append = " -Wno-error=maybe-uninitialized"
-- 
2.39.5


