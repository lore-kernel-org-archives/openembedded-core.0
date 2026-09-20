Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BB3C982D7
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 01:38:54 +0000 (UTC)
Received: from mail-yx2-f15.google.com (mail-yx2-f15.google.com [74.125.224.143])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22918.1789868329478252899
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 18:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GH1z6A07;
 spf=pass (domain: gmail.com, ip: 74.125.224.143, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f15.google.com with SMTP id 956f58d0204a3-66e4aae3149so1444424d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 18:38:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789868328; cv=none;
        d=google.com; s=arc-20260327;
        b=nsIRzaxJI+bMWCwHJyz1hHZhTZ5luvKsGO+wOo3lCS3khWI7OXMrN/j6Pp5PY4wFsm
         Ph0Te15YsctqV1bWFqV1R2qjTzYVBkQ3FAT2n6U5kyzwaDGnyTz4rxvXjUY2XrIjwSXH
         d2CLSGI7Dtu917oa2Ph0udIeOPzc1//Spvo5h0lmSPZeBX8/oue9r3lcssQIJ5+Elgqy
         w3T9Wm1txmJMmlwJgZdP0wpwK3wmXzIc0IYhthpL6xA0gyQFZMEdsfoHOtr1sndOJJwu
         HQGPM2mwY2ref8rKRh3VNmXlldNdbUcOm0dEPH2U4xrdi2qcdxH13iM+eeKfVq4CwWCD
         nzgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cMkK1iiaFK5NdzZ6LildL+pV5Yv+k0kaps9SYM8EDD0=;
        fh=2tRbkh9USu5x3C+6pK/CbohOrqrZJdfRQMueNE2H0s4=;
        b=raoJtWJhi0nv6mFRER2+wex1iApLaz8NlYItSGKbv4Ufn+o+hQjgcrxKsJ1oO9OqLV
         bEXSLxQKiftR2/AJQnTxFEr7Sm6srnfU0IxWFc6haNEwJZFDK2BLGeZDhfEiW5U7EP4x
         F81pF2AISj1Wqx3a5BpmRyb0BeykAnfXEeRAPRfwPGYs/oZZlrkrcacF9jY/2siA9SAK
         0WKBLoKEcRgtQM5M7Ak1XYAulMCp/Hd2mThQq56UumYlVjmydehZljBKZd5nSkUixPWN
         USe05qevScf1kMJomtx1QlkLFYeyEZbMjB3emNCv41s4DHc5yOcVDmJu6EqkVCnNDQeA
         ZirQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789868328; x=1790473128; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMkK1iiaFK5NdzZ6LildL+pV5Yv+k0kaps9SYM8EDD0=;
        b=GH1z6A07UF0ID48NjMlqH77dElQ4ThwK8ZrfJSzg47uCEv4/l88gvQa6m0oJYqRPc/
         CPo+mr/YFhBuuxGhXmz7+kEVildXy04WWuNTH9xdPTOF8VyeuexIXRL3xQgBc/VhZOmO
         sXFLFC4PykqEFOKBZYkk7z8xb8pKNEQTzQ8eanyFvm4eCjCB/oKN8LzvNggpZmg1keo4
         aIZcFG9Tu/NPWfx/gX1Di/1IkvH0T3fowvwlRl71TKwDNdxAxTGV76NLP43m3WQF+wP6
         8X3/iM94s1ln/cSWhnVucej9WwBWgvbowVAoXO9fFAxrvjiF0MG6HVcBBC+Cd+k0PWrU
         7vAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789868328; x=1790473128;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cMkK1iiaFK5NdzZ6LildL+pV5Yv+k0kaps9SYM8EDD0=;
        b=HCqGmnWAGiJuWmF7yaRNf9N9RhGyrFP9l3xaQxJVllAccvlClwwpkpeVjl627cFwND
         iG24GZ2PvinKtrm7ci54J6HhJvoXF1qdld4IF7KlvawpIIr9naU26a9jVcuRHdwWv7sW
         QcssRNWDVLViu1+QTG2UVA2P6AGlaZgo2RucPd/jJ4oEedYR36IZEtrhZ+Rp7iyzjVDX
         MoRfmgBqX8BsGUnpWGaeluQj+7QQ7CaNBpowdKDEubdFsIAxm9msTb7BXXX1wgOh9KN8
         8uR2Un6p4HnpuBCUxAAAdoQYmYvtSzsuhfqS4THu+R4HOjqSXe+0dOe0A3fCnvn78dJO
         iddA==
X-Gm-Message-State: AFuF++nXeKwBUPkTnH8uwmZ04SK6zogsUaPKYvd98APwoAKS0HhpG10b
	JJZtgsLdNWWRnGLtnnnRAEf4NSfweAAMQuTP6ebV8M9Uq+hnu7xSEB6SxDe7pMIRNLddrErEEMa
	nmCUHBiW00Yv5qyA2s4Q2Cral9W1jqe3y/woJ
X-Gm-Gg: AYBFou3GG89R1XPVeTIrhFqKZc21DhgOKvJ8IDVf0W+hke3s+pgP2K4VbaqrmDugM5C
	0wQSfA7aS8nX6hePEusBT9w2Ml3qJXTP7e+TkojtwpzeQ1uNn7GcsVXrl5omeLcuq0a1izsKmfX
	UyUASN+DFGAw4QuJK/F71g2cjVI8fh/AhOfYlnUiWrIcprq+a6SVFthkaLVrcnuiU8ZcqELoX9i
	wDGzr3NZsd1T9ENEPSv0yhR2/mtuyX97JSm2kZ5D4JLSRM/+A0t87QgUR2bpL9jddwtI47MD/sS
	cTKA4gbW13lP5SD0mwvBU8XttVwsbu6UsgH4gtc2ql9NXUlMQINwWVss7ELu86Ak1bBkUsegqm0
	oFyR7iR41D6c3iy55PIi+SARiUny+CyKrB/dhkNANc/SoI0GaTggWJSE5WnDP4hAtPYB9MyvBqu
	7LEHm3Ec+XDuoD2zBQzApuXYiPzQsO4fb8LjTg6dGedml+23iNR2AwTEiGZy9eGQcK7Zfeb3QWO
	gxsYD5lQ17RJ4a30qvETfUxE/FTRKDUeV90Ul7a58EuB/sny80ud4jw0po=
X-Received: by 2002:a05:690e:d83:b0:671:70d1:d6df with SMTP id
 956f58d0204a3-6717fe43305mr1759721d50.81.1789868328440; Sat, 19 Sep 2026
 18:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260915190244.2983746-1-tgamblin@baylibre.com> <20260915190244.2983746-10-tgamblin@baylibre.com>
In-Reply-To: <20260915190244.2983746-10-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Sep 2026 18:38:22 -0700
X-Gm-Features: AcwNN1XxFaovF6MWPa7RNImfWpanKpE0u-sAa2k8ccBNSODy3kS03pGqfJMWfIU
Message-ID: <CAMKF1sr4Vh6x6jqnGMLS8CPw43dBPcKXSGjZ6Uh-8_bSCWReGQ@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH 09/14] arch-riscv.inc: add rva23u64 extensions
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="000000000000e95870065be0313c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 01:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246253

