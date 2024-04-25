Return-Path: <sheng.tan@9elements.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B549FC4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 17:40:56 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.23424.1714066853771044581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Apr 2024 10:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=gaEMU1w8;
 spf=pass (domain: 9elements.com, ip: 209.85.218.50, mailfrom: sheng.tan@9elements.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a5557e3ebcaso217103966b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 10:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1714066852; x=1714671652; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gNZBL//tlRfQ+an0K9BD7zYhTldILPaaXmxxV55spEk=;
        b=gaEMU1w866eA9kztWrTUgjJvapSDJbdd/pjWdfxYh01HjiXgO8Ta8Kn3N4a1MfAqBR
         5TLysRqxfb3aLObuPRV18jn+Xj4gKTkH4AggomyGz0lB7C+RDm1xHADG6i0TRES+TCee
         4QT7cjuSHaPgabzvZIHEVgUvyFgq41quyiH+12Jn3lpnpmIJBbHWRQ2O7JKYcFqieOrx
         O3Bziy2YLkdO9T264bhKrgwoT+Fkyav+n/hZpPmJLzjyTOQsH/Gi4B58exR9Ad5he9Zc
         kyVtf9XxrqKtSig/6l7fNVie/zzmT31VJHwksj40mPr2Rfz+SMxl1iF6sPqPbcDpWQXf
         z2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714066852; x=1714671652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNZBL//tlRfQ+an0K9BD7zYhTldILPaaXmxxV55spEk=;
        b=pKee3ZD6rNs3nHllDLYLiZBu3jQSSZI6ir5WFSdry/n7+OFlS1gW1BWJBr2G+DeFYA
         Z9fScQ/jkW/ZTDBR6cMFhO4a+pBww7tbRNqzYvPR1bY2vdOki3OpJAKLKb5iI9ytj+9C
         vWVAKPlTIVaXOvTM4jp9Pda6JStcS4HeZkfeRjyXkZRY8he9UlJHEByXTci+aTt4EjwJ
         bWCK9DdZIQIOLyTDPBQWrysLmSiB1vBSiveziTW4s8PHQv0ETpxlC7pxZU73YXIX3RIa
         hBagLAp9lY8xhwn3bqvN3bK1LME7D1AD4pUUr1/FMZkxPhFe4WYIMGSjYZiAgTRPvNqE
         ih9w==
X-Forwarded-Encrypted: i=1; AJvYcCUcxcnQbWFVmJxLnTIrmpN7UbdAb7b6zVCBQY+AwGJm92HNKEULnQuNxBnMEUxTNOtPiFootQeromPahfvE5MN4nIJc5qnCA5f137z+8AkJkhASfIdQTPi/
X-Gm-Message-State: AOJu0YzxWCeuVbZ5DHjd9ES8x0RreZWfq1LzY9p6T2E5w7BURzsBeb4T
	eJWEFj4u86TcGuPdWd2itxK/G5s9YoFQS6etiE6ZLPSlnFkkWvAX7fqA0R5SYGnhrozVao7173R
	b2mXmo1lBhvKG145l2xOqUlZyLAjSsazprnFcsg==
X-Google-Smtp-Source: AGHT+IF2dhPFig5n2BCSo50QohY8o7G0G3NYFjnndvSriUfV3OeWLDmkBjbB69kxmImvxkr3uWOCHSJGc1KpVUET9w8=
X-Received: by 2002:a17:907:986a:b0:a58:7830:a548 with SMTP id
 ko10-20020a170907986a00b00a587830a548mr3682899ejc.3.1714066851768; Thu, 25
 Apr 2024 10:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAMWxwJ0znPDyQAKAwv8PL9GwyCCEpW9+2SDmXsygNyK26_xF-A@mail.gmail.com>
 <CAMWxwJ1aad-ggrC+Bug=RGx1yQcFADOSWiZMDZv8S2AnJ7ntnw@mail.gmail.com>
 <5684983E-FC35-4766-BA02-4D5BCBCB6796@arm.com> <17C993B983870D20.19690@lists.openembedded.org>
In-Reply-To: <17C993B983870D20.19690@lists.openembedded.org>
From: Lean Sheng Tan <sheng.tan@9elements.com>
Date: Thu, 25 Apr 2024 19:40:15 +0200
Message-ID: <CAMWxwJ3ok_d17XnVEgSm3H3qeKK+7U3AQ4OuwNFXTo-jWjtHoQ@mail.gmail.com>
Subject: Re: [OE-core] btrfs-tools-native build python error
To: sheng.tan@9elements.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Hansen, Alexander" <alexander.hansen@9elements.com>, John Chung <John.Chung@arm.com>, patrick@stwcx.xyz
Content-Type: multipart/alternative; boundary="000000000000d248c80616ef4949"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 17:40:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198707

--000000000000d248c80616ef4949
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,
Here is the background of this:
Initially we found this issue, when we are trying to build the Arm FVP for
openbmc, as you can see from the discussion here:
https://gerrit.openbmc.org/c/openbmc/openbmc/+/70070/comment/4a963c24_75b11=
840/

So thanks to the kind help from Patrick Williams (cc'ed here), he proposed
to try this fix:

> diff --git a/poky/meta/recipes-kernel/perf/perf.bb
> b/poky/meta/recipes-kernel/perf/perf.bb
> index 11fa917649..d39265367b 100644
> --- a/poky/meta/recipes-kernel/perf/perf.bb
> +++ b/poky/meta/recipes-kernel/perf/perf.bb
> @@ -54,7 +54,7 @@ PROVIDES =3D "virtual/perf"
>  inherit linux-kernel-base kernel-arch manpages


 # needed for building the tools/perf Python bindings
> -inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python',
> 'python3targetconfig', '', d)}
> +inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python',
> 'setuptools3-base python3targetconfig', '', d)}


