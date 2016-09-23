Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4047060125
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 01:24:42 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 107so753144uah.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 18:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Lcx4kOBspo1xH4lCfNVznUyrFEtWeldWod0ip+qaZMk=;
	b=Ix4++c32FLn8cSAhn1yabcacQ5JugiHow8shsOvBDqtABreai6szDs7S/wRy5Kr67k
	ZJdVCTW9GhAMB/uhJe/7Nj/VTlM6wwc88Y7KjWFzEVQBNuWvQYfCmUPJx8BMt1rayn4C
	mqHsOAgJI7mzhTbvpcroFSEHXM+H4TxuFoot1qYTL2N6LShxvYsb2NwUEQdr3m3AuXay
	Qo6dHpt2MWbYSPErYKNeq/2NCTnTGHQXYfXCgVry6WA3fWqOfDdL3upY+VG44IYA/51J
	2chd0TNw1F9ydWgqzxn0WQfT5Beu3zD8E6Be2ch0eLQXJ4Ez+7+rzRBQY30F5jR6oxVh
	jgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Lcx4kOBspo1xH4lCfNVznUyrFEtWeldWod0ip+qaZMk=;
	b=YZZPEdzXOh8WO215Awp7HT0mMZuhdJBYZ5UX4+lGF17BzADMPnpgxLekFBewK5KKtU
	sspHpSI+PccjKdVShMWNzh1zeay3wA92OWCuLqQ+Zk0yIsFVt0Z47Db3Wxo03RcZtJ02
	1H2Mo6yOZzubUc/WekBrVk7gq2xK+UYBw+wWZdnsNcIsuZktVl5NvPyu5BiNNuh9bSxH
	5E+0dSqKvwzp9Th14Hs035KDe8pAlQ1zueFrgUBgyu20/Q/uZmnNA4yJ0x9ePk3fP+/+
	1t03pWi6ZW9+ZF2HjbfvsxhWmo5i7rN9GBaVDELb3bzuQj3h9UW+24ls/TsDZ0w5cOmE
	xgxQ==
X-Gm-Message-State: AA6/9RmJZdDZzuKWdlhpzBZ5NeslKdRATlJ4n8zdqnrcINr0DpyHDWJqtOIz7BlTIdwXrlSWf6yupHJlRqTjUg==
X-Received: by 10.176.2.73 with SMTP id 67mr2412687uas.40.1474593883918; Thu,
	22 Sep 2016 18:24:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Thu, 22 Sep 2016 18:24:13 -0700 (PDT)
In-Reply-To: <1474435844-16942-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474435844-16942-1-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Sep 2016 18:24:13 -0700
Message-ID: <CAMKF1sr-gz_KF+yL=UTu4C-6qPME2obXj9mrsxdhB=yhV+Nijw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libunwind: fix build by linking with bfd instead of gold
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
X-List-Received-Date: Fri, 23 Sep 2016 01:24:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2016 at 10:30 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> works around:
> <native-sysroot>/ld: error: Gperf-simple.o: cannot make copy relocation f=
or protected symbol '_Uarm_local_addr_space', defined in ../src/.libs/libun=
wind-arm.so
> collect2: error: ld returned 1 exit status
> Makefile:1038: recipe for target 'Gperf-simple' failed
> make[1]: *** [Gperf-simple] Error 1
> make[1]: *** Waiting for unfinished jobs....
> <...>
> <native-sysroot>/ld: error: Lperf-simple.o: cannot make copy relocation f=
or protected symbol '_ULarm_local_addr_space', defined in ../src/.libs/libu=
nwind.so
> collect2: error: ld returned 1 exit status
> Makefile:1094: recipe for target 'Lperf-simple' failed
> make[1]: *** [Lperf-simple] Error 1
> <...>
> ERROR: oe_runmake failed
> <native-sysroot>/ld: error: Gperf-trace.o: cannot make copy relocation fo=
r protected symbol '_Uarm_local_addr_space', defined in ../src/.libs/libunw=
ind-arm.so
> collect2: error: ld returned 1 exit status
> Makefile:1042: recipe for target 'Gperf-trace' failed
> make[1]: *** [Gperf-trace] Error 1
> <native-sysroot>/ld: error: Lperf-trace.o: cannot make copy relocation fo=
r protected symbol '_ULarm_local_addr_space', defined in ../src/.libs/libun=
wind.so
> collect2: error: ld returned 1 exit status
> Makefile:1098: recipe for target 'Lperf-trace' failed
> make[1]: *** [Lperf-trace] Error 1
> <...>
> <native-sysroot>/ld: error: test-coredump-unwind.o: cannot make copy relo=
cation for protected symbol '_UCD_accessors', defined in ../src/.libs/libun=
wind-coredump.so
> collect2: error: ld returned 1 exit status
> Makefile:1186: recipe for target 'test-coredump-unwind' failed
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta/recipes-support/libunwind/libunwind_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/libunwind/libunwind_git.bb b/meta/recip=
es-support/libunwind/libunwind_git.bb
> index cd4cb89..4249430 100644
> --- a/meta/recipes-support/libunwind/libunwind_git.bb
> +++ b/meta/recipes-support/libunwind/libunwind_git.bb
> @@ -26,3 +26,4 @@ SECURITY_CFLAGS_append_aarch64 =3D " -fPIE"
>
>  S =3D "${WORKDIR}/git"
>
> +LDFLAGS +=3D "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES'=
, 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"

I dont think we need to check for DISTRO_FEATURE here. Since we want
to always use BFD linker using -fuse-ld=3Dbfd unconditionally is fine
always.

> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

