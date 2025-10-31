Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51823CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 17:47:50 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.1551.1761932866225165991
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 10:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g09bInEQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-340299fe579so2856084a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 10:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761932866; x=1762537666; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9tICV9MlrkAZN9XPZKvljrlCDxYA1grck97ejE6/tWg=;
        b=g09bInEQlXNjIdtK4r67h5Gcvo85/vC6PKjCOFpAFWIuj3CfovXSDBRTYvaru0HNZN
         +r3W3x8zSygqwzkHOwCRLRvfTVBPryq08cn6/6o5XxkOwNunJI0/iACHVpVDx85SwE0L
         uo42NqE5sdjVeAI4ROCvkopsbQN6rrcTut3bq0JB9MthhZB+nE9R8J6obNNuNcHC9PfY
         2Syg8t9WmOXKzdExceQpQn1RwgK4sXGYCNKtLNGiCV/94zAJ2Tw81qTAehYWDCePsPMF
         metHrJoxypVFM7klcCiXYpZG5FkschHvQyAQFfAyYSlOjheMeK83djBs3hpTuJKnw9kC
         hYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761932866; x=1762537666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tICV9MlrkAZN9XPZKvljrlCDxYA1grck97ejE6/tWg=;
        b=M7k8gqagS2Gp334+j5pqwzyvcgI0TdDUad5EzVN2wmgdiczW0barVKvivj8FY4C1pA
         Gfw5gYivdwF4xB0pbwJzFXcidb6yA69IwV3exAQM+HneClYQxCPTZmvN9+ay1AHBWqQ6
         nTJKBeD3p29N/FpfL2gueM/2I/b8HhFzTi9Do7rENMUojoy7f9eYr46mTVPB1Wl7414y
         yVqqakhmYWkd+YrFz6HVTuMVaxr5jlnpENwFwRdPwoCirb2VC21jobsU9GbX32Dtkt8e
         3lQWzYNmicG8LBhnpuFb1+L+0qDM3rRAbZJakIVcf9C70+tYDT+QaK0Gw9lemA1y/99g
         gJjA==
X-Gm-Message-State: AOJu0Yz7h/3z+b6OXEcTKze0zW06eYy91ORhku8W3VTwB8t1WCDmd3Dx
	KnG98JQ/TWWDlZq8O/b9Q30bXA7j+emfsR7QL+ypVPioa8R59wRFdhTk1gPFHFwdtUcN/Uf5hhh
	PzCzrfj/Sbp+OLF0poEBaHJ5nvLLDP0M=
X-Gm-Gg: ASbGncuaMSQzWsh8tcKaSEuxCFVxPwJ7dptuOVuoMCbA+W8Ngjd6eQpHbOmI8QXlnmI
	WQqidhMCPvF6vdXXVsvBeWWX/Un3fU1H3vQ/lkTInR/gsiW9jBbxQsuogIH8n1j6W9WMDHVWL8J
	DOA/4bL/EtCSigYDUk5Ca/Lc1kXQqS6lE0acxmxzJZHAw0cRH3zMVFNsjuYpOr1na4s2exQJSJ1
	0UyRWDyXO4dTiDud0Td/haH4YMpt2P50LcmEOcqdo8C3ne2XM9DfdfYST0VU95qLheVacWi
X-Google-Smtp-Source: AGHT+IHXvfv/SgWWp+sjCZv3KPT4GuxdtlR538oFQPzrVxtSYjE1mq72LC4VVaDVWFuMRISfX2pURGMn90sqYaiYddI=
X-Received: by 2002:a17:90a:e7cb:b0:32b:9774:d340 with SMTP id
 98e67ed59e1d1-3408309af99mr5937135a91.33.1761932865440; Fri, 31 Oct 2025
 10:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251031173559.1916806-1-johannes.schneider@leica-geosystems.com> <CADkTA4MqjYaf_3TbpqT53AkCcznuHfxbZ_S1eLDyRqozxKcPNg@mail.gmail.com>
In-Reply-To: <CADkTA4MqjYaf_3TbpqT53AkCcznuHfxbZ_S1eLDyRqozxKcPNg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 31 Oct 2025 13:47:33 -0400
X-Gm-Features: AWmQ_bmbK5rJqQZfdozBIT5QcMQri8EBDDoPOlhTC3TUT3HZM_FPuWOpBuiiJsQ
Message-ID: <CADkTA4Mz_-fJoWvHAUg4e9KFg4dMFcUG2UyMSkv=tp2wqemGrw@mail.gmail.com>
Subject: Re: [scarthgap][PATCH v2] perf: add Kbuild file for unistd.h
To: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000900d2c064277f610"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 17:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225557

--000000000000900d2c064277f610
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 1:45=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

