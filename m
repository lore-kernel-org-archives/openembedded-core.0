Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 78B2875A31
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 18:18:04 +0000 (UTC)
Received: by igbhv6 with SMTP id hv6so17156067igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 10:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=W1CI3rwTAWUZSvv+R37R0RvPPCmLCqqMj3ILS9wPxGU=;
	b=VH4xd6UiWdv/+4ugfAWao5ciEf4guSESPcjTNqxt+/q1hR4RvXVcr1dE5Ajtw+MEGE
	Jqj6hKGVKJWDReOA0GngFD8nyDa2me07TjhBWN0zoBGjQXTu0n/ao8ME2pA6/t8dDNXY
	f/c0YUjxdObygBDQovcpSRkPLJ8Sn9R/cxVBY3xINjS8YA+GI4yKhCqXhf509obPfca/
	VpB/4mdTYRWdlYSoZBxNZgxwFEy2s8FzH0svvtHIDs2agKsEt7Eh2dEG2FYU6J9gxAKF
	8ecOsBzR/d5CnVRImvXf+O7bsSX3XuJ91rNfagSadY4uLB7ORMLKIBEVjk21AFSOOTI3
	LDcg==
X-Received: by 10.50.155.106 with SMTP id vv10mr5051234igb.77.1446747484935;
	Thu, 05 Nov 2015 10:18:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Thu, 5 Nov 2015 10:17:35 -0800 (PST)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B610D473B5@ORSMSX110.amr.corp.intel.com>
References: <1445268589-104714-1-git-send-email-mark.hatle@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B610D473B5@ORSMSX110.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Nov 2015 10:17:35 -0800
Message-ID: <CAMKF1sqHRscyqe+OCLAB+BQxEe7zz3VAX0V3vFpt1aL7H_KcDg@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Fix GCC 5.2 "_FOR_BUILD" and related variables
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
X-List-Received-Date: Thu, 05 Nov 2015 18:18:06 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 5, 2015 at 10:13 AM, Bystricky, Juro
<juro.bystricky@intel.com> wrote:
> The patch works unmodified  (and solves mingw build problems) for gcc 4.9. as well,
> providing gcc-4.9.inc is  patched the same way as gcc-5.2.inc
>
> (However, this makes  the Makefile.in patch  status:
>
> Upstream-Status: Pending
>
> incorrect for case of gcc 4.9.)

why it it incorrect. is gcc 4.9 EOL ?

>
>
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -81,6 +81,7 @@ SRC_URI = "\
>      file://0063-nativesdk-gcc-support.patch \
>      file://0064-handle-target-sysroot-multilib.patch \
>      file://0065-gcc-483-universal-initializer-no-warning.patch \
> +    file://0042-cxxflags-for-build.patch \
>  "
>
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> Of Mark Hatle
>> Sent: Monday, October 19, 2015 8:30 AM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH] Fix GCC 5.2 "_FOR_BUILD" and related variables
>>
>> Without this patch, the wrong header fragments can be used to generate the
>> nativesdk, cross-canadian, and other variations.  Generally this works fine.
>> However, when there is enough variation from the build machine to the
>> target runtime it will break.. (Such as SDKMACHINE=i686-mingw32)
>>
>> The bugs can also how up on a Linux -> Linux build, but it's signficiantly more
>> rare.  It would require some set of options that make the host headers and
>> flags incompatible with the target.  (Such as various profiling
>> options.)
>>
>> This has been tested with a set of meta-mingw patches that will be sent to
>> the Yocto Project mailing list soon.
>>
>> Mark Hatle (1):
>>   gcc-5.2: Fix various _FOR_BUILD and related variables
>>
>>  meta/recipes-devtools/gcc/gcc-5.2.inc              |   1 +
>>  .../gcc/gcc-5.2/0042-cxxflags-for-build.patch      | 123
>> +++++++++++++++++++++
>>  2 files changed, 124 insertions(+)
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0042-cxxflags-for-
>> build.patch
>>
>> --
>> 1.9.3
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

