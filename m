Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3D910F2863
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 18:00:58 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79047.1774634456096122772
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 11:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DzNImPI5;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64ee82e853cso1998112d50.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 11:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774634455; cv=none;
        d=google.com; s=arc-20240605;
        b=PfbUYb37u2kj6pCwqAn89fzvI26gxGZ7M7CDdi7YgNN/cyixyt48UBpzQYBONGZzth
         WlYYhjSsaSaXd1HJtBxkvUBeZX2POHMcpiY913Mgmq6edxj/5M+rlGVLOH77XSWc7u2w
         Iy5Tqt42eSs/p5ufRkyCIuofINT+/bQVCXYehrLu46nyswwsSNKlp56A5tbi00reu5lq
         lOE/X5uxcYTR5lA10YOMIMh2lS6+MSf52/y1/GUpn+XCm82D6Ek/5D9EYcaKZo/BXpU8
         KYE9Yj+84xIoMWmhVpqD1TzQzm4Q8OvGG9917yFQv8gAxD3JLLPGBe2G6bR53Unkk50C
         5gdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VsOlGwBHSGeFt47kaX6PW9N+TpgFX0w7BspcNdD8X7k=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=PYNcHCO4YVo1XUpLZGsaSo+VKR6aK5YlbXRX1KdH6T9uFTtqBAJlK9jjuc3wWEZs7O
         cEf71aQzhsI+zK4g2dHzZIHZz5fkCazyvEwMJtduScPn3F+cX41zZb6Nf2vuYJOQGm6X
         zdXtlkiE5nudZ3YBQT3sXS0bKW75eCqqgy0LxcnKxIPHLLNMTflLM6nTs98XEHjMqBo8
         Hy+xVgifRbNgH+f37HqJGTQYAob8l2YNmBXAHMHZvyi97LeGA1G3JxiUBPdQOR8cm9GX
         vEDWa/RKMOfmRqwU/hh//mPsXcY3OoDNfCQtVAx5+ulMAiEIliw6yW46R/ccFucnbzSl
         mJ6w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774634455; x=1775239255; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VsOlGwBHSGeFt47kaX6PW9N+TpgFX0w7BspcNdD8X7k=;
        b=DzNImPI5CUUsa/dRtzq0QQaz5TX+SThppNuv3NpwvUWUtQTGdak8LEi6Y1mRNeKk0E
         9uebKIxUzhVS9hDz8uJFkzhOdFIqI6462IoU9dSH5tMJDtYRvYznXWThaxwE5ec1fezC
         XLbs2Mi7w8I5aeOV0BFvsYNmJTtKJkoXraPmZGYW+Vj3OpB+k0MjhKkjPBZb3rLJQq8Q
         Zhon7fBvZZjZRcUKnmUY79YWdYtcgs9onpwM9FT83UjQSHan2b7NBXLgjbWUNkkeQBlL
         zu1s5+T7iUKN5hgx7UKT2PdpYmYu48EbOw4XBEWV5vKOepAY1SU8Eq6eBHLZI/DEVI0t
         gFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774634455; x=1775239255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsOlGwBHSGeFt47kaX6PW9N+TpgFX0w7BspcNdD8X7k=;
        b=aipN/KPjWZrnmHrkXltrfDIZoyJODXzjl6+FrIe5tdcQfGXuzOl5tzgWInSlgEC0xC
         FrB94F/02RcZWQCEiXeJgXiFcZ1x6Zi6P45W7hAcsToEu7Q4qY96WAnod6EslQZ1g5nP
         aFoxPLBQMJ0PdeNgkkalbwnRipxSzPTaxZpZfOp+QtMMu6Mr/2tUpPu8u7GHpHJ3HloM
         DZoUaqt2JF1Tfy8gEPiUAc1IDxoArUzJ3bA4dKPo+Phj0t9X7SSHqgMrOx0c8uFZZBsH
         3sIlpEJZ4LoGhclgVF7hl09/RNwU/8Css6Iig3bCysi28+Sm+TxNQcNNXzQwS/Iiy2Qw
         VUYQ==
X-Gm-Message-State: AOJu0Yza6fgSNLDS9sX2vwtc1DdRjVJ2AnwGRjuJ9GEqiPDNWiqfVTZd
	DlBF5KIk566fAWjjwreKTwp9Y3CcsA9IPMvvlmRNUxQH75qZUTiz/FCNyujdBT+AcJPyCbUPsJL
	KULvrKwLJE3mPuJTx3N3aLIXo/rE5yKI=
X-Gm-Gg: ATEYQzzGsZ2NZuPcvoitMMSPM12neIBuWEd9H0z7RQuyhj6dWjl8f86BzXD1YdjXPPU
	JT4B8Fxm4ddQuFNzNoP1XXuLa2ilatDwwdrOgoUM6zLpbLfsrNZEo+8O9fiZRZ85FjcsTswxKqs
	7Kq0nktFYiCGoX/MCUC2Lret5pNZ5Vh3TtN4scVNRS1jk/nOFtkLeCNQkDzYxmo1TFG2AEm9HTJ
	XLQJjTiunC8qVRk8wWjl/ewArdCF3U+zsGSl8avJ8zbAb9hhJq/qHza3o5RU9arGIojJcPZXfD4
	Yne8vWfV8EqGTQDtv7W5VBqtjuF7SFwjjZeqCCdZLpWJIAG+KLn98a9TmoRnGEJcdvd5JpaM40k
	mVuJyXYyS+WG2RygYW0W6iElc
