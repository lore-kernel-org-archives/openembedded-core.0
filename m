Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D654CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 16:46:50 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.140.1761929203326691823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 09:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A9iBjDeU;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71d71bcac45so29140877b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 09:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761929202; x=1762534002; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bNf6r78wFNEQtCbZ+cNqgNwUonepB4FXNoCI7iYKoAc=;
        b=A9iBjDeU7lH+K8UY8ZCUnoIoUhEokTR3xcmomsnGjfB/i6k7467BY6KGlcphSZ4YSt
         DBeo4PKHPNmUH+yUhtJOGG3FTCdssQPa32h0p4GqCzIjH8ZaLSXMdWo7En03qN8sftVe
         TCB26KoEYZaPEHxogodaQDAOSoRWBHe+RdVAUK84izJ0DfFyykEmt5k+I4lihwtyESHz
         wrg9CY+yKFdxGJguAJ8DMnyECkieQAHuajnRrXhEacZ7ZL2lnUPCMEnI4RCAjYQLCXBn
         A+/yoDemOJuDo8sarR+KrF7H1nF0HLth9+CTXNczTcsqzXw8mJ/FxfsfqEiN1bh+f39Z
         2A7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761929202; x=1762534002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNf6r78wFNEQtCbZ+cNqgNwUonepB4FXNoCI7iYKoAc=;
        b=NpOqTw6SxSxy5GMlvYPfYqgS89rbPMujp31HQBwHVlTbOL4dGYXes/urTi2bxEJ42m
         B8MEA6qjJOnM0hFOfGaPwrY1GwzZNWj0x27LYSPyOnCeNYIW0XxQvclQftn8JKXSZ1Gi
         zwAbWCkLp974QX8NUaEXgUZkS0aUv+87iNkjUaYm5Ad87F0GTDq//RHVI8iygwHO5Ng/
         KbS2vk8KZyIj2AWM8rbC97227Bzuvl8N63NV0n7pZ9acR4ZLYanzmB6AFLsYamF4tsGS
         DvDiKK42PaObYmS95KF2yy8wfjKhqDzcO9oKIzgZ2NUzE+yDmZF3VdSs7gI9P4Amzdjg
         y31g==
X-Forwarded-Encrypted: i=1; AJvYcCUbnLlw+O8XybaGHwQOF5buXmwO+NHg9Bp5V/j1jmdKkKvtonGOAmS79V5FvLtF0S3drAqM2Yn2/YMng2PmU9eypw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzziEak+Fvg5pvZk91GcqihcOX7jd4e+2UFNIKKNWXJoRKdg6ok
	FOaCUKNKbk6GAh/NpQu2VgkDU+aE9UaSnX6qBbFwwdtM146TRpND14oPvgus4YIh0VmVcPPmHJI
	YYet5zftNDGEQqjmHsEEfi2Ys9rfKkUA=
X-Gm-Gg: ASbGncvkpRDlFJPHXlGZVWJcuI0PP4CRp008U1DVDf8bGTid+BLx0dTIWFqSaslRZyf
	FTUH0bqKFiiiUt/zZu9KDsZG/HZ7p1fC5rxn6OYGeEn35xvd+Yi4mL06FhDWs/skCjDg9uaiNYu
	9tR4foGuRjB/oVnVOn3JVek2JVpliibM1yoioBmDG8sImCZf3Acy11KrpChj0V6dTYMxYn2LMrN
	yy3vnWDCxxm3sEpUs8QPizbKRnFGGt6KwM2Rj/TmvQcJHVpvSGugJvJCYFAZiFZHvJjJ+w=
X-Google-Smtp-Source: AGHT+IEv1Kodnlm0JPxPSlRiF9K4v2Tvuz3TM4fYFL57Fh0XOW+pJeQswZ/TKvPV1pZQ9zAtlYYfxS3jWpDoUm+B7bg=
X-Received: by 2002:a05:690c:9212:b0:786:4e07:b015 with SMTP id
 00721157ae682-7864e07bf0fmr18832957b3.9.1761929202247; Fri, 31 Oct 2025
 09:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761844161.git.bruce.ashfield@gmail.com> <64d62995-6c65-4cf1-9293-9c5ac364dfef@bootlin.com>
In-Reply-To: <64d62995-6c65-4cf1-9293-9c5ac364dfef@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 31 Oct 2025 12:46:35 -0400
X-Gm-Features: AWmQ_bn1WhpFW5AU6dAZn_BksXesPH5oL-nuq63QTfZhv-cH1u-ON4SVVgBjVIA
Message-ID: <CADkTA4P6JOKd1p7B7GbO3DhCx2YuK5jUuuuJAvoOiidz+dukcQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/14] kernel-yocto: consolidated pull request
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000382b650642771cc9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 16:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225551

