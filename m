Return-Path: <sheng.tan@9elements.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7213DC4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 16:46:06 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.22091.1714063557656802540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Apr 2024 09:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=B+0B0qY5;
 spf=pass (domain: 9elements.com, ip: 209.85.208.50, mailfrom: sheng.tan@9elements.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso1878804a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 09:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1714063556; x=1714668356; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R0ptnRuVik4/zDfFW/EoxFGMRHV1K6YOx/+inOWZEGo=;
        b=B+0B0qY5TBsJDHTHeOgn08vaWbhToddyPwepgVwXWjWAmlrhjfNkvvN2748Igj9xIl
         2KUVCXUxOIPLNGpYkG5BkM7gfOkfoy/g27CvvByDeHED6E9ZKzRoPs3rA+RCBIA8UUMo
         SWJhIoMazdagy/cljbcLZyUa2dI27k/5jZ/2jU8vBgy9TTq1QApt75IPvnY3ZlEIbPu2
         +8t3b2zihPBz7Gp2kNdQZRiJqROl2v+5v33Uye39qNq7DOq0CnxBOsm9rvDybtWjlqP7
         jSbBUo9XfRPOOGQKLE38sr5pvX7fpC5hFWjsRpj9neOtVgL7/AI1sdAej/X7F409QhFQ
         NsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714063556; x=1714668356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0ptnRuVik4/zDfFW/EoxFGMRHV1K6YOx/+inOWZEGo=;
        b=SP2hRr8Q3TFreV+2jRJmp10y9qnvYYKuLCpgGMU4LKqVtRSrlBmvQv3CyBsO/xeO0i
         8BbQsSTemtJj/Dd1VKIdWIBcF3nzOM1YtzBI08NWzIBzH7eQ9TpxSQPPhK3gL1EsIZYv
         IYlF6E5osVOVav0dwtDSIeFEpISgflOx+LakFqLyUZRtfXOaWeq7qsG5P9FB9ZIMwByA
         PMMLn0OR0w5mC1aHbCHeuMcaVzIRSpq3Ux+GfZxhYMv+H30ZLj8AUCJa9XRhg6hK+G64
         9hDJDBN5vY7E8zeNNvsHSAUdQ7eAwPw+3mhbmM80q5Gbm24BfDdXl++hd39PKquRLhqH
         MHFg==
X-Gm-Message-State: AOJu0YwIbgIu5uSkAiI3sEfFuGIb+jF8+JxvjpP1xD/UVE9URmzq0c7k
	ByOTroKOTuuynr1YnrxT87yvPfZUSxzfbIx53e4Rs9VmlRjNvKScJEPzVE7kpKqOJnUmfKjq2GM
	JjI6HYa/Xmg/KvN3g3C8f6ahMmLdcTV/sEUvtHg==
X-Google-Smtp-Source: AGHT+IGGF98q9KO8kskhC92ADZ38FobTVMdkX062PdTQFHq68MEhxqjMbQTINy0w/kPNBLonZ20UBJ3qYJrgRL7DVtg=
X-Received: by 2002:a17:907:77d4:b0:a55:b520:768 with SMTP id
 kz20-20020a17090777d400b00a55b5200768mr231364ejc.32.1714063555532; Thu, 25
 Apr 2024 09:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAMWxwJ0znPDyQAKAwv8PL9GwyCCEpW9+2SDmXsygNyK26_xF-A@mail.gmail.com>
 <CAMWxwJ1aad-ggrC+Bug=RGx1yQcFADOSWiZMDZv8S2AnJ7ntnw@mail.gmail.com> <5684983E-FC35-4766-BA02-4D5BCBCB6796@arm.com>
In-Reply-To: <5684983E-FC35-4766-BA02-4D5BCBCB6796@arm.com>
From: Lean Sheng Tan <sheng.tan@9elements.com>
Date: Thu, 25 Apr 2024 18:45:19 +0200
Message-ID: <CAMWxwJ1Kd_rpySXBu1wrCsJHvb1NM--XehLZOiX9vXee10SuvA@mail.gmail.com>
Subject: Re: [OE-core] btrfs-tools-native build python error
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Hansen, Alexander" <alexander.hansen@9elements.com>, John Chung <John.Chung@arm.com>
Content-Type: multipart/alternative; boundary="00000000000059b4c00616ee8574"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 16:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198706

--00000000000059b4c00616ee8574
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,
Thank you for your quick response!
That makes sense now.

Regarding your statement:
"That dependency in btrfs-tools might be actually not required, or you
might want to make the recipe depend on python3-native."
May I know if something has to be fixed from the meta-openembedded or
generic yocto build?
If not, what would be the best way to approach it?

Thanks again.

Best Regards,
Sheng


On Thu, 25 Apr 2024 at 18:34, Ross Burton <Ross.Burton@arm.com> wrote:

> On 25 Apr 2024, at 13:29, Sheng Lean Tan via lists.openembedded.org
> <sheng.tan=3D9elements.com@lists.openembedded.org> wrote:
> >
> > Hi,
> > Good day to openembedded community!
> >
> > This is my first post - hope this is the right place to ask for help
> regarding a build issue, as refer from here:
> >
> https://gerrit.openbmc.org/c/openbmc/openbmc/+/71017/comment/195b742f_6cf=
8da09/
> >
> > Currently, we saw this issue when building this on openBMC which is
> based on Yocto:-
> > The error found when manually run bitbake btrfs-tools-native is as
> follows:
> >  checking for a Python interpreter with version >=3D 3.4... python3
> >  checking for python3...
> /home/apwillia/local/builds/lf-build-yosemite4/tmp/hosttools/python3
> >  checking for python3 version... 3.11
> >  checking for python3 platform... linux
> >  checking for GNU default python3 prefix... ${prefix}
> >  checking for GNU default python3 exec_prefix... ${exec_prefix}
> >  checking for python3 script directory (pythondir)...
> ${libdir}/python3.11/site-packages
> >  checking for python3 extension module directory (pyexecdir)...
> ${libdir}/python3.11/site-packages
> >  checking for python-3.11... no
> >  configure: error: Package requirements (python-3.11) were not met:
> >
> >  No package 'python-3.11' found
> >
> > To bypass this, we have to manually remove in OpenBMC with this tweak:
> > PACKAGECONFIG:remove:pn-btrfs-tools-native =3D "python"
> >
> > May I know if this is a real bug, or if we did miss something from our
> configuration?
>
> It looks like the native btrfs-tools is trying to build against the host
> python:
>
> >  checking for python3...
> /home/apwillia/local/builds/lf-build-yosemite4/tmp/hosttools/python3
>
> So the problem is that your build host doesn=E2=80=99t have python3-dev o=
r similar
> installed.
>
> That dependency in btrfs-tools might be actually not required, or you
> might want to make the recipe depend on python3-native.
>
> Ross

--00000000000059b4c00616ee8574
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ross,<div>Thank you for your quick=C2=A0response!</div>=
<div>That makes sense now.</div><div><br></div><div>Regarding your statemen=
t:</div><div>&quot;That dependency in btrfs-tools might be actually not req=
uired, or you might want to make the recipe depend on python3-native.&quot;=
<br></div><div>May I know=C2=A0if something has to be fixed from the meta-o=
penembedded=C2=A0or generic yocto build?</div><div>If not, what would be th=
e best way to approach it?</div><div><br></div><div>Thanks again.</div><div=
><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr"><div><div><font color=3D"#00000=
0" face=3D"Helvetica">Best Regards,</font></div><div style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px">Sheng</div></div><div=
 style=3D"font-size:medium;color:rgb(34,34,34);font-family:Helvetica;line-h=
eight:11px"></div></div></div></div><br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 25 Apr 2024 at 18:34,=
 Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On 25 Apr 2024, at 13:29, Sheng Lean Tan via <a href=3D"http://lists.openem=
bedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a>=
 &lt;sheng.tan=3D<a href=3D"mailto:9elements.com@lists.openembedded.org" ta=
rget=3D"_blank">9elements.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; Hi,<br>
&gt; Good day to openembedded community!<br>
&gt; <br>
&gt; This is my first post - hope this is the right place to ask for help r=
egarding a build issue, as refer from here:<br>
&gt; <a href=3D"https://gerrit.openbmc.org/c/openbmc/openbmc/+/71017/commen=
t/195b742f_6cf8da09/" rel=3D"noreferrer" target=3D"_blank">https://gerrit.o=
penbmc.org/c/openbmc/openbmc/+/71017/comment/195b742f_6cf8da09/</a><br>
&gt; <br>
&gt; Currently, we saw this issue when building this on openBMC which is ba=
sed on Yocto:-<br>
&gt; The error found when manually run bitbake btrfs-tools-native is as fol=
lows:<br>
&gt;=C2=A0 checking for a Python interpreter with version &gt;=3D 3.4... py=
thon3<br>
&gt;=C2=A0 checking for python3... /home/apwillia/local/builds/lf-build-yos=
emite4/tmp/hosttools/python3<br>
&gt;=C2=A0 checking for python3 version... 3.11<br>
&gt;=C2=A0 checking for python3 platform... linux<br>
&gt;=C2=A0 checking for GNU default python3 prefix... ${prefix}<br>
&gt;=C2=A0 checking for GNU default python3 exec_prefix... ${exec_prefix}<b=
r>
&gt;=C2=A0 checking for python3 script directory (pythondir)... ${libdir}/p=
ython3.11/site-packages<br>
&gt;=C2=A0 checking for python3 extension module directory (pyexecdir)... $=
{libdir}/python3.11/site-packages<br>
&gt;=C2=A0 checking for python-3.11... no<br>
&gt;=C2=A0 configure: error: Package requirements (python-3.11) were not me=
t:<br>
&gt; <br>
&gt;=C2=A0 No package &#39;python-3.11&#39; found<br>
&gt; <br>
&gt; To bypass this, we have to manually remove in OpenBMC with this tweak:=
<br>
&gt; PACKAGECONFIG:remove:pn-btrfs-tools-native =3D &quot;python&quot;<br>
&gt; <br>
&gt; May I know if this is a real bug, or if we did miss something from our=
 configuration?<br>
<br>
It looks like the native btrfs-tools is trying to build against the host py=
thon:<br>
<br>
&gt;=C2=A0 checking for python3... /home/apwillia/local/builds/lf-build-yos=
emite4/tmp/hosttools/python3<br>
<br>
So the problem is that your build host doesn=E2=80=99t have python3-dev or =
similar installed.<br>
<br>
That dependency in btrfs-tools might be actually not required, or you might=
 want to make the recipe depend on python3-native. <br>
<br>
Ross</blockquote></div>

--00000000000059b4c00616ee8574--

