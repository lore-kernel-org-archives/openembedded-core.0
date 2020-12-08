Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.13047.1607450200955210486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 09:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pAjGxaAC;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id bo9so25766355ejb.13
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 09:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/GgYcE0AJ2aGMV8q5wvydfO3sfVEJgtOe/cytCVAhiA=;
        b=pAjGxaACed4eYCl2w6wIS0d/t6IW3EKpXh45zax1HvAahc9umK5PlJYf0rsr3TVI1a
         vAzsqS3ojmLpc/S0DlnWiUv92X2qm9AcCJkVWsxsnvG0jcIRKynl82RNpLZTpkTOczKW
         JPdULt/tnWOa9hYFOlDcw29bhrjOjYMBV0FSiZsNAo3iUPmhITyhcDTcLvZOpNLM8Dqb
         2bqL970e6F0Qo8588aGReWtKOsrpl1bmhmAn79NkTjLQPZcXjQW76rSO6iw7ocNN6xM6
         lBXdt118CLEvqNvbgdza4TbfQmv162NHDK/gsx6aUyEAEp5zkn1Zq3B+LyYAwdlGYg+9
         7E8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/GgYcE0AJ2aGMV8q5wvydfO3sfVEJgtOe/cytCVAhiA=;
        b=g8OmVs/1D0ZprPMRsImE4I7Fb+tV1OedJRXeRojsko4qwKgeQDPEP70JxaF50g4KR5
         EpeXwxT4679+6ib93QfnCg7MSGjymMtcjT5+PaD4RiP2AYCtt6MLvjAP1RRoPkahJGWY
         cleqYlLWI0hFlZDVLHy8qLInwdFXKOd4KXbGJxCIvMNht3SAf0Jla5V2sD1FrLkyUNUi
         gY+WGUja/pfTgOY98JXDsKYS564rtWQNsWUFhdgX7dtDNuahNrPUMaEi+rsakLnGj7TX
         GOlzlwnIkn5tZroZSIjH1cK+xWGNEBkAq4VZzNy1Ggd9nF/1HWhpPvA/QxYvXZnmVY52
         TRWw==
X-Gm-Message-State: AOAM533cclcE//nZgUGWritjGj2EEgfleGcqJnv1hc8PnjBRSoVJLqUK
	7teGBpGlQNCycBxtANciBQs1iXC3jbyX3DvdpcY=
X-Google-Smtp-Source: ABdhPJyRa9SYHhLooRKkXab41tVQmv/rFgyveCVeRs+NjKOhrAmadkdwwyt+kzEdplA6dbc5t281SJzILKOmElmfKqQ=
X-Received: by 2002:a17:907:373:: with SMTP id rs19mr21647784ejb.298.1607450199426;
 Tue, 08 Dec 2020 09:56:39 -0800 (PST)
MIME-Version: 1.0
References: <1606218546-115087-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <CAPLtV=qtux0nP429iJqRTCFRpfHN3B8_fpNPSaeGqreWJFK=Dg@mail.gmail.com>
 <164D60671E1EC649.7952@lists.openembedded.org> <bcd9f08662984ddaa8923c0d3fe13d4c@G08CNEXMBPEKD04.g08.fujitsu.local>
In-Reply-To: <bcd9f08662984ddaa8923c0d3fe13d4c@G08CNEXMBPEKD04.g08.fujitsu.local>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 8 Dec 2020 12:56:27 -0500
Message-ID: <CADkTA4NL0ek_WMbq1tu-9itDFVKkNL-tiw-RyzxtnGhqsd3sAA@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4.4
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: Leonardo Sandoval <leonardo.sandoval@linaro.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If that symbol is required, then we'd need to add it to the
appropriate fragment in the
reference kernel configurations (kernel-cache), and make sure it is
built into the
various kernel types.

Changes like that are submitted to the linux-yocto mailing list.

That being said, I went and looked at the error, and the .c that
defines the missing
symbol is security.c, which is controlled by CONFIG_SECURITY, not
CONFIG_SECURITY_LOCKDOWN_LSM. And that option is already enabled in
all kernel types.

It looks more like a missing .h, versus a missing option to me.

Have you looked at the systemtap source for an include of security.h,
and traced why
it wouldn't be finding the function definition ?