--000000000000e95870065be0313c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 12:03=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.=
com>
wrote:

> gcc reports the following extension string for '-march=3Drva32u64':
>
> |tgamblin@megalith
> ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedded-core (master)$
> riscv64-linux-gnu-gcc -march=3Drva23u64 -mabi=3Dlp64d -Q --help=3Dtarget =
| grep
> rv64
> |  -march=3D
>  rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse=
_zicntr_zicond_zicsr_zihintntl_zihintpause_zihpm_zimop_zmmul_za64rs_zaamo_z=
alrsc_zawrs_zfa_zfhmin_zca_zcb_zcd_zcmop_zba_zbb_zbs_zkt_zvbb_zve32f_zve32x=
_zve64d_zve64f_zve64x_zvfhmin_z
>
> Add the following extensions to complete the profile:
>
> - zawrs
> - zcb
> - zcmop
> - zfa
> - zicond
> - zihintntl
> - zihpm
> - zimop
> - zvbb
> - zve32f
> - zve32x
> - zve64d
> - zve64f
> - zve64x
>


commit message: says -march=3Drva32u64 (typo), and its bullet list omits
zvfhmin zvkb zvkt zvl32b zvl64b zvl128b supm
which the patch does add.


>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../conf/machine/include/riscv/arch-riscv.inc | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>
> diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc
> b/meta/conf/machine/include/riscv/arch-riscv.inc
> index c05cdf8c21..e60b88fe44 100644
> --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> @@ -118,6 +118,10 @@ TUNEVALID[zicntr] =3D "Cycle and instruction countin=
g
> for profiling extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zicntr",
> "_zicntr", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zicntr",
> "_zicntr", "", d)}"
>
> +TUNEVALID[zicond] =3D "Conditional zeroing operations extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zicond",
> "_zicond", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zicond",
> "_zicond", "", d)}"
> +
>  TUNEVALID[zicsr] =3D "Control and status register access extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr =
f
> d", "_zicsr", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zics=
r f
> d", "_zicsr", "", d)}"
> @@ -126,10 +130,22 @@ TUNEVALID[zifencei] =3D "Instruction-fetch fence
> extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zifencei",
> "_zifencei", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zifencei=
",
> "_zifencei", "", d)}"
>
> +TUNEVALID[zihintntl] =3D "Non-temporal locality hints extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zihintntl"=
,
> "_zihintntl", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zihintnt=
l",
> "_zihintntl", "", d)}"
> +
>  TUNEVALID[zihintpause] =3D "Pause hint extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zihintpaus=
e",
> "_zihintpause", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "zihintpause", "_zihintpause", "", d)}"
>
> +TUNEVALID[zihpm] =3D "Hardware performance counters extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zihpm",
> "_zihpm", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zihpm",
> "_zihpm", "", d)}"
> +
> +TUNEVALID[zimop] =3D "Hardware performance counters extension."
>

