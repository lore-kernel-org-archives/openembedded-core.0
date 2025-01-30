Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D8BC02190
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 16:51:41 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.20079.1738255896474238052
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 08:51:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LBJxgCiK;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2a01bcd0143so683528fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 08:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738255896; x=1738860696; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybztJxFs6L5aiKH360ZwUjuk4czYvg6JG6AnNCTvD+o=;
        b=LBJxgCiKM7IZU606HSL3lF8U7+Xrj0p2/57Nem+/AnZe7LvJfgeyb1XmdkRBE/tSu2
         H2w/q9kcJY+GipiO6T9KmH8OeTvw03eb/fi+w34sCsdecMRWhf1ApTF05DLwudFCugIt
         wDk9LyWrf5rDYvbQEOFNC3O64J1P7rkRIC5Y5/x+bYIW+Ee02kjNs7SkihXkP8ehvjTK
         ERKpNAtOpgRVdzO9eoe5fLNYUyKMnmqb4fPm21Hozq2qsZxHI4UBgUxUsgcVydpFhQp/
         +x+LGpipO/yRjWlZXVwsDO1z0lJriqcb/qFwekPmlbXQxjXIwH/c1Wa/t+yXMjtgwzB3
         rGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738255896; x=1738860696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybztJxFs6L5aiKH360ZwUjuk4czYvg6JG6AnNCTvD+o=;
        b=UXXMGxKNaORVM8o6MUQhEmGNX5LnA2h0PD7R/5udviRIUqFTEL8Z71ifGNsBzNpLD7
         n3Wim6oR/HwckJJr5yJ9nYTqAVT7Mo+7XKxhVF1JjlBpz/z75hmGCvY1Kp8Z0xu/tjZQ
         60rNPnX4MjtLn+3TFLklgtkgwnLIrjTt4nZ/UGrTllHtTLgZwvjRJtKjPOjx4chueESk
         gMAsSe5MvUulKqtagvF2bHrrdPl5D8BQaWx9cpPwBHOl7I771CfE7YmbLZ4N0aF6R7MN
         KFgylx0Xomz+bCZWO4Ss17yYfNzDckUK+69kSgsUV47ah4oBvRYFCaQUJiGJYFt2TVen
         aC8g==
X-Forwarded-Encrypted: i=1; AJvYcCV3wT6qqrn1hz1oiM4UoEC5mVB2Nu+PPLSn1yLBCjzEpD1PS+5whC4e1io2lSqkuCgotnlitzBC+DHfRMHeldwslA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwKtwDdggjY2RvijEO1OBVFmGxE96ceI6d/r5kfuKurWYi+Y7TW
	LnC3qnmB+Uu+A86b87sx3ube4UL+memAzoIksQEYxZIxDaMR94C+pbXBonoCrGh3tQOryaudPam
	w95YlCCrxxTemn1YnJpRqprWynm0=
X-Gm-Gg: ASbGncsEVGB9Vox+UvxRJHj0N1H4XLSNXf+02jEqQ961ZFqAFCPax+TiaKX2chvZCNB
	en0CC2L6x/rc8l1O9ModpledUffjryAWg5+Px2sZuQywhcAJ/0juA4Dy5j/BjG8iyncpTJjs=
X-Google-Smtp-Source: AGHT+IHtwUi1tXiKEFBd6J/GTfuEi8fUb4WJp4CtSLqwZaOGJhsCbDQXjYI3xePl/uCB4UfLkF8PGA3HmIBWdjxrLY8=
X-Received: by 2002:a05:6871:2009:b0:2a3:d9b3:3d01 with SMTP id
 586e51a60fabf-2b32f2d8137mr5208768fac.29.1738255895516; Thu, 30 Jan 2025
 08:51:35 -0800 (PST)
MIME-Version: 1.0
References: <20250128101633.3664659-1-Yash.Shinde@windriver.com>
 <96981090-c00a-40cb-802c-f709450036f1@windriver.com> <CAKmqyKNHc0rGAAc=3cJZN+uQ8BPhSAyb96Y1+pFGt8bk=ouY6Q@mail.gmail.com>
 <a52736b6-71d1-4301-a602-096808a60209@windriver.com> <9bf345df-9263-4921-95f5-ba96279a7a9c@windriver.com>
