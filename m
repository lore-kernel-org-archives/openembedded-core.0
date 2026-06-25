Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A891CDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 10:45:10 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8670.1782384308653014149
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 03:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PgnXGR3P;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4631679f204so424263f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 03:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782384307; cv=none;
        d=google.com; s=arc-20260327;
        b=n4vJMw2vlQlkbEJQLex/at1vZObpH//c3z2RGQilz7a6cp1Jmasao0KhhUTUAVYLkj
         tdjOLjmQjN1i6Z29VLIy6z0UdCC5lPGUZ1Yq/Nh4mC2PpGf9Yn7dcq7eaZzS4/OMMmuK
         KxHbUpltZteori3ffLAPynETHnTk0G7SCufy6dNr1AlIh88lH0Zsjhav0eUBToXGZTYk
         0wEaO4aFeJcHjuMWhqJ4dJ4+yVQ/Y+eiAYnrxz/FOb7l6UQeJg7RheTJjASOBFv1nLcQ
         KwKE/SG5j2Jqul0bDDrAGfJNzFhmKXtTQyLU4Oh9t82ffpndBODdN+BfNPQ98ET11zz7
         GhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=59Xk/jIfv5EadARA8a4HAKnLcO3FRC7/Uf/lhlZCua8=;
        fh=tuNbZVF+Hdp/0n7LnnNX9Yx3GMhlDpnOL3FQdvF5gZQ=;
        b=hH8sL8B7NyICQzwzOJIAtQaiYB0rmBMpvYjrSPOyHGGdDxhrkO6yLG/TgOw/IuM0/f
         HNf6dR+PBpoIGOiU//jOm1BBjRHld9gKfS7j7vFAMtAd1Dr2XLyiRS/QlNUc65Asb+H2
         2caCStAQI8mmXh4QQUzk9RTM4g6wo8bX3sLmntXLYMfFbXN7ihpQd5wYxvEkEvoVXayq
         iRGoqrQGTJsMOpXkp9X6rPZ8DhdFemtNRboBvMS2TdkhQKzXhqTFgDflp2Lh3O+fv9xa
         8KjJzinpVYP6FvZoGpktN4SbcLb5owtTIXtoCIiKirfVf0IAszdmODzl0GAqsZlNFp7S
         NELA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782384307; x=1782989107; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=59Xk/jIfv5EadARA8a4HAKnLcO3FRC7/Uf/lhlZCua8=;
        b=PgnXGR3PD0d91+6DfqxrV0P+jyxdgQXi/VMyKM5/ZoyjQnVRDTjkaA/wgYBKJ9marD
         +IHptaNvFJxNZYZabs0j6WP50GD5IdyD75VUddrNSGyD7gE1gcATgPP3+2hF6CPA8Wyr
         7Xx04K7XA4axbMvkVXonYbUTOjew19mISrt4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384307; x=1782989107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59Xk/jIfv5EadARA8a4HAKnLcO3FRC7/Uf/lhlZCua8=;
        b=EKCejVa6dEkm6mdFEsg/UqLhNlDjTXl8R/TjG5iC5GDpsBG8Deo4ICUCRivL0I+je8
         kINbDaWm6rDfxYtPFsyJcQd3zqn0OVmd8YhCMRJu010QqBnI6hdwfzTEwtTnMiDbcNGx
         zuBs0hmhVD7/6YDh1DG5aQWW557S4L2OQk8SzdIIa83OZhv03+ujqLpe7GNMx0NZam3f
         In3s2zqfyDRfib+neHzqZbSVvC09t8G+do+YPNYZiMaT4fUCFTnf4yDAKb01DMx7ZCWB
         8f1i+J845+MeVrM2eGp914qkOzuCjkTZgACzS0Wh/PuKZxXmafx8BHKu4gI3aZ9HIftN
         lp/w==
X-Gm-Message-State: AOJu0YxF4Lt8NVmcxTDQtF/mFE3DkbiJCIca5/j2GezPiwmZX+cMF9br
	aE9zfRhQzJck9jrg+wP3IeYNHxj81m/N0Yqe7PTZW2zRj0KX7AtZ1q70IfIdGUSgAYphFYdTLcW
	MWZ1CCg6+lHT6hpr2nDGJ9nPJSJo67gutnh2trdrkhg==
X-Gm-Gg: AfdE7cnf/KTr7BRenFldeb6mB7JEFpanC1HbmME5nQk0PRwyadggGlp8n7snXLBdqg0
	WVHIGB1zthU+kK8EjB2Da4SxF/lWsPEvDl6TB8sOX/j0LKa36qAt0r6F25uFYdJ9Z333RCMMiE0
	01OmoLxE7VXogFPOT6DTK9AdJ3rWYkRfVgmH6r5LVA1Gv0bLByIqsOd9CuMWPi0tGx8nGEjXiCd
	hej2XdcbJZ5w64A8BJ7E+anJ9SVo3lxXdtGkILb8+XoH6hGFbuX4F+NH0g/U5iisdQExrGHxDCN
	THwJx2CLFjo5j/3KbN5vy+tgNkQZlNk=