X-Received: by 2002:a05:690e:4187:b0:63f:bc75:6ead with SMTP id
 956f58d0204a3-64ff71b231bmr3790923d50.9.1774634453965; Fri, 27 Mar 2026
 11:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com> <DHDI32YKJSSP.MH33L7GOJJ1Q@bootlin.com>
In-Reply-To: <DHDI32YKJSSP.MH33L7GOJJ1Q@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Mar 2026 11:00:27 -0700
X-Gm-Features: AQROBzC6sWBHMJNOpkoj_gI_sJtc3uNBnbloetMRzRSUVh2FPIAhUXzvkniOrdo
Message-ID: <CAMKF1soKLkhMZNSHTzrTcX8qSQYgFz20NgAzjN-ResCgG=Dg1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/7] clang/llvm: Upgrade to 22.x major release
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003c1f8b064e0548f9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 18:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234105

--0000000000003c1f8b064e0548f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 3:42=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Thu Mar 26, 2026 at 4:16 PM CET, Khem Raj via lists.openembedded.org
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
> This looks better, but we still have one issue:
>
> ERROR: clang-22.1.2-r0 do_compile: Execution of
> '/srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3=
-poky-linux/clang/22.1.2/temp/run.do_compile.573061'
> failed with exit code 1
> ...
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: VERBOSE=3D1 cmake --build
> /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3-=
poky-linux/clang/22.1.2/build
> --target all --
> | Change Dir:
> '/srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3=
-poky-linux/clang/22.1.2/build'
> |
> | Run Build Command(s): ninja -v -j 16 all
> | ninja: error:
> '/srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work-shared/ll=
vm-project-source-22.1.2-r0/sources/llvm-project-22.1.2.src/clang/tools/sca=
n-build-py/lib64/libscanbuild/__init__.py',
> needed by 'lib64/libscanbuild/__init__.py', missing and no known rule to
> make it
> |
> | WARNING: exit code 1 from a shell command.
> NOTE: recipe clang-22.1.2-r0: task do_compile: Failed
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3485
>
>
This is caught with x86_64 because libdir is lib64 in multilib mode. The
issue was in the clangscan patch where it was
changing rules to look for sourcefiles also in mulilib libdir. I have fixed
it and updated the patchset here in a branch on top of master

https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/clang-=
22

my local builds are seeming ok. I have also started an AB build here, its
still running

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3492




> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000003c1f8b064e0548f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 27,=
 2026 at 3:42=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathie=
u.dubois-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu Mar 26=
, 2026 at 4:16 PM CET, Khem Raj via <a href=3D"http://lists.openembedded.or=
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
This looks better, but we still have one issue:<br>
<br>
ERROR: clang-22.1.2-r0 do_compile: Execution of &#39;/srv/pokybuild/yocto-w=
orker/qemux86-world/build/build/tmp/work/x86-64-v3-poky-linux/clang/22.1.2/=
temp/run.do_compile.573061&#39; failed with exit code 1<br>
...<br>
Log data follows:<br>
| DEBUG: Executing shell function do_compile<br>
| NOTE: VERBOSE=3D1 cmake --build /srv/pokybuild/yocto-worker/qemux86-world=
/build/build/tmp/work/x86-64-v3-poky-linux/clang/22.1.2/build --target all =
--<br>
| Change Dir: &#39;/srv/pokybuild/yocto-worker/qemux86-world/build/build/tm=
p/work/x86-64-v3-poky-linux/clang/22.1.2/build&#39;<br>
|<br>
| Run Build Command(s): ninja -v -j 16 all<br>
| ninja: error: &#39;/srv/pokybuild/yocto-worker/qemux86-world/build/build/=
tmp/work-shared/llvm-project-source-22.1.2-r0/sources/llvm-project-22.1.2.s=
rc/clang/tools/scan-build-py/lib64/libscanbuild/__init__.py&#39;, needed by=
 &#39;lib64/libscanbuild/__init__.py&#39;, missing and no known rule to mak=
e it<br>
|<br>
| WARNING: exit code 1 from a shell command.<br>
NOTE: recipe clang-22.1.2-r0: task do_compile: Failed<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/buil=
ds/3485" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/59/builds/3485</a><br>
<br></blockquote><div><br></div><div>This is caught with x86_64 because lib=
dir is lib64 in multilib mode. The issue was in the clangscan patch where i=
t was</div><div>changing rules to look for sourcefiles also in mulilib=C2=
=A0libdir. I have fixed it and updated the patchset here in a branch on top=
 of master</div><div><br></div><div><a href=3D"https://git.openembedded.org=
/openembedded-core-contrib/log/?h=3Dkraj/clang-22">https://git.openembedded=
.org/openembedded-core-contrib/log/?h=3Dkraj/clang-22</a></div><div><br></d=
iv><div>my local builds are seeming ok. I have also started an AB build her=
e, its still running</div><div><br></div><div><a href=3D"https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/59/builds/3492">https://autobuilder.=
yoctoproject.org/valkyrie/#/builders/59/builds/3492</a></div><div><br></div=
><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
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

--0000000000003c1f8b064e0548f9--