copy/paste from zihpm. Should be May-Be-Operations.


> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zimop",
> "_zimop", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zimop",
> "_zimop", "", d)}"
> +
>  TUNEVALID[zmmul] =3D "Cheaper M subset (mul only) extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m zmmul",
> "_zmmul", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m zmmul"=
,
> "_zmmul", "", d)}"
> @@ -150,6 +166,14 @@ TUNEVALID[zalrsc] =3D "Extended LR/SC semantics
> extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc",
> "_zalrsc", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc=
",
> "_zalrsc", "", d)}"
>
> +TUNEVALID[zawrs] =3D "Wait-on-reservation-set instructions extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zawrs",
> "_zawrs", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zawrs",
> "_zawrs", "", d)}"
> +
> +TUNEVALID[zfa] =3D "Additional floating point instructions extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zfa", "_zf=
a",
> "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zfa",
> "_zfa", "", d)}"
> +
>  TUNEVALID[zfhmin] =3D "Minimal half-precision floating point extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zfhmin",
> "_zfhmin", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zfhmin",
> "_zfhmin", "", d)}"
> @@ -158,10 +182,18 @@ TUNEVALID[zca] =3D "Compressed base integer ops
> extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "c zca",
> "_zca", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "c zca",
> "_zca", "", d)}"
>
> +TUNEVALID[zcb] =3D "Extra compressed integer ops extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zcb", "_zc=
b",
> "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zcb",
> "_zcb", "", d)}"
> +
>  TUNEVALID[zcd] =3D "16-bit encodings for 64-bit FP extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zcd", "_zc=
d",
> "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zcd",
> "_zcd", "", d)}"
>
> +TUNEVALID[zcmop] =3D "Compressed may-be-ops extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zcmop",
> "_zcmop", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zcmop",
> "_zcmop", "", d)}"
> +
>  TUNEVALID[zba] =3D "Address bit manipulation extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zba"=
,
> "_zba", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zb=
a",
> "_zba", "", d)}"
> @@ -182,6 +214,58 @@ TUNEVALID[zkt] =3D "Data-independent execution laten=
cy
> extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zkt"=
,
> "_zkt", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zk=
t",
> "_zkt", "", d)}"
>
> +TUNEVALID[zvbb] =3D "Vector basic bit-manipulation extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvbb",
> "_zvbb", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvbb=
",
> "_zvbb", "", d)}"
> +
> +TUNEVALID[zve32f] =3D "Embedded vector computation (32-bit integer, 32-b=
it
> FP) extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zve32f=
",
> "_zve32f", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zve32f", "_zve32f", "", d)}"
> +
> +TUNEVALID[zve32x] =3D "Embedded vector computation (32-bit integer)
> extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zve32x=
",
> "_zve32x", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zve32x", "_zve32x", "", d)}"
> +
> +TUNEVALID[zve64d] =3D "Embedded vector computation (64-bit integer, 64-b=
it
> FP) extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zve64d=
",
> "_zve64d", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zve64d", "_zve64d", "", d)}"
> +
> +TUNEVALID[zve64f] =3D "Embedded vector computation (64-bit integer, 32-b=
it
> FP) extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zve64f=
",
> "_zve64f", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zve64f", "_zve64f", "", d)}"
> +
> +TUNEVALID[zve64x] =3D "Embedded vector computation (64-bit integer)
> extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zve64x=
",
> "_zve64x", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zve64x", "_zve64x", "", d)}"
> +
> +TUNEVALID[zvfhmin] =3D "Vector half-precision minimal extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvfhmi=
n",
> "_zvfhmin", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zvfhmin", "_zvfhmin", "", d)}"
> +
> +TUNEVALID[zvkb] =3D "Vector cryptography bit-manipulation extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvkb",
> "_zvkb", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvkb=
",
> "_zvkb", "", d)}"
> +
> +TUNEVALID[zvkt] =3D "Vector data independent execution latency extension=
."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvkt",
> "_zvkt", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvkt=
",
> "_zvkt", "", d)}"
> +
> +TUNEVALID[zvl128b] =3D "Minimum vector length standard extensions
> (128-bit)."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvl128=
b",
> "_zvl128b", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zvl128b", "_zvl128b", "", d)}"
> +
> +TUNEVALID[zvl32b] =3D "Minimum vector length standard extensions (32-bit=
)."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvl32b=
",
> "_zvl32b", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zvl32b", "_zvl32b", "", d)}"
> +
> +TUNEVALID[zvl64b] =3D "Minimum vector length standard extensions (64-bit=
)."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvl64b=
",
> "_zvl64b", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zvl64b", "_zvl64b", "", d)}"
> +
> +TUNEVALID[supm] =3D "User-mode pointer masking extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "supm",
> "_supm", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "supm=
",
> "_supm", "", d)}"
> +
>  # Construct TUNE_CCARGS
>  # This should result in a CCARG similar to:
>  #   -march=3Drv32imac -mabi=3Dilp32
> --
> 2.55.0
>
>

