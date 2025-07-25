Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585DDC87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 12:56:55 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.18566.1753448208629404281
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 05:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=f2t+W2qm;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4561ca74829so21950885e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 05:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753448206; x=1754053006; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dfw6Rk9LD5PVi23ziR/dtXNv2aDfxc5Yn1m4HsLn1Sg=;
        b=f2t+W2qmIjLSomCFEYBuI5xGCSm4/MVLWLdcQEFiiCaF5KSoseXH4w62rs4ijCw3tK
         eiU5Zx8CU5zQ9aDz9VKm0JM5dGqLJAmlX97u1817ry8Z+zubCWa4CjuIG1lYhXW41Kc+
         XF1/zMMAOpYJVwf5XKsDIrev3V88BiMK/nlHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753448206; x=1754053006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dfw6Rk9LD5PVi23ziR/dtXNv2aDfxc5Yn1m4HsLn1Sg=;
        b=mAAbP5Z2xyN+ESA3rZ270zn1ENT4JTkynfhid16a9gRHdlIjyDfjshcfdlPX/DFw9a
         hi8VoU3RPdo7y/rulbLAUYaI3FJyL/xhmvg6kOKtInOXjnMpqP394lwDGoNqtDtu1XD8
         S4GF3ycLvhK/4jkcN/q9sGtR1B24U8AU41FrDXR0wKk3xItvjDANGCJkflBOknoWxNG9
         G02m1PPsyZBLNdqbsZlrNYOmsSiGT8B/RMFBGyxOOpMPj5boZ3LURak+tvoClAGxORBT
         lFOf3aAyMN7YDQtTF5ittnx0iJUt/oJ0Au38k7Jbe+fd3rsvbuLgCOTdkVB/7y9S7G5T
         5b+g==
X-Forwarded-Encrypted: i=1; AJvYcCUOa+youw+GFfEq/jHNfrNTH73fqXZJw1OonNNEesV41yW/P10GcjNS4P0adJYe7Ytu6ZXzsYWE6fzUpdqHefZLZg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwuDG0IseZ0MgUGXvLjXHtVJVbQJU9/C9pykkTQ9U82tpfNASxF
	Q68sAbfS3tyKjIVlLFFchiIpkD2R8qZXvAVhw8Hthyid1+/n2vkHph2vf+YUK2lrSjiOhKXUZBD
	sQFT+sewLLLFc0CcvAGW8WlsyWFKM339b4QbQZFPYzw==
X-Gm-Gg: ASbGncsIRYsVXdldKAARHjIyDp1hsZhSzOvYoWniWdnRF7JkxgFDS8qrBhKHaGtYCci
	/cIiOE3rh59Y7OurzVXOR4XryeKSJamoWkPNLd+7n3XjmQUlEQz+MG45luoT3NvZQvCFM+7U3Ne
	1aEi20/mw9JZR4dgHakjKwI5aoTBFf7rNPAliEbvut2UQrou16mO6JF2dc5jqqc3+b2hAC+VJqO
	o1R6KTb/986XNM0DI+q1XZhUHJrDm7wTia/RXpX
X-Google-Smtp-Source: AGHT+IFLOBT+Ss0crC7xaz4rycKv6d37hexYZsF/WX4QoeUkkSzh5GYN6nT7j2LeK9wCD1ndD84iKlTPs8wZUSOhGcE=
X-Received: by 2002:a5d:64ec:0:b0:3a4:db49:94aa with SMTP id
 ffacd0b85a97d-3b776603349mr1872381f8f.21.1753448205807; Fri, 25 Jul 2025
 05:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250725123811.1718097-1-lamine.rehahlia@smile.fr> <CADkTA4NwXU0TCYRCPj1BgT=y5Q6z5_Vn_i1+D8SAQNH7vWV=XA@mail.gmail.com>
In-Reply-To: <CADkTA4NwXU0TCYRCPj1BgT=y5Q6z5_Vn_i1+D8SAQNH7vWV=XA@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 25 Jul 2025 14:56:19 +0200
X-Gm-Features: Ac12FXzNHE4ZjGSp13gUWc0WpngF_8zejQtGFz2Bnb06MK2ooA9XlKry2DrAjXU
Message-ID: <CAMSfU+7E8J_qXX+3a690V9z9hxHZMQyUVn50B5SY1Aj3Mjf0Bw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] runqemu: Enable snapshot mode by default
To: bruce.ashfield@gmail.com
Cc: lamine.rehahlia@smile.fr, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000708a79063ac079df"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 12:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220911

