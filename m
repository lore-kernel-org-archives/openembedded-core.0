Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD4EC87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 13:10:15 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.18870.1753449012067786865
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 06:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lEw3U9ik;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b321bd36a41so1863476a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753449011; x=1754053811; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wAHos9c4ghvGZ2G4hVgB6h/lqBMKY4RhSpFsZPpVPCk=;
        b=lEw3U9ikqz6JTmBN/OcOYv/7jQ1J+9wm5nk9getyUAxUx1Ul1ZIZIBSaQAXHjGkCrJ
         n/HxVqdMTnDChdaNhQLyvt0xL7zji9/HSgOzKiXuKas3DfxjCEUKGaPfSXVk1VLeXOt2
         YHDlL6uzf6g9spnsjNXQir2vNHOmjS7h7Z1aSsTs0mEVpsXBZ4YrlY+D+s2p4w/zjnG+
         K59QhecataVE1/gRUL+b3kpkgpMrG7WIOKpqouCobHD6Bcn390wdhmH+Gsg+Z8H8mFFq
         SZ5Z8R+9AIa3IQVg5CjbHO3Jf7wmbdZfJstSa6yNARbs3TVbQV2ZPqTwXv9OclSAOMCd
         EZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753449011; x=1754053811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAHos9c4ghvGZ2G4hVgB6h/lqBMKY4RhSpFsZPpVPCk=;
        b=Qd4FiXVHZmHOh/9dAFXLBQAfmgqzdnLNNj1QTTYEy2Ipl+97oW6V3ECbh09kJiW+bS
         y7WjaXuxqyOpMoqVbm1ZybpMF+0z6vzYPmNt9qOta2wcyftAvKUy6FL7Iwdyf+SZ4odE
         xsDaqsRIXUWLHHCPAZmGyb4KirR06enLcPFTQo4COVHaWHzWhnVjW/KIYlue3ZcFQcNe
         pDt9zY1OcfTQnyAFV8swSmkLH3N73kt/ah8VZ+TvwLegobLheyIiMVCR1kshUD50x7/O
         nUiwkhdTf4g1E9WLTVv3GiBtG5smBKXAc2lECluO1y5JyCdxqSKOQwAEE9adtzq+xDW6
         bpoA==
X-Forwarded-Encrypted: i=1; AJvYcCV3v/UGh2J1i0yrG/OAP15f08IRBrLpM4QYW3plFINTDpSC9BnRrDuU4doowwZuv3nDkptt2xOgO1S5U0lzD7kKNg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzqoynLN8bPubDStg0brYgMQoMZv6GWkxXtEPQU9yhfi/j3BGvB
	ennRfyjCs8R3SlaC1yweUE5MQSKnUkox240HfXObIKqhTxaRciOQ97m+HF/h/R6s6YALC8b898S
	G4h4s33ApORuVYm4bNsqanTuoBTheRqg=
X-Gm-Gg: ASbGncujNTAyH4zidNN5kI4hAfc3VdyMstWzX6M7qbdNJjGMvJy492TYsRK8ZDt7llp
	EGHXTr95iIh32NkDE9Od+S2WNsOH0qD+88u9NWlkcFRP/uNBJS5LHHLmUNd+AeZMXiSN3SHw/uz
	NG3Dkh6+AE2ypV7Nvr3uy0m8h8DRJWncYSqpc091REyoY4isbJDEUdrZFKVYhEKBrbfDSvZnbO1
	ZUl0Cz/
X-Google-Smtp-Source: AGHT+IEgZm8RmC/+3OWWg1vF8m6FIryCf8uI1YvzJ4DWV4+4eTAtacrtpFrESXQvfRnq3d3CjE/K2TrEGUtbaxlHP/8=
X-Received: by 2002:a17:90b:5104:b0:30c:540b:9ba with SMTP id
 98e67ed59e1d1-31e7788b9edmr2820024a91.10.1753449010633; Fri, 25 Jul 2025
 06:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250725123811.1718097-1-lamine.rehahlia@smile.fr>
 <CADkTA4NwXU0TCYRCPj1BgT=y5Q6z5_Vn_i1+D8SAQNH7vWV=XA@mail.gmail.com> <CAMSfU+7E8J_qXX+3a690V9z9hxHZMQyUVn50B5SY1Aj3Mjf0Bw@mail.gmail.com>
In-Reply-To: <CAMSfU+7E8J_qXX+3a690V9z9hxHZMQyUVn50B5SY1Aj3Mjf0Bw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 25 Jul 2025 09:10:00 -0400
X-Gm-Features: Ac12FXwYdLvIF8RPVCFQxIfrv0_fn7bNqumKHEiXLbwy-eRlLdQeP5IyPW-HtUs
Message-ID: <CADkTA4MahNU--4zAz-DVku429HwuJ6j1CeAXTwp662v3=HSpwQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] runqemu: Enable snapshot mode by default
To: Yoann Congal <yoann.congal@smile.fr>
Cc: lamine.rehahlia@smile.fr, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000691f83063ac0a933"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 13:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220913

