Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09943D715E2
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 10:30:05 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16367.1769250603398534907
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jan 2026 02:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Gvj9s9hI;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4359a16a400so2785940f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Jan 2026 02:30:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769250602; cv=none;
        d=google.com; s=arc-20240605;
        b=DqtYceiHqa6tlUPlXmsDxjQca6vr5Pq7VsiorzybhsprCCmR/Je1vs0bhhjYbFPx9H
         K+1ocl7yFX8fkK4GAqJBnrrgwKIpm76EnXkZ5KLk9FJrl2Rs+40CA0A2eTRsanwXu8dP
         e6FBovwfiJgFXyyBoBEx7NHKr5bU3mNiq56naAA2lzTEL5iEXAOWHdmd1I0RXNn27a7Y
         vJJFJ1d08+/AUck96fNKkuw2SLrPiqOPxNBHmK0viuEabCN0xRldSqXv7y56q7RoHk1T
         aqena8FS5tOcDcNhw1IH2AAf6giiJj6vIBFdJ5a6wXfVPr2m1zdi1WQ91r6j2N0G0RD2
         bnvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dmsrlf6VL1cgQY4JHhFTSzGkqOLUFInNludr/gLLtjE=;
        fh=dI4eGhhXRYQf7RsXLxEGaKg0Olh6BsHtf/nuVeEubBo=;
        b=jKr0aGV92guQ8blbgg+CtqppX+A5IT7//tQZQbzMHRDD0/0dUOK3B6rk44vRAwDhVM
         067tGRI+mixe2ASMYbOArjApUiBhlIeQxaC2LltAmCs5jgqGBu5z7nsJkA40jlhbvLAA
         6AETi9BPH/tkyk83bnDK9UTBKvRMj1ghTjg3dWkQ4xDxARWA3eyawbLzknILNJ44tEC7
         +2WzXS61lbso7KsHJMN/7spzCK+3gkD9m9FdfZPU+pHLmRdYKj3xca2eIundBuWkR3+p
         OPDzQ6NBneWqKRT5bLxk41G/hIl+21ZIxoRFOMRKls4NDYm4F1ynEQXbFBdnUQLs3+UZ
         d+nA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769250602; x=1769855402; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dmsrlf6VL1cgQY4JHhFTSzGkqOLUFInNludr/gLLtjE=;
        b=Gvj9s9hIcDTS5AdtEptz+Ut0hPL+8pyJkPJShZn/CEXHi52RzLC29UUp+dLFqNFGHi
         ViOOeIBJcFdKkn13XGr3B0jpvN9XgXYluWCJxSKjAG1Cty+UAn4JZ8LswFECvlhoNQI4
         PRTniwkDvNxWpWYc+HMOspa2jA9RPgyR1LW7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769250602; x=1769855402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmsrlf6VL1cgQY4JHhFTSzGkqOLUFInNludr/gLLtjE=;
        b=pMEUdzHLVYfmsYm+EjyNitFbQEyoak1dBKXQ8G+bAUvIMbk2vG4xMju1tcBrMdTO8h
         L7IAZdOWA0Jmv/8nc/8nGUaGETA6UkKh3vAsMG2ZlODqv6cGjLn/u/iV1KUM0aMB2UCy
         tLzmiJ61SVSoCn9e4o/AZ9ztRN8LNTj3ORUj6CMi7EdCzhXZ37UppvRfXojcFBzuM7jn
         EYKYdiFic1rgSGUTFlhDerKCPqak/s7U6kkSUfnrG0Ka2PtcWYb3xXmGii+eBd5Pfoir
         qBuhKqHcmQN4oqB/FaunaOm6dApWpqOXTOj7HE7YXuBTVpyAOR1tCRa+DVbQuFcVFIRC
         A8hQ==
