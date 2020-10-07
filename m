Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.2290.1602080516902555412
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 07:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=C1hhr8Jn;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.66, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f66.google.com with SMTP id dn5so2354963edb.10
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 07:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nOYvS7Btn5aWHLc0W09LVzvGtSBGLa7JGnwq9jZ0tlA=;
        b=C1hhr8JnAqE4oUsCrFvG+FhyNA8hZFdegEJbEPmu66XXB0joxGJHiPzy49wqDaANBy
         li77cZlfs+IS5vYYRZv9wm4jEMeS2bvteZG8i7urAYWD8BmhLA4oL8iRdwCTslszIgWD
         zyeFtVM5mga3uJmSrdo72VRP3TGeKIIvjlriD73B38wVspttpCLFHvsoQYmKJzdWm9Xj
         ifAfhrT6+VZjoXftd9NFXIkAgCTiuyRIa76+0LQ+B1M51vznVFyvRDkGvl1hsxIAXm+Q
         rPopDm+egFM/qDjmB6wbvAdcoNsF8Et2GNbXj6yeQ5+/NfWO/ZPt6MAX9lnpYMxqJRMK
         bkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nOYvS7Btn5aWHLc0W09LVzvGtSBGLa7JGnwq9jZ0tlA=;
        b=IiIAi4Dilc+mI1X1kAz2XsUDZiA1PBZcgRgq9NZx3gSuN9LkGdmzv3Z/uanBhkhABx
         dUpCJKZCZY5G3VLokIX4YhHBdnv83+5XVnV9FrF93RZK8fetz4FLBp/RI3DvVGbNZZDZ
         jeoCB9/aD2HAZT0laCdWZsImrggtqya9XnFRRzZ/Oq7dbErIwm+q99foC57a34UcksQ6
         DE/G7JITke2qD8aBP7K8tx0dmsmWuTEOxoUy213NTXqgopGlqKKWg710IHT9KF+1r0Wz
         FASSTztU7KzuWTFe+eZWGCMkCfWQnfjypH93Hc2+dohFOAPD50Xs4pxtRZO4qyAdnonS
         vBmw==
X-Gm-Message-State: AOAM532ScSk3yqt6L0GOu0IrTJ231V3U/8JZitVYSu0kvkWpnN3DWSj2
	t+JNqyKa2IgndQHjcDO7nVDRU3EAReknPm22lr+r6g==
X-Google-Smtp-Source: ABdhPJzhQclP+Pzkkz34NwG9PeVYKQvIpG95E3Ny5vz6tLofu2SFx/w08ES26ZQf8sPRpCeLbg6iWyFny/7/l2MSXLY=
X-Received: by 2002:aa7:ca52:: with SMTP id j18mr3660598edt.147.1602080515078;
 Wed, 07 Oct 2020 07:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200729133256.20229-1-viktor.rosendahl@bmw.de> <CA+chaQfJONtwMRxOzStaK+78qCP4vcksoTJD4NxNzEQNWAwa1A@mail.gmail.com>
In-Reply-To: <CA+chaQfJONtwMRxOzStaK+78qCP4vcksoTJD4NxNzEQNWAwa1A@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 7 Oct 2020 04:21:43 -1000
Message-ID: <CAOSpxdbqsAqKoMWA=qXxq7bNcZqRZOX=PP_Y5NpLGw4JQ+8NWg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] boost: backport fix to make async_pipes work with asio
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Viktor Rosendahl <viktor.rosendahl@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 7, 2020 at 2:10 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> It's not caused by this change, but when rebuilding dunfell based build with this change included I've noticed:
> WARNING: boost-1.72.0-r0 do_fetch: Checksum mismatch for local file downloads/boost_1_72_0.tar.bz2
> Cleaning and trying again.
> WARNING: boost-1.72.0-r0 do_fetch: Renaming downloads/boost_1_72_0.tar.bz2 to downloads/boost_1_72_0.tar.bz2_bad-checksum_9df25550eb5a8d5a83dc67be4135d3785ab02b22c6972e5e3da1d79781b03f0b

I checked on two machines here and don't see this issue, the checksums
for boost_1_72_0.tar.bz2 in the downloads directory matches that in
the recipe.