--000000000000e95870065be0313c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 15,=
 2026 at 12:03=E2=80=AFPM Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@bay=
libre.com">tgamblin@baylibre.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">gcc reports the following extension string=
 for &#39;-march=3Drva32u64&#39;:<br>
<br>
|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedde=
d-core (master)$ riscv64-linux-gnu-gcc -march=3Drva23u64 -mabi=3Dlp64d -Q -=
-help=3Dtarget | grep rv64<br>
|=C2=A0 -march=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rv64imafdcbv_zic64b_=
zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicond_zicsr_zi=
hintntl_zihintpause_zihpm_zimop_zmmul_za64rs_zaamo_zalrsc_zawrs_zfa_zfhmin_=
zca_zcb_zcd_zcmop_zba_zbb_zbs_zkt_zvbb_zve32f_zve32x_zve64d_zve64f_zve64x_z=
vfhmin_z<br>
<br>
Add the following extensions to complete the profile:<br>
<br>
- zawrs<br>
- zcb<br>
- zcmop<br>
- zfa<br>
- zicond<br>
- zihintntl<br>
- zihpm<br>
- zimop<br>
- zvbb<br>
- zve32f<br>
- zve32x<br>
- zve64d<br>
- zve64f<br>
- zve64x<br></blockquote><div><br></div><div><br></div><div>commit message:=
 says -march=3Drva32u64 (typo), and its bullet list omits zvfhmin zvkb zvkt=
 zvl32b zvl64b zvl128b supm</div><div>which the patch does add.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" =
