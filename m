Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B27D75BA7
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 03:10:30 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.2641.1732158621681427646
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 19:10:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O1z+8/By;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ea527ae14aso372613a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 19:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732158621; x=1732763421; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Al//980X74NUP+vdNDc3tjsRahfQ8OLWDAb5zOvb9c=;
        b=O1z+8/ByDK5BETOMEpUaTbpYEcxpG0202Saoc3JbmvS7FtCPsv1r75Fkk0/28pPq2d
         vJtiMS4SIeLW9Dv1rVQNOjCqdxXu3pzPlZ/+2KFFoQU+xaxebmiI8p2M2z7QW705nP23
         muxU21PkYduFX+0GE3W8856c953DKbcaNOfIft04L7oK6DrRaJmKHUv4GG8a+72LlEjd
         m0bAusu/w7cb+IzLYmJIoj8gHRw4FncwJycR6EmEfxNbLf5fIBA8ethZhhR5pMQe4xSR
         LSnvr7k5jIQI6a6aGTWSAPy0DOhptwhCpYbdvt1tYfaHYfCZydVJq3ZxzFVlpgCGyiaU
         S7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732158621; x=1732763421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Al//980X74NUP+vdNDc3tjsRahfQ8OLWDAb5zOvb9c=;
        b=cxyhLBaVk+XaNWDSrnFgLOWh788ApecB6AfCDYZ3hNMDkrB/TwDKnj4+wIfwscORXu
         4F7hR98Aww/D0M/l6t9tZnAc1DManjkZRG965mhuZ3VJ8XUEG8jjr/R50efD540TL2Xe
         kdICblOesIl0pmehYvrQHMwvnEIPdp6HsvXZFe97+a46Rz8wxxtpVumtGa9CwXD008+m
         sp/lDiETQgMFhRR4Zu3KsGsjLlfWWBZxKYpI4EUL15Z+x5tmYoZcI1JsuzO8GxO9MB/u
         Hdy6YYs945y2Be4eyOKNPFrUCM22ynCpqrD5qPBVmOkjdJpIrehl7b75XXMFz7howI3h
         o5mA==
X-Forwarded-Encrypted: i=1; AJvYcCX8zPnce8F4Dj0wzGm7YjO/LeUZnk4orE9X5Clc2xE0+iqmkHk7/nUNjaBRzESQW61nhX0eFfxTibv1Gvw9JNSl+w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyrVgTknJ5gcP0tl4p5u7fiBdA4a+Ew0O/IWdWEUSABh5Oqmc5I
	PEVl2KOviMus4JsU2jtGHavRA6wCzrGXVxwLHxvKo65E2ATUB8X5PYn2WV9krcvZE+JjX5sgs0R
	hZDc338CD2QClXVTsBO5BmG5BTYs+mcAL
X-Gm-Gg: ASbGncvWOhkY7EjLmIjtetbO+5nsoQPXnlFV5WGhGXWeN/LZD4iUJQYOgXvTS0YqMBm
	6/Yo+rRD24dMPnY7cJj0En8K1tyTenqAK
X-Google-Smtp-Source: AGHT+IFbIWq3H/3Z/+gwWVDl3rsdIXfkPLcn8V1eu06Xrxy3VOjoHHxAcGNFs3O+HDKXBR6bsqtEuqH3Gxp1qDjEwQE=
X-Received: by 2002:a17:90b:1b47:b0:2ea:4150:3f71 with SMTP id
 98e67ed59e1d1-2eaca709cbemr6282719a91.14.1732158621019; Wed, 20 Nov 2024
 19:10:21 -0800 (PST)
MIME-Version: 1.0
References: <20241120121923.3675835-1-Harish.Sadineni@windriver.com> <5d482ba4-cd30-47cc-96bd-88b9eca675c2@windriver.com>
In-Reply-To: <5d482ba4-cd30-47cc-96bd-88b9eca675c2@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Nov 2024 22:10:09 -0500
Message-ID: <CADkTA4PzWVTf=1tOdxwj9V=PjKj+XBpyrVn9EF5AN7kRApbQ3g@mail.gmail.com>
Subject: Re: [PATCH v2] linux: Modify kernel configuration to fix runqlat issue
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, 
	"He, Zhe" <Zhe.He@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000004cf9990627639b7c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 03:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207499

