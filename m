Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B014CDE008
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 10:43:20 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8646.1782384186214864573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 03:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WZ8/9TH5;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49249707788so10962185e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 03:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782384184; cv=none;
        d=google.com; s=arc-20260327;
        b=NvUxboK5aZNVn0ZTMh6bLaHog7x4QO2rKn4HeL+OUrlyf9TCOwEb9VKG3cLH5WZmYw
         KCxnEX3MDAY/U326DcdvoyYW18pFIwsGGzCaLhOCbTxtobdkmkllytmrP9317UQTlv4X
         JGqdlKGzf4NYnNp9deH9qupgxX5+CChnV0Nwy9Llbq9KzcXPNpy4WD3ZXHoFJ5QD8bSv
         iZ80k6tE3MlYozn4AgjWpZ/pKmxUCeyJegG1xAtJ5ZyK+q7p/shjleHEEzKh3gu5E6vE
         jiU1Sq7HnrHWzdcIFKb1sXo3gOsjoOkXfI2NF/4z8buFB+zbo550Eukf66Ue4BbD/RT1
         iM9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6cI1cwwKbl+rIKfVVV9OezOIhx9K7ezESB6WifXMynE=;
        fh=tuNbZVF+Hdp/0n7LnnNX9Yx3GMhlDpnOL3FQdvF5gZQ=;
        b=P0vJY5sZweenLJI4qJGSg/SmK+nMyoGw1GbkmfNImTfhNMdtfE7OdPqwbs8TiqS92+
         Elk1UzrOR4Dg/GcHurySee76/FE3Cm9g6wkP6J7PdPT6EHm49PIDsCeW8EIZ6Z+LW5Z5
         zrZ08OeDhLtuvgxCU5TDvrg2TgC+m1tHL9yfp0kEVATgjgbf3rY8uXAlOpEi644A4h+l
         UAadCXqTEgXO5Xpi27XirqYe8WmhAjbwwaId54su/763QAUuskfzXdyu/86kCTqP0wsO
         nW+vMGCvcFhBACgblNniRyohygauBB1UhNIidYJpZnHfF25n+XHaWVqVH6RDVK/0Qb9j
         sulw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782384184; x=1782988984; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6cI1cwwKbl+rIKfVVV9OezOIhx9K7ezESB6WifXMynE=;
        b=WZ8/9TH5V609HiY951uaP0lIc0uXQuk5JC2R9zpxsGNBrya7TL7s5EuWjNU+/KTXQH
         YspSftQK6gQsTkv/R+TxWtHHRsY0NZMHZBABToZFbG15nURLXkEm3jokXqk3JJ5iXhiE
         qM2/qYMpdiTrKhi9u2eEdw1rHJG+OHatf0OqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384184; x=1782988984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cI1cwwKbl+rIKfVVV9OezOIhx9K7ezESB6WifXMynE=;
        b=e0I+S1ZcRk4Bn1a7+D0Bnx2pHmNGvmDuMUEzgjOqWbuql9JNsBRbZxiZzMtHy13mvb
         43NaVA3tDl1YsyGVXjyQujB5XpPvMmFQOaR49dKvf0mplz2qFySa2yzK4RtJ3ATwtHFt
         DTLG4QjF5LuNST8MUTC34gCvwBB4dReHTqbIhpeTlcTqKSTInYOuDqPsRpafWjM1ctlY
         adJMa6Si+Xbj41uF/SeXHXpxIXl30+QZGjUtBXcZFNxlSCI+ZNwU8UyCGl7wb2dApX4/
         XIf53eQ6jCzbA/anPfu8y7bClNYPKBE2zarXGuosRVvAWmHR9sP6Mhsk9Bdg8BqeO7uR
         jHPQ==
X-Gm-Message-State: AOJu0YxPzGEHPZzwl+3IWq/ZNtkb5OzdTrmL8ClVCpvmysQ8xNI91qZn
	mXVHMo2xeb1bbdDMY+o24dnJps+RGNGrZMYrsrA9grHcYyjOTXvQ57OSSxKZVK5Vf8XjBYu0HV/
	sls7ZujlL2HeFSrJWlK804Bw5ret+Bt5ol6XV31fLdg==
X-Gm-Gg: AfdE7cll7Do8A1hHemkCCRLMa0tkQX4Oz5giRB3IEgInYz1Vji8A1YM4FyjYVJJxBQJ
	+rH6uCMwkPln1o2cIKj1Kjie4SuCxrFc84qSb9kS/XoF1+wVcFnNDd9xBEkiwrkcPk9PitLL+Jc
	CmqV14ooEewoE3HuJXuVsGpj5EtH+LoxezabpC6s6B2kGIOkloTh/v1qU6N8sS6vBO4cP3tp/3E
	XRG7dNwZvERaH3p58xtsOyYjqBfaWdZFgIX5IpzbDppuK0A+o6D2ggvvm0vHml5r5dIgvxja0Nj
	czIjjRDjnA6950Mng8RypUKbNdDc2sOzAghneCMTYw==