If this is the on-target build, versus a cross build test, then maybe
we are missing the
copy of a .h to the target (but you'd think that we'd get a more
obvious compile error
if a .h wasn't found).

Bruce

On Mon, Dec 7, 2020 at 10:03 PM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Ping
>
>
>
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.=
openembedded.org> On Behalf Of zangrc
> Sent: Friday, December 4, 2020 9:51 AM
> To: Leonardo Sandoval <leonardo.sandoval@linaro.org>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4.4
>
>
>
> I think this problem should be because the kernel does not enable CONFIG=
_SECURITY_LOCKDOWN_LSM,
>
> do you need me to submit a patch to open this option of the kernel?
>
>
>
> Zangrc
>
>
>
> From: Zang, Ruochen/=E8=87=A7 =E8=8B=A5=E5=B0=98
> Sent: Thursday, November 26, 2020 2:18 PM
> To: 'Leonardo Sandoval' <leonardo.sandoval@linaro.org>
> Cc: openembedded-core@lists.openembedded.org
> Subject: RE: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4.4
>
>
>
> I will investigate, it may take some time, if the error is resolved, I w=
ill send a patch to the mailing list.
>
>
>
> zangrc
>
>
>
> From: Leonardo Sandoval <leonardo.sandoval@linaro.org>
> Sent: Thursday, November 26, 2020 6:09 AM
> To: Zang, Ruochen/=E8=87=A7 =E8=8B=A5=E5=B0=98 <zangrc.fnst@cn.fujitsu.c=
om>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4.4
>
>
>
> Hi Zangrc,
>
>
>
> this patch is now in master-next
>
>
>
>   https://patchwork.openembedded.org/series/27030/
>
>
>
> but autobuilder detected a compilation error in the upgraded version
>
>
>
>   https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/2736=
/steps/13/logs/stdio
>
>
>
> Can you please take a look? (seems like a C macro is not defined).
>
>
>
> Thanks,
>
>
>
> lsg
>
>
>
>
>
>
>
>
>
> On Mon, 23 Nov 2020 at 20:08, zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> The test log of oe-selftest is as follows:
> 2020-11-23 15:48:49,144 - oe-selftest - INFO - test_crosstap_helloworld =
(runtime_test.SystemTap)
> 2020-11-23 17:06:55,949 - oe-selftest - INFO -  ... ok
> 2020-11-23 17:06:55,951 - oe-selftest - INFO - test_crosstap_pstree (run=
time_test.SystemTap)
> 2020-11-23 17:08:07,921 - oe-selftest - INFO -  ... ok
> 2020-11-23 17:08:07,922 - oe-selftest - INFO - test_crosstap_syscalls_by=
_pid (runtime_test.SystemTap)
> 2020-11-23 17:09:20,084 - oe-selftest - INFO -  ... ok
> 2020-11-23 17:09:20,085 - oe-selftest - INFO - test_crosstap_syscalls_by=
_proc (runtime_test.SystemTap)
> 2020-11-23 17:10:31,349 - oe-selftest - INFO -  ... ok
> 2020-11-23 17:12:58,052 - oe-selftest - INFO - -------------------------=
---------------------------------------------
> 2020-11-23 17:12:58,054 - oe-selftest - INFO - Ran 4 tests in 5051.537s
> 2020-11-23 17:12:58,054 - oe-selftest - INFO - OK
> 2020-11-23 17:13:08,416 - oe-selftest - INFO - RESULTS:
> 2020-11-23 17:13:08,417 - oe-selftest - INFO - RESULTS - runtime_test.Sy=
stemTap.test_crosstap_helloworld: PASSED (4686.81s)
> 2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_test.Sy=
stemTap.test_crosstap_pstree: PASSED (71.97s)
> 2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_test.Sy=
stemTap.test_crosstap_syscalls_by_pid: PASSED (72.16s)
> 2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_test.Sy=
stemTap.test_crosstap_syscalls_by_proc: PASSED (71.26s)
> 2020-11-23 17:13:08,432 - oe-selftest - INFO - SUMMARY:
> 2020-11-23 17:13:08,432 - oe-selftest - INFO - oe-selftest () - Ran 4 te=
sts in 5051.540s
> 2020-11-23 17:13:08,432 - oe-selftest - INFO - oe-selftest - OK - All re=
quired tests passed (successes=3D4, skipped=3D0, failures=3D0, errors=3D0)
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/reci=
pes-kernel/systemtap/systemtap_git.inc
> index 56fa51d61e..ae735025b7 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -1,7 +1,7 @@
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263"
> -SRCREV =3D "82b8e1a07a31bf37ed05d6ebc5162b054c0be9fd"
> -PV =3D "4.3"
> +SRCREV =3D "988f439af39a359b4387963ca4633649866d8275"
> +PV =3D "4.4"
>
>  SRC_URI =3D "git://sourceware.org/git/systemtap.git \
>             file://0001-Do-not-let-configure-write-a-python-location-int=
o-th.patch \
> --
> 2.25.1
>
>
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