target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
---<br>
=C2=A0.../conf/machine/include/riscv/arch-riscv.inc | 84 ++++++++++++++++++=
+<br>
=C2=A01 file changed, 84 insertions(+)<br>
<br>
diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/mac=
hine/include/riscv/arch-riscv.inc<br>
index c05cdf8c21..e60b88fe44 100644<br>
--- a/meta/conf/machine/include/riscv/arch-riscv.inc<br>
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc<br>
@@ -118,6 +118,10 @@ TUNEVALID[zicntr] =3D &quot;Cycle and instruction coun=
ting for profiling extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zicntr&quot;, &quot;_zicntr&quot;, &quot;&quot;, d)}&quot;<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURE=
S&quot;, &quot;zicntr&quot;, &quot;_zicntr&quot;, &quot;&quot;, d)}&quot;<b=
r>
<br>
+TUNEVALID[zicond] =3D &quot;Conditional zeroing operations extension.&quot=
;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;zicond&quot;, &quot;_zicond&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zicond&quot;, &quot;_zicond&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
=C2=A0TUNEVALID[zicsr] =3D &quot;Control and status register access extensi=
on&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zicsr f d&quot;, &quot;_zicsr&quot;, &quot;&quot;, d)}&quo=
t;<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEA=
TURES&quot;, &quot;zicsr f d&quot;, &quot;_zicsr&quot;, &quot;&quot;, d)}&q=
uot;<br>
@@ -126,10 +130,22 @@ TUNEVALID[zifencei] =3D &quot;Instruction-fetch fence=
 extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zifencei&quot;, &quot;_zifencei&quot;, &quot;&quot;, d)}&quot;=
