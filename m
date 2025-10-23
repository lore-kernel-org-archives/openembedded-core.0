Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAAFCCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 12:16:42 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.18829.1761221792340035312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 05:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lYLm/3sZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-87c13813464so10245426d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761221791; x=1761826591; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr5vS+dfkYbNw/ADeloNaeyIHQ1YW6wYXOmHOVcmPEM=;
        b=lYLm/3sZy/xbJZvkCFzgoLDoxk+zV0cr3pUa61f7wEwa1Bbd8sHDzz3PUUq2dC1i5w
         0g9h9HhiGdsadPIdHGUPOEhhi4twXgilC+IDbdA+EtPeSlFe3O4hNkFRMduvZAc+9dvH
         MHd9WbmKb0K7SqJL+/jw3AgurFEN91PThgUrvF6sIfyK3giadlWBde+S6ehHEpyKgcZP
         p1+CUQR+zdwt82x0bWCj9wNGbqsFn++Yqwk58iFswY6vFXShy2JRGZ/fSR2Is1kRpP97
         tf1bK7pJiSiFzLjQK8Y1z6nR6n6hHawLJ4ZlWqy5FTjZe8HIIZ3+r9v4YBDlMeWpaLDF
         YZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761221791; x=1761826591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jr5vS+dfkYbNw/ADeloNaeyIHQ1YW6wYXOmHOVcmPEM=;
        b=T74VDNNtS7gk9epj5ZGSs8ZUoNIr+djTnMVGF0/gLB8uExgeSJsjYw5aLxJg/u/Iah
         aBBvuJj/z2x79VaX+DCHFaIrLQfFEhU6Cm/0kv3wTX9jAbgcwKE87WzHR/biF6UEVPxy
         COWrNiCl56wBpaEcQVlTZ74mqQhzAwaDid7rkx9rv1U2dIrmoIF3h4KxzA8dqaoPxo2f
         xmSZQKmXbEnvXT+v6+hA6yiP0yJp6z9fGF5IMhZD88ElwZb0P987QHyPCa7ARxcoaWxU
         qnjbHmI5lUY7910vL3Eqjf38oFdGdhrqMZCaPSeWSMKekNJ0ExLeE5tW/AhP8tacK+2H
         rU+g==
X-Gm-Message-State: AOJu0Yx3lV0H65AzFBZQticplIgD3XSpdPY2kiJgcvjCh5PCRUm6diFE
	sXezVTLB+AwbJuu4rwnKuDaYcJquojKCb0yvJuqhjcOuWfmNSc1krvWwM9EXF/gFB7/RZFf/TiT
	Hg+onLremHZT1Zr9hsijSIwkZw8oavNs=
X-Gm-Gg: ASbGncsz/PH7NNijJDtTBHdvdOjzT5TDYLitXuyXYbNPEcQ4MUmEawc12ZoO6bkdmBu
	dmjHAi5UELlhN+L7R5hV2VvUA763ELnXI//6bxBo+dKazewk+5uJfydsba4PenOUNzvr3PnOTgg
	E5wSGiLvWvCbuxcTExiVyUgYXfyAh3P6DKb9jYq8BcEacHjGufAoMsLP2ySIHfS7a9tSf1yzipM
	KQFllqBCFpVNawU42ZkWZpYSpijFOeiHUFPhFaYQEGy3FNqmcbpYMzWIKdl1IaPYm5Sivv1LTx5
	svuIsCez5XwZa7eMU3RjYB3bH1DJa86XOMXoCreshWg7dL2JWJxZloTcCVMlILn9aJPsbhp6pr6
	+124Tj6gJqxquLjz3O3Ja6Dlr
X-Google-Smtp-Source: AGHT+IF+8zpee2VWGRjf+4XdMsgUZ+Sxkd0XRGLgJFB5BnDyv+7PvvUjhHvY+EEXO/tyZnWxFbZw/vGZwQU19fCut30=
X-Received: by 2002:ad4:4ea1:0:b0:87c:a721:42f7 with SMTP id
 6a1803df08f44-87ca7214384mr224437836d6.22.1761221791270; Thu, 23 Oct 2025
 05:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251020171026.2965650-1-ecordonnier@snap.com>
 <20251020171026.2965650-2-ecordonnier@snap.com> <CANNYZj-Prjhs710rHr1S4L4682Ta_=ADVgaFOqPTpNnR9QwPtg@mail.gmail.com>
 <CAHUKmYZazUn6RZA3GZxDAmQ7MGKKd469rwy_EUkxxcrzf3xPaQ@mail.gmail.com>