--0000000000004cf9990627639b7c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 5:38=E2=80=AFPM Randy MacLeod <randy.macleod@windri=
ver.com>
wrote:

> Hi Harish,
>
>
> When you are changing the kernel config or any part of the system that
> you don't normally work on, it's a good idea to CC the people who work on
> that
> part of the system. Doubly so, since this is a v2 and Bruce commented on
> v1. ;-)
>

Thanks Randy! I had completely missed this, and didn't even remember my
comments on v1. I just had to go back and find them!

Another tip we could add is that on any new version of a patch, summarize
the new changes in the throw away section, so us with bad memories can
remember what was motivating the v2.



>
>
> On 2024-11-20 7:19 a.m., Harish.Sadineni@windriver.com wrote:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com> <Harish.Sadineni@wi=
ndriver.com>
>
> In Qemu Running "/usr/share/bcc/tools/runqlat 1 5" gives following error:=
-
>
> Using fewer capitals is usually better:
>
> s/In Qemu Running/In qemu, running:/
>
>
> libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DE=
BUG_INFO_BTF enabled?
> libbpf: failed to find valid kernel BTF
> modprobe: FATAL: Module kheaders not found in directory /lib/modules/6.10=
.14-yocto-standard
> Unable to find kernel headers. Try rebuilding kernel with CONFIG_IKHEADER=
S=3Dm (module) or installing
> the kernel development package for your running kernel version.
> chdir(/lib/modules/6.10.14-yocto-standard/build): No such file or directo=
ry
> Traceback (most recent call last):
>   File "/usr/share/bcc/tools/./runqlat", line 293, in <module>
>     b =3D BPF(text=3Dbpf_text)
>   File "/usr/lib/python3.13/site-packages/bcc/__init__.py", line 479, in =
__init__
>     raise Exception("Failed to compile BPF module %s" % (src_file or "<te=
xt>"))
>
> the following patch fixes the error.
>
> BCC test summary for x86_64:
>
> Before applying the patch:
>  TOTAL: 95
>  PASS: 29
>  FAIL: 66
> After applying the patch:
>  TOTAL: 95
>  PASS: 79
>  FAIL: 16
>
> Better as:
>
>  State    TOTAL  PASS  FAIL
>  Before    95     29    66
>  After     95     79    16
>
>  50 new test cases passed
>
> s/50 new test cases passed/Note that 50 additional cases pass./
>
> Please explain if the remaining issues are yet to be looked at or if you
> know something about the failures. Ideally, you'd fix all the ptests or
> deliberately skip them with a sensible reason in your commit log. I'm not
> requiring you to do that yet, I just want to understand the current state=
.
>
> Please explain why you added: features/reproducibility/reproducibility.sc=
c
> both here and in the v3 commit log.
>

Agreed on this! If something is being provided by that fragment that the
tests need, it might actually be something that the btf fragment should
automatically include, or maybe we should be splitting out an option.

I not sure if we want these features as a defaults for debug kernels but I
> expect that Bruce or Zhe will comment.
>
For debug, it is probably ok. We don't guard against bloat/size nearly as
carefully on this.  That being said, there definitely is a difference
between a debug kernel and "a kernel for running yocto's ptests" and we
have to guard against that.

Bruce



> Good work and I look forward having all of the bcc ptests pass.
>
> ../Randy
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com> <Harish.Sa=
dineni@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_6.10.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes=
-kernel/linux/linux-yocto_6.10.bb
> index 9b2334afd0..d678bce254 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
> @@ -64,6 +64,7 @@ KERNEL_FEATURES:append:qemux86-64=3D" cfg/sound.scc cfg=
/paravirt_kvm.scc"
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx32=
", " cfg/x32.scc", "", d)}"
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", "", =
d)}"
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains("KERNEL_DEBUG", "True"=
, " features/reproducibility/reproducibility.scc features/debug/debug-btf.s=
cc", "", d)}"
>  # libteam ptests from meta-oe needs it
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/net/team/team.scc", "", d)}"
>  # openl2tp tests from meta-networking needs it
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004cf9990627639b7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 20, 2024 at 5:38=E2=80=AFPM Randy MacLe=
od &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriv=
er.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><u></u>

 =20
  <div>
    <div>Hi Harish, <br>
    </div>
    <div><br>
    </div>
    <div><br>
      When you are changing the kernel config or any part of the system
      that<br>
      you don&#39;t normally work on, it&#39;s a good idea to CC the people=
 who
      work on that<br>
      part of the system. Doubly so, since this is a v2 and Bruce
      commented on v1. ;-)<br></div></div></blockquote><div><br></div><div>=
