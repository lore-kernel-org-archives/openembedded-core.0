Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14B7C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 17:48:50 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.16867.1711475321663244124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 10:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e1mVPyEK;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-29dedcd244dso4122884a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 10:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711475321; x=1712080121; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=djDUOLsS3VgWo1c6CMku2Llb3pBBROkdFPzCyIo9OTY=;
        b=e1mVPyEK4vyBpt7PRDLudAaY4shG26iTsX3cwylKvIgDObJMQBm7vctPnAAOx9FrKl
         BPb+zbITVgxNBoybfdGSW/PDWtFSF6z8pqJ5DOwwyC2VPvAK225dH2cK0Zd8fCsmUT7J
         we/PSHWvAo7E7T3ELBeV7hHhbVcIQtZ9uDkqIDLvVFLirDJY5uGvOh6+slhjbJRr8bfn
         sZgH0BB6lpuz7WUdIOLYScs/A7yK80g/P/zzbVsjPQv+uub5OlzYHoc9/gtQXIm5h3M7
         1+f5P1fR9W4aRwPIrIspPqo3W/MfNxND8eXfRq9JD2A7f4JFbQK56LLyPPK/A0gRcULe
         pc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711475321; x=1712080121;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djDUOLsS3VgWo1c6CMku2Llb3pBBROkdFPzCyIo9OTY=;
        b=jlX2Yjy2S4kIhaajNjX5TroC5KqDM5pnuy/EX404sppI49Ym8OccYS1/Rc+Gcy5ZKO
         zowv90S+a6JHYdDTP1wHfPfeWxQnQzt4MRnBpZpQNXEFK/bw0V6TkuN8t7UHUvBXoo7h
         CdTI8e9e6vJGJoy3xfFPrvBeuJvx9oF31CYOpGTWYtXcAusED9lQp0uR1xfUh17rhQoF
         jcULG03xVj8kNg/aRZ+kW2U21bvY7NlcBBmUMEBb2AO4mfzxOLn6Jw36+c/QGQYvsxNE
         pW55/Fx7bwvcNkSxobUyVHsHlegIcvPmMfDSyQxDuoylTVwhillro57T8peURTm/9G/l
         FUTQ==
X-Gm-Message-State: AOJu0YwFzyLpQ4awcUSb9KFzDi/P90+dH7x57X8emGdlfEZijL5x/hpk
	+eebfpyQkIAi2lXw5efqBBkH4IZOUYloJZq9KKjHkK7MUbe/D2DvBM3KScBIwFejJiRrOXH1YXr
	B+yygbbwd8MGQ8onAL6u/aRzrn7GA/LCP
X-Google-Smtp-Source: AGHT+IFJzqAp2ZSiZdtyPgy8mAM7lo4pwxzdC/t4wRRdbgMPnR1bHd0cqlqtcv4iFLdCIqMUSLJwMojL1IhUmprKmuk=
X-Received: by 2002:a17:90b:3ec6:b0:29f:f6c7:1ace with SMTP id
 rm6-20020a17090b3ec600b0029ff6c71acemr544953pjb.32.1711475320841; Tue, 26 Mar
 2024 10:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240325102055.1037135-1-max.oss.09@gmail.com> <CADkTA4PYLUCck7Y0evO_597xOvwooe1vn5kSvJ1pqq+ew98FKg@mail.gmail.com>
In-Reply-To: <CADkTA4PYLUCck7Y0evO_597xOvwooe1vn5kSvJ1pqq+ew98FKg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 26 Mar 2024 13:48:29 -0400
Message-ID: <CADkTA4M9wf--yDs9+ggQuKwSKnGYVaV994RfK+L+Q5XhUhXT8A@mail.gmail.com>
Subject: Re: [OE-core][Patch v1 1/2] perf: fix build with latest kernel
To: max.oss.09@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: multipart/alternative; boundary="0000000000008a6fa9061493e645"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 17:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197538

--0000000000008a6fa9061493e645
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 1:46=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