In-Reply-To: <CAHUKmYZazUn6RZA3GZxDAmQ7MGKKd469rwy_EUkxxcrzf3xPaQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Oct 2025 14:16:20 +0200
X-Gm-Features: AWmQ_bkhL7sOuh7A1J4cpu00KYZFiT6gHajakbtU7S9EAKiicI21YSgwhhPGRZM
Message-ID: <CANNYZj-cy_0EznKi1v0-_-z6VjF_q-vsMrtQch8G7-A=53hJ4A@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 2/2] opkg: upgrade 0.8.0 -> 0.9.0
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003d4f670641d267a6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 12:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225249

--0000000000003d4f670641d267a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If you submitted the patch upstream, the correct status is Submitted
[where]. There are some existing patches which are pending without reason,
they=E2=80=99re all old legacy from times where rules were less strict, and=
 in core
there=E2=80=99s only about 150 of them out of about 1000 overall.

Alex

On Thu 23. Oct 2025 at 13.37, Etienne Cordonnier <ecordonnier@snap.com>
wrote:

> It was not merged yet as I sent the patch, so pending was correct, and
> pending without any reason seems to be the standard used in almost all th=
e
> existing patches.
>
> I'll resend the patch with the updated status.
>
> On Thu, Oct 23, 2025 at 12:49=E2=80=AFPM Alexander Kanavin <alex.kanavin@=
gmail.com>
> wrote:
>
>> On Mon, 20 Oct 2025 at 19:10, Etienne Cordonnier via
>> lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
>> wrote:
>> > +From: Etienne Cordonnier <ecordonnier@snap.com>
>> > +Date: Mon, 20 Oct 2025 18:57:56 +0200
>> > +Subject: [PATCH] config.h.in: fix typo
>> > +
>> > +Upstream-Status: Pending
>>
>> Pending without any reason =3D=3D grumpy Alex.
>>
>> This is actually a backport, please update the status:
>>
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.=
org_opkg_commit_-3Fid-3Dd723a90bfe6409c7ad983ed911225d4aefbfd09e&d=3DDwIBaQ=
&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9Ts=
Rih1DULJTKUkSGa66m67E&m=3DTxd2N_EjxFdjqxkwk8alOMX5JreJ52tWF1YjtLksgVFjvSOSJ=
IWhGIWGTVtW03Fy&s=3D-fs5LUzASqAmTqOx8ecIAib0uWq4U7HM_VUan9rqHC0&e=3D
>>
>> Alex
>>
>

--0000000000003d4f670641d267a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">If you submitted the patch upstream, the correct status i=
s Submitted [where]. There are some existing patches which are pending with=
out reason, they=E2=80=99re all old legacy from times where rules were less=
 strict, and in core there=E2=80=99s only about 150 of them out of about 10=
00 overall.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><d=
iv><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu 23. Oct 2025 at 13.37, Etienne Cordonnier &lt;<a =
href=3D"mailto:ecordonnier@snap.com">ecordonnier@snap.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)"><div dir=3D"ltr">It was not merged yet as I sent th=
e patch, so pending was correct, and pending without any reason seems to be=
 the standard used in almost all the existing patches.<div><br></div><div>I=
&#39;ll resend the patch with the updated status.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 23, 2025=
 at 12:49=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:r=
gb(204,204,204)">On Mon, 20 Oct 2025 at 19:10, Etienne Cordonnier via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com=
@lists.openembedded.org" target=3D"_blank">snap.com@lists.openembedded.org<=
/a>&gt;<br>
wrote:<br>
&gt; +From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" =
target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; +Date: Mon, 20 Oct 2025 18:57:56 +0200<br>
&gt; +Subject: [PATCH] <a href=3D"http://config.h.in" rel=3D"noreferrer" ta=
rget=3D"_blank">config.h.in</a>: fix typo<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
<br>
Pending without any reason =3D=3D grumpy Alex.<br>
<br>
This is actually a backport, please update the status:<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yocto=
project.org_opkg_commit_-3Fid-3Dd723a90bfe6409c7ad983ed911225d4aefbfd09e&am=
p;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAh=
kbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DTxd2N_EjxFdjqxkwk8alOMX5J=
reJ52tWF1YjtLksgVFjvSOSJIWhGIWGTVtW03Fy&amp;s=3D-fs5LUzASqAmTqOx8ecIAib0uWq=
4U7HM_VUan9rqHC0&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://url=
defense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commi=
t_-3Fid-3Dd723a90bfe6409c7ad983ed911225d4aefbfd09e&amp;d=3DDwIBaQ&amp;c=3Dn=
cDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRi=
h1DULJTKUkSGa66m67E&amp;m=3DTxd2N_EjxFdjqxkwk8alOMX5JreJ52tWF1YjtLksgVFjvSO=
SJIWhGIWGTVtW03Fy&amp;s=3D-fs5LUzASqAmTqOx8ecIAib0uWq4U7HM_VUan9rqHC0&amp;e=
=3D</a> <br>
<br>
Alex<br>
</blockquote></div>
</blockquote></div></div>

--0000000000003d4f670641d267a6--