<div class=3D"gmail_default" style=3D"font-size:small">Thanks Randy! I had =
completely missed this, and didn&#39;t even remember my comments on v1. I j=
ust had to go back and find them!</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Another tip we could add is that on any new version of a patch, =
summarize the new changes in the throw away section, so us with bad memorie=
s can remember what was motivating the v2.</div><br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>
    </div>
    <div><br>
    </div>
    <div><br>
    </div>
    <div>On 2024-11-20 7:19 a.m.,
      <a href=3D"mailto:Harish.Sadineni@windriver.com" target=3D"_blank">Ha=
rish.Sadineni@windriver.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>From: Harish Sadineni <a href=3D"mailto:Harish.Sadineni@windrive=
r.com" target=3D"_blank">&lt;Harish.Sadineni@windriver.com&gt;</a>

In Qemu Running &quot;/usr/share/bcc/tools/runqlat 1 5&quot; gives followin=
g error:-</pre>
    </blockquote>
    <p>Using fewer capitals is usually better:<br>
    </p>
    <p>s/In Qemu Running/In qemu, running:/</p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <pre>libbpf: kernel BTF is missing at &#39;/sys/kernel/btf/vmlinux&#3=
9;, was CONFIG_DEBUG_INFO_BTF enabled?
libbpf: failed to find valid kernel BTF
modprobe: FATAL: Module kheaders not found in directory /lib/modules/6.10.1=
4-yocto-standard
Unable to find kernel headers. Try rebuilding kernel with CONFIG_IKHEADERS=
=3Dm (module) or installing
the kernel development package for your running kernel version.
chdir(/lib/modules/6.10.14-yocto-standard/build): No such file or directory
Traceback (most recent call last):
  File &quot;/usr/share/bcc/tools/./runqlat&quot;, line 293, in &lt;module&=
gt;
    b =3D BPF(text=3Dbpf_text)
  File &quot;/usr/lib/python3.13/site-packages/bcc/__init__.py&quot;, line =
479, in __init__
    raise Exception(&quot;Failed to compile BPF module %s&quot; % (src_file=
 or &quot;&lt;text&gt;&quot;))

the following patch fixes the error.

BCC test summary for x86_64:

Before applying the patch:
 TOTAL: 95
 PASS: 29
 FAIL: 66
After applying the patch:
 TOTAL: 95
 PASS: 79
 FAIL: 16</pre>
    </blockquote>
    <pre><code>Better as:

 <span>State</span>    <span>TOTAL</span>  <span>PASS</span>  <span>FAIL</s=
pan>=20
 <span>Before</span>    <span>95</span>     <span>29</span>    <span>66</sp=
an> =20
 <span>After</span>     <span>95</span>     <span>79</span>    <span>16</sp=
an> =20


</code></pre>
    <p></p>
    <blockquote type=3D"cite">
      <pre>50 new test cases passed</pre>
    </blockquote>
    <p>s/<span style=3D"white-space:pre-wrap">50 new test cases passed/</sp=
an><span style=3D"white-space:pre-wrap">Note that 50 additional cases pass.=
/</span></p>
    <p><span style=3D"white-space:pre-wrap">Please explain if the remaining=
 issues are yet to be looked at or
