Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4F4C25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 11:35:26 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.81089.1717414522296343154
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 04:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=M57ygSvX;
 spf=pass (domain: snapchat.com, ip: 209.85.218.41, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a68ca4d6545so259364566b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 04:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1717414521; x=1718019321; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w3eQr6NamX8J80Vcba5OcLY1Lbds2aLgX0uhTz3p5ww=;
        b=M57ygSvX8Auplg1yRlJo8qVxSdBsg6ij/XbUjiYOF45hIhFfnsSa4p3ZihkkrpHSa/
         bMlMYv4FlCn28yRGWud/s8l4q9fmrYfkFW904rYFuSswryI32DyPkA8zr7QMlYEre0tB
         lZGB9Z0CUPgcIlHzJG0E26qZCEjb7Ss3j7L3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717414521; x=1718019321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3eQr6NamX8J80Vcba5OcLY1Lbds2aLgX0uhTz3p5ww=;
        b=fXVW1n4ZXToCldXyXJZSrs9hz3VcluQ0XY2MiXZhkZHHp+fdpi+YMEmhXACcrQ32ME
         wwaeladA6h8GCA0x5qCzfbHpA2RlU/GGCjwVYNuapIRAPDY9eEgwAH7KIyBr7B4EKtQS
         1Yte+LN0IJvOMcJAxpFzjRzo4YiLR2mL40O1ARw50twiivxg4TXinvFu23GiaqGMLylS
         L2ZY7klPOTYN+XZnkoKOBl+2/FMktfdlL+ooM5wsAslXbKTeVqsNEP3q8oywZZg51tt7
         ruCbMZwzQz1LRNNND1PYFNOi1rbsSJeWLOFkKn9M9snxaiMnMk7J1nzmgA6BtDLpC8gc
         Nx1A==
X-Forwarded-Encrypted: i=1; AJvYcCW0i4QLOkMJD4h+1mSiVjz+1AldmqVyypN/q47NIjILhKetq+DP9a+q+kdSfmAErMjmOeTsuNnU/3DVdCkefcKj95kGXh8gvk/aY+O3jDwW7UrElbe7bW/2
X-Gm-Message-State: AOJu0YzFCeiycpV4hCYlgnA6Xh4jNBonZHZIJhBWnmEGQPLbxbxe5MPV
	cvp1uDg4Vpx2obuG6Gbe1rN2VoEG8g/mcTwTkD+291vrBywfvrO6u4+GGex1lPwxW2qk8vi7osk
	UToLtwMcVTa1/6JDl/BAhkE+EtK+5Y8Kjt1HZeA==
X-Google-Smtp-Source: AGHT+IHuqqBYSM+1O6i+O7/GmMOT9iGt9qGFRLBFzYeW9x75OIEEcgLyETCfd8fFmfB2h3Q5JHY1ppocYGYZuixatUU=
X-Received: by 2002:a17:907:869e:b0:a68:c70b:5555 with SMTP id
 a640c23a62f3a-a68c70b565amr479524466b.17.1717414520546; Mon, 03 Jun 2024
 04:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240529100853.1162640-1-ecordonnier@snap.com>
 <80be0806edba87cb67f7f5711fb9c83516fb860d.camel@linuxfoundation.org> <17D44D900E0F42D1.15404@lists.openembedded.org>
In-Reply-To: <17D44D900E0F42D1.15404@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 3 Jun 2024 13:35:09 +0200
Message-ID: <CAHUKmYY53BOSRdFvxwsTeDOXfurLbvJ9yS6by-K4mR1OshvFRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: fix regression in minidebuginfo test
To: ecordonnier@snap.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006e18a50619fabaf5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 11:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200246

--0000000000006e18a50619fabaf5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,
thanks for merging the v2 of this patch. Is this test running in CI
currently? I'm thinking I could send a PR to enable minidebuginfo in
poky-altcfg, but is there a way I can verify that this test works in
yocto's CI? (it works locally, but as I mentioned it would fail on a kernel
with CONFIG_USER_NS disabled.)

=C3=89tienne


