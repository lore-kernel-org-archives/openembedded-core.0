Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8531FD735E4
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 00:08:48 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.126536.1732925327026318902
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 16:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XzswsUvG;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: colinmca242@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d0ccd931a3so91149a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 16:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732925325; x=1733530125; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QNVsCi4D2V1n0xonvDWGArTG6A68aheHVAsIi4A++zE=;
        b=XzswsUvGt0La6oelkJjWaaQ7pGEAV0QwCiaDiActvntmn2hkzJ/yvSYGI0Jb/hMC5f
         P68MM0Myqo5lxnfOt4kP9Lp6WXQ5sLTj/sAmb/EJG+1p58ENq0gHXa2QiiaOtbUNR4Nj
         wxzmUlJm/rd4ozkuMUoV4K3eynXWhXc15VB/6DZ8MS0d3Ge9AE9ibz9G+S3sDMNUoqWn
         yQZdojDkVbNTfMYAt7XGUfTGX62HjOOJd1lzNeOtWlJDcVRvT8wf2QFyzvBEH+1clG0p
         HITS5i7MC82gl5MUFNelRi98PZ0T5mYqoE7F3Az0CeK1lrelyIyWQFlzaLNRnQUtQbpl
         b08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732925325; x=1733530125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNVsCi4D2V1n0xonvDWGArTG6A68aheHVAsIi4A++zE=;
        b=qh6xbSGE7WcD8SOQLolAR9XsdTLxKkBNUB6fWvQ/0MjUNgWHz00Ma/kkn+hO57URMZ
         FI+PsqVHCG81iu2+tbiDg+qHr6Izjg1qIB6Q+UZ+i8tj7EqpIL7nyFJuJ57mT47GlSIt
         tEwWvfotdF8/J9S9x1tu2/yecbONf6LPkU8IfHT/R0xHepmqdK2f4vhSBKx2/LQDvRnV
         x2auIpfnSwMbgCXHtSKIC+66jd7SBimJsc1cxkUNZOchTp9oYNq3Zr0ho0oBjM3h5axF
         e7pqWCwyo5u7lakW/9AdNV5+1rMrZ7FOW/VZ5NxQ11F0SXSsWnaXDchSME2bjJlCEMzR
         MqLg==
X-Gm-Message-State: AOJu0YyKa81SfJIH90KuvLs7DObZGQDN2HRqJpLRWII8eYHuvl+EJEex
	ZgpACI8qaylprhAvwZe7TH+17Pt3qpMp0Gg6ZXf+3HbiUi5v9u4ucI8VZdhrZHruC+8TwSsbHCw
	uXgN+R5KoIQZSDcwstQOYsmvFlyQ=
X-Gm-Gg: ASbGncsdfmXAC19fdwzzjhzLA++eCRjnPbxjwltl8hiQrUiGHkRVetd17pFxo8gvyvw
	ifBX/CttYthsC0h39yZumVPrcu1vbRt8jnKtGlfhaf1glVZCWeg==
X-Google-Smtp-Source: AGHT+IFnorlLT0WX8naqZGqTB2tU15lFkE6+Qqh1FMERNHqursTdKXkFWknlM/8xUdvPulfqcRqzsHQlogBRReYZrx4=
X-Received: by 2002:a17:906:1db1:b0:aa5:479b:3d25 with SMTP id
 a640c23a62f3a-aa581062a7emr1029619466b.51.1732925325061; Fri, 29 Nov 2024
 16:08:45 -0800 (PST)
MIME-Version: 1.0
References: <20241127125945.3211089-1-colinmca242@gmail.com>
 <CAApg2=QjL7XBPbBU0tP7T_hO2OVTudzDf3u+2zJh9GVS3gXKoQ@mail.gmail.com>
 <CAAyLwgTtg4ykNN9sY91P-CfX2=BeXiXevHu_TyzFaT5=SUbt8w@mail.gmail.com> <CAApg2=Q_vk6XNB2T_OLWLZ_hXgPMDuFR=7jdmBeRbNvsTAHjrQ@mail.gmail.com>
In-Reply-To: <CAApg2=Q_vk6XNB2T_OLWLZ_hXgPMDuFR=7jdmBeRbNvsTAHjrQ@mail.gmail.com>
From: Colin <colinmca242@gmail.com>
Date: Fri, 29 Nov 2024 18:08:32 -0600
Message-ID: <CAAyLwgRmFw0FYPc97skM9M9PZHMt1t3cnkb0tesUh8noaa4B8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: Update vector logic
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006c364a0628161e4c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 00:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208034

--0000000000006c364a0628161e4c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2024 at 9:05=E2=80=AFAM Marta Rybczynska <rybczynska@gmail.=
com>
wrote:

> On Fri, Nov 29, 2024 at 3:02=E2=80=AFPM Colin <colinmca242@gmail.com> wro=
te:
>
>> Hi,
>>
>>
>> I would like to use the vector string to do some analysis
>> and prioritization of CVEs and have
>> found that the vector string is better than using the CVSS score. I woul=
d
>> argue that in
>> embedded contexts, the environment that a device is used in will result
>> in a different scoring
>> of the vector. The most easy example is a standalone device that does no=
t
>> have any network
>> connections will likely prioritize physical over network attacks, which =
I
>> believe is opposite to
>> how the CVSS score is determined.
>>
>> I would like for the vector string to be included in the outputs so it i=
s
>> also cached. Post-build
>> tooling could use the NIST API to pull down the vector string, but I
>> would like to avoid hitting
>> the API for what I imagine are the same reasons caching is already done
>> for cve-check.
>>
>> As others have noted in this thread, the NIST API has been rather
>> unreliable lately. I agree
>> that the fetch is likely what is failing the build, since I had to bump
>> the database filename to
>> refresh the contents with the correct vector string. I didn't
>> test_image_json locally, but I did
>> run builds that included fetching the nvd database and everything seemed
>> to have been
>> working.
>>
>>
> Hello,
> I'm not totally convinced by the fact that having the vector will avoid
> you getting the complete entry.
> What is the database if what is needed for the analysis. CVSS scores are =
a
> little an exception here.
> If we want to change the database format, I think it might make sense to
> add ALL the vector strings
> and not only the last one. That makes way more sense for interpretation
> purposes and allows you
> compare entries that have multiple vectors.
>
> That being said, NVD entries often have multiple vectors - one from the
> vendor issuing the CVE,
> one from the NVD and so on. They often differ quite a bit, and those days
> there might be other
> assignments too. For such an analysis I would rather use the raw CVE
> database instead.
>
> Please note that we keep NVD for now because of the CPEs. Product names i=
n
> the CVE database
> are not always set correctly (also, the vector is not always set). For al=
l
> more complete analysis I
> use CVE that is available as a simple repository at
> https://github.com/CVEProject/cvelistV5
>
> Kind regards,
> Marta
>
>

I don't disagree. I figured including all CVSS vector strings
would probably be best, but I also
figured that would also lead to a breaking API change in the cve-check
output. I was
concerned that a breaking change may not be able to be backported to
Kirkstone and
Scarthgap, which is what I wanted. However, if a patch that adds all CVSS
version vector
strings would be accepted over this patch, I would be happy to make that
change instead.

Thank you,
Colin

--0000000000006c364a0628161e4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Nov 29, 2024 at 9:05=E2=80=AFAM M=
arta Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com">rybczynska@gmai=
l.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote gmail_quote_contain=
er"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Nov 29, 2024 at 3:02=E2=80=AFPM Colin=
 &lt;<a href=3D"mailto:colinmca242@gmail.com" target=3D"_blank">colinmca242=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>=
<div>Hi,</div><div><p style=3D"margin:0px;font-stretch:normal;font-size:11p=
x;line-height:normal;font-family:Menlo;font-size-adjust:none;font-kerning:a=
uto;font-variant-alternates:normal;font-variant-ligatures:normal;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-feature-settings:norm=
al;color:rgb(0,0,0)"><br></p></div><div>I would like to use the=C2=A0vector=
 string to do some analysis and=C2=A0prioritization of CVEs and have</div><=
div>found that the vector string is better than using the CVSS score. I wou=
ld argue that in</div><div>embedded contexts, the environment that a device=
 is used in will result in a different scoring</div><div>of the vector. The=
 most easy example is a standalone device that does not have any network</d=
iv><div>connections will likely=C2=A0prioritize physical over network attac=
ks, which I believe is opposite to</div><div>how the CVSS score is determin=
ed.</div><div><br></div><div><div>I would like for the vector string to be =
included in the outputs so it is also cached. Post-build</div><div>tooling =
could use the NIST API to pull down the vector string, but I would like to =
avoid hitting</div><div>the API for what=C2=A0I=C2=A0imagine are the same r=
easons caching is already done for cve-check.</div></div><div><br></div><di=
v>As others have noted in this thread, the NIST API has been rather unrelia=
ble lately. I agree</div><div>that the fetch is likely what is failing the =
build, since I had to bump the database filename to</div><div>refresh the=
=C2=A0contents with the=C2=A0correct vector string. I didn&#39;t test_image=
_json locally, but I did</div><div>run builds that included fetching the nv=
d database and everything seemed to have been</div><div>working.</div></div=
><br></div></blockquote><div><br></div><div><div>Hello,</div><div>I&#39;m n=
ot totally convinced by the fact that having the vector will avoid you gett=
ing the complete entry.</div><div>What is the database if what is needed fo=
r the analysis. CVSS scores are a little an exception here.</div><div>If we=
 want to change the database format, I think it might make sense to add ALL=
 the vector strings</div><div>and not only the last one. That makes way mor=
e sense for interpretation purposes and allows you</div><div>compare entrie=
s that have multiple vectors.</div><div><br></div><div>That being said, NVD=
 entries often have multiple vectors - one from the vendor issuing the CVE,=
</div><div>one from the NVD and so on. They often differ quite a bit, and t=
hose days there might be other</div><div>assignments too. For such an analy=
sis I would rather use the raw CVE database instead.</div><div><br></div><d=
iv>Please note that we keep NVD for now because of the CPEs. Product names =
in the CVE database</div><div>are not always set correctly (also, the vecto=
r is not always set). For all more complete analysis I</div><div>use CVE th=
at is available as a simple repository at <a href=3D"https://github.com/CVE=
Project/cvelistV5" target=3D"_blank">https://github.com/CVEProject/cvelistV=
5</a></div><div><br></div><div>Kind regards,</div><div>Marta</div>=C2=A0</d=
iv></div></div></blockquote><div><br></div><div>I don&#39;t disagree. I fig=
ured including all CVSS vector strings would=C2=A0probably be best, but I a=
lso</div><div>figured that would also lead to a breaking API change in the =
cve-check output. I was</div><div>concerned that a breaking change may not =
be able to be backported to Kirkstone and</div><div>Scarthgap, which is wha=
t I wanted. However, if a patch that adds all CVSS version vector</div><div=
>strings would be accepted over this patch, I would be happy to make that c=
hange instead.</div><div><br></div><div>Thank you,</div><div>Colin</div></d=
iv></div>

--0000000000006c364a0628161e4c--

