Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 16FE86011F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 17:43:43 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id g73so95888942ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ye8af6PVrn2TKltLIGfGkIICWu2NF4wDtC1jlJYksqE=;
	b=bva2f8aWnaotU44Qz+5L8oTo3EbLJMA8LuASzKcvFgShuk+lbJHLi9uM3d5fjFTbex
	i95xEDPrtuBWN35b2cIpIfk74dO6/P2h/FfzotFTp8Njgd+pitF7FXEwO+jcFIMSe67T
	61JrGypvelSGsQcdfzeNTYPz8gdwScgGO/kHtG+gJZ5jj6A4rqOXquSpyWYvjrYYdYqd
	rmdDpgtMEedPfP5RsKMLlIDmn5Sq2UYGIojBEYXiTo/TejnJuq8khchod77fDAM0o1sW
	nJXnnZJLV3KTJ3Eyov5zN533xfMVQ3qdXUqHidO3/uarwXqmoXBxkIEe/R3ELa4gKhBV
	BKWQ==
X-Received: by 10.107.9.224 with SMTP id 93mr98219571ioj.112.1452275024156;
	Fri, 08 Jan 2016 09:43:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 8 Jan 2016 09:43:14 -0800 (PST)
In-Reply-To: <CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Jan 2016 09:43:14 -0800
Message-ID: <CAMKF1so8xuy9Q8YjRynpgV68cjt-9KHae4TBTjKvn5EU0UzD+g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Fri, 08 Jan 2016 17:43:44 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 6:00 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 January 2016 at 10:19, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> This set of fixes let core-image-full-cmdline build with musl along with
>> core-image-sato
>> and core-image-weston
>
>
> Hm, for some reason, this doesn't work for me.

I think x86 includes more packages than other arches in these images.
full-cmdline image is pretty new it hasnt yet been tested on all
architectures only qemuarm is where I got it to work.

>
> Lots and lots of "files installed but not packaged", all locales.  eg
> /usr/lib/locale/hu/LC_MESSAGES/glib20.mo in glib-2.0.
>
> systemd fails with this error, over and over:

systemd does not work with musl. I have patches in my tree to fix the
build but then it does not run :(. musl and systemd has different
goals, right now I am not putting lot of efforts to bridge the gap.
Patches are here

https://github.com/kraj/systemd/commits/oe/master

>
> |
> /data/poky-master/tmp/work/i586-poky-linux-musl/systemd/1_228+gitAUTOINC+dd050decb6-r0/git/src/basic/util.h:96:70:
> error: unknown type name 'comparison_fn_t'
> |  static inline void qsort_safe(void *base, size_t nmemb, size_t size,
> comparison_fn_t compar) {
>
> Also I presume you're not building with debugging tools enabled because
> oprofile fails to build:
>
> | make[2]: Entering directory
> '/data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/build/pe_profiling'
> | i586-poky-linux-musl-g++  -m32 -march=i586
> --sysroot=/data/poky-master/tmp/sysroots/qemux86 -DHAVE_CONFIG_H -I.
> -I/data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling
> -I..  -I
> /data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/libutil
> -I
> /data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/libop
> -I
> /data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/libutil++
> -I
> /data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/libperf_events
> -I
> /data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/libpe_utils
> -I/data/poky-master/tmp/sysroots/qemux86/usr/include   -W -Wall -fno-common
> -ftemplate-depth-50 -O2 -pipe -g -feliminate-unused-debug-types
> -fvisibility-inlines-hidden -c -o operf.o
> /data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling/operf.cpp
> |
> /data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling/operf.cpp:
> In function 'int __delete_old_previous_sample_data(const char*, const stat*,
> int, FTW*)':
> |
> /data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling/operf.cpp:862:10:
> error: 'FTW_STOP' was not declared in this scope
> |    return FTW_STOP;
> |           ^
> |
> /data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling/operf.cpp:864:10:
> error: 'FTW_CONTINUE' was not declared in this scope
> |    return FTW_CONTINUE;
> |           ^
> |
> /data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling/operf.cpp:
> In function 'void convert_sample_data()':
> |
> /data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling/operf.cpp:899:41:
> error: 'FTW_ACTIONRETVAL' was not declared in this scope
> |                  int flags = FTW_DEPTH | FTW_ACTIONRETVAL;
> |                                          ^
> | Makefile:451: recipe for target 'operf.o' failed
>
> I presume this is another "link to fts" case.
>
> Ross