<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURE=
S&quot;, &quot;zifencei&quot;, &quot;_zifencei&quot;, &quot;&quot;, d)}&quo=
t;<br>
<br>
+TUNEVALID[zihintntl] =3D &quot;Non-temporal locality hints extension.&quot=
;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;zihintntl&quot;, &quot;_zihintntl&quot;, &quot;&quot;, d)}&quot;<br=
>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zihintntl&quot;, &quot;_zihintntl&quot;, &quot;&quot;, d)}&quot;<=
br>
+<br>
=C2=A0TUNEVALID[zihintpause] =3D &quot;Pause hint extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zihintpause&quot;, &quot;_zihintpause&quot;, &quot;&quot;, d)}=
&quot;<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURE=
S&quot;, &quot;zihintpause&quot;, &quot;_zihintpause&quot;, &quot;&quot;, d=
)}&quot;<br>
<br>
+TUNEVALID[zihpm] =3D &quot;Hardware performance counters extension.&quot;<=
br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;zihpm&quot;, &quot;_zihpm&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zihpm&quot;, &quot;_zihpm&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
+TUNEVALID[zimop] =3D &quot;Hardware performance counters extension.&quot;<=
br></blockquote><div><br></div><div>copy/paste from zihpm. Should be May-Be=
-Operations.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;zimop&quot;, &quot;_zimop&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zimop&quot;, &quot;_zimop&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
=C2=A0TUNEVALID[zmmul] =3D &quot;Cheaper M subset (mul only) extension.&quo=
t;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;m zmmul&quot;, &quot;_zmmul&quot;, &quot;&quot;, d)}&quot;<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURE=
S&quot;, &quot;m zmmul&quot;, &quot;_zmmul&quot;, &quot;&quot;, d)}&quot;<b=
r>
@@ -150,6 +166,14 @@ TUNEVALID[zalrsc] =3D &quot;Extended LR/SC semantics e=
xtension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;a zalrsc&quot;, &quot;_zalrsc&quot;, &quot;&quot;, d)}&quot;<b=
r>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURE=
S&quot;, &quot;a zalrsc&quot;, &quot;_zalrsc&quot;, &quot;&quot;, d)}&quot;=
<br>
<br>
+TUNEVALID[zawrs] =3D &quot;Wait-on-reservation-set instructions extension.=
&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;zawrs&quot;, &quot;_zawrs&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zawrs&quot;, &quot;_zawrs&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
+TUNEVALID[zfa] =3D &quot;Additional floating point instructions extension.=
&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;zfa&quot;, &quot;_zfa&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zfa&quot;, &quot;_zfa&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
=C2=A0TUNEVALID[zfhmin] =3D &quot;Minimal half-precision floating point ext=
ension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zfhmin&quot;, &quot;_zfhmin&quot;, &quot;&quot;, d)}&quot;<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURE=
S&quot;, &quot;zfhmin&quot;, &quot;_zfhmin&quot;, &quot;&quot;, d)}&quot;<b=
r>
@@ -158,10 +182,18 @@ TUNEVALID[zca] =3D &quot;Compressed base integer ops =
extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;c zca&quot;, &quot;_zca&quot;, &quot;&quot;, d)}&quot;<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURE=
S&quot;, &quot;c zca&quot;, &quot;_zca&quot;, &quot;&quot;, d)}&quot;<br>
<br>
+TUNEVALID[zcb] =3D &quot;Extra compressed integer ops extension.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;zcb&quot;, &quot;_zcb&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zcb&quot;, &quot;_zcb&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
=C2=A0TUNEVALID[zcd] =3D &quot;16-bit encodings for 64-bit FP extension.&qu=
ot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zcd&quot;, &quot;_zcd&quot;, &quot;&quot;, d)}&quot;<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURE=
S&quot;, &quot;zcd&quot;, &quot;_zcd&quot;, &quot;&quot;, d)}&quot;<br>
<br>
+TUNEVALID[zcmop] =3D &quot;Compressed may-be-ops extension.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;zcmop&quot;, &quot;_zcmop&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zcmop&quot;, &quot;_zcmop&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
=C2=A0TUNEVALID[zba] =3D &quot;Address bit manipulation extension&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;b zba&quot;, &quot;_zba&quot;, &quot;&quot;, d)}&quot;<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEA=
TURES&quot;, &quot;b zba&quot;, &quot;_zba&quot;, &quot;&quot;, d)}&quot;<b=
r>
@@ -182,6 +214,58 @@ TUNEVALID[zkt] =3D &quot;Data-independent execution la=
tency extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;b zkt&quot;, &quot;_zkt&quot;, &quot;&quot;, d)}&quot;<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEA=
TURES&quot;, &quot;b zkt&quot;, &quot;_zkt&quot;, &quot;&quot;, d)}&quot;<b=
r>
<br>
+TUNEVALID[zvbb] =3D &quot;Vector basic bit-manipulation extension.&quot;<b=
r>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;zvbb&quot;, &quot;_zvbb&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zvbb&quot;, &quot;_zvbb&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
+TUNEVALID[zve32f] =3D &quot;Embedded vector computation (32-bit integer, 3=
2-bit FP) extension.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;zve32f&quot;, &quot;_zve32f&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zve32f&quot;, &quot;_zve32f&quot;, &quot;&quot;, d)}&quot;<br=
>
+<br>
+TUNEVALID[zve32x] =3D &quot;Embedded vector computation (32-bit integer) e=
xtension.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;zve32x&quot;, &quot;_zve32x&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zve32x&quot;, &quot;_zve32x&quot;, &quot;&quot;, d)}&quot;<br=
>
+<br>
+TUNEVALID[zve64d] =3D &quot;Embedded vector computation (64-bit integer, 6=
4-bit FP) extension.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;zve64d&quot;, &quot;_zve64d&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zve64d&quot;, &quot;_zve64d&quot;, &quot;&quot;, d)}&quot;<br=
>
+<br>
+TUNEVALID[zve64f] =3D &quot;Embedded vector computation (64-bit integer, 3=
2-bit FP) extension.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;zve64f&quot;, &quot;_zve64f&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zve64f&quot;, &quot;_zve64f&quot;, &quot;&quot;, d)}&quot;<br=
>
+<br>
+TUNEVALID[zve64x] =3D &quot;Embedded vector computation (64-bit integer) e=
xtension.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;zve64x&quot;, &quot;_zve64x&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zve64x&quot;, &quot;_zve64x&quot;, &quot;&quot;, d)}&quot;<br=
>
+<br>
+TUNEVALID[zvfhmin] =3D &quot;Vector half-precision minimal extension.&quot=
;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;zvfhmin&quot;, &quot;_zvfhmin&quot;, &quot;&quot;, d)}&quot;<br=
>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zvfhmin&quot;, &quot;_zvfhmin&quot;, &quot;&quot;, d)}&quot;<=
br>
+<br>
+TUNEVALID[zvkb] =3D &quot;Vector cryptography bit-manipulation extension.&=
quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;zvkb&quot;, &quot;_zvkb&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zvkb&quot;, &quot;_zvkb&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
+TUNEVALID[zvkt] =3D &quot;Vector data independent execution latency extens=
ion.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;zvkt&quot;, &quot;_zvkt&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zvkt&quot;, &quot;_zvkt&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
+TUNEVALID[zvl128b] =3D &quot;Minimum vector length standard extensions (12=
8-bit).&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;zvl128b&quot;, &quot;_zvl128b&quot;, &quot;&quot;, d)}&quot;<br=
>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zvl128b&quot;, &quot;_zvl128b&quot;, &quot;&quot;, d)}&quot;<=
br>
+<br>
+TUNEVALID[zvl32b] =3D &quot;Minimum vector length standard extensions (32-=
bit).&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;zvl32b&quot;, &quot;_zvl32b&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zvl32b&quot;, &quot;_zvl32b&quot;, &quot;&quot;, d)}&quot;<br=
>
+<br>
+TUNEVALID[zvl64b] =3D &quot;Minimum vector length standard extensions (64-=
bit).&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;zvl64b&quot;, &quot;_zvl64b&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zvl64b&quot;, &quot;_zvl64b&quot;, &quot;&quot;, d)}&quot;<br=
>
+<br>
+TUNEVALID[supm] =3D &quot;User-mode pointer masking extension.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;supm&quot;, &quot;_supm&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;supm&quot;, &quot;_supm&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
=C2=A0# Construct TUNE_CCARGS<br>
=C2=A0# This should result in a CCARG similar to:<br>
=C2=A0#=C2=A0 =C2=A0-march=3Drv32imac -mabi=3Dilp32<br>
-- <br>
2.55.0<br>
<br>
</blockquote></div></div>

--000000000000e95870065be0313c--

