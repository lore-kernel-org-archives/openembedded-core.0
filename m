Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F78C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 23:37:36 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1213.1787960249297485538
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 16:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XQsXIoql;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81ee6b2da98so24143897b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 16:37:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787960248; cv=none;
        d=google.com; s=arc-20260327;
        b=Rz0CBXxvAk6VlQ09jV2WKJqqBHQQ3AZAixmvgBlpuUteR++J3e7+px2o54CthuavOO
         TPDIdw/D9M2Shg+nojykFwvHu7knDUtSmuVWu85qHF1pkSI4t04QOujhTdCi7d0zLmAr
         3IsE06EyQkeaEdFHHU97yNGBt4MAQ8wrQiaLE5Nen3J48uvnPYW+GegXg7OCVZFTd66j
         gLSRQIlJhmqBwlA6WeVH9+eEk4DQnf+rQAofEvZif55WD7RX0hRDYTfJmH3Wcq7Kg4+L
         JOz+qsbdpbqrzegeEeYJUP1u4rjwJLuuM1QciwO5gW2kKHZ9lLoPWddwxs0EVRXEOl+0
         gayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9+MOHz/ADa2o52OSuxQsh8r8FnJ2lzVfWWuLY0JcMhY=;
        fh=7+LO5g2386gipOMobn/osmdMWhTo5OJ9aLgl5Q75HYU=;
        b=IIRCZ3YqErMAzVdMhvzpX7YMsZ75p7/LyUNJePbG9gKrYO6nRFMGW/mpAmsMqMSJGO
         83xwqSwrelD9ZFHSDixrkwunJe6509uZeqeUK3N44guyOOUkfDP+oAzK48rnwkysOYtP
         yiYs2gcB/919HKp05KCxN+xPJPJ8XHtuAQLZ0u9blSVDQkwy5TDRpdUh1jnbxiLxgB6s
         VnEtKvPpSDEO/xXfwFqzL1+3er+6y6D2BfHtmFti8fALP9ClmI6LnDgrb5z2guFjfnuC
         o7nHmmiskLLo+i5mqNqDOugQlf86QC3SxLZrolTPDj0yiXN39f1XTQWZIxTLaw/DKtny
         UFRw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787960248; x=1788565048; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+MOHz/ADa2o52OSuxQsh8r8FnJ2lzVfWWuLY0JcMhY=;
        b=XQsXIoqlUU2rWLngjmMWnzX+3vsnqcqnZFZAdqQjW934ysKYpaTc4+QZVjToELyG3Z
         0VSNeqtqKBcvc/wrG7A7bOu8h6/E0sQ4FKDgsqgQ2XC+7tjQg6b+//3NJIeE+qIY3zOl
         PBcDROyErdKaWG5p4eWLIu/qdwfkL3hnM0VLn2gaNQUAya58Ku0ggh1MuJ8uIlLjzOGv
         KpBTOjgNaPZnOUDnl5YpfKHSe5QNrbd2kL7KH4zYO3rRP+mOdsQE4tgfHLn33Ico5CN8
         SsaR2tv6CucfDbh54Vr+305HbJY9pvjQP6KdQX6kgn2EdHiWRHoTaF5bWjsK3JiH4VFq
         gY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787960248; x=1788565048;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9+MOHz/ADa2o52OSuxQsh8r8FnJ2lzVfWWuLY0JcMhY=;
        b=lKaeA95/EP2a9JXyj9TONzPYp2P4HVc7Ro0xJSV1jdxOkHa+FGViv1bnmhCUUw+qV0
         WQRn3B4umVoAMOve2mtFbwHr06oZ7H5v3vS4pRzKPC7W2MCWqzVwr62pZhoc0X/i9IEm
         ZelrHiHBSH+sbCRg/2jTqcj9p/53sYP9H6nc+34HWk1RcVEDvik/8/w/v49gND+fRWHK
         ibPYWg2nwKbL6caqUPQl/Mm87EoJbWDMMz8hQeHH6HK8/4KCQyx2wYFpEd4g/BiAWGU9
         qUQ5ZNuqYUlUwRigLR9bJZiIan8JkbfFqI5Qb9jTQttgPe7vjZlGJWm5kYI3ONxof8cW
         MhPw==
X-Gm-Message-State: AFuF++lx+Dcv9J5C7urM10n3RQQl47HEp8mtH9tW8FFJQvzwdfqSHK+z
	NPClQczpVNKGyM77gpTy3cMECueDmXaoa7MBS2ZGhboM3rRX76/sa+PlYGQBAT3LMuC00g/W8mq
	8bgdze3Hzstl89Oy+hzmixPTYEQoZZAM=
X-Gm-Gg: AYBFou1MNxZ5lHtcNbPiEQj8PpSKM61/6AfkXSA+4BlXcR7EaVCf37ZisgKQHVSxApj
	HpBhksalqPbwKlwMQMq76tdp8RZbhOqhpZt45ByykjMV7pYhRAaFCbKwS0Aw6tnM+nPbJ5pnm6j
	D+TAvRvH0ZAxGmFwtP3KCkVccVQ9URu0e6TJgkTiQQL1UzDHs7iGAalA2IzvdZ4ttN5iF5ea//t
	H7ZzEOlwqlwO3/zly+nOPs2mawaUls37TCxKP+XpqkJwdVolULUsulMbmQUZ120eE1+//EE5X/f
	U91VmV2LjuCdbr7Q7aO5GD1Ux/4qOHJnlyElfUNE4Uj8Kf4FdM7Go3hu18ENQANu5f302DpER+u
	YV7DvajoRyd8dllZgq0oJ/9YhJs9ToL6i6ciT7IXr1IZiK9pkzaJXqqF9eC1m8wdIyO28h9/qWz
	W+IP6jWZ5s1TfiEIr/ohRyj0FSIJgnlFI0QXO0DQOT6za0rMUrCKw0InZZNknKNDE3jpb/eU4qi
	tOJ9XeKIYS5Ry/MIS0ggt55PW/9BEEf1KeygPqwVXtdk/pj
