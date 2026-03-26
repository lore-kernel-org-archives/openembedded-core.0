Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADA210A88C8
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:19:14 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50919.1774538352401454277
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gR0HuKN/;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79a8e873ca1so27281297b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 08:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774538351; cv=none;
        d=google.com; s=arc-20240605;
        b=USLVjfesEzPG+iXCGrufzy8zRhdFmwtelPSwxYU9p577coDUL965GrLsw1+464h+zU
         LbZsWHI1xFGv78qtA0wJbK09dZUE1XHA/Sx5JstdcHFkHQEMTe+MYI5NnDaPrKAGz+7l
         WtAaOj8VTacvTm1ygm0IAWK4wlLR3aK14Y/PSh6wuGamx17A8wM9s0djVr1tsIud3A/8
         IERyh6Rrpj7a/Htz7pjzGk3V+15+7arQUj/XpopU+RUwUGkuxpnrIDkI86XQhr6Zvl2u
         21fAhkShoiJm0cOIH3mwil4s7xuGZXfsrEEr0k9z/lNzWNNNuRzlkAP2ATxYZQteICB1
         5ezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5uPMzh5VIL9zBbSS9+QORHZhnF3eOlFdM/G0TnTEBR4=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=eR8omzIj0vPxGMQToIHLvy0QVzJrGTflQtMP6WX3R5fdNJWTQxTIEjgnpowGEx7NAI
         DBZb+zdRl48BWSThf3Iyf95Q8n4z+UFOX4U71C80AD7RRC5EH1DF28Ej0w58rdtKBW65
         SDWPMWFXN6cmGZdsCwMzgJ9MPdtxujT87//bbQQJ18GJH6Dg6xaaHC2zzqQsTodhxPEN
         cOK7MYsVwkUq0Mcgi/LslRwn5c8hFA566EiDIwECUsn7DugyvnJkm7jY3vTlO3j3lpW5
         4jKYIwQQS9yg4z+WadV7OcpLpmm9xXWtRIM52sxUCQe7DbGhaZrMVxJ8+YeI4Nb54yFz
         EGWw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538351; x=1775143151; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5uPMzh5VIL9zBbSS9+QORHZhnF3eOlFdM/G0TnTEBR4=;
        b=gR0HuKN/HQngT97hv1JvPebZOXWUEIx81H+ZNCxCvSsQxe8aAdJM7//9G9h506a5sm
         CHGElh/d9Qec35VfNdIZw/3Nl/fGkyIHB4mpXLFn7Bcn3vfiIQEO5TnX3VAcwZLLNyPV
         jA/0/8yfDlUTgx+dvPXI6LUGzeoBDeKVa4rb7tSKDdpLY0vaGm0oqUs+6hlcbWupNOEJ
         aYS4zpKJ8v7fNYKu5DWuNStnELH2HVquEd0NJtTeuUCsGZiKF61t1bdt73Fy6GoMplSB
         QNYYOyPC2PQ7wRT17ytDsjxwIWPUE9mv7+E49Mp95IzjZm3/MevlzETnmj6/JfdS2+zV
         F/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538351; x=1775143151;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uPMzh5VIL9zBbSS9+QORHZhnF3eOlFdM/G0TnTEBR4=;
        b=LNwDs1Pv2eQfzvDeEqSGgb30y36xNwgRulKQ4UwmbABxuat/JAIWqg6Ylaa2SYuzE1
         iYXa5i8oDmwbZNi16vxwTrSUSe4w9IiIf9b45Ldw1/h3y+SxR06Jc8Wuvul/q+35ANq7
         9GMeuuvkEAqfuPaQvADbHU3egm0FDdUS9lTrR1PQBRYZF0EwzY0a4kpXovt93is75yws
         OPbn6+K+lkZiYqfdo/k6qhRLFWzjC2sH+H1qwohLU30gHex2gf65P/SnAAQXAe0wTSFg
         EO4zSD6H/nQuCfayuEik1oIJDsDgcKNtr6Nc1fd8Zf9Pc7InM/+2GuQLuWo4At+Vn2QX
         yzKg==
X-Gm-Message-State: AOJu0YyePazRfGYbl9nQX0odcm9Mj+A0owZ4SfHX5/6s4qdGpqDMrizT
	G3wlUPRxnLmVXzq0oB4XW7nxf2MaeBImJ/vShNeIoAZozui/U4n7LvNMlGESvkx5g0YXctxf52Y
	s0+x7pvfz8XpiDnwzcNOIS3sxyHejv3vkVp53
