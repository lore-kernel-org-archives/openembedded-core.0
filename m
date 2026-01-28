Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BA7D2592A
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 11:05:11 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10611.1769598303498080547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 03:05:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bP4Ni1Ko;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so4606046f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 03:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769598302; cv=none;
        d=google.com; s=arc-20240605;
        b=Zis4RwPponHFqPxBXInixYS8JpJfYniYGiipR9Mg5SY9ixnrYxw7Ph2OCgV0p5YLjG
         wY0HmdetfL3Z8ZbsK+7jO0LGH486aL46wR8rTX19eBU1CY3EEfowfJqk6nW2VzDS9kDE
         D9gboQMabK2uyYXbfTu2h3RRqSUl+5eZgsooqiQ83gi7QWW495QaWLQ5iMJ7ilVERKwI
         kQdBewhmrRxoHpzsfmUGAybPQmBEJ0RUkg7ZKg2rAGV3OWwZaY8NxvUH1FA8ZmjkMUCH
         lSQSG2S0PW5jDdt66eqnF9qPCZN/B2KVOTYSSQ8eyKL40WhsnucYTzRvcPVXabuKbG6d
         lFyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hP9L//yzWWgwaitWJEVuqQ3w0GNOyLoIWi4zvrCAfyg=;
        fh=dI4eGhhXRYQf7RsXLxEGaKg0Olh6BsHtf/nuVeEubBo=;
        b=EsedBsO/1zSX1dg6MbmMydfIu/iN03HkKhpYNpQYQ/SRqRyt7+JonmpS8sArguRYNR
         6ayXFbOzx9k/FSmp3KN4lXMvbNsEqqfEyhONPk0RkjS1J36+j5QdJyt8bCb/9v3ao20w
         3ddF4kj9wvL2RC5DOxmaLyNwHZdI61WxJiRQV0XvpH455wxzChbMuBmrj7uitBZ+A2aW
         MyHD1Vhu9NFhZf05KbzBDMU6KlrKv45ajYykX+ZYKdvbDHpkFhcXOPx/WNHILN98Txh/
         pziPh9wen6/bE8XJBF6pD4dDI3Jy4+gTUBDHkOOnNutCpDf/NHr4hennMg/DyMPsz2vl
         lqzQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769598302; x=1770203102; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hP9L//yzWWgwaitWJEVuqQ3w0GNOyLoIWi4zvrCAfyg=;
        b=bP4Ni1KoHZs4oPfgscJxEbSAhaUvV7j1V1WP0buvSPVp0hoz2yuvRAmU8CZ2dxYXEN
         VBE2W5Isp621FmxXx97Yh7A2dnORQeM4+V7G4eRCSinC/Xh53QLN8klByGfWiLvtfo9r
         HRSL2HiFbDei+RBHLuC4XeCut5AnN6yxqbwGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769598302; x=1770203102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hP9L//yzWWgwaitWJEVuqQ3w0GNOyLoIWi4zvrCAfyg=;
        b=dERkQ7BgGmQDRL+2LGSevZbV7k5dpKnbkhSEXmMhZE4pWZigj5un7t+XIFrlgURe40
         SzfgSzgvb8UG2pMmUlc3v1esApfTt8YqrHkJmh4xvIkwWMSV/5CjTRx6VlLXRedoHzGK
         BTSKk3kLeONjmMm6GSKOwtiX1mD8dQBtYUKz2M+UJLFzJ3uDtW9+QTeNGUdwCeNk6LFB
         CnHZ3tqLjnuNxRIkhmMRXhXjPxkxPnccE0rs4aJ4y6T5fBz7dPfHWLI1fei41CGWiAWw
         jBJeqP81/K+66NHoKSfuL+XnRe9P4FmROjt4OAOei8YGI++iGt5KHgO207YtVR0vGLdR
         H0AQ==
X-Gm-Message-State: AOJu0YzC1doyc+J929MCJU3kN8rAE/62Yqakf8nqgoBRl7VsE/RyOED+
	EMjXiS+258HVc9KkhNy4VCfrfpnPmMuH7PgC6aX5g2xsSgureZ0uqqrQ8MAJo1qO6XUOeJe4ck+
	ysUkX026YEmwKFyRR/VZ9ehoZA2umBqNOW/G3eejDgQ==
X-Gm-Gg: AZuq6aKrG9fZFWnbVieVIzYGPhvhjesDRIdRdtBC2lzf44d8wE8GoSMp2tf8eKgzOjq
	g3WeBCZutgSb0O6DxWABfFMDpu+N4fsa/OP2p0c5X2F+iFTpLMwEiuXWhydbPCYqwWkd39PoCcO
	lw4EGuPTRTtgqrimjqOqVMaDnAPmoTisTO87ke32abuz0MdhPt80BjdL511VMA/AQkVFxsD4u1r
	frlXAJ4wSE/ysrR4L3unBS4PlM0s9DrJCA5ZSwriLDmjzjg/QNlSG6F2EMZlpOHdusweebSGw==
