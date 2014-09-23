Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id D41F365DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 08:23:48 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id b12so8289661lbj.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 01:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=OrkekcBuZE9iauHQ00+WJoRsL8KRAcuTSvibBisA6LI=;
	b=HDsUGx2X7ninTqVBEHobSVPH0HoBf0+csrxJbDGzf0yhIu3Kms9b1o6fOeLxM4o1uQ
	TBxq8H3NK9VBamkOwaX5YI3kfGJE0vWaBJF9StnQUKNRK6Ioj0PhM5Sv6fcyU7nNo6E2
	Y+hMDq7paC//VV3YOo8mrreOgzxZNVi3OMf2FVxRz/7l5WkWnSbyR4JX6a4btQDOMwSp
	4Vd19X3RmAs7E/HxEAPNRuowfhkAfFID/n6I7b+cBXEBR2fr/FU3yE4lyGZpGHdR7MUg
	FAOZ5aiJSqRHrqO9FIB8GnL94/YQULqLTTXXo9pA7WYVaMW3UBEz8Nr4z4NZUO+Hsphg
	ZgzQ==
X-Gm-Message-State: ALoCoQntVjuaf4sB9sJvdTVBmj2PxT/kGmAjjUMqr60Xc/NycKjxxQXhHDkL/cwBMRGo1wdClEwJ
MIME-Version: 1.0
X-Received: by 10.153.4.39 with SMTP id cb7mr30999750lad.19.1411460628849;
	Tue, 23 Sep 2014 01:23:48 -0700 (PDT)
Received: by 10.112.205.165 with HTTP; Tue, 23 Sep 2014 01:23:48 -0700 (PDT)
In-Reply-To: <54210F1F.10907@windriver.com>
References: <cover.1411117403.git.kai.kang@windriver.com>
	<65b2b92067da54c7ae1c4dcfee22e317798e6371.1411117403.git.kai.kang@windriver.com>
	<CAGNsrLCEAtiAW5GpN7K-6jTuK0EgOyduVAREUyVhVt1gb4A-xg@mail.gmail.com>
	<54210F1F.10907@windriver.com>
Date: Tue, 23 Sep 2014 11:23:48 +0300
Message-ID: <CAGNsrLDiRpTjOxhpppTxe8H8UJUrLxxnxxKaZq4MXuAV+HMJDQ@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 9/9] perf: disable libunwind support for aarch64
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
X-List-Received-Date: Tue, 23 Sep 2014 08:23:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23 September 2014 09:11, Kang Kai <Kai.Kang@windriver.com> wrote:
> On 2014=E5=B9=B409=E6=9C=8823=E6=97=A5 00:01, Fathi Boudra wrote:
>>
>> On 19 September 2014 12:21, Kai Kang <kai.kang@windriver.com> wrote:
>>>
>>> Disable libunwind support of perl for aarch aarch64 that libunwind
>>> doesn't support aarch64.
>>
>> typo:
>> perl -> perf
>> aarch -> arch
>>
>> Otherwise, the patch doesn't seems correct. libunwind supports aarch64
>> since libunwind 1.1 (you need to build with --enable-debug-frame).
>
>
> When do configure, it fails with:
>
> | checking for ELF helper width... configure: error: Unknown ELF target:
> aarch64
>
> It could be fixed by patching configure.ac:
>
> --- configure.ac.orig   2014-09-23 13:30:23.415975656 +0800
> +++ configure.ac        2014-09-23 13:30:47.991976326 +0800
> @@ -137,7 +137,7 @@
>  AC_MSG_CHECKING([for ELF helper width])
>  case "${target_arch}" in
>  (arm|hppa|ppc32|x86|sh) use_elf32=3Dyes; AC_MSG_RESULT([32]);;
> -(ia64|ppc64|x86_64)    use_elf64=3Dyes; AC_MSG_RESULT([64]);;
> +(aarch64|ia64|ppc64|x86_64)    use_elf64=3Dyes; AC_MSG_RESULT([64]);;
>  (mips)                 use_elfxx=3Dyes; AC_MSG_RESULT([xx]);;
>  *)                     AC_MSG_ERROR([Unknown ELF target: ${target_arch}]=
)
>  esac
>
> And then it fails with do compile either:
>
> | ../include/libunwind.h:25:3: error: #error "Unsupported arch"
>
> In include/libunwind.h.in, it checks arch and include header accordingly.
> For aarch64, it lacks arch check and header file libunwind-arm64.h or
> libunwind-aarch64.h.


right, we've upstreamed aarch64 support but it hasn't been released in 1.1.
we need the following patches:
http://git.savannah.gnu.org/gitweb/?p=3Dlibunwind.git;a=3Dcommitdiff;h=3Dac=
6c0a6535975f1dc2da6e4e2766614baac2a14a
http://git.savannah.gnu.org/gitweb/?p=3Dlibunwind.git;a=3Dcommitdiff;h=3D2c=
b00c1eaca437e41556ad5512149508fcc7cb82

> Thanks,
> Kai
>
>
>
>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>   meta/recipes-kernel/perf/perf-features.inc | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-kernel/perf/perf-features.inc
>>> b/meta/recipes-kernel/perf/perf-features.inc
>>> index 2dbbb47..7de35f3 100644
>>> --- a/meta/recipes-kernel/perf/perf-features.inc
>>> +++ b/meta/recipes-kernel/perf/perf-features.inc
>>> @@ -1,4 +1,5 @@
>>>   PERF_FEATURES_ENABLE ?=3D "perf-scripting perf-tui perf-libunwind"
>>> +PERF_FEATURES_ENABLE_remove_aarch64 =3D "perf-libunwind"
>>>
>>>   def perf_feature_enabled(feature, trueval, falseval, d):
>>>       """
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>
>
> --
> Regards,
> Neil | Kai Kang