>
>
> On Mon, Mar 25, 2024 at 6:21=E2=80=AFAM <max.oss.09@gmail.com> wrote:
>
>> From: Max Krummenacher <max.krummenacher@toradex.com>
>>
>> Kernel commit 9eea8fafe33e ("libbpf: fix __arg_ctx type enforcement for
>> perf_event programs") added with 6.9-rc1
>> tools/include/uapi/asm/bpf_perf_event.h
>> which for arc, arm64, loongarch, riscv and s390 includes headers from
>> the arch/${ARCH}/... directories.
>> Thus the build in OE fails as those headers are not present.
>>
>> Fix this by additioanly copying all files in arch/${ARCH}/include/.
>>
>> Fixes:
>> ERROR: perf-1.0-r0 do_compile: oe_runmake failed
>> | In file included from
>> work/verdin_imx8mm-tdx-linux/perf/1.0/perf-1.0/tools/include/uapi/linux/=
bpf_perf_event.h:11,
>> |                  from libbpf.c:36:
>> |
>> work/verdin_imx8mm-tdx-linux/perf/1.0/perf-1.0/tools/include/uapi/asm/bp=
f_perf_event.h:2:10:
>> fatal error: ../../arch/arm64/include/uapi/asm/bpf_perf_event.h: No such
>> file or directory
>> |     2 | #include "../../arch/arm64/include/uapi/asm/bpf_perf_event.h"
>> |       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>> ---
>>  meta/recipes-kernel/perf/perf.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf=
/
>> perf.bb
>> index 4f26813de0..6408c65462 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -139,6 +139,7 @@ PERF_SRC ?=3D "Makefile \
>>               tools/scripts \
>>               scripts/ \
>>               arch/arm64/tools \
>> +             arch/${ARCH}/include \
>>
>
> We've always tried to stay within the tools/ source umbrella since we
> really
> don't want to copy any more of the kernel than we have to, since
> otherwise,
> we might as well go back to simplifying things and just building against
> the
> entire kernel source tree.
>
> I'd like to see if there's a way that we could limit this to the uapi (an=
d
> hence
> use our uapi headers), and avoid needing to make the copy. If we need a
> copy, then being as specific as possible would be the goal.
>


I meant to also add that I'm not talking about the libc-headers for the
uapi bits, as they are not tracking the latest kernel by design. Although
it would be interesting to see how perf does treat the older uapi against
the new kernel, so we can document the tested combinations.

Bruce



>
> I'm not moving linux-yocto-dev to the latest -dev until next week, but I
> can
> look into this more then.
>
> Bruce
>
>
>
>>               arch/${ARCH}/Makefile \
>>  "
>>
>> --
>> 2.42.0
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000008a6fa9061493e645
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Mar 26, 2024 at 1:46=E2=80=AFPM Bruce Ashfi=
eld &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Mon, Mar 25, 2024 at 6:21=E2=80=AFAM &lt;<a href=3D"mailto:max.oss.09@g=
mail.com" target=3D"_blank">max.oss.09@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">From: Max Krummenacher &lt;=
<a href=3D"mailto:max.krummenacher@toradex.com" target=3D"_blank">max.krumm=
enacher@toradex.com</a>&gt;<br>
<br>
Kernel commit 9eea8fafe33e (&quot;libbpf: fix __arg_ctx type enforcement fo=
r<br>
perf_event programs&quot;) added with 6.9-rc1 tools/include/uapi/asm/bpf_pe=
rf_event.h<br>
which for arc, arm64, loongarch, riscv and s390 includes headers from<br>
the arch/${ARCH}/... directories.<br>
Thus the build in OE fails as those headers are not present.<br>
<br>
Fix this by additioanly copying all files in arch/${ARCH}/include/.<br>
<br>
Fixes:<br>
ERROR: perf-1.0-r0 do_compile: oe_runmake failed<br>
| In file included from work/verdin_imx8mm-tdx-linux/perf/1.0/perf-1.0/tool=
s/include/uapi/linux/bpf_perf_event.h:11,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from libbpf=
.c:36:<br>
| work/verdin_imx8mm-tdx-linux/perf/1.0/perf-1.0/tools/include/uapi/asm/bpf=
_perf_event.h:2:10: fatal error: ../../arch/arm64/include/uapi/asm/bpf_perf=
_event.h: No such file or directory<br>
|=C2=A0 =C2=A0 =C2=A02 | #include &quot;../../arch/arm64/include/uapi/asm/b=
pf_perf_event.h&quot;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
<br>
Signed-off-by: Max Krummenacher &lt;<a href=3D"mailto:max.krummenacher@tora=
dex.com" target=3D"_blank">max.krummenacher@toradex.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index 4f26813de0..6408c65462 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -139,6 +139,7 @@ PERF_SRC ?=3D &quot;Makefile \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tools/scripts \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scripts/ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm64/tools \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arch/${ARCH}/include \<br>=
</blockquote><div><br></div><div><div style=3D"font-size:small">We&#39;ve a=
lways tried to stay within the tools/ source umbrella since we really</div>=
<div style=3D"font-size:small">don&#39;t want to copy any more of the kerne=
l than we have to, since otherwise,=C2=A0</div><div style=3D"font-size:smal=
l">we might as well go back to simplifying things and just building against=
 the</div><div style=3D"font-size:small">entire kernel source tree.</div><d=
iv style=3D"font-size:small"><br></div><div style=3D"font-size:small">I&#39=
;d like to see if there&#39;s a way that we could limit this to the uapi (a=
nd hence</div><div style=3D"font-size:small">use our uapi headers), and avo=
id needing to make the copy. If we need a=C2=A0</div><div style=3D"font-siz=
e:small">copy, then being as specific as possible would be the goal.</div><=
/div></div></div></blockquote><div><br></div><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">I meant to also add that I&#39=
;m not talking about the libc-headers for the</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">uapi bits, as they are not tracking the late=
st=C2=A0kernel by design. Although</div><div class=3D"gmail_default" style=
=3D"font-size:small">it would be interesting to see how perf does treat the=
 older uapi against</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">the new kernel, so we can document the tested combinations.</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div =
class=3D"gmail_quote"><div><div style=3D"font-size:small"><br></div><div st=
yle=3D"font-size:small">I&#39;m not moving linux-yocto-dev to the latest -d=
ev until next week, but I=C2=A0 can</div><div style=3D"font-size:small">loo=
k into this more then.</div><div style=3D"font-size:small"><br></div><div s=
tyle=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/${ARCH}/Makefile \<br=
>
=C2=A0&quot;<br>
<br>
-- <br>
2.42.0<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000008a6fa9061493e645--