X-Received: by 2002:a05:6000:4013:b0:432:b951:e9fc with SMTP id
 ffacd0b85a97d-435dd1c1cf9mr7733328f8f.47.1769598301621; Wed, 28 Jan 2026
 03:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20260123123336.41126-1-peter.marko@siemens.com> <CAMSfU+7FpuEruzCELf=PGAmGgEzWYf_WBnU2goHdsPSsSkDcVg@mail.gmail.com>
In-Reply-To: <CAMSfU+7FpuEruzCELf=PGAmGgEzWYf_WBnU2goHdsPSsSkDcVg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 28 Jan 2026 12:04:35 +0100
X-Gm-Features: AZwV_QiQ0F6Wf9Sz0xseWGvXkN75NuA4hnfFHpiT7U7wSBz7qv0RWuTX7Slp6RU
Message-ID: <CAMSfU+5RvtaRei8Kt=-=rRi77ch=3dFJ0DzNLDdmjfpnmTzonw@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][RFC PATCH 0/1] openssl: upgrade 3.2.6 -> 3.5.4
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000029dfe8064970b6e4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 11:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230088

--00000000000029dfe8064970b6e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 23 janv. 2026 =C3=A0 18:02, Yoann Congal <yoann.congal@smile.fr> a
=C3=A9crit :

> Le ven. 23 janv. 2026 =C3=A0 13:33, Peter Marko via lists.openembedded.or=
g
> <peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :
>
>> Intention of this RFC is to run full autobuilder job matrix to see if
>> there are any failures not detected by my local testsuite.
>>
>
> I created a poky branch with this patch :
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dycongal/scarthgap/open=
ssl_3.5_upgrade
> (above my -nut branch to decrease the probability of an unrelated AB-INT
> failure)
>
> I've started the build :
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3118
>

Hello,

As discussed during the tech call of last tuesday, I've started builds:
* a new a-full with rebased branch on the latest scarthgap (now, the branch
is only scarthgap+this upgrade)
  * https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3133=
