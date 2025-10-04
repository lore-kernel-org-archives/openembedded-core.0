Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68C8CAC5BB
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 16:00:07 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.11991.1759593603648811266
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Oct 2025 09:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=MFxSaf7V;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-856222505eeso382891485a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Oct 2025 09:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1759593602; x=1760198402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=i53NWKMsuT9IyirZq4Lw+t/MHocUthvHAnLX8/fCgSU=;
        b=MFxSaf7Vwr6rgm506IHdN1LIBH4hq6X5c0PEWMjMVReiRr6YtlVPNwVRbldySOWMXu
         VwfqId0cxnjKkp9vANVWdEtXUpsFXHVmkHZQ0DmxUy4eigyx3ZeUFAIgoSrowgmGhJ6B
         Nk7GWaloFZiK9XSVxAfqp3Vkjhclb3nbJRHysrC/cpn2uUfOIVLIk/0k0WiwoUk73m3o
         UVK4ZcWF+/nZzX2eBX/xhAFDcMujgLujFrN1zGrvXibbeYQ/twRuc0lPYvYl+IFIyrZd
         8Vd4X5223HiGYU52uGmsi3Cl/PbwdS41Rmcr6esg3lPh1UyTPhor9LYhm7J+NGm+2q/X
         hOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759593602; x=1760198402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i53NWKMsuT9IyirZq4Lw+t/MHocUthvHAnLX8/fCgSU=;
        b=c+HIVEOME3QPicrD7/SMrUetY8vNN5R6VxOBxrrw0meRg7wN0L7MdnLm8gHQZHk6Sx
         4fyhZ7IyxKKPfFuLSUUlCPDeycszxUK1TIAcYYxuuGDf/l5oQtGXZU1BqrabDzxp5b6t
         P9iaDcdhBYVCSbllNiWPln4nyN4yr36/FHiPpMFUNVnfw5lM20j0fC6jP+vBxj01GbQe
         c9/A8eNr6DwOro5JA1pgAsZrFDWeUnHFRcsJQFXeVPAhPwFI8T+wKF5lja2TH7E++mvU
         Ug3D2hR1/9wAVukYGTMM/FkF4FHInvREdR411Gj1V7Ts3MtMhLaR0ihVranfmhU2oN2h
         xT9w==
X-Gm-Message-State: AOJu0Yyx1EHi1IxzgA6DqdJ+N1CBPLBby226Yb4knXrXLSEriCy8UVK3
	nJWFa6JJSuxUuX0wbFhys3+7Mc50EJRqujMcS8vUDbwqvHDPbthgjsQS4ctsn+p55z7IdGKooWZ
	tlPc=
X-Gm-Gg: ASbGnctuWR/L/QVGuZHbTGNN6OeCpUUwi7ASkF7KRarbku9DVvekP62zpnaATjOhuIo
	VzlwSM8Lg/XrNvDbd33k7M4+bfk6R6BbgFKBjsJobuA8m7culekTQmsouEbOCI3bZRbu2fUbija
	2RkfJ3dKHdC/QWht5w/yohcHoMlm5G2EQxUYlIJXTni92R/1gR+lSaemkrqc+PfbTmHYlchBUwf
	e+AdvS9KqTr7htsFrTO/Qn5N1CUpCLp+BEy2LRSeE+jXFLfc3AcvlHv+Q8Ft4VypCLk5rpCUSX+
	c6Z8lWtZrz4fSW07qgAYsKb6OnsX3W772bf9HJIb+CQAj050UjdgY1YYVe8cP4WhzWIgX4Jn1AT
	tS6DjDRd6Jc7pO2rKqdPFKisK9Tx8FIokvdD4RONpwFdzL6tS2fTgQjnVnSg=
X-Google-Smtp-Source: AGHT+IE4jZakGbe3p3bsaUJmgLh/Z8cad32epm/ji2EdNkwfbg0f4FMrwfSq2thH9PuMQWUZu7GxmA==
X-Received: by 2002:a05:620a:44d2:b0:862:ab87:ce6e with SMTP id af79cd13be357-87a3720da32mr930679785a.27.1759593602209;
        Sat, 04 Oct 2025 09:00:02 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55a34aa08sm69398381cf.5.2025.10.04.09.00.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 09:00:01 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gn: remove gcc override
Date: Sat,  4 Oct 2025 11:59:57 -0400
Message-Id: <20251004155957.1013969-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Oct 2025 16:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224432

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
index d8896609b193..87ccfe370456 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -49,4 +49,4 @@ BBCLASSEXTEND = "native"
 
 COMPATIBLE_HOST = "^(?!riscv32).*"
 
-CFLAGS:append:toolchain-gcc = " -Wno-error=maybe-uninitialized"
+CFLAGS += "-Wno-error=maybe-uninitialized"
-- 
2.39.5