I do builds with meta-openembedded, meta-qt5, meta-mender,
meta-virtualization and bsp's from poky, meta-freescale and
meta-st-stm32mp.

Are you using other layers that might touch boost?

Steve

> boost-new/boost_1_72_0:
> INSTALL  Jamroot  LICENSE_1_0.txt  README.md  boost  boost-build.jam  boost.css  boost.png  boostcpp.jam  bootstrap.bat  bootstrap.sh  doc  index.htm  index.html  libs  more  rst.css  status  tools
>
> boost-old/boost_1_72_0:
> INSTALL  LICENSE_1_0.txt  boost  boost.css  boost.png  boostcpp.jam  bootstrap.bat  bootstrap.sh  doc  index.htm  libs  status
>
> $ diff -rq boost-*
> Only in boost-new/boost_1_72_0: Jamroot
> Only in boost-new/boost_1_72_0: README.md
> Only in boost-new/boost_1_72_0/boost: archive
> Only in boost-new/boost_1_72_0/boost: array.hpp
> Only in boost-new/boost_1_72_0/boost: assign
> Only in boost-new/boost_1_72_0/boost: atomic
> Only in boost-new/boost_1_72_0/boost: beast.hpp
> Only in boost-new/boost_1_72_0/boost: blank.hpp
> Only in boost-new/boost_1_72_0/boost: callable_traits
> Only in boost-new/boost_1_72_0/boost: checked_delete.hpp
> Only in boost-new/boost_1_72_0/boost: circular_buffer
> Only in boost-new/boost_1_72_0/boost: compatibility
> Only in boost-new/boost_1_72_0/boost: compute
> Only in boost-new/boost_1_72_0/boost: concept
> Only in boost-new/boost_1_72_0/boost: concept_check.hpp
> Only in boost-new/boost_1_72_0/boost: container
> Only in boost-new/boost_1_72_0/boost: convert.hpp
> Only in boost-new/boost_1_72_0/boost: current_function.hpp
> Only in boost-new/boost_1_72_0/boost: date_time
> Only in boost-new/boost_1_72_0/boost: date_time.hpp
> Only in boost-new/boost_1_72_0/boost: dynamic_bitset
> Only in boost-new/boost_1_72_0/boost: dynamic_bitset.hpp
> Only in boost-new/boost_1_72_0/boost: foreach_fwd.hpp
> Only in boost-new/boost_1_72_0/boost: format
> Only in boost-new/boost_1_72_0/boost: format.hpp
> Only in boost-new/boost_1_72_0/boost: function
> Only in boost-new/boost_1_72_0/boost: functional
> Only in boost-new/boost_1_72_0/boost: generator_iterator.hpp
> Only in boost-new/boost_1_72_0/boost/geometry/srs: esri.hpp
> Files boost-new/boost_1_72_0/boost/geometry/srs/projections/iau2000_traits.hpp and boost-old/boost_1_72_0/boost/geometry/srs/projections/iau2000_traits.hpp differ
> Only in boost-new/boost_1_72_0/boost/geometry/srs/projections: spar.hpp
> Only in boost-new/boost_1_72_0/boost/geometry/srs: shared_grids.hpp
> Only in boost-new/boost_1_72_0/boost/geometry/srs: sphere.hpp
> Only in boost-new/boost_1_72_0/boost/geometry/srs: spheroid.hpp
> Only in boost-new/boost_1_72_0/boost: get_pointer.hpp
> Only in boost-new/boost_1_72_0/boost: gil
> Only in boost-new/boost_1_72_0/boost: hana
> Only in boost-new/boost_1_72_0/boost: hana.hpp
> Only in boost-new/boost_1_72_0/boost: heap
> Only in boost-new/boost_1_72_0/boost: histogram
> Only in boost-new/boost_1_72_0/boost: integer
> Only in boost-new/boost_1_72_0/boost: iostreams
> Only in boost-new/boost_1_72_0/boost: is_placeholder.hpp
> Only in boost-new/boost_1_72_0/boost: lambda
> Only in boost-new/boost_1_72_0/boost: locale
> Only in boost-new/boost_1_72_0/boost: logic
> Only in boost-new/boost_1_72_0/boost: make_shared.hpp
> Only in boost-new/boost_1_72_0/boost: math
> Only in boost-new/boost_1_72_0/boost: memory_order.hpp
> Only in boost-new/boost_1_72_0/boost: mp11.hpp
> Only in boost-new/boost_1_72_0/boost: mpi
> Only in boost-new/boost_1_72_0/boost: multiprecision
> Only in boost-new/boost_1_72_0/boost: non_type.hpp
> Only in boost-new/boost_1_72_0/boost: operators_v1.hpp
> Only in boost-new/boost_1_72_0/boost: outcome
> Only in boost-new/boost_1_72_0/boost: outcome.hpp
> Only in boost-new/boost_1_72_0/boost: pending
> Only in boost-new/boost_1_72_0/boost: phoenix
> Only in boost-new/boost_1_72_0/boost: pointee.hpp
> Only in boost-new/boost_1_72_0/boost: pointer_cast.hpp
> Only in boost-new/boost_1_72_0/boost: predef.h
> Only in boost-new/boost_1_72_0/boost: process
> Only in boost-new/boost_1_72_0/boost: proto
> Only in boost-new/boost_1_72_0/boost: python
> Only in boost-new/boost_1_72_0/boost: random.hpp
> Only in boost-new/boost_1_72_0/boost: regex.hpp
> Only in boost-new/boost_1_72_0/boost: scope_exit.hpp
> Only in boost-new/boost_1_72_0/boost: scoped_array.hpp
> Only in boost-new/boost_1_72_0/boost: serialization
> Only in boost-new/boost_1_72_0/boost: shared_container_iterator.hpp
> Only in boost-new/boost_1_72_0/boost: spirit
> Only in boost-new/boost_1_72_0/boost: stacktrace
> Only in boost-new/boost_1_72_0/boost: statechart
> Only in boost-new/boost_1_72_0/boost: token_functions.hpp
> Only in boost-new/boost_1_72_0/boost: type_traits.hpp
> Only in boost-new/boost_1_72_0/boost: unordered_map.hpp
> Only in boost-new/boost_1_72_0/boost: utility
> Only in boost-new/boost_1_72_0/boost: variant2
> Only in boost-new/boost_1_72_0/boost: weak_ptr.hpp
> Only in boost-new/boost_1_72_0: boost-build.jam
> Only in boost-new/boost_1_72_0: index.html
> Only in boost-new/boost_1_72_0: more
> Only in boost-new/boost_1_72_0: rst.css
> Only in boost-new/boost_1_72_0: tools
>
> I don't remember any commit updating the checksum from:
> 9df25550eb5a8d5a83dc67be4135d3785ab02b22c6972e5e3da1d79781b03f0b  downloads/boost_1_72_0.tar.bz2_bad-checksum_9df25550eb5a8d5a83dc67be4135d3785ab02b22c6972e5e3da1d79781b03f0b
> to
> 59c9b274bc451cf91a9ba1dd2c7fdcaf5d60b1b3aa83f2c9fa143417cc660722  downloads/boost_1_72_0.tar.bz2
> currently used in recipe.
>
> It's possible that there is another recipe somewhere using the same boost_1_72_0.tar.bz2 archive from different URL with different checksums.
>
> Regards,
>
> On Wed, Jul 29, 2020 at 3:33 PM Viktor Rosendahl <viktor.rosendahl@gmail.com> wrote:
>>
>> From: Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
>>
>> async_pipe is missing the executor_type type, which is expected by
>> asio in /usr/include/boost/asio/impl/read.hpp. Without this, it's
>> not possible to even compile code that uses constructs such as:
>>
>> boost::asio::io_service foo;
>> boost::process::async_pipe foopipe{ boost::process::async_pipe(foo) };
>>
>> This is only relevant for Dunfell because master has already moved to
>> boost-1.73.0 in which this bug has been fixed. The bug is also not
>> present in Zeus, which uses boost-1.71.0.
>>
>> Signed-off-by: Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
>> ---
>>  .../0001-added-typedef-executor_type.patch    | 53 +++++++++++++++++++
>>  meta/recipes-support/boost/boost_1.72.0.bb    |  1 +
>>  2 files changed, 54 insertions(+)
>>  create mode 100644 meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch
>>
>> diff --git a/meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch b/meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch
>> new file mode 100644
>> index 0000000000..83d3749e15
>> --- /dev/null
>> +++ b/meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch
>> @@ -0,0 +1,53 @@
>> +From 6a4d2ff72114ef47c7afaf92e1042aca3dfa41b0 Mon Sep 17 00:00:00 2001
>> +From: Klemens David Morgenstern <klemens.morgenstern@gmx.net>
>> +Date: Fri, 22 Nov 2019 14:03:22 +0800
>> +Subject: [PATCH] added typedef executor_type;
>> +
>> +Upstream-Status: Backport [https://github.com/boostorg/process/commit/6a4d2ff72114ef47c7afaf92e1042aca3dfa41b0]
>> +
>> +---
>> + include/boost/process/async_pipe.hpp                | 2 ++
>> + include/boost/process/detail/posix/async_pipe.hpp   | 1 +
>> + include/boost/process/detail/windows/async_pipe.hpp | 1 +
>> + 3 files changed, 4 insertions(+)
>> +
>> +diff --git a/include/boost/process/async_pipe.hpp b/include/boost/process/async_pipe.hpp
>> +index 101fe1d..a562432 100644
>> +--- a/boost/process/async_pipe.hpp
>> ++++ b/boost/process/async_pipe.hpp
>> +@@ -47,6 +47,8 @@ public:
>> +      */
>> +     typedef platform_specific handle_type;
>> +
>> ++    typedef typename handle_type::executor_type executor_type;
>> ++
>> +     /** Construct a new async_pipe, does automatically open the pipe.
>> +      * Initializes source and sink with the same io_context.
>> +      * @note Windows creates a named pipe here, where the name is automatically generated.
>> +diff --git a/include/boost/process/detail/posix/async_pipe.hpp b/include/boost/process/detail/posix/async_pipe.hpp
>> +index 725a078..a82c057 100644
>> +--- a/boost/process/detail/posix/async_pipe.hpp
>> ++++ b/boost/process/detail/posix/async_pipe.hpp
>> +@@ -23,6 +23,7 @@ class async_pipe
>> + public:
>> +     typedef int native_handle_type;
>> +     typedef ::boost::asio::posix::stream_descriptor handle_type;
>> ++    typedef typename handle_type::executor_type executor_type;
>> +
>> +     inline async_pipe(boost::asio::io_context & ios) : async_pipe(ios, ios) {}
>> +
>> +diff --git a/include/boost/process/detail/windows/async_pipe.hpp b/include/boost/process/detail/windows/async_pipe.hpp
>> +index 06d5f2d..0b447f9 100644
>> +--- a/boost/process/detail/windows/async_pipe.hpp
>> ++++ b/boost/process/detail/windows/async_pipe.hpp
>> +@@ -48,6 +48,7 @@ class async_pipe
>> + public:
>> +     typedef ::boost::winapi::HANDLE_ native_handle_type;
>> +     typedef ::boost::asio::windows::stream_handle   handle_type;
>> ++    typedef typename handle_type::executor_type executor_type;
>> +
>> +     async_pipe(boost::asio::io_context & ios) : async_pipe(ios, ios, make_pipe_name(), true) {}
>> +     async_pipe(boost::asio::io_context & ios_source, boost::asio::io_context & ios_sink)
>> +--
>> +2.17.1
>> +
>> diff --git a/meta/recipes-support/boost/boost_1.72.0.bb b/meta/recipes-support/boost/boost_1.72.0.bb
>> index 0b7badbc76..51c84bc935 100644
>> --- a/meta/recipes-support/boost/boost_1.72.0.bb
>> +++ b/meta/recipes-support/boost/boost_1.72.0.bb
>> @@ -8,4 +8,5 @@ SRC_URI += "file://arm-intrinsics.patch \
>>             file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
>>             file://0001-dont-setup-compiler-flags-m32-m64.patch \
>>             file://0001-revert-cease-dependence-on-range.patch \
>> +           file://0001-added-typedef-executor_type.patch \
>>             "
>> --
>> 2.17.1
>>
>> 