X-Received: by 2002:a05:600c:6094:b0:492:63c3:8eeb with SMTP id
 5b1f17b1804b1-492668aa8b7mr25754245e9.35.1782384184120; Thu, 25 Jun 2026
 03:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260605024308.222721-1-wei.deng@oss.qualcomm.com> <20260625034712.3878106-1-wei.deng@oss.qualcomm.com>
In-Reply-To: <20260625034712.3878106-1-wei.deng@oss.qualcomm.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 25 Jun 2026 12:42:37 +0200
X-Gm-Features: AVVi8Cev4B1Gnnn6kGb3dnSRH1fs4O-PIHaEGr1IwIyn_Y6dzP8zlWp-7VgIDJw
Message-ID: <CAMSfU+4mCkdiF5i1UHfCVn0sMs-GFb=WMu8HZxvbkKHHMRkzrA@mail.gmail.com>
Subject: Re: [PATCH] bluez5: set L2CAP IMTU for OBEX profile listeners
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000025ff1e065511a8b1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 10:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239552

--00000000000025ff1e065511a8b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 25 juin 2026 =C3=A0 05:47, Wei Deng <wei.deng@oss.qualcomm.com> a =
=C3=A9crit :

> Hi Yoann,
>
> This patch was merged to OE-core master on 2026-06-11 (commit 13cb97f).
> Could you please cherry-pick it to the wrynose branch as well? It fixes
> an OBEX Rx throughput regression caused by an incorrect L2CAP IMTU being
> advertised on listening sockets.
>

Hello,

I've noted to consider it. Looks good at a quick glance.
Ping back if you don't see it in the next wrynose review series.

Regards,


>
> Thanks,
>
> On Fri, 5 Jun 2026 08:13:08 +0530, Wei Deng <wei.deng@oss.qualcomm.com>
> wrote:
> > Backport upstream fix that adds an imtu field to default_settings for
> > OBEX profiles (OPP, FTP, PBAP, MAS, MNS) and applies it to the L2CAP
> > listening socket via bt_io_set(). Without this, the listening socket
> > advertises the L2CAP minimum of 672 bytes in L2CAP_CONFIGURATION_RSP,
> > limiting the peer's outgoing PDU size and degrading Rx throughput.
> >
> > Upstream-Status: Backport [bluez/bluez@646014a]
> > Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> > ---
>
> --
> Best Regards,
> Wei Deng
>


--=20
Yoann Congal
Smile ECS

--00000000000025ff1e065511a8b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 25=
 juin 2026 =C3=A0=C2=A005:47, Wei Deng &lt;<a href=3D"mailto:wei.deng@oss.q=
ualcomm.com">wei.deng@oss.qualcomm.com</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Yoann,<br>
<br>
This patch was merged to OE-core master on 2026-06-11 (commit 13cb97f).<br>
Could you please cherry-pick it to the wrynose branch as well? It fixes<br>
an OBEX Rx throughput regression caused by an incorrect L2CAP IMTU being<br=
>
advertised on listening sockets.<br></blockquote><div><br></div><div>Hello,=
</div><div><br></div><div>I&#39;ve noted to consider it. Looks good at a qu=
ick glance.</div><div>Ping back if you don&#39;t see it in the next wrynose=
 review series.</div><div><br></div><div>Regards,</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
<br>
On Fri, 5 Jun 2026 08:13:08 +0530, Wei Deng &lt;<a href=3D"mailto:wei.deng@=
oss.qualcomm.com" target=3D"_blank">wei.deng@oss.qualcomm.com</a>&gt; wrote=
:<br>
&gt; Backport upstream fix that adds an imtu field to default_settings for<=
br>
&gt; OBEX profiles (OPP, FTP, PBAP, MAS, MNS) and applies it to the L2CAP<b=
r>
&gt; listening socket via bt_io_set(). Without this, the listening socket<b=
r>
&gt; advertises the L2CAP minimum of 672 bytes in L2CAP_CONFIGURATION_RSP,<=
br>
&gt; limiting the peer&#39;s outgoing PDU size and degrading Rx throughput.=
<br>
&gt;<br>
&gt; Upstream-Status: Backport [bluez/bluez@646014a]<br>
&gt; Signed-off-by: Wei Deng &lt;<a href=3D"mailto:wei.deng@oss.qualcomm.co=
m" target=3D"_blank">wei.deng@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
<br>
--<br>
Best Regards,<br>
Wei Deng<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000025ff1e065511a8b1--

