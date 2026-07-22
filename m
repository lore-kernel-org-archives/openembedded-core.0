Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D20C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:38:44 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47206.1784723914165991338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aNXXFNqP;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-667b0ced2d3so13486164d50.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:38:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784723913; cv=none;
        d=google.com; s=arc-20260327;
        b=Iz994sukgiX2DeNRc1nHRov9424uYnzkP4g+kFY/7mIs8ZuWjVyhEyk8HmsFkxwg+n
         1KTk2a2LjImlctuV1ZjNh/tCv8GNKZuCMd2nHhKTSVg+FlnGczxOFezSaBis7iRoS1NT
         86/L3efYXilTGe3m3hLZ5rF3QTv1j0P51iQIqI2QthetebLmyjUNUUD5tDJRuvqsv18j
         KBbqMgCyssa9+WafSz3hdllPrNlGlXMUpauuZ3spe/pEBAaEN6zKOqyZIJkgxDSJwy0N
         6CEsxwRt4WQOcOkzSRikXSjrOpOLurmgGS0m5lJ5jBEDpOvHn8FwYhIYo50iuuNfdcyW
         Hfag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WbEsVFnU3gHgNG41PCIlvGCFWPLrwNy9jZf5d61iTiw=;
        fh=Q4rchphPa/1wWzSu+Lu3d1pqs4ZeF696/3GZiqPGoZ0=;
        b=ru0q/Vxenm5pfKU0n7Yb5diqJ4byLNv/O+pPsoYfKn7hhVz9LGz3CmTsWEHlN4jbUa
         onORoAtvS7nWqrEuw4j3cJy2p/GPlA3feQuofTXfemBwv6oPkYj6bju22OJHXlIyH8C7
         pUX4rmbuk8ohB9LADwpqAYkDYkJ6fA+ZVPXWumzPXz7cfFF/OyNTaNfyoRpGThzV/vAZ
         MKZgi6aI7cHgS57XltzwztZPpqvpFo7PqgsPcRiZLRLLc7gTfGkOYZKhwzLPPdmbdBSY
         oyuaTJoQhf8z//lJORz78SqLYSrh79YbBph70w4UG4Zs3OAtLIkjNc13Ora/581ogOHT
         G4+Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784723913; x=1785328713; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbEsVFnU3gHgNG41PCIlvGCFWPLrwNy9jZf5d61iTiw=;
        b=aNXXFNqPcsPKqeI//rAGCwirqhoaILQkUu2NoTriYnjYMJO9eLkHwMw2dxvbvf4AE7
         JTGrtqLfRc6Ct2n/NwREAZA3ZkwbG0RT8vjkFRCwiyTBD87YZxODqMeVZdBC9C4+lQL3
         4mfnSJePbcRcgKvASQtmJp3E+5h5Kl61tD0fqDmB4KrGGF6yXqCLpAwyaUKIhaPq+zDn
         D1+xVGi+vs42gG1e/gS4kWsMnFs0UkmCrxA0v4nfP+LXfTeQYXoYgWqYNYRn0AWGeY8Z
         k4iORXvSQC5DXFPr6s0/YxXN6U89Ukw4HCCCtJ4bQ2X4XLCSDfusjJDP2cd44i9QKZez
         D2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723913; x=1785328713;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WbEsVFnU3gHgNG41PCIlvGCFWPLrwNy9jZf5d61iTiw=;
        b=T5Pi6h+uzK9I8Rj1NZrroPYUiMwgH19SEKQ1gNHlsQw0nirqMhDPTJjzlMqptwZlmM
         6HbPxjC1qf/G92KMY6tyoyarlHlmyvqA9+oixVcAceTTdw1tk63KzlElU6Nw6a1UvrvO
         fmQU0qZ44FWTwPPVoior/BZ2QgPoxnp+JmeGC+6BA9TGsvK4H6pXo0Gv1uGzZ0g2kiNE
         +6dFikx5L4bRUAiHdzjhdXioZmRcjoenqyLAfV69tzQg5ruDP31hY+slMZhmUsvDbIij
         zCSX+glPG6HKa3+Pnsn+W4UN2sCwetk4jhE9LR3ekeaohNB8BIcNbe2B1wP31+FGtoWT
         kI0w==