--000000000000708a79063ac079df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 25 juil. 2025 =C3=A0 14:43, Bruce Ashfield via lists.openembedded.o=
rg
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

>
>
> On Fri, Jul 25, 2025 at 8:38=E2=80=AFAM lamine.rehahlia via lists.openemb=
edded.org
> <lamine.rehahlia=3Dsmile.fr@lists.openembedded.org> wrote:
>
>> From: Lamine REHAHLIA <lamine.rehahlia@smile.fr>
>>
>> When snapshot mode is enabled, all disk images are treated as read-only.
>> Any sectors that are written during the QEMU session are redirected to a
>> temporary file (usually in /tmp), and these changes are discarded when
>> QEMU exits.
>>
>> This mode is particularly useful to:
>> - Avoid corruption of the original image
>> - Ensure repeatable and clean test runs
>>
>
> Except that qemu isn't only used for testing in that manner.
>

Hi Bruce!

That we did not take into account.


> My main use case is persistent qemu runs where data persists for days and
> even
> weeks at a time while I test the deep container stacks in
> meta-virtualization.
>
> So unless I'm misunderstanding the patch, I'd be strongly against this
> being
> the default. It has much more potential to surprise users than the chance=
s
> of
> disk corruption causing problems.
>
> If the default did change (and I'm understanding this correctly that it
> would
> impact all runqemu invocations), then there needs to be a large and
> obvious\
> banner than any changes made during the run would be lost on exit.
>

Agreed.

What about :
* stay in non-snapshot by default
* only allow using compressed image in snapshot mode (in the next patch)
?

Looking back at the patch, it does not let a user return to the
non-snapshot mode... which is wrong, so it must not be accepted like this.

Thanks!


>
> Cheers,
>
> Bruce
>
>
>
>>
>> Signed-off-by: Lamine REHAHLIA <lamine.rehahlia@smile.fr>
>> ---
>>  scripts/runqemu | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 3d77046972..6c263d6b2a 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -196,7 +196,7 @@ class BaseConfig(object):
>>          self.taplock_descriptor =3D None
>>          self.portlocks =3D {}
>>          self.bitbake_e =3D ''
>> -        self.snapshot =3D False
>> +        self.snapshot =3D True
>>          self.wictypes =3D ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi',
>> "wic.vhd", "wic.vhdx")
>>          self.fstypes =3D ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrf=
s',
>>                          'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz'=
,
>> --
>> 2.43.0
>>
>>
>>
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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220910):
> https://lists.openembedded.org/g/openembedded-core/message/220910
> Mute This Topic: https://lists.openembedded.org/mt/114336727/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000708a79063ac079df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 25=
 juil. 2025 =C3=A0=C2=A014:43, Bruce Ashfield via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;bruce.ashfield=3D<a href=3D=
"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org<=
/a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div style=
=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Jul 25, 2025 at 8:38=E2=80=AFAM lami=
ne.rehahlia via <a href=3D"http://lists.openembedded.org" target=3D"_blank"=
>lists.openembedded.org</a> &lt;lamine.rehahlia=3D<a href=3D"mailto:smile.f=
r@lists.openembedded.org" target=3D"_blank">smile.fr@lists.openembedded.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
From: Lamine REHAHLIA &lt;<a href=3D"mailto:lamine.rehahlia@smile.fr" targe=
t=3D"_blank">lamine.rehahlia@smile.fr</a>&gt;<br>
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
br></div><div>Looking back at the patch, it does not let a user return to t=
he non-snapshot mode... which is wrong, so it must not be accepted like thi=
s.</div><div><br></div><div>Thanks!</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div cla=
ss=3D"gmail_quote"><div><div style=3D"font-size:small"><br></div><div style=
=3D"font-size:small">Cheers,</div><div style=3D"font-size:small"><br></div>=
<div style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
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

--000000000000708a79063ac079df--