On Thu, May 30, 2024 at 5:24=E2=80=AFPM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> Hi Richard,
> I thought it was OK because systemd requires usrmerge, but I've sent a ne=
w
> version of the patch using "env sleep" instead of "/usr/bin/sleep" in ord=
er
> to be safe. I hope this also fixes the test failure which was happening o=
n
> CI.
> One reason this could be failing in CI is that this functionality
> currently requires user-namespaces enabled in the kernel (e.g.
> core-image-sato does have CONFIG_USER_NS, thus it works with this image).
> This is not really by design, and I'm working on changing this in the
> upstream systemd: https://github.com/systemd/systemd/pull/33043 . I can
> then backport this on scarthgap if the change is merged upstream.
>
> =C3=89tienne
>
> On Wed, May 29, 2024 at 4:54=E2=80=AFPM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Wed, 2024-05-29 at 12:08 +0200, Etienne Cordonnier via
>> lists.openembedded.org
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedde=
d.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNo=
nVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dqu0Injv6pHxfa5BgL3x29y11Al_3EpMdB=
OTkj8cWHLaFlxRoh9vy7WMU3VU2o6c-&s=3DjZOAoPx0ETGk3PoW9Wmzdl9wuDwTZtC_WxYX7O3=
EPFY&e=3D>
>> wrote:
>> > From: Etienne Cordonnier <ecordonnier@snap.com>
>> >
>> > The builtin command "sleep" was getting executed instead of the busybo=
x
>> binary.
>> > Hence "pidof sleep" was empty and the test was failing.
>> >
>> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>> > ---
>> >  meta/lib/oeqa/runtime/cases/systemd.py | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/lib/oeqa/runtime/cases/systemd.py
>> b/meta/lib/oeqa/runtime/cases/systemd.py
>> > index 5481e1d840..a2229848e7 100644
>> > --- a/meta/lib/oeqa/runtime/cases/systemd.py
>> > +++ b/meta/lib/oeqa/runtime/cases/systemd.py
>> > @@ -145,7 +145,7 @@ class SystemdServiceTests(SystemdTest):
>> >          Verify that call-stacks generated by systemd-coredump contain
>> symbolicated call-stacks,
>> >          extracted from the minidebuginfo metadata (.gnu_debugdata elf
>> section).
>> >          """
>> > -        t_thread =3D threading.Thread(target=3Dself.target.run,
>> args=3D("ulimit -c unlimited && sleep 1000",))
>> > +        t_thread =3D threading.Thread(target=3Dself.target.run,
>> args=3D("ulimit -c unlimited && /usr/bin/sleep 1000",))
>> >          t_thread.start()
>> >          time.sleep(1)
>>
>> I get a bit nervous about hardcoding paths like "/usr/bin",
>> particularly in the context of some distros liking to move things
>> around. We may want to put a shutil.which("sleep") call in instead (and
>> an import shutil if needed)?
>>
>> Cheers,
>>
>> Richard
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200026):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_200026&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3Dqu0Injv6pHxfa5BgL3x29y11Al_3EpMdBOTkj8cWHLaFlxRoh9vy7WMU3VU2o6c-&s=3DEhl=
pO7VCVBhijcCMY2T86qar5UZZTaUidFKXQTXXBXA&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_106365956_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dqu0Injv6pHxfa=
5BgL3x29y11Al_3EpMdBOTkj8cWHLaFlxRoh9vy7WMU3VU2o6c-&s=3Dv89AFdBy-BUex49TuXq=
DiEFkidJxP27psNJVdVXrgCM&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dqu0Inj=
v6pHxfa5BgL3x29y11Al_3EpMdBOTkj8cWHLaFlxRoh9vy7WMU3VU2o6c-&s=3DvCbKyJLrNTiy=
VgVTio-Tl9XdO6erBWJiypaEgcrkqX8&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006e18a50619fabaf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<br>thanks for merging the v2 of this patch. Is=
 this test running in CI currently? I&#39;m thinking I could send a PR to e=
nable minidebuginfo in poky-altcfg, but is there a way I can verify that th=
is test works in yocto&#39;s=C2=A0CI? (it works locally, but as I mentioned=
 it would fail on a kernel with CONFIG_USER_NS disabled.)<br><br>=C3=89tien=
ne<br><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, May 30, 2024 at 5:24=E2=80=AFPM Etienne Cordonnier via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ecor=
donnier=3D<a href=3D"mailto:snap.com@lists.openembedded.org">snap.com@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr">Hi Richard,<br>I thought it was OK becaus=
e systemd requires usrmerge, but I&#39;ve sent a new version of the patch u=
sing &quot;env sleep&quot; instead of &quot;/usr/bin/sleep&quot; in order t=
o be safe. I hope this also fixes the test failure which was happening on C=
I.<br>One reason this could be failing in CI is that this functionality cur=
rently requires user-namespaces enabled in the kernel (e.g. core-image-sato=
 does have CONFIG_USER_NS, thus it works with this image). This is not real=
ly by design, and I&#39;m working on changing this in the upstream systemd:=
=C2=A0<a href=3D"https://github.com/systemd/systemd/pull/33043" target=3D"_=
blank">https://github.com/systemd/systemd/pull/33043</a> . I can then backp=
ort this on scarthgap=C2=A0if the change is merged upstream.<br><br>=C3=89t=
ienne</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, May 29, 2024 at 4:54=E2=80=AFPM Richard Purdie &lt;<a href=3D"=
mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Wed, 2024-05-29 at 12:08 +0200, Etienne Cordonnier v=
ia <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.o=
penembedded.org&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2e=
pckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dqu0Injv=
6pHxfa5BgL3x29y11Al_3EpMdBOTkj8cWHLaFlxRoh9vy7WMU3VU2o6c-&amp;s=3DjZOAoPx0E=
TGk3PoW9Wmzdl9wuDwTZtC_WxYX7O3EPFY&amp;e=3D" rel=3D"noreferrer" target=3D"_=
blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; <br>
&gt; The builtin command &quot;sleep&quot; was getting executed instead of =
the busybox binary.<br>
&gt; Hence &quot;pidof sleep&quot; was empty and the test was failing.<br>
&gt; <br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/lib/oeqa/runtime/cases/systemd.py | 2 +-<br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/ru=
ntime/cases/systemd.py<br>
&gt; index 5481e1d840..a2229848e7 100644<br>
&gt; --- a/meta/lib/oeqa/runtime/cases/systemd.py<br>
&gt; +++ b/meta/lib/oeqa/runtime/cases/systemd.py<br>
&gt; @@ -145,7 +145,7 @@ class SystemdServiceTests(SystemdTest):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Verify that call-stac=
ks generated by systemd-coredump contain symbolicated call-stacks,<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extracted from the mi=
nidebuginfo metadata (.gnu_debugdata elf section).<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;&quot;&quot;<br=
>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t_thread =3D threading.Thr=
ead(target=3Dself.target.run, args=3D(&quot;ulimit -c unlimited &amp;&amp; =
sleep 1000&quot;,))<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t_thread =3D threading.Thr=
ead(target=3Dself.target.run, args=3D(&quot;ulimit -c unlimited &amp;&amp; =
/usr/bin/sleep 1000&quot;,))<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t_thread.start()<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 time.sleep(1)<br>
<br>
I get a bit nervous about hardcoding paths like &quot;/usr/bin&quot;,<br>
particularly in the context of some distros liking to move things<br>
around. We may want to put a shutil.which(&quot;sleep&quot;) call in instea=
d (and<br>
an import shutil if needed)?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200026): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_20=
0026&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dqu0Injv6pHxfa5BgL3=
x29y11Al_3EpMdBOTkj8cWHLaFlxRoh9vy7WMU3VU2o6c-&amp;s=3DEhlpO7VCVBhijcCMY2T8=
6qar5UZZTaUidFKXQTXXBXA&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_200026&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3Dqu0Injv6pHxfa5BgL3x29y11Al_3EpMdBOTkj8cWHLaFlxRoh9vy7WMU3VU2o6=
c-&amp;s=3DEhlpO7VCVBhijcCMY2T86qar5UZZTaUidFKXQTXXBXA&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_106365956_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3Dqu0Injv6pHxfa5BgL3x29y11Al_3EpMdBOTkj8cWHLaFlx=
Roh9vy7WMU3VU2o6c-&amp;s=3Dv89AFdBy-BUex49TuXqDiEFkidJxP27psNJVdVXrgCM&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_106365956_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dqu0Injv6pHxfa5BgL3x29y11Al_3EpM=
dBOTkj8cWHLaFlxRoh9vy7WMU3VU2o6c-&amp;s=3Dv89AFdBy-BUex49TuXqDiEFkidJxP27ps=
NJVdVXrgCM&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3Dqu0Injv6pHxfa5BgL3x29y11Al_3EpMdBOTkj8cWHLa=
FlxRoh9vy7WMU3VU2o6c-&amp;s=3DvCbKyJLrNTiyVgVTio-Tl9XdO6erBWJiypaEgcrkqX8&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dqu0Injv6pHxfa5BgL3x2=
9y11Al_3EpMdBOTkj8cWHLaFlxRoh9vy7WMU3VU2o6c-&amp;s=3DvCbKyJLrNTiyVgVTio-Tl9=
XdO6erBWJiypaEgcrkqX8&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000006e18a50619fabaf5--