However, it is still not working. I added a workaround with this patch:
https://gerrit.openbmc.org/c/openbmc/openbmc/+/71017

Still, Patrick thinks that this should not be the case, and the proper fix
should be done via OpenEmbedded.

Currently we are not sure how to fix this properly and don't have any idea.
Much appreciated if you or anyone have any idea on this!

Thank you,
Sheng


On Thu, 25 Apr 2024 at 18:45, Lean Sheng Tan via lists.openembedded.org
<sheng.tan=3D9elements.com@lists.openembedded.org> wrote:

> Hi Ross,
> Thank you for your quick response!
> That makes sense now.
>
> Regarding your statement:
> "That dependency in btrfs-tools might be actually not required, or you
> might want to make the recipe depend on python3-native."
> May I know if something has to be fixed from the meta-openembedded or
> generic yocto build?
> If not, what would be the best way to approach it?
>
> Thanks again.
>
> Best Regards,
> Sheng
>
>
> On Thu, 25 Apr 2024 at 18:34, Ross Burton <Ross.Burton@arm.com> wrote:
>
>> On 25 Apr 2024, at 13:29, Sheng Lean Tan via lists.openembedded.org
>> <sheng.tan=3D9elements.com@lists.openembedded.org> wrote:
>> >
>> > Hi,
>> > Good day to openembedded community!
>> >
>> > This is my first post - hope this is the right place to ask for help
>> regarding a build issue, as refer from here:
>> >
>> https://gerrit.openbmc.org/c/openbmc/openbmc/+/71017/comment/195b742f_6c=
f8da09/
>> >
>> > Currently, we saw this issue when building this on openBMC which is
>> based on Yocto:-
>> > The error found when manually run bitbake btrfs-tools-native is as
>> follows:
>> >  checking for a Python interpreter with version >=3D 3.4... python3
>> >  checking for python3...
>> /home/apwillia/local/builds/lf-build-yosemite4/tmp/hosttools/python3
>> >  checking for python3 version... 3.11
>> >  checking for python3 platform... linux
>> >  checking for GNU default python3 prefix... ${prefix}
>> >  checking for GNU default python3 exec_prefix... ${exec_prefix}
>> >  checking for python3 script directory (pythondir)...
>> ${libdir}/python3.11/site-packages
>> >  checking for python3 extension module directory (pyexecdir)...
>> ${libdir}/python3.11/site-packages
>> >  checking for python-3.11... no
>> >  configure: error: Package requirements (python-3.11) were not met:
>> >
>> >  No package 'python-3.11' found
>> >
>> > To bypass this, we have to manually remove in OpenBMC with this tweak:
>> > PACKAGECONFIG:remove:pn-btrfs-tools-native =3D "python"
>> >
>> > May I know if this is a real bug, or if we did miss something from our
>> configuration?
>>
>> It looks like the native btrfs-tools is trying to build against the host
>> python:
>>
>> >  checking for python3...
>> /home/apwillia/local/builds/lf-build-yosemite4/tmp/hosttools/python3
>>
>> So the problem is that your build host doesn=E2=80=99t have python3-dev =
or
>> similar installed.
>>
>> That dependency in btrfs-tools might be actually not required, or you
>> might want to make the recipe depend on python3-native.
>>
>> Ross
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198706):
> https://lists.openembedded.org/g/openembedded-core/message/198706
> Mute This Topic: https://lists.openembedded.org/mt/105729019/6757431
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> sheng.tan@9elements.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d248c80616ef4949
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ross,<div>Here is the background=C2=A0of this:<br>Initi=
ally we found this issue, when we are trying to build=C2=A0the Arm FVP for =
openbmc, as you can see from the discussion here:<br><a href=3D"https://ger=
rit.openbmc.org/c/openbmc/openbmc/+/70070/comment/4a963c24_75b11840/">https=
://gerrit.openbmc.org/c/openbmc/openbmc/+/70070/comment/4a963c24_75b11840/<=
/a><br><br>So thanks to the kind help from Patrick Williams (cc&#39;ed here=
), he proposed to try this fix:</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">diff --git a/poky/meta/recipes-kernel/perf/<a href=3D"http://pe=
rf.bb">perf.bb</a> b/poky/meta/recipes-kernel/perf/<a href=3D"http://perf.b=
b">perf.bb</a><br>index 11fa917649..d39265367b 100644<br>--- a/poky/meta/re=
cipes-kernel/perf/<a href=3D"http://perf.bb">perf.bb</a><br>+++ b/poky/meta=
/recipes-kernel/perf/<a href=3D"http://perf.bb">perf.bb</a><br>@@ -54,7 +54=
,7 @@ PROVIDES =3D &quot;virtual/perf&quot;<br>=C2=A0inherit linux-kernel-b=
ase kernel-arch manpages</blockquote><div><br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">=C2=A0# needed for building the tools/perf Python bind=
ings<br>-inherit_defer ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;p=
ython&#39;, &#39;python3targetconfig&#39;, &#39;&#39;, d)}<br>+inherit_defe=
r ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;python&#39;, &#39;setu=
ptools3-base python3targetconfig&#39;, &#39;&#39;, d)}</blockquote></div><d=
iv><br></div><div>However, it is still not working. I added a workaround=C2=
=A0with=C2=A0this patch:<br><a href=3D"https://gerrit.openbmc.org/c/openbmc=
/openbmc/+/71017">https://gerrit.openbmc.org/c/openbmc/openbmc/+/71017</a><=
br></div><div><br></div><div>Still, Patrick thinks that this should not be =
the case, and the proper fix should be done via OpenEmbedded.<br><br>Curren=
tly we are not sure how to fix this properly and don&#39;t=C2=A0have any id=
ea. Much appreciated if you or anyone have any idea on this!</div><div><br>=
</div><div>Thank you,</div><div>Sheng</div><div><br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 25 Apr 20=
24 at 18:45, Lean Sheng Tan via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;sheng.tan=3D<a href=3D"mailto:9elements.com@l=
ists.openembedded.org">9elements.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
>Hi Ross,<div>Thank you for your quick=C2=A0response!</div><div>That makes =
sense now.</div><div><br></div><div>Regarding your statement:</div><div>&qu=
ot;That dependency in btrfs-tools might be actually not required, or you mi=
ght want to make the recipe depend on python3-native.&quot;<br></div><div>M=
ay I know=C2=A0if something has to be fixed from the meta-openembedded=C2=
=A0or generic yocto build?</div><div>If not, what would be the best way to =
approach it?</div><div><br></div><div>Thanks again.</div><div><br clear=3D"=
all"><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>=
<div><font color=3D"#000000" face=3D"Helvetica">Best Regards,</font></div><=
div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px">Sheng</div></div><div style=3D"font-size:medium;color:rgb(34,34,34);fo=
nt-family:Helvetica;line-height:11px"></div></div></div></div><br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Thu, 25 Apr 2024 at 18:34, Ross Burton &lt;<a href=3D"mailto:Ross.Burton@ar=
m.com" target=3D"_blank">Ross.Burton@arm.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On 25 Apr 2024, at 13:29, Sheng=
 Lean Tan via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" =
target=3D"_blank">lists.openembedded.org</a> &lt;sheng.tan=3D<a href=3D"mai=
lto:9elements.com@lists.openembedded.org" target=3D"_blank">9elements.com@l=
ists.openembedded.org</a>&gt; wrote:<br>
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
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#198706): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/198706" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/198706</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105729019/675=
7431" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105729019/6757431</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:sheng.tan@9elements.com" t=
arget=3D"_blank">sheng.tan@9elements.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d248c80616ef4949--