if you know something about the failures. Ideally, you&#39;d fix all the pt=
ests
or deliberately skip them with a sensible reason in your commit log.
I&#39;m not requiring you to do that yet, I just want to understand the cur=
rent state.
</span></p>
    <p><span style=3D"white-space:pre-wrap">Please explain why you added:  =
</span><span style=3D"white-space:pre-wrap">
   features/reproducibility/reproducibility.scc=20
</span><span style=3D"white-space:pre-wrap">both here and in the v3 commit =
log.</span></p></div></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">Agreed on this! If something is being pro=
vided by that fragment that the tests need, it might actually be something =
that the btf fragment should automatically include, or maybe we should be s=
plitting out an option.</div></div><div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div><p><span style=3D"white-space:pre-wrap">

I not sure if we want these features as a defaults for debug kernels but I =
expect that  Bruce or  Zhe
will comment.</span></p></div></blockquote><div><div class=3D"gmail_default=
" style=3D"font-size:small">For debug, it is probably ok. We don&#39;t guar=
d against bloat/size nearly as carefully on this.=C2=A0 That being said, th=
ere definitely is a difference between a debug kernel and &quot;a kernel fo=
r running yocto&#39;s=C2=A0ptests&quot; and we have to guard against that.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><p><spa=
n style=3D"white-space:pre-wrap">
</span></p>
    <p><span style=3D"white-space:pre-wrap">Good work and I look forward ha=
ving all of the bcc ptests pass.
</span></p>
    <p><span style=3D"white-space:pre-wrap">../Randy</span></p>
    <p><span style=3D"white-space:pre-wrap">
</span></p>
    <p><span style=3D"white-space:pre-wrap">
</span></p>
    <pre></pre>
    <blockquote type=3D"cite">
      <pre>Signed-off-by: Harish Sadineni <a href=3D"mailto:Harish.Sadineni=
@windriver.com" target=3D"_blank">&lt;Harish.Sadineni@windriver.com&gt;</a>
---
 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.10.bb" target=3D=
"_blank">linux-yocto_6.10.bb</a> | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.10.b=
b" target=3D"_blank">linux-yocto_6.10.bb</a> b/meta/recipes-kernel/linux/<a=
 href=3D"http://linux-yocto_6.10.bb" target=3D"_blank">linux-yocto_6.10.bb<=
/a>
index 9b2334afd0..d678bce254 100644
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.10.bb" targ=
et=3D"_blank">linux-yocto_6.10.bb</a>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.10.bb" targ=
et=3D"_blank">linux-yocto_6.10.bb</a>
@@ -64,6 +64,7 @@ KERNEL_FEATURES:append:qemux86-64=3D&quot; cfg/sound.scc =
cfg/paravirt_kvm.scc&quot;
 KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&quot;TUNE_FEATURES=
&quot;, &quot;mx32&quot;, &quot; cfg/x32.scc&quot;, &quot;&quot;, d)}&quot;
 KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&quot;DISTRO_FEATUR=
ES&quot;, &quot;ptest&quot;, &quot; features/scsi/scsi-debug.scc features/n=
f_tables/nft_test.scc&quot;, &quot;&quot;, d)}&quot;
 KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&quot;DISTRO_FEATUR=
ES&quot;, &quot;ptest&quot;, &quot; features/gpio/mockup.scc features/gpio/=
sim.scc&quot;, &quot;&quot;, d)}&quot;
+KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&quot;KERNEL_DEBUG&=
quot;, &quot;True&quot;, &quot; features/reproducibility/reproducibility.sc=
c features/debug/debug-btf.scc&quot;, &quot;&quot;, d)}&quot;
 # libteam ptests from meta-oe needs it
 KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&quot;DISTRO_FEATUR=
ES&quot;, &quot;ptest&quot;, &quot; features/net/team/team.scc&quot;, &quot=
;&quot;, d)}&quot;
 # openl2tp tests from meta-networking needs it
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </div>

</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000004cf9990627639b7c--

