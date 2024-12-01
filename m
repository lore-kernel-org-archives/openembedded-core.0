Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224DFD4977B
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 16:35:03 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.154121.1733070895465004409
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 08:34:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hy0ql0nS;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7250844b0ecso2753595b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 08:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733070895; x=1733675695; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MvK361SsdgJWb081ugY/1SuKP75iSo8AGI+Bz95bWsY=;
        b=Hy0ql0nSuQdKeImPtjWfUTOYdRDrxDFqpU/kXXMmQLyxk4CrTQBoVDaf3D4xEPjQgj
         yHJq9wAfzpRbUDRbL9CVyQ4xK2+LaLzK9SetMbwSIG55JwkDs8zXeiTXH3VFwJRYYAq5
         F37y3vYsnflc9MYdxyOaLFtPG+rPTKaA2ebhP//vtA3pFQEO4vDEUIoiYKBSMk/TBRfS
         E5R65unH212V0cpdu41lLcQ97QVyS/QJK4HpVw8Pmi36jz+oMlma4cVVuG7T8zQsj9MB
         soOKI3vQLPgDZHK1kP4iHOXhANJNF/1XnPhfutyv9I61dp7QJaGEqDix5TjNtjssbbPa
         GBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733070895; x=1733675695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvK361SsdgJWb081ugY/1SuKP75iSo8AGI+Bz95bWsY=;
        b=Nte5RxA0Ek7jjgcWxiQEr6NOnmxB7dhrs2CDnLJmZrMcf2J6yGPAN+TrPhTQ2e77fD
         UpsKTC2YEFIzwDyznX54YEQMwwfSiuSCXqDtgmIWvVOtoYSczER8Vr97nuYM4iZKJLGY
         57z+2/C69rVsN89SzAjoBy02eWyn9p8oecdItJR2bvSzWoifrDhFiJtY+DWfOHz0J3S4
         zfxeNBpc3YdmrWXDykacxENN83UZ2BjKW1yVsDysRhKjE8ZsYHo+2pEygrIRaIvGn7HT
         SlSyV3b/vULzuywzL0o7pJ0gcLXmXJZ38jLKPO+25btcsbIZbkyGgvnmhdu3H+mMrW2m
         NdIg==
X-Forwarded-Encrypted: i=1; AJvYcCX9rTfaREH7W7dcj+vcVrSfc8Vb9BjB6N6p2R39EfOPEERNIszAiBHU9kIFxdKKScvDnz4eMLGYyuvza8sexSNkFw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxwmb4ZLwn8RwjBE+j48Qy9WpH4yKziFQu/fyWZ6nf0d5MggQmG
	TeTL1Egx21pdU0MJfzWXNtIu1mo6mTNxebQGmNmcO/+WfmdgD+vsb+maeh+09uiHhN6aIq3xZwc
	K39oPJ94qg3+8GPj/IuU4HbW8nb4=
X-Gm-Gg: ASbGnctdc/Hyg9G+88DxLW+G1Z4KssfzhMxojgGoTT1IN+o+Ir+dCFuqocdcuNwMmEs
	uNI5QH6/kPDA5rnNkunPz1TyaeNrQTDQ=
X-Google-Smtp-Source: AGHT+IEjMrOt07laX3g+y4W7Hn3gU6/fwJT+Kk1HARI3i7pR0S0F2IWOkf7y2Y2srnwZlOWa3QnlNjse8dt3rpytGm0=
X-Received: by 2002:a17:90b:52c5:b0:2ee:94d1:7a9d with SMTP id
 98e67ed59e1d1-2ee94d17b7emr5712176a91.32.1733070894582; Sun, 01 Dec 2024
 08:34:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1730950520.git.steve@sakoman.com> <57de6545695ac11816d670959d9e63666de08e3d.1730950520.git.steve@sakoman.com>
 <CAB2nKc88-5F1mDe4G7ucA1W7u7rzQkCpuzwmA7Zmd2_n3qyqrA@mail.gmail.com>
 <CAApg2=SbZL+GBHLW3xVJ-UM+nepEwtcJbO4wEfc5pRay=oTVZg@mail.gmail.com> <CAMSfU+6JN7gYcTcn9rDjJQ=ERWNNKJeKxsZ4HBQfqqb=vgcpaQ@mail.gmail.com>
In-Reply-To: <CAMSfU+6JN7gYcTcn9rDjJQ=ERWNNKJeKxsZ4HBQfqqb=vgcpaQ@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Sun, 1 Dec 2024 17:34:43 +0100
Message-ID: <CAApg2=QeAsOv7+4JxpNZ6Y3M9BvpUZRNc_qPyzXcLCBPOoOeyA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 02/10] cve_check: Use a local copy of the
 database during builds