>
>
> On Fri, Oct 31, 2025 at 1:36=E2=80=AFPM Johannes Schneider <
> johannes.schneider@leica-geosystems.com> wrote:
>
>> Building 'perf' with/against newer kernels (>=3D6.14) would fail because
>> of a missing 'Kbuild' in the folder created when manually installing
>> the 'unistd.h' header from libc.
>>
>> Add a oneliner that creates the missing file, with the relevant
>> content taken from the kernels Kbuild file.
>>
>> Tested with kernel version: 6.16.4
>>
>
> I wasn't clear.
>
> You also need to test this with the older kernel versions and let us know
> that it worked.
>
> Not just "it should work", we can't let the infrastructure pick up any
> failures, it needs to be tested before submission.
>
> But thanks for not just saying you tested it (if you haven't). if you hav=
e
> done those tests and I'm just misunderstanding, a quick v3 with
> confirmation would be great.
>

I hit send too soon.

The reason that we really need those tests is:  if you've noticed on master
we had significant reproducibility issues with perf, which you'd also have
when building a 6.16 perf on that old release.

So once we add the support for building it all, there will be expectations
that it passes testing on all versions.

Cheers,

Bruce



>
> Cheers,
>
> Bruce
>
>
>
>>
>> Signed-off-by: Johannes Schneider <
>> johannes.schneider@leica-geosystems.com>
>> ---
>>  meta/recipes-kernel/perf/perf.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf=
/
>> perf.bb
>> index 11fa917649..7db5fe6d1c 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -368,6 +368,7 @@ do_configure:prepend () {
>>      # so we copy it from the sysroot unistd.h to the perf unistd.h
>>      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h
>> ${S}/tools/include/uapi/asm-generic/unistd.h
>>      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h
>> ${S}/include/uapi/asm-generic/unistd.h
>> +    echo "mandatory-y +=3D unistd.h" > ${S}/include/uapi/asm-generic/Kb=
uild
>>
>>      # the fetcher is inhibited by the 'inherit kernelsrc', so we do a
>> quick check and
>>      # copy for a helper script we need
>>
>> base-commit: 649147913e89cd8f7390cb17cd0be94c9710ffa6
>> --
>> 2.43.0
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

--000000000000900d2c064277f610
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 31, 2025 at 1:45=
=E2=80=AFPM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">=
bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Oct 31, 2025 at 1:36=E2=80=AFPM Johannes Sc=
hneider &lt;<a href=3D"mailto:johannes.schneider@leica-geosystems.com" targ=
et=3D"_blank">johannes.schneider@leica-geosystems.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Building &#39;perf&#39=
; with/against newer kernels (&gt;=3D6.14) would fail because<br>
of a missing &#39;Kbuild&#39; in the folder created when manually installin=
g<br>
the &#39;unistd.h&#39; header from libc.<br>
<br>
Add a oneliner that creates the missing file, with the relevant<br>
content taken from the kernels Kbuild file.<br>
<br>
Tested with kernel version: 6.16.4<br></blockquote><div><br></div><div><div=
 style=3D"font-size:small">I wasn&#39;t clear.</div><div style=3D"font-size=
:small"><br></div><div style=3D"font-size:small">You also need to test this=
 with the older kernel versions and let us know that it worked.</div><div s=
tyle=3D"font-size:small"><br></div><div style=3D"font-size:small">Not just=
=C2=A0&quot;it should work&quot;, we can&#39;t let the infrastructure pick =
up any failures, it needs to be tested before submission.</div><div style=
=3D"font-size:small"><br></div><div style=3D"font-size:small">But thanks fo=
r not just saying you tested it (if you haven&#39;t). if you have done thos=
e tests and I&#39;m just misunderstanding, a quick v3 with confirmation wou=
ld be great.</div></div></div></div></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">I hit send too soon.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">The reason that we really need=
 those tests is:=C2=A0 if you&#39;ve noticed on master we had significant r=
eproducibility=C2=A0issues with perf, which you&#39;d also have when buildi=
ng a 6.16 perf on that old release.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">So once we add the support for building it all, there will be ex=
pectations that it passes testing on all versions.</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">Cheers,</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><d=
iv style=3D"font-size:small"><br></div><div style=3D"font-size:small">Cheer=
s,</div><div style=3D"font-size:small"><br></div><div style=3D"font-size:sm=
all">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Signed-off-by: Johannes Schneider &lt;<a href=3D"mailto:johannes.schneider@=
leica-geosystems.com" target=3D"_blank">johannes.schneider@leica-geosystems=
.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index 11fa917649..7db5fe6d1c 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -368,6 +368,7 @@ do_configure:prepend () {<br>
=C2=A0 =C2=A0 =C2=A0# so we copy it from the sysroot unistd.h to the perf u=
nistd.h<br>
=C2=A0 =C2=A0 =C2=A0install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.=
h ${S}/tools/include/uapi/asm-generic/unistd.h<br>
=C2=A0 =C2=A0 =C2=A0install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.=
h ${S}/include/uapi/asm-generic/unistd.h<br>
+=C2=A0 =C2=A0 echo &quot;mandatory-y +=3D unistd.h&quot; &gt; ${S}/include=
/uapi/asm-generic/Kbuild<br>
<br>
=C2=A0 =C2=A0 =C2=A0# the fetcher is inhibited by the &#39;inherit kernelsr=
c&#39;, so we do a quick check and<br>
=C2=A0 =C2=A0 =C2=A0# copy for a helper script we need<br>
<br>
base-commit: 649147913e89cd8f7390cb17cd0be94c9710ffa6<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000900d2c064277f610--