/
failed on a unrelated AB-INT issue (#15945) but is otherwise OK
* a meta-oe build (which includes a world build for meta-oe, meta-python,
meta-networking & meta-filesystems):
  * https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1277
  * *Failed on python3-m2crypto* (log.do_compile =3D>
https://gist.github.com/ycongal-smile/4c6501ecd81c9f475b793234cceb7a74)
* to compare, I've started the same build with a vanilla scarthgap branch
(without the openssl upgrade):
  * https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1278
=3D> success (albeit with warnings)

Can you investigate this python3-m2crypto failure?

Also, the "meta-oe" build does not cover every layer in meta-openembedded,
I think I will increase coverage to all the meta-openembedded layers for
the next run...


Topic for discussion is especially what should be the final form of this
>> upgrade as some users may want to stay on openssl 3.2.x originally
>> shipped with Yocto 5.0 Scarthgap.
>> Current form was chosen to easily review recipe/patch differences.
>> Is it fine to overwrite or do we need to keep both version and make one
>> the default and other optional? Which would be tested on AB?
>>
>> Peter Marko (1):
>>   openssl: upgrade 3.2.6 -> 3.5.4
>>
>>  .../openssl/files/environment.d-openssl.sh    |  9 ++-
>>  ...ke-history-reporting-when-test-fails.patch | 19 +++--
>>  ...1-Configure-do-not-tweak-mips-cflags.patch |  4 +-
>>  ...sysroot-and-debug-prefix-map-from-co.patch | 26 ++++---
>>  .../0001-extend-check_cwm-test-timeout.patch  | 32 ++++++++
>>  .../openssl/openssl/CVE-2024-41996.patch      | 44 -----------
>>  .../{openssl_3.2.6.bb =3D> openssl_3.5.4.bb}    | 76 +++++++++++++-----=
-
>>  7 files changed, 116 insertions(+), 94 deletions(-)
>>  create mode 100644
>> meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-tim=
eout.patch
>>  delete mode 100644
>> meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
>>  rename meta/recipes-connectivity/openssl/{openssl_3.2.6.bb =3D>
>> openssl_3.5.4.bb} (75%)
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#229884):
>> https://lists.openembedded.org/g/openembedded-core/message/229884
>> Mute This Topic: https://lists.openembedded.org/mt/117416674/4316185
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
Yoann Congal
Smile ECS

--00000000000029dfe8064970b6e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0ven. 23 janv. 2026 =C3=A0=C2=A018=
:02, Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal=
@smile.fr</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quote gmail_=
quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">L=
e=C2=A0ven. 23 janv. 2026 =C3=A0=C2=A013:33, Peter Marko via <a href=3D"htt=
p://lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &l=
t;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openembedded.org" targe=
t=3D"_blank">siemens.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Intention of th=
is RFC is to run full autobuilder job matrix to see if<br>
there are any failures not detected by my local testsuite.<br></blockquote>=
<div><br></div><div>I created a poky branch with this patch :=C2=A0<a href=
=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Dycongal/scarthgap/op=
enssl_3.5_upgrade" target=3D"_blank">https://git.yoctoproject.org/poky-cont=
rib/log/?h=3Dycongal/scarthgap/openssl_3.5_upgrade</a></div><div>(above my =
-nut branch to decrease the probability of an unrelated AB-INT failure)</di=
v><div><br></div><div>I&#39;ve started the build : <a href=3D"https://autob=
uilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3118" target=3D"_bla=
nk">https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/311=
8</a></div></div></div></blockquote><div><br></div><div>Hello,</div><div><b=
r></div><div>As discussed=C2=A0during the tech call of last tuesday, I&#39;=
ve started builds:</div><div>* a new a-full with rebased branch on the late=
st scarthgap (now, the branch is only scarthgap+this upgrade)</div><div>=C2=
=A0 *=C2=A0<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/build=
ers/29/builds/3133/">https://autobuilder.yoctoproject.org/valkyrie/#/builde=
rs/29/builds/3133/</a> failed on a unrelated AB-INT issue (#15945) but is o=
therwise OK</div><div>* a meta-oe build (which includes a world build for m=
eta-oe, meta-python, meta-networking &amp; meta-filesystems):</div><div>=C2=
=A0 *=C2=A0<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/build=
ers/81/builds/1277">https://autobuilder.yoctoproject.org/valkyrie/#/builder=
s/81/builds/1277</a></div><div>=C2=A0 * *Failed on=C2=A0python3-m2crypto* (=
log.do_compile =3D&gt;=C2=A0<a href=3D"https://gist.github.com/ycongal-smil=
e/4c6501ecd81c9f475b793234cceb7a74">https://gist.github.com/ycongal-smile/4=
c6501ecd81c9f475b793234cceb7a74</a>)</div><div>* to compare, I&#39;ve start=
ed the same build with a vanilla scarthgap=C2=A0branch (without the openssl=
 upgrade):</div><div>=C2=A0 *=C2=A0<a href=3D"https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1278">https://autobuilder.yoctoprojec=
t.org/valkyrie/#/builders/81/builds/1278</a> =3D&gt; success (albeit with w=
arnings)</div><div><br></div><div>Can you investigate this python3-m2crypto=
 failure?</div><div><br></div><div>Also, the &quot;meta-oe&quot; build does=
 not cover every layer in meta-openembedded, I think I will increase covera=
ge to all the meta-openembedded layers for the next run...</div><div><br></=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
Topic for discussion is especially what should be the final form of this<br=
>
upgrade as some users may want to stay on openssl 3.2.x originally<br>
shipped with Yocto 5.0 Scarthgap.<br>
Current form was chosen to easily review recipe/patch differences.<br>
Is it fine to overwrite or do we need to keep both version and make one<br>
the default and other optional? Which would be tested on AB?<br>
<br>
Peter Marko (1):<br>
=C2=A0 openssl: upgrade 3.2.6 -&gt; 3.5.4<br>
<br>
=C2=A0.../openssl/files/<a href=3D"http://environment.d-openssl.sh" rel=3D"=
noreferrer" target=3D"_blank">environment.d-openssl.sh</a>=C2=A0 =C2=A0 |=
=C2=A0 9 ++-<br>
=C2=A0...ke-history-reporting-when-test-fails.patch | 19 +++--<br>
=C2=A0...1-Configure-do-not-tweak-mips-cflags.patch |=C2=A0 4 +-<br>
=C2=A0...sysroot-and-debug-prefix-map-from-co.patch | 26 ++++---<br>
=C2=A0.../0001-extend-check_cwm-test-timeout.patch=C2=A0 | 32 ++++++++<br>
=C2=A0.../openssl/openssl/CVE-2024-41996.patch=C2=A0 =C2=A0 =C2=A0 | 44 ---=
--------<br>
=C2=A0.../{<a href=3D"http://openssl_3.2.6.bb" rel=3D"noreferrer" target=3D=
"_blank">openssl_3.2.6.bb</a> =3D&gt; <a href=3D"http://openssl_3.5.4.bb" r=
el=3D"noreferrer" target=3D"_blank">openssl_3.5.4.bb</a>}=C2=A0 =C2=A0 | 76=
 +++++++++++++------<br>
=C2=A07 files changed, 116 insertions(+), 94 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-ext=
end-check_cwm-test-timeout.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024=
-41996.patch<br>
=C2=A0rename meta/recipes-connectivity/openssl/{<a href=3D"http://openssl_3=
.2.6.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.2.6.bb</a> =3D&gt; =
<a href=3D"http://openssl_3.5.4.bb" rel=3D"noreferrer" target=3D"_blank">op=
enssl_3.5.4.bb</a>} (75%)<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229884): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229884" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229884</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117416674/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117416674/4316185</a><br>
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
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000029dfe8064970b6e4--