X-Gm-Gg: ATEYQzxC7OzTIpoxSyqVogUSEShsM8VNdw3XF3S3yPwWC+51ViG8Alj3H7uS6tjdajC
	4ClFbFhfg9W79tZzCOOy7yyYwaFNYlU8V2pfNsQ1htrDrxZysaK+t1ymkdJuPGImspgnN4WVy94
	SzbJ+n5bu0CfGzqaoStAiWU37GGYEsKNl1Q7v+IwueTHDxnNIS3rdctHP39g4f0FUVJKLJkyXkj
	AHsiP/dEj6T25U1Gt8NCurO/tmJ+i/hUi7bIYvoAr7lOaqW3gRqoUD7ZJmKV4Ocd7Ag+Rn7ySbE
	1knh6kvQuayzKjAmU3+tisWvuuEhnI4okqjPnr5ZYup/UvzcdUdVRtuS/KBthEbQ7TK2Z9tOmN2
	1OmpNBEFVxuWMMxAk+hRvOxcx1dH6a70ZbF0=
X-Received: by 2002:a05:690e:418d:b0:64e:e898:10ff with SMTP id
 956f58d0204a3-64fee311c9bmr1576717d50.40.1774538351281; Thu, 26 Mar 2026
 08:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260326020923.297511-1-khem.raj@oss.qualcomm.com> <DHCPXEPGK489.13NFXVPD5IBMZ@bootlin.com>
In-Reply-To: <DHCPXEPGK489.13NFXVPD5IBMZ@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Mar 2026 08:18:44 -0700
X-Gm-Features: AQROBzDG3aXGDR6mpIQUSKpiVbLdI7XJsSYsMRNp1Wz_MKszn8hBPdTVZYx9rV0
Message-ID: <CAMKF1sqj0aGPNbo7Wi9mkFv4hzjhy8HZuzZ_uR4Y2FZ=Dp5dEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/4] clang/llvm: Upgrade to 22.x major release
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000118b19064deee81a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 15:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234028

--000000000000118b19064deee81a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 5:38=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Thu Mar 26, 2026 at 3:09 AM CET, Khem Raj via lists.openembedded.org
> wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > Includes support for new Intel (Wildcat Lake, Nova Lake with APX and
> AVX10.2)
> > Arm (C1 Nano, Pro, Premium, Ultra) processors. It also features
> performance
> > optimizations for AMD Zen 4 and Zen 5 architectures.
> >
> > Integrated Distributed ThinLTO is more mature, with enhancements
> > like cache support for incremental builds and robust handling of
> temporary artifacts.
> >
> > LLDB added first-class WebAssembly debugging support, including
> breakpoints and variable inspection.
> >
> > Support for Google Native Client (NaCl) is dropped in this release.
> >
> > Detailed ChangeLog [1]
> >
> > [1] https://releases.llvm.org/22.1.0/docs/ReleaseNotes.html
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
>
> Hi Khem,
>
> Thanks for the new version. I believe we have two issues linked with
> this patch.
>
>
> Firs, an x86 build issue:
>
> ERROR: clang-22.1.1-r0 do_compile: Execution of
> '/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-6=
4-v3-poky-linux/clang/22.1.1/temp/run.do_compile.91398'
> failed with exit code 1
> ...
> | Run Build Command(s): ninja -v -j 16 all
> | ninja: error:
> '/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work-share=
d/llvm-project-source-22.1.1-r0/sources/llvm-project-22.1.1.src/clang/tools=
/scan-build-py/lib64/libscanbuild/__init__.py',
> needed by 'lib64/libscanbuild/__init__.py', missing and no known rule to
> make it
> |
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3302
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3478
>
> Then, a rust selftest issue:
>
> 2026-03-26 11:11:17,872 - oe-selftest - INFO -
> rust.RustSelfTestSystemEmulated.test_rust (subunit.RemotedTestCase)
> 2026-03-26 11:11:17,889 - oe-selftest - INFO -  ... FAIL
> ...
> test [assembly] tests/assembly-llvm/asm/loongarch-type.rs#loongarch32 ...
> FAILED
> ...
>
> failures:
>
> ---- [assembly] tests/assembly-llvm/asm/loongarch-type.rs#loongarch32
> stdout ----
> ------FileCheck stdout------------------------------
>
> ------FileCheck stderr------------------------------
> /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-2170811/tmp/work/=
cortexa57-poky-linux/rust/1.94.0/sources/rustc-1.94.0-src/tests/assembly-ll=
vm/asm/loongarch-type.rs:31:11:
> error: CHECK: expected string not found in input
> // CHECK: pcalau12i $t0, %got_pc_hi20(extern_func)
>           ^
> /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-2170811/tmp/work/=
cortexa57-poky-linux/rust/1.94.0/sources/rustc-1.94.0-src/build/x86_64-unkn=
own-linux-gnu/test/assembly-llvm/asm/loongarch-type.loongarch32/loongarch-t=
ype.s:9:6:
> note: scanning from here
>  #APP
>      ^
> ...
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/3413
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/1289
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/3411
>
> Can you have a look at the issue?
>
>
there is a failure in rust tests due to a loongarch asm tests, this has
been fixed upstream so
I have backported it to rust in OE and sent a v3. Thanks


> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000118b19064deee81a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 26,=
 2026 at 5:38=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathie=
u.dubois-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu Mar 26=
, 2026 at 3:09 AM CET, Khem Raj via <a href=3D"http://lists.openembedded.or=
g" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<b=
r>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Includes support for new Intel (Wildcat Lake, Nova Lake with APX and A=
VX10.2)<br>
&gt; Arm (C1 Nano, Pro, Premium, Ultra) processors. It also features perfor=
mance<br>
&gt; optimizations for AMD Zen 4 and Zen 5 architectures.<br>
&gt;<br>
&gt; Integrated Distributed ThinLTO is more mature, with enhancements<br>
&gt; like cache support for incremental builds and robust handling of tempo=
rary artifacts.<br>
&gt;<br>
&gt; LLDB added first-class WebAssembly debugging support, including breakp=
oints and variable inspection.<br>
&gt;<br>
&gt; Support for Google Native Client (NaCl) is dropped in this release.<br=
>
&gt;<br>
&gt; Detailed ChangeLog [1]<br>
&gt;<br>
&gt; [1] <a href=3D"https://releases.llvm.org/22.1.0/docs/ReleaseNotes.html=
" rel=3D"noreferrer" target=3D"_blank">https://releases.llvm.org/22.1.0/doc=
s/ReleaseNotes.html</a><br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Khem,<br>
<br>
Thanks for the new version. I believe we have two issues linked with<br>
this patch.<br>
<br>
<br>
Firs, an x86 build issue:<br>
<br>
ERROR: clang-22.1.1-r0 do_compile: Execution of &#39;/srv/pokybuild/yocto-w=
orker/qemux86-world-alt/build/build/tmp/work/x86-64-v3-poky-linux/clang/22.=
1.1/temp/run.do_compile.91398&#39; failed with exit code 1<br>
...<br>
| Run Build Command(s): ninja -v -j 16 all<br>
| ninja: error: &#39;/srv/pokybuild/yocto-worker/qemux86-world-alt/build/bu=
ild/tmp/work-shared/llvm-project-source-22.1.1-r0/sources/llvm-project-22.1=
.1.src/clang/tools/scan-build-py/lib64/libscanbuild/__init__.py&#39;, neede=
d by &#39;lib64/libscanbuild/__init__.py&#39;, missing and no known rule to=
 make it<br>
|<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/buil=
ds/3302" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/17/builds/3302</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/buil=
ds/3478" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/59/builds/3478</a><br>
<br>
Then, a rust selftest issue:<br>
<br>
2026-03-26 11:11:17,872 - oe-selftest - INFO - rust.RustSelfTestSystemEmula=
ted.test_rust (subunit.RemotedTestCase)<br>
2026-03-26 11:11:17,889 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
...<br>
test [assembly] tests/assembly-llvm/asm/loongarch-type.rs#loongarch32 ... F=
AILED<br>
...<br>
<br>
failures:<br>
<br>
---- [assembly] tests/assembly-llvm/asm/loongarch-type.rs#loongarch32 stdou=
t ----<br>
------FileCheck stdout------------------------------<br>
<br>
------FileCheck stderr------------------------------<br>
/srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-2170811/tmp/work/co=
rtexa57-poky-linux/rust/1.94.0/sources/rustc-1.94.0-src/tests/assembly-llvm=
/asm/loongarch-type.rs:31:11: error: CHECK: expected string not found in in=
put<br>
// CHECK: pcalau12i $t0, %got_pc_hi20(extern_func)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
/srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-2170811/tmp/work/co=
rtexa57-poky-linux/rust/1.94.0/sources/rustc-1.94.0-src/build/x86_64-unknow=
n-linux-gnu/test/assembly-llvm/asm/loongarch-type.loongarch32/loongarch-typ=
e.s:9:6: note: scanning from here<br>
=C2=A0#APP<br>
=C2=A0 =C2=A0 =C2=A0^<br>
...<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/build=
s/3413" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/5/builds/3413</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/buil=
ds/1289" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/58/builds/1289</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/buil=
ds/3411" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/42/builds/3411</a><br>
<br>
Can you have a look at the issue?<br>
<br></blockquote><div><br></div><div>there is a failure in rust tests due t=
o a loongarch asm tests, this has been fixed upstream so</div><div>I have b=
ackported it to rust in OE and sent a v3. Thanks</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--000000000000118b19064deee81a--