--000000000000691f83063ac0a933
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 8:56=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:

>
>
> Le ven. 25 juil. 2025 =C3=A0 14:43, Bruce Ashfield via lists.openembedded=
.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>
>>
>>
>> On Fri, Jul 25, 2025 at 8:38=E2=80=AFAM lamine.rehahlia via
>> lists.openembedded.org <lamine.rehahlia=3Dsmile.fr@lists.openembedded.or=
g>
>> wrote:
>>
>>> From: Lamine REHAHLIA <lamine.rehahlia@smile.fr>
>>>
>>> When snapshot mode is enabled, all disk images are treated as read-only=
.
>>> Any sectors that are written during the QEMU session are redirected to =
a
>>> temporary file (usually in /tmp), and these changes are discarded when
>>> QEMU exits.
>>>
>>> This mode is particularly useful to:
>>> - Avoid corruption of the original image
>>> - Ensure repeatable and clean test runs
>>>
>>
>> Except that qemu isn't only used for testing in that manner.
>>
>
> Hi Bruce!
>
> That we did not take into account.
>
>
>> My main use case is persistent qemu runs where data persists for days an=
d
>> even
>> weeks at a time while I test the deep container stacks in
>> meta-virtualization.
>>
>> So unless I'm misunderstanding the patch, I'd be strongly against this
>> being
>> the default. It has much more potential to surprise users than the
>> chances of
>> disk corruption causing problems.
>>
>> If the default did change (and I'm understanding this correctly that it
>> would
>> impact all runqemu invocations), then there needs to be a large and
>> obvious\
>> banner than any changes made during the run would be lost on exit.
>>
>
> Agreed.
>
> What about :
> * stay in non-snapshot by default
> * only allow using compressed image in snapshot mode (in the next patch)
> ?
>
>
Since that is a new use case / feature that you are adding, then having a
different mode associated with it would likely not be surprising to a user.

I did look at your 2nd patch as well, and if I'm understanding it correctly
the compressed image is decompressed to a location (currently the
directory with the compressed image) and then executed.  With those
extra steps, it seems to make sense that the data is not persistent and
snapshot makes sense.

In either case, it may be a good idea to expose the snapshot (or not)
to the user via an environment variable or a command line option and
that way whatever default is picked can always be changed.

On that line of thought, it would also be good if that setting did appear
in the runqemu summary of settings, so it would be more obvious to the
user that it is in effect.

Cheers,

Bruce


> Looking back at the patch, it does not let a user return to the
> non-snapshot mode... which is wrong, so it must not be accepted like this=
.
>
> Thanks!
>
>
>>
>> Cheers,
>>
>> Bruce
>>
>>
>>
>>>
>>> Signed-off-by: Lamine REHAHLIA <lamine.rehahlia@smile.fr>
>>> ---
>>>  scripts/runqemu | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/runqemu b/scripts/runqemu
>>> index 3d77046972..6c263d6b2a 100755
>>> --- a/scripts/runqemu
>>> +++ b/scripts/runqemu
>>> @@ -196,7 +196,7 @@ class BaseConfig(object):
>>>          self.taplock_descriptor =3D None
>>>          self.portlocks =3D {}
>>>          self.bitbake_e =3D ''
>>> -        self.snapshot =3D False
>>> +        self.snapshot =3D True
>>>          self.wictypes =3D ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi',
>>> "wic.vhd", "wic.vhdx")
>>>          self.fstypes =3D ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btr=
fs',
>>>                          'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz=
',
>>> --
>>> 2.43.0
>>>
>>>
>>>
>>>
>>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#220910):
>> https://lists.openembedded.org/g/openembedded-core/message/220910
>> Mute This Topic: https://lists.openembedded.org/mt/114336727/4316185
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> Yoann Congal
> Smile ECS
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000691f83063ac0a933
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 25, 2025 at 8:56=
=E2=80=AFAM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann=
.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 25 juil=
. 2025 =C3=A0=C2=A014:43, Bruce Ashfield via <a href=3D"http://lists.openem=
bedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;bruce.ashfield=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gm=
ail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr=
"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 25,=
 2025 at 8:38=E2=80=AFAM lamine.rehahlia via <a href=3D"http://lists.openem=
bedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;lamine.rehahli=
a=3D<a href=3D"mailto:smile.fr@lists.openembedded.org" target=3D"_blank">sm=
ile.fr@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">From: Lamine REHAHLIA &lt;<a href=3D"mailto:la=
mine.rehahlia@smile.fr" target=3D"_blank">lamine.rehahlia@smile.fr</a>&gt;<=
br>
<br>
When snapshot mode is enabled, all disk images are treated as read-only.<br=
>
Any sectors that are written during the QEMU session are redirected to a<br=
>
temporary file (usually in /tmp), and these changes are discarded when<br>
QEMU exits.<br>
<br>
This mode is particularly useful to:<br>
- Avoid corruption of the original image<br>
- Ensure repeatable and clean test runs<br></blockquote><div><br></div><div=
><div style=3D"font-size:small">Except that qemu isn&#39;t only used for te=
sting in that manner.</div></div></div></div></div></blockquote><div><br></=
div><div>Hi Bruce!</div><div><br></div><div>That we did not take into accou=
nt.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div sty=
le=3D"font-size:small">My main use case is persistent qemu runs where data =
persists for days and even</div><div style=3D"font-size:small">weeks at a t=
ime while I test the deep container stacks in meta-virtualization.</div><di=
v style=3D"font-size:small"><br></div><div style=3D"font-size:small">So unl=
ess I&#39;m misunderstanding the patch, I&#39;d be strongly against this be=
ing</div><div style=3D"font-size:small">the default. It has much more poten=
tial to surprise users than the chances of</div><div style=3D"font-size:sma=
ll">disk corruption causing problems.</div><div style=3D"font-size:small"><=
br></div><div style=3D"font-size:small">If the default did change (and I&#3=
9;m understanding this correctly that it would</div><div style=3D"font-size=
:small">impact all runqemu invocations), then there needs to be a large and=
 obvious\</div><div style=3D"font-size:small">banner than any changes made =
during the run would be lost on exit.</div></div></div></div></div></blockq=
uote><div><br></div><div>Agreed.</div><div><br></div><div>What about :<br><=
/div><div>* stay in non-snapshot by default</div><div>* only allow using co=
mpressed image in snapshot mode (in the next patch)</div><div>?</div><div><=
br></div></div></div></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">Since that is a new use case / feature th=
at you are adding, then having a</div><div class=3D"gmail_default" style=3D=
"font-size:small">different mode associated with it would likely not be sur=
prising to a user.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I did =
look at your 2nd patch as well, and if I&#39;m understanding it correctly</=
div><div class=3D"gmail_default" style=3D"font-size:small">the compressed i=
mage is decompressed to a location (currently the</div><div class=3D"gmail_=
default" style=3D"font-size:small">directory with the compressed image) and=
 then executed.=C2=A0 With those</div><div class=3D"gmail_default" style=3D=
"font-size:small">extra steps, it seems to make sense that the data is not =
persistent and</div><div class=3D"gmail_default" style=3D"font-size:small">=
snapshot makes sense.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">In =
either case, it may be a good idea to expose the snapshot (or not)</div><di=
v class=3D"gmail_default" style=3D"font-size:small">to the user via an envi=
ronment variable or a command line option and</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">that way whatever default is picked can alwa=
ys be changed.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">On t=
hat line of thought, it would also be good if that setting did appear</div>=
<div class=3D"gmail_default" style=3D"font-size:small">in the runqemu summa=
ry of settings, so it would be more obvious to the</div><div class=3D"gmail=
_default" style=3D"font-size:small">user that it is in effect.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">Cheers,</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><=
div></div><div>Looking back at the patch, it does not let a user return to =
the non-snapshot mode... which is wrong, so it must not be accepted like th=
is.</div><div><br></div><div>Thanks!</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div cl=
ass=3D"gmail_quote"><div><div style=3D"font-size:small"><br></div><div styl=
e=3D"font-size:small">Cheers,</div><div style=3D"font-size:small"><br></div=
><div style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Lamine REHAHLIA &lt;<a href=3D"mailto:lamine.rehahlia@smile.=
fr" target=3D"_blank">lamine.rehahlia@smile.fr</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index 3d77046972..6c263d6b2a 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -196,7 +196,7 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.taplock_descriptor =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.portlocks =3D {}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.bitbake_e =3D &#39;&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.snapshot =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.snapshot =3D True<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.wictypes =3D (&#39;wic&#39;, &#39;wi=
c.vmdk&#39;, &#39;wic.qcow2&#39;, &#39;wic.vdi&#39;, &quot;wic.vhd&quot;, &=
quot;wic.vhdx&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.fstypes =3D (&#39;ext2&#39;, &#39;ex=
t3&#39;, &#39;ext4&#39;, &#39;jffs2&#39;, &#39;nfs&#39;, &#39;btrfs&#39;,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;cpio.gz&#39;, &#39;cpio&#39;, &#39;ramfs&#39;, &#39;t=
ar.bz2&#39;, &#39;tar.gz&#39;,<br>
-- <br>
2.43.0<br>
<br>
<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#220910): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/220910" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/220910</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114336727/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114336727/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000691f83063ac0a933--