X-Forwarded-Encrypted: i=1; AHgh+RqoQGhQPux6oUzMVFxd8Yv4k2mpvZutkI3v6wqQxs5oaESyvEeB8pHCQqvgPoxKxwR4iuYJSyP+2JccmkdSHfOHew==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzAEwcSiLIX9CykKrbGq6J6Wh+QwbwHOQidGS7hHeDi5rRVqoaZ
	P5HwENPDO9f0HgLgpH+KZzqFYLvo6QTUAE8fOR6XkxNkNpOsnojLzco78gvWsVIbl/HN0vwsZ1Q
	9+Jt2OMz7NWazKjQR+6riTwKA20Ven/k=
X-Gm-Gg: AR+sD10fthGNaRFTPCAe3aXhAEs62LQdIn57WxAN68m/v1WoCSLPMbGyxX/HN/mUoq1
	fWhfQDMLB648OGa8FLjSVjJ92mfYoFcn6Q2lQ5ywB4zVjOjWGzh8USO8Hxa0SCzh/SJhPrrNI7i
	qDLzQOr/To5DAXa9IarA6LVuhfYfP9GiCpYPCkd5QKcV0hT8afue8VqyXFdRW5edHD56ElsFUl0
	7DQiOqYlw14sYK4zcEtT0Uy21oh0e0QwYxZOpHE0hkAcCo80u6Wh5vk0Vpz5TXrQJ0KYuxMQgei
	f1BIujzHZogPHm/FSUg=
X-Received: by 2002:a05:690e:1591:20b0:664:b1c2:88f with SMTP id
 956f58d0204a3-6683ba8220cmr4719468d50.1.1784723913044; Wed, 22 Jul 2026
 05:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260722121119.888611-1-emailaddress.ashish@gmail.com>
 <978937.1784722525653637859@lists.openembedded.org> <DK53FLV3KVRE.3GAZN2WD4XNY9@smile.fr>
 <CAE_=ZzEVtYkPzW3F+an=5T7aRA++WsdXEgejrSZ6oX6Dz0xWjg@mail.gmail.com> <CAMSfU+6+thxpr5c-oCX-L1Pc678XpPnk6-PFBrRewvrZjtB6mA@mail.gmail.com>
In-Reply-To: <CAMSfU+6+thxpr5c-oCX-L1Pc678XpPnk6-PFBrRewvrZjtB6mA@mail.gmail.com>
From: Ashish Mishra <emailaddress.ashish@gmail.com>
Date: Wed, 22 Jul 2026 18:08:20 +0530
X-Gm-Features: AUfX_mzo0N1D5osavMQpj3pvqMo0hRExkKqXp2GUAm4wSWebMZY94BhJ04I8jK0
Message-ID: <CAE_=ZzHJ7LPnXqP_yu+MDME5jdV2dGYJ37i5TD0d8wg3CoXnww@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] package.bbclass: fix execution order
 bug in emit_pkgdata
To: Yoann Congal <yoann.congal@smile.fr>
Cc: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dbf5890657326a1a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241681

--000000000000dbf5890657326a1a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok , will work on Wrynose.

Thanks for sharing the details , will take care of this process going ahead



On Wed, Jul 22, 2026, 6:02=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr> =
wrote:

> Le mer. 22 juil. 2026 =C3=A0 14:25, Ashish Mishra <
> emailaddress.ashish@gmail.com> a =C3=A9crit :
>
>> Hi Yoann ,
>>
>> I tested on Scarthgap today and hence shared for it
>>
>> Will create an patch for Wrynose and share after testing it once.
>>
>> In meantime, can you please take this in consideration for Scarthgap?
>> Or as an process i should send Wrynose.
>>
>> So accordingly from next patch onwards, will follow the same.
>>
>
> As a policy, I can't accept a patch for scarthgap if it does not have a
> wrynose equivalent.
> So yes, you should send the wrynose patch. Then, I'll consider this one
> for scarthgap.
>
> Regards,
>
>
>>
>> Thanks ,
>> Ashish
>>
>>
>> On Wed, Jul 22, 2026, 5:50=E2=80=AFPM Yoann Congal via lists.openembedde=
d.org
>> <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
>>
>>> On Wed Jul 22, 2026 at 2:15 PM CEST, AshishKumar Mishra via
>>> lists.openembedded.org wrote:
>>> > Hi Yoann ,
>>> >
>>> > This is an bug fix patch which fixes the emit_pkgdata order
>>> > The same have been merged in master at
>>> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dross=
/wip/nasm&id=3Daa85baff9ebdd3f932811c3b43d1918c38373cb9
>>> >
>>> > Request to take this patch in scarthgap
>>>
>>> Hello,
>>>
>>> This also need backporting to wrynose, right?
>>> If that's the case, please send a cherry-pick request (if trivial) or a
>>> backported patch.
>>>
>>> Thanks!
>>> --
>>> Yoann Congal
>>> Smile ECS
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#241665):
>>> https://lists.openembedded.org/g/openembedded-core/message/241665
>>> Mute This Topic: https://lists.openembedded.org/mt/120392420/1334323
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>>> emailaddress.ashish@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>
>
> --
> Yoann Congal
> Smile ECS
>