In-Reply-To: <9bf345df-9263-4921-95f5-ba96279a7a9c@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Jan 2025 08:51:09 -0800
X-Gm-Features: AWEUYZnx2Z7Vl8F8cqlmDkOHmw0nx36X3mrm1qpLlSmyk9vJw9fbCqsw8EBxyyg
Message-ID: <CAMKF1sqGoDo5Z3UkAS3grag9tqr_MuRpQZSfyXhZVuNJvXmdpQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemuriscv: Enable Sv39 memory address scheme by default
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Yash Shinde <Yash.Shinde@windriver.com>, openembedded-core@lists.openembedded.org, 
	"Ramasamy, Rajeshkumar" <Rajeshkumar.Ramasamy@windriver.com>, Sundeep.Kokkonda@windriver.com, 
	"Hao, Kexin" <Kexin.Hao@windriver.com>, "He, Zhe" <Zhe.He@windriver.com>, 
	Trevor Woerner <twoerner@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 16:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210463

On Wed, Jan 29, 2025 at 11:28=E2=80=AFAM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2025-01-29 7:12 a.m., Yash Shinde wrote:
>
>
> On 29-01-2025 06:08, Alistair Francis wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Wed, Jan 29, 2025 at 1:51=E2=80=AFAM Randy MacLeod via
> lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Add Raj, Khem, Kexin and Zhe who know more about RISC-V than I do.
> Kexin and Zhe are on holiday for a week or more.
> CC a few people who have contributed to riscv* conf.
>
> I am not all that familiar with either qemu internals or riscv specificat=
ions so any input is appreciated.
>
> I have some comments and questions below.
>
> On 2025-01-28 5:16 a.m., Yash.Shinde@windriver.com wrote:
>
> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> Currently, GCC Asan supports only Sv39 on RISC-V due to custom allocator =
configurations optimized for large allocations.
> These configurations are incompatible with larger address spaces like Sv4=
8/Sv57.
> This fix enables RISC-V's configuration for Sv39 by default when running =
`runqemu nographic`,
> eliminating the need for manual configuration via command line flags (`qe=
muparams=3D"-cpu rv64, sv39=3Dtrue"`).
>
> Fixes [YOCTO #15691]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15691
>
> Reference: https://git.openembedded.org/openembedded-core/commit/?id=3D4b=
4450ff695ef73bf7a2437e142d2e0730d6a547
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/ma=
chine/include/riscv/qemuriscv.inc
> index d01d988eee..6170ce65f2 100644
> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> @@ -27,6 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D "0x80200000"
>  # qemuboot options
>  QB_SMP ?=3D "-smp 4"
>  QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
> +QB_CPU =3D "-cpu rv64, sv39=3Dtrue"
>
> Thanks Yash.
>
> To save everyone from doing the math, sv39 gives the system 512 GB virtua=
l address space.
>
> Should we use the ?=3D operator here so that users can easily override th=
is specification
> just as is done for  QB_SMP two lines above?
>
> Please summarize what testing you did.
>
> I tested a buffer overflow case for asan by booting qemuriscv64 and using=
 the command "runqemu nographic",
> without passing any additional qemu parameters, as mentioned in the follo=
w-up message to the patch:
> https://lists.openembedded.org/g/openembedded-core/message/210317
>
> Did you test with TCLIBC=3Dmusl ?
>
> Musl builds for asan are still broken as mentioned earlier in "gcc-saniti=
zers.inc" :
>
> # musl is currently broken entirely
> COMPATIBLE_HOST_libc-musl =3D 'null'
>
> http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/=
gcc/gcc-sanitizers.inc#n88
>
> When built with TCLIBC=3D"musl", following error is seen:
> "gcc-sanitizers RPROVIDES libasan but was skipped: incompatible with host=
 riscv64-poky-linux-musl (not in COMPATIBLE_HOST)"
>
> Since you are changing qemuriscv.inc you and the YP AB should test qemuri=
scv32 and qemuriscv64.
> qemuriscv32 should, if I'm understanding how this works, be unaffected si=
nce it has to use sv32 mode.
>
> As mentioned in the below gcc mailing list, risc-v 32 does not officialy =
support GCC's ASan and some of other 32-bit targets. So, this should not af=
fect it.
> https://gcc.gnu.org/pipermail/gcc-patches/2020-October/557406.html
>
>
> Also, there is no compatible host for riscv-32 in gcc-sanitizers.inc:
> https://git.openembedded.org/openembedded-core/commit/?id=3D7d90d2a70f018=
4ad715e9917d3e7aa096cf98f79
>
> Note: While testing this I found that the "-cpu rv64, sv39=3Dtrue" also p=
asses when building for risc-v 32.
> I will send a V2 where it only applies to risc-v 64.
>
>
> Thanks for duplicating and explaining your testing. I noticed your test e=
mail after I had replied
> to the main thread because you didn't CC me on the testing email. Oops ..=
. on both our parts.
>
> Anyway, this started out being about just GCC ASan but if you're changing=
 qemu's config,
> you'll have to build that emulator and use it a bit before sending in v2.=
  Perhaps run the full
> GCC test suite and say openssl's ptests. The rest of the ptest will likel=
y be run as part of the YP AB
> testing.
>
>
>
> Did you find out why sv39 isn't the default for qemu?
>
> QEMU defaults to the max supported SATP mode. I'm not sure there is a
> specific reason, that's just what we have always done since we allowed
> a user to specify the SATP mode.
>
> Supporting to the above comments, here is the commit that allows users to=
 specify the SATP mode
>
> https://github.com/qemu/qemu/commit/6f23aaeb9be13d4a26b7f863533c316105481=
640
>
> It seems that Risc-V has multiple sizes for addressable memory and Linux =
probes for the machine's support at startup.
> Thus, the reason would be to give the flexibility to users to set it rath=
er than having a fixed default SATP mode.
> The authors/reviewers of the commit can put more light on this topic.
>
> If not, please check the git history and it there isn't an answer there, =
ask one of the qemu developers
> who work on risc-v. It would be nice to have a sentence about that in the=
 commit log.
>
> Did you consider a different RISC-V cpu sub-arch such as rva22s64 ?
>
> I think defaulting to a profile (RVA22S64) would be the way to go,
> that will also enable a known set of extensions.
>
> Alistair
>
>    https://github.com/qemu/qemu/commit/3ba8462c4ca55720239fdc6fa30b9870d2=
2a8814
>
> I'm only asking because it seems like it might be a good fit for us and I=
 noticed it when
> searching the qemu commit logs looking for sv39.
>
> I added  "-cpu rv64,sv39=3Dtrue" options for risc-v by default as mention=
ed in the bug requirements.
>
> The support for RVA22S64 looks good to have  provided that it doesn't bre=
ak other risc-v builds/tests being done in Yocto.
> Following commit adds the RVA22S64 profile and corresponding extensions i=
n qemu.
> https://github.com/qemu/qemu/commit/af651969eb23ecf018bcaa8e0761b58425de5=
50c
>
> I also tested with passing "QB_CPU =3D "-cpu rv64i, rva22s64=3Dtrue""  in=
 qemuriscv.inc file and asan works with that as well.
>
>
> Good.
>
>
>
> I will send a V2 with setting "rva22s64" profile for risc-v 64 only as fo=
llows:
>
> QB_CPU:riscv64 ?=3D "-cpu rv64, rva22s64=3Dtrue"
>
>
> Using the weak operator "?=3D" to allow overrides seems like a good choic=
e at least for now.
>
> Do you really need both
>    "-cpu rv64, rva22s64=3Dtrue"
> rather than just:
>
>    "-cpu rva22s64"
>
> ?


"-cpu rva22s64" directly selects the RVA22S64 processor model as the
complete CPU specification
"-cpu rv64,rva22s64=3Dtrue" starts with a base RV64 processor and
explicitly enables the RVA22S64 extension as an additional feature

The end result should be functionally equivalent - both will give you
a 64-bit RISC-V processor with the RVA22S64 instruction set extension
enabled. The second format with the explicit feature flag is more
verbose but can be useful when you want to be explicit about enabled
features or combine multiple extensions.



>
> Remember, I don't know much about the qemu internals so maybe this is obv=
ious to you.
>
> ../Randy
>
>
>
>
>
> Regards,
> Yash
>
> ../Randy
>
>
>
>
>  QB_MACHINE =3D "-machine virt"
>  QB_DEFAULT_BIOS =3D "fw_jump.elf"
>  QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downscr=
ipt=3Dno"
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210329): https://lists.openembedded.org/g/openembedde=
d-core/message/210329
> Mute This Topic: https://lists.openembedded.org/mt/110856569/3619028
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
istair23@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
> --
> # Randy MacLeod
> # Wind River Linux

