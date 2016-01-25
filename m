Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8C23A77172
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 23:42:10 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l65so84146166wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 15:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=H421Jbwru0K+TxzwP2aOFaEdCcAR/pa0FKIX0eSOpSQ=;
	b=orRjg5gkgexhETzg4F5ZJ/VhbHdjqyn+ykpsJYVsqaUOt9+E6T00djFMDGnfzb5XfC
	/5c7JSsoY4xhNERBM7hhEF4FTSgkSe2utT8PVSORTnYAHNPX3w8ypRx1nefCfxjlZVHI
	yZKEZ/ltVRnWLau6cizlzMnSU9CS6nXSrOl5bGEoyFm4zQ21Q7K4tQqs6jUzk98VKnG0
	GXyI+wUHALsN8VHUjcZEpIYnXyZg6hp6KVfK7Wk16W9baZ2S6veDBkEfKNSoxU3RpNSU
	eo6wfzFHRw3QydfqV3QG95aZ9ok2DY32N+ytnOshqsT5Osm6oyaimtG1zlH8FRGepP18
	Cc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=H421Jbwru0K+TxzwP2aOFaEdCcAR/pa0FKIX0eSOpSQ=;
	b=aqx1WXr+Lga/jPbYYtx/QBvNsAzBeSo6mse+I0ABMvAgmp4UPnDnehEeiP4Nbd+Aak
	jkLTgRlSivc2tJj1oktWnrN+ZKzHHOtIBeDTcPZKlYnUSOdk33ZSAg/6yPMggoHykEqT
	biSfYn9aJVOBdqFCnWQbCSUKbOCHZVt9gq6Y80M6qu7O50jOObj0CK7Zm91mMBhfPh85
	6Yyfgg+NPXwPS8G9CHme6eLctsQqxXlGJ7T5iTWe/xqdjaUAPa3cFnCPg1y1qtULxJO9
	Xw+k7BiG54EZ7Oin4cyBfkjAi54t8vFlOUr0YdHsn0p0VwTUiQh8DqDzbqQUQSMZN1xK
	Gs1A==
X-Gm-Message-State: AG10YOR7Sqtv2fivmsp1Gg1NrhUFpwa3spUyWyRLMLDKoE63OFgjBxw0iZAZFSVP7Jll7WbpKoAsetSd8zPRlA==
MIME-Version: 1.0
X-Received: by 10.28.146.8 with SMTP id u8mr19710233wmd.72.1453765330697; Mon,
	25 Jan 2016 15:42:10 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 25 Jan 2016 15:42:10 -0800 (PST)
Date: Mon, 25 Jan 2016 15:42:10 -0800
Message-ID: <CAJ86T=VqpBLNsD5-W=+dF4WiSQ-3Zx_5Hs5P_ZqShVuqTTKCrg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: c++11 support in OE's gcc 5.x toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jan 2016 23:42:12 -0000
Content-Type: text/plain; charset=UTF-8

I'm seeing an error when trying to compile the string::append example
from cplusplus.com (
http://www.cplusplus.com/reference/string/string/append ) with the
oe-core gcc 5.3 / glibc toolchain and -std=c++11. Log below.

The problem seems to be related to the new libstdc++ dual ABI
introduced in GCC 5.1:

  https://gcc.gnu.org/onlinedocs/libstdc++/manual/using_dual_abi.html

If I use -std=c++11 together with -D_GLIBCXX_USE_CXX11_ABI=0 to force
the old ABI then the test app compiles OK.

Do we perhaps need to do something different when building libstdc++
to enable the new ABI?

----

  i686-rdk-linux-g++ -m32 -march=core2 -mtune=core2 -msse3
-mfpmath=sse --sysroot=/.../tmp/sysroots/vbox32 -std=c++11 test.cpp
  test.cpp: In function 'int main()':
  test.cpp:18:25: error: no matching function for call to
'std::__cxx11::basic_string<char>::append(int, int)'
     str.append<int>(5,0x2E);                // "....."
                           ^
  In file included from
/.../tmp/sysroots/vbox32/usr/include/c++/5.3.0/string:52:0,
                   from
/.../tmp/sysroots/vbox32/usr/include/c++/5.3.0/bits/locale_classes.h:40,
                   from
/.../tmp/sysroots/vbox32/usr/include/c++/5.3.0/bits/ios_base.h:41,
                   from /.../tmp/sysroots/vbox32/usr/include/c++/5.3.0/ios:42,
                   from
/.../tmp/sysroots/vbox32/usr/include/c++/5.3.0/ostream:38,
                   from
/.../tmp/sysroots/vbox32/usr/include/c++/5.3.0/iostream:39,
                   from test.cpp:2:
  /.../tmp/sysroots/vbox32/usr/include/c++/5.3.0/bits/basic_string.h:1071:9:
note: candidate: template<class _InputIterator, class>
std::__cxx11::basic_string<_CharT, _Traits, _Alloc>&
std::__cxx11::basic_string<_CharT, _Traits,
_Alloc>::append(_InputIterator, _InputIterator) [with _InputIterator =
_InputIterator; <template-parameter-2-2> = <template-parameter-1-2>;
_CharT = char; _Traits = std::char_traits<char>; _Alloc =
std::allocator<char>]
           append(_InputIterator __first, _InputIterator __last)
           ^
  /.../tmp/sysroots/vbox32/usr/include/c++/5.3.0/bits/basic_string.h:1071:9:
note:   template argument deduction/substitution failed:

----