--000000000000dbf5890657326a1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok , will work on Wrynose.<div dir=3D"auto"><br><div dir=
=3D"auto">Thanks for sharing=C2=A0the details , will take care of this proc=
ess going ahead</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></di=
v></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Jul 22, 2026, 6:02=E2=80=AFPM Yoann C=
ongal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 22=
 juil. 2026 =C3=A0=C2=A014:25, Ashish Mishra &lt;<a href=3D"mailto:emailadd=
ress.ashish@gmail.com" target=3D"_blank" rel=3D"noreferrer">emailaddress.as=
hish@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"auto">Hi Yoann ,<div dir=3D"auto"><b=
r><div dir=3D"auto">I tested on Scarthgap today and hence shared for it=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Will create an patch=
 for Wrynose and share after testing it once.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">In meantime, can you please take this in consideratio=
n for Scarthgap?</div><div dir=3D"auto">Or as an process i should send Wryn=
ose.</div><div dir=3D"auto"><br></div><div dir=3D"auto">So accordingly from=
 next patch onwards, will follow the=C2=A0same.</div></div></div></blockquo=
te><div><br></div><div>As a policy, I can&#39;t accept a patch for scarthga=
p if it does not have a wrynose equivalent.</div><div>So yes, you should se=
nd the wrynose patch. Then, I&#39;ll consider this one for scarthgap.</div>=
<div><br></div><div>Regards,</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Thanks ,=C2=A0</div><div dir=3D"auto">Ashi=
sh=C2=A0</div><div dir=3D"auto"><br></div></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 22, 2026, 5:50=
=E2=80=AFPM Yoann Congal via <a href=3D"http://lists.openembedded.org" targ=
et=3D"_blank" rel=3D"noreferrer">lists.openembedded.org</a> &lt;yoann.conga=
l=3D<a href=3D"mailto:smile.fr@lists.openembedded.org" target=3D"_blank" re=
l=3D"noreferrer">smile.fr@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Wed Jul 22, 2026 at 2:15=
 PM CEST, AshishKumar Mishra via <a href=3D"http://lists.openembedded.org" =
rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">lists.openembedd=
ed.org</a> wrote:<br>
&gt; Hi Yoann ,<br>
&gt;<br>
&gt; This is an bug fix patch which fixes the emit_pkgdata order<br>
&gt; The same have been merged in master at <a href=3D"https://git.openembe=
dded.org/openembedded-core-contrib/commit/?h=3Dross/wip/nasm&amp;id=3Daa85b=
aff9ebdd3f932811c3b43d1918c38373cb9" rel=3D"noreferrer noreferrer noreferre=
r" target=3D"_blank">https://git.openembedded.org/openembedded-core-contrib=
/commit/?h=3Dross/wip/nasm&amp;id=3Daa85baff9ebdd3f932811c3b43d1918c38373cb=
9</a><br>
&gt;<br>
&gt; Request to take this patch in scarthgap<br>
<br>
Hello,<br>
<br>
This also need backporting to wrynose, right?<br>
If that&#39;s the case, please send a cherry-pick request (if trivial) or a=
<br>
backported patch.<br>
<br>
Thanks!<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#241665): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/241665" rel=3D"noreferrer noreferrer noreferrer" ta=
rget=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/=
241665</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120392420/133=
4323" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://li=
sts.openembedded.org/mt/120392420/1334323</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-core+own=
er@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://l=
ists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:emai=
laddress.ashish@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">=
emailaddress.ashish@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</blockquote></div>

--000000000000dbf5890657326a1a--