--000000000000382b650642771cc9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 12:41=E2=80=AFPM Joao Marcos Costa <
joaomarcos.costa@bootlin.com> wrote:

> Hello, Bruce (and Richard)
>
> I hope this email finds you well.
>
> On 10/30/25 18:12, Bruce Ashfield via lists.openembedded.org wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > I've put all of the patches I've sent for 6.17 into this series. The
> > only new ones are a bump to 6.17.5 (Which also contains some
> configuration
> > changes to fix audit warnings for genericarm64) and t he addition of
> > genericarm64 SRCREVs to the 6.16 and 6.17 appends.
> >
> > These are against master, I can rebase to master-next as needed (if
> > some of the older ones merged there that I didn't notice).
> >
> > If this series works out, we'll remove 6.16 from the tree.
> >
> > Cheers,
> >
> > Bruce
>
> I spotted this ptest failure likely related to this update:
> Failed ptests:
> {'lttng-tools':
> ["tests.serial_3_-_Test_script_'tools/channel/test_cli_legacy_channel_buf=
fering_policies.py'_returned_code_1._4_passed,_0_failed,_0_skipped,_6_plann=
ed_[total:_4]",
>
>
>
> "tests.serial_6_-_Test_script_'tools/filtering/test_valid_filter[_0.00000=
0]_Linux_version_6.17.6-yocto-standard"]}
>
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2561/s=
teps/13/logs/stdio
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2520/s=
teps/13/logs/stdio
>
> Could you please take a look?
>
>
We are well over the pain threshold for this. I have no time over the
weekend to look at anything.

I'm abandoning the series, and we'll go with 6.16 for the release.  -dev
has 6.17 and 6.18 for those that want it, and I'll do the LTS kernel for
the spring release.

Bruce



> Have a nice weekend!
>
> --
> Best regards,
> Jo=C3=A3o Marcos Costa
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000382b650642771cc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 31, 2025 at 12:41=
=E2=80=AFPM Joao Marcos Costa &lt;<a href=3D"mailto:joaomarcos.costa@bootli=
n.com">joaomarcos.costa@bootlin.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hello, Bruce (and Richard)<br>
<br>
I hope this email finds you well.<br>
<br>
On 10/30/25 18:12, Bruce Ashfield via <a href=3D"http://lists.openembedded.=
org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:=
<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Richard,<br>
&gt; <br>
&gt; I&#39;ve put all of the patches I&#39;ve sent for 6.17 into this serie=
s. The<br>
&gt; only new ones are a bump to 6.17.5 (Which also contains some configura=
tion<br>
&gt; changes to fix audit warnings for genericarm64) and t he addition of<b=
r>
&gt; genericarm64 SRCREVs to the 6.16 and 6.17 appends.<br>
&gt; <br>
&gt; These are against master, I can rebase to master-next as needed (if<br=
>
&gt; some of the older ones merged there that I didn&#39;t notice).<br>
&gt; <br>
&gt; If this series works out, we&#39;ll remove 6.16 from the tree.<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Bruce<br>
<br>
I spotted this ptest failure likely related to this update:<br>
Failed ptests:<br>
{&#39;lttng-tools&#39;: <br>
[&quot;tests.serial_3_-_Test_script_&#39;tools/channel/test_cli_legacy_chan=
nel_buffering_policies.py&#39;_returned_code_1._4_passed,_0_failed,_0_skipp=
ed,_6_planned_[total:_4]&quot;, <br>
<br>
&quot;tests.serial_6_-_Test_script_&#39;tools/filtering/test_valid_filter[_=
0.000000]_Linux_version_6.17.6-yocto-standard&quot;]}<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/buil=
ds/2561/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2561/steps/13/log=
s/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/buil=
ds/2520/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2520/steps/13/log=
s/stdio</a><br>
<br>
Could you please take a look?<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">We are well over the pain threshold for this. I have no ti=
me over the weekend to look at anything.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">I&#39;m abandoning the series, and we&#39;ll go with 6.16 f=
or the release.=C2=A0 -dev has 6.17 and 6.18 for those that want it, and I&=
#39;ll do the LTS kernel for the spring release.</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
Have a nice weekend!<br>
<br>
-- <br>
Best regards,<br>
Jo=C3=A3o Marcos Costa<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000382b650642771cc9--