X-Received: by 2002:a5d:5d84:0:b0:46d:f979:1827 with SMTP id
 ffacd0b85a97d-46df9791994mr1996048f8f.23.1782384306755; Thu, 25 Jun 2026
 03:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260605024308.222721-1-wei.deng@oss.qualcomm.com>
 <20260625034712.3878106-1-wei.deng@oss.qualcomm.com> <CAMSfU+4mCkdiF5i1UHfCVn0sMs-GFb=WMu8HZxvbkKHHMRkzrA@mail.gmail.com>
In-Reply-To: <CAMSfU+4mCkdiF5i1UHfCVn0sMs-GFb=WMu8HZxvbkKHHMRkzrA@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 25 Jun 2026 12:44:40 +0200
X-Gm-Features: AVVi8CdwG0bkAH43CmoS-BaLYGgtH7d8PLU4tzUrGzDf3WQehTuO0LTo-YkaVqY
Message-ID: <CAMSfU+4MuNWsDvi-LNuv=G7VR7F75LgQ=e3QXrJKGn6pbk0ujQ@mail.gmail.com>
Subject: Re: [PATCH] bluez5: set L2CAP IMTU for OBEX profile listeners
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000753354065511af2c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 10:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239553

--000000000000753354065511af2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 25 juin 2026 =C3=A0 12:42, Yoann Congal <yoann.congal@smile.fr> a =
=C3=A9crit :

>
>
> Le jeu. 25 juin 2026 =C3=A0 05:47, Wei Deng <wei.deng@oss.qualcomm.com> a
> =C3=A9crit :
>
>> Hi Yoann,
>>
>> This patch was merged to OE-core master on 2026-06-11 (commit 13cb97f).
>> Could you please cherry-pick it to the wrynose branch as well? It fixes
>> an OBEX Rx throughput regression caused by an incorrect L2CAP IMTU being
>> advertised on listening sockets.
>>
>
> Hello,
>
> I've noted to consider it. Looks good at a quick glance.
> Ping back if you don't see it in the next wrynose review series.
>

... except it does not apply cleanly on wrynose. Can you send a backported
patch?

Thanks!



>
> Regards,
>
>
>>
>> Thanks,
>>
>> On Fri, 5 Jun 2026 08:13:08 +0530, Wei Deng <wei.deng@oss.qualcomm.com>
>> wrote:
>> > Backport upstream fix that adds an imtu field to default_settings for
>> > OBEX profiles (OPP, FTP, PBAP, MAS, MNS) and applies it to the L2CAP
>> > listening socket via bt_io_set(). Without this, the listening socket
>> > advertises the L2CAP minimum of 672 bytes in L2CAP_CONFIGURATION_RSP,
>> > limiting the peer's outgoing PDU size and degrading Rx throughput.
>> >
>> > Upstream-Status: Backport [bluez/bluez@646014a]
>> > Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>> > ---
>>
>> --
>> Best Regards,
>> Wei Deng
>>
>
>
> --
> Yoann Congal
> Smile ECS
>


--=20
Yoann Congal
Smile ECS

--000000000000753354065511af2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 25=
 juin 2026 =C3=A0=C2=A012:42, Yoann Congal &lt;<a href=3D"mailto:yoann.cong=
al@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">Le=C2=A0jeu. 25 juin 2026 =C3=A0=C2=A005:47, Wei Deng &lt;<a href=
=3D"mailto:wei.deng@oss.qualcomm.com" target=3D"_blank">wei.deng@oss.qualco=
mm.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hi Yoann,<br>
<br>
This patch was merged to OE-core master on 2026-06-11 (commit 13cb97f).<br>
Could you please cherry-pick it to the wrynose branch as well? It fixes<br>
an OBEX Rx throughput regression caused by an incorrect L2CAP IMTU being<br=
>
advertised on listening sockets.<br></blockquote><div><br></div><div>Hello,=
</div><div><br></div><div>I&#39;ve noted to consider it. Looks good at a qu=
ick glance.</div><div>Ping back if you don&#39;t see it in the next wrynose=
 review series.</div></div></div></blockquote><div><br></div><div>... excep=
t it does not apply cleanly on wrynose. Can you send a backported patch?</d=
iv><div><br></div><div>Thanks!</div><div><br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_quote"><div><br></div><div>Regards,</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
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
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000753354065511af2c--