X-Received: by 2002:a05:690c:ed2:b0:81c:b834:47de with SMTP id
 00721157ae682-85d6cdc685dmr51529377b3.18.1787960243599; Fri, 28 Aug 2026
 16:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <DS0PR11MB7901641887C85593E522BD3BE0AC2@DS0PR11MB7901.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB7901641887C85593E522BD3BE0AC2@DS0PR11MB7901.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Aug 2026 16:36:56 -0700
X-Gm-Features: AcwNN1U3GviyNtGAXx4oC_Ojst8yn7LQDQfDYS4Pv6AwSfwiKJpoDqXMxLhNOfc
Message-ID: <CAMKF1sqVLefx-rJ_vdBAWqNaLtAjykHKb47EL9jttKfxcmKwcw@mail.gmail.com>
Subject: Re: clang/llvm 23.1.0 upgrade for oe-core
To: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"Varatharajan, Deepesh" <Deepesh.Varatharajan@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000313cfb065a23ef2e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 23:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244620

--000000000000313cfb065a23ef2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for working on this Sunil. There are some recipes in meta-oe layers
which depend on clang e.g. perfetto, bcc etc. would be good to try them out
as well.

On Fri, Aug 28, 2026 at 9:47=E2=80=AFAM Dora, Sunil Kumar <
SunilKumar.Dora@windriver.com> wrote:

> Hi all,
>
> I have been working on the clang/llvm upgrade to 23.1.0 for oe-core.
> It is close to ready and I plan to send the series tomorrow.
>
> What it covers:
>
> - clang/llvm 22.1.8 to 23.1.0. The carried LLVM patch stack goes from
>   41 to 34. Seven are upstream or no longer needed, and three needed
>   rework for changes in LLVM 23.
> - spirv-llvm-translator moves to its LLVM 23 branch.
> - openmp builds through the runtimes entry point, since LLVM 23 removed
>   the standalone build mode.
> - rust needs upstream test fixes for LLVM 23, and one change to stop
>   passing the x86 amx-tf32 feature that LLVM 23 removed.
> - pango, ovmf, vulkan-samples and gettext need small fixes to build
>   with clang 23.
> - a few clang and LLVM tests are added to the exclusion list.
>
> *Testing:*
> - oe-selftest on the autobuilder for qemuarm, qemuarm64, qemux86,
>   qemux86-64 and qemuriscv64. That runs the clang, lld and LLVM test
>   suites on the target.
> - clang family, rust and core-image-minimal build from scratch.
> - The series also passed multilib, testimage, SDK and TOOLCHAIN=3Dclang
> builds.
>
> I would like to go through the patches once more before posting,
> So I plan to send the series shortly.
>
> Thanks,
> Sunil Dora
>

--000000000000313cfb065a23ef2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for working=C2=A0on this Sunil. There are some reci=
pes=C2=A0in meta-oe layers which depend on clang e.g. perfetto, bcc etc. wo=
uld be good to try them out as well.</div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 28, 2=
026 at 9:47=E2=80=AFAM Dora, Sunil Kumar &lt;<a href=3D"mailto:SunilKumar.D=
ora@windriver.com">SunilKumar.Dora@windriver.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-756807953=
809251349">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Hi all,</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
I have been working on the clang/llvm upgrade to 23.1.0 for oe-core.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
It is close to ready and I plan to send the series tomorrow.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
What it covers:</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
- clang/llvm 22.1.8 to 23.1.0. The carried LLVM patch stack goes from</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
=C2=A0 41 to 34. Seven are upstream or no longer needed, and three needed</=
div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
=C2=A0 rework for changes in LLVM 23.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
- spirv-llvm-translator moves to its LLVM 23 branch.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
- openmp builds through the runtimes entry point, since LLVM 23 removed</di=
v>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
=C2=A0 the standalone build mode.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
- rust needs upstream test fixes for LLVM 23, and one change to stop</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
=C2=A0 passing the x86 amx-tf32 feature that LLVM 23 removed.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
- pango, ovmf, vulkan-samples and gettext need small fixes to build</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
=C2=A0 with clang 23.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
- a few clang and LLVM tests are added to the exclusion list.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<b>Testing:</b></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
- oe-selftest on the autobuilder for qemuarm, qemuarm64, qemux86,</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
=C2=A0 qemux86-64 and qemuriscv64. That runs the clang, lld and LLVM test</=
div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
=C2=A0 suites on the target.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
- clang family, rust and core-image-minimal build from scratch.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
- The series also passed multilib, testimage, SDK and TOOLCHAIN=3Dclang bui=
lds.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
I would like to go through the patches once more before posting,</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
So I plan to send the series shortly.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Sunil Dora</div>
</div>

</div></blockquote></div>

--000000000000313cfb065a23ef2e--