To: Yoann Congal <yoann.congal@smile.fr>
Cc: vincent.prince.fr@gmail.com, steve@sakoman.com, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000ad26106283803bb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 16:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208116

--0000000000000ad26106283803bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 1, 2024 at 2:40=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr>=
 wrote:

>
>
> Le jeu. 28 nov. 2024 =C3=A0 17:09, Marta Rybczynska via lists.openembedde=
d.org
> <rybczynska=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>
>> On Tue, Nov 26, 2024 at 2:05=E2=80=AFPM Vincent Prince via lists.openemb=
edded.org
>> <vincent.prince.fr=3Dgmail.com@lists.openembedded.org> wrote:
>>
>>> Hello,
>>>
>>> I'm wondering if I'm the only one who couldn't complete do_fetch of
>>> cve-update-nvd2-native with maximum retries on CVE API?
>>> I tried with or without API Key, from several different machines, I
>>> also tried to increase retries number etc, without success.
>>>
>>> I see on the NVD status page the following warning :
>>> "Due to changes described below, a large number of CVE records have
>>> recently been updated, resulting in a large increase in API requests.
>>> We are aware of the issue and are working to mitigate it. Thank you
>>> for your patience."
>>>
>>> I see the Buildroot switched from NVD to alternative FKIE github
>>> database due to that API 2.0 inconsistency :/
>>>
>>> I'm not sure what are my options here, quite odd that cybersecurity
>>> organisation get impacted by DDoS :D
>>>
>>
>> If it doesn't improve in a reasonable time (like until the end of the
>> week) I'm for mirroring it. The complete image for now.
>>
>
> FYI, this looks like it's fixed now :
> https://valkyrie.yoctoproject.org/#/builders/103 has been green for 2
> days and, locally, no HTTP errors.
>
>
For info, I have a partially working switch to a different source. It isn't
complicated, just a question of applying recent modifications to the other
fetcher.

I will post an RFC so that we do have an alternative the next time it goes
down.

Kind regards,
Marta

--0000000000000ad26106283803bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 1, =
2024 at 2:40=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smi=
le.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0j=
eu. 28 nov. 2024 =C3=A0=C2=A017:09, Marta Rybczynska via <a href=3D"http://=
lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;ry=
bczynska=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_b=
lank">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 26, 2=
024 at 2:05=E2=80=AFPM Vincent Prince via <a href=3D"http://lists.openembed=
ded.org" target=3D"_blank">lists.openembedded.org</a> &lt;<a href=3D"http:/=
/vincent.prince.fr" target=3D"_blank">vincent.prince.fr</a>=3D<a href=3D"ma=
ilto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.op=
enembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hello,<br>
<br>
I&#39;m wondering if I&#39;m the only one who couldn&#39;t complete do_fetc=
h of<br>
cve-update-nvd2-native with maximum retries on CVE API?<br>
I tried with or without API Key, from several different machines, I<br>
also tried to increase retries number etc, without success.<br>
<br>
I see on the NVD status page the following warning :<br>
&quot;Due to changes described below, a large number of CVE records have<br=
>
recently been updated, resulting in a large increase in API requests.<br>
We are aware of the issue and are working to mitigate it. Thank you<br>
for your patience.&quot;<br>
<br>
I see the Buildroot switched from NVD to alternative FKIE github<br>
database due to that API 2.0 inconsistency :/<br>
<br>
I&#39;m not sure what are my options here, quite odd that cybersecurity<br>
organisation get impacted by DDoS :D<br></blockquote><div><br></div><div><d=
iv>If it doesn&#39;t improve in a reasonable time (like until the end of th=
e week) I&#39;m for mirroring it. The complete image for now.</div></div></=
div></div></blockquote><div><br></div><div>FYI, this looks like it&#39;s fi=
xed now : <a href=3D"https://valkyrie.yoctoproject.org/#/builders/103" targ=
et=3D"_blank">https://valkyrie.yoctoproject.org/#/builders/103</a> has been=
 green for 2 days and, locally, no HTTP errors.<br></div><br></div></div></=
blockquote><div><br></div><div>For info, I have a partially working switch =
to a different source. It isn&#39;t complicated, just a question of applyin=
g recent modifications to the other fetcher.</div><div><br></div><div>I wil=
l post an RFC so that we do have an alternative the next time it goes down.=
</div><div><br></div><div>Kind regards,</div><div>Marta <br></div></div></d=
iv>

--0000000000000ad26106283803bb--