X-Gm-Message-State: AOJu0YyzP88Sobc0gqpYAoekLQyL27DBSATeu0u14JMWiBEw9fOwribz
	nHSyK4n55oNETQwKPfNt+JvO8y7yNoH8pkqPB/OpoZ3MRb+XTzirqv0G69u6RlbcP7bNXDLwbu9
	kQbcxDVWFd7U9DXxyHIgl8nuFKMuTRomGlN9raFaJew==
X-Gm-Gg: AZuq6aIpcIb97LouAmOvxjJLYy1THClq3m4xJCQx2VUWEx5qGJVphJGQe66RyDzpotL
	O1mcwCXc4DksfjhQ0hJQslrWgIisSz+g+fVE176U1JlL+lD9p4xhxlZnDXiOMqnypepcJuUY+EV
	z4SdU59A2D7JPxgTxOdS6G5gzB1BXuHlOwGokK7Nin7d9uTlwLMBR4Av6crNhZK3RCbekdQ2/5E
	LV6qSqRVy1ifeauj2QtkSRnI6kyRq39p133LOHxIXksS/M1TiXHmtejdWsYTk4B/aMQaD3o6gM/
	zUcPA5bUPdW4CPr8k2EZO+RH8C9+
X-Received: by 2002:a05:6000:2384:b0:430:f40f:61ba with SMTP id
 ffacd0b85a97d-435b15fad16mr9297736f8f.41.1769250601755; Sat, 24 Jan 2026
 02:30:01 -0800 (PST)
MIME-Version: 1.0
References: <20260123123336.41126-1-peter.marko@siemens.com> <CAMSfU+7FpuEruzCELf=PGAmGgEzWYf_WBnU2goHdsPSsSkDcVg@mail.gmail.com>
In-Reply-To: <CAMSfU+7FpuEruzCELf=PGAmGgEzWYf_WBnU2goHdsPSsSkDcVg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 24 Jan 2026 11:29:34 +0100
X-Gm-Features: AZwV_Qifv9p1jAk8o8wyGIl0jYAUhSToCk-D4zlvHtW3IXgXUMq2Tbmw9H3v28c
Message-ID: <CAMSfU+7h_LCFuziRsfcEhDfzJkdFQaP4bCM1WEkkHRHcW6j_qw@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][RFC PATCH 0/1] openssl: upgrade 3.2.6 -> 3.5.4
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a2f1c106491fc14b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jan 2026 10:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229918

--000000000000a2f1c106491fc14b
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

a-full build was successful:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3118


> Topic for discussion is especially what should be the final form of this
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

--000000000000a2f1c106491fc14b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 23=
 janv. 2026 =C3=A0=C2=A018:02, Yoann Congal &lt;<a href=3D"mailto:yoann.con=
gal@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 23 janv=
. 2026 =C3=A0=C2=A013:33, Peter Marko via <a href=3D"http://lists.openembed=
ded.org" target=3D"_blank">lists.openembedded.org</a> &lt;peter.marko=3D<a =
href=3D"mailto:siemens.com@lists.openembedded.org" target=3D"_blank">siemen=
s.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Intention of this RFC is to run fu=
ll autobuilder job matrix to see if<br>
there are any failures not detected by my local testsuite.<br></blockquote>=
<div><br></div><div>I created a poky branch with this patch :=C2=A0<a href=
=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Dycongal/scarthgap/op=
enssl_3.5_upgrade" target=3D"_blank">https://git.yoctoproject.org/poky-cont=
rib/log/?h=3Dycongal/scarthgap/openssl_3.5_upgrade</a></div><div>(above my =
-nut branch to decrease the probability of an unrelated AB-INT failure)</di=
v><div><br></div><div>I&#39;ve started the build : <a href=3D"https://autob=
uilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3118" target=3D"_bla=
nk">https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/311=
8</a></div></div></div></blockquote><div><br></div><div>a-full build was su=
ccessful: <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/build=
ers/29/builds/3118">https://autobuilder.yoctoproject.org/valkyrie/?#/builde=
rs/29/builds/3118</a>=C2=A0=C2=A0</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
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

--000000000000a2f1c106491fc14b--

