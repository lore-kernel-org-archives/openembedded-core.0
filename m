Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5744D70DE3
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 16:09:08 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.98802.1732810140012381573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 08:09:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bJdH8SML;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7251731d2b9so1478923b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 08:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732810139; x=1733414939; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p7j41Mp/m7biTMnP1NcZhuMACVvom9xR1fPVUgskgAw=;
        b=bJdH8SMLkl437J0mjBj8l49ny98aYEFnARw+kCw6ScD7IoEPWyvleqEA8fs57L/hHv
         BKGIPsbWw2KCJculXFBFUHeIzl52aZqqQDFu820+LlmgDjpsJz9gIjTSgCDY8xrnsIDP
         0dvsr8194amgavQyXnmsQgKeah4ej8p/6pejCbXAP+4Pn1lDHHXx8WhVb0Jm38igzjLf
         SOzlvXQI5aHoxC3fp/a3Pz81SsMbMYAdRiUl7lCQGZ/qquUgxJyyt/HYLwTwBxflaUly
         Osk/NHMjC3a7fwxudfSzfYjdEz+9sV+qBzEbQRD20h2vhNGLQPTNH3nNHfa92c8eDE6s
         GmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732810139; x=1733414939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p7j41Mp/m7biTMnP1NcZhuMACVvom9xR1fPVUgskgAw=;
        b=cdTxW6UPa7VAvzlIj+Hmq5d/53kHzOe91qnNrwzm68yCYi5i84PIE3EUPF6bwurSgO
         KYLLJMqGZ6OB3ThRW/g2c4M7sUqBAT3+rLSQ1yqY8hEfYocRUNBam5n+q53IxxSoaFiz
         kAOfN17fxehPHnBiS02xXhdau3mpJA5EqyIJs+uGmDbCO2zy7BhFaoKzHWFetuVR6Zsw
         q4Z2uGuQA5Wbz2fSD9NNP/8talD9w2dqsdZHvQJAdZaWZBVnZNplflFi9O2KTMYB3I/6
         5ysk1cCDomTqmznYSDgj/8EJXOhSBf91M3LlxVkbvp6q4/ZesoyIJloM5C6U9d6FKBT3
         hJEw==
X-Forwarded-Encrypted: i=1; AJvYcCWeY4MfA3bpeOcPZ+HPVj+E/AwxVNmDjQMnqC1T9jrBRkdKvePJcU8TmBjMb407GTEIXw4Gn3LUGsXQ5A1BFMCgRA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz9BfBnXhVfmuyEg8rbDg2gQRcT2j+3wZGxJlcxOMOeaZ+nPY55
	P55wVvWXcP0DDnZrkHEODj6lvxOG6p9qLXW8H/1OHZmkEt9ulx3RVvizdfW2breqpGmjp2ondOX
	R6z/pKUryM3Wk6Y8TDXA+FR3d2O8=
X-Gm-Gg: ASbGncvdZ6aWAP8CbWVeu+y+WxL7Ndxlc4o9tlkrABgp86ZPWG9E4S62yse/DO/OwRq
	W8wxorcm+M4a5DZVg55U5EoB4/g+QYw5XpA==
X-Google-Smtp-Source: AGHT+IFf1gmt9FD60sV/dS6NoEc20vSkOIGfULwh8L3ekZ8hoNjpn9r6Vj6FLrKH1nXpTFLlhx928UVfJyAcZ++Wm/I=
X-Received: by 2002:a05:6a00:ac8e:b0:725:3ff5:76bc with SMTP id
 d2e1a72fcca58-7253ff5773dmr4975683b3a.7.1732810139271; Thu, 28 Nov 2024
 08:08:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1730950520.git.steve@sakoman.com> <57de6545695ac11816d670959d9e63666de08e3d.1730950520.git.steve@sakoman.com>
 <CAB2nKc88-5F1mDe4G7ucA1W7u7rzQkCpuzwmA7Zmd2_n3qyqrA@mail.gmail.com>
In-Reply-To: <CAB2nKc88-5F1mDe4G7ucA1W7u7rzQkCpuzwmA7Zmd2_n3qyqrA@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 28 Nov 2024 17:08:47 +0100
Message-ID: <CAApg2=SbZL+GBHLW3xVJ-UM+nepEwtcJbO4wEfc5pRay=oTVZg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 02/10] cve_check: Use a local copy of the
 database during builds
To: vincent.prince.fr@gmail.com
Cc: steve@sakoman.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d08a960627fb4ce9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 16:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207995

--000000000000d08a960627fb4ce9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 2:05=E2=80=AFPM Vincent Prince via lists.openembedd=
ed.org <
vincent.prince.fr=3Dgmail.com@lists.openembedded.org> wrote:

> Hello,
>
> I'm wondering if I'm the only one who couldn't complete do_fetch of
> cve-update-nvd2-native with maximum retries on CVE API?
> I tried with or without API Key, from several different machines, I
> also tried to increase retries number etc, without success.
>
> I see on the NVD status page the following warning :
> "Due to changes described below, a large number of CVE records have
> recently been updated, resulting in a large increase in API requests.
> We are aware of the issue and are working to mitigate it. Thank you
> for your patience."
>
> I see the Buildroot switched from NVD to alternative FKIE github
> database due to that API 2.0 inconsistency :/
>
> I'm not sure what are my options here, quite odd that cybersecurity
> organisation get impacted by DDoS :D
>

If it doesn't improve in a reasonable time (like until the end of the week)
I'm for mirroring it. The complete image for now.

Kind regards,
Marta

--000000000000d08a960627fb4ce9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Nov 26, 2024 at 2:05=E2=80=AFPM Vincent Prince via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;<a href=
=3D"http://vincent.prince.fr">vincent.prince.fr</a>=3D<a href=3D"mailto:gma=
il.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
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
e week) I&#39;m for mirroring it. The complete image for now.</div><div><br=
></div><div>Kind regards,</div><div>Marta</div></div><div>=C2=A0</div><br><=
/div></div>

--000000000000d08a960627fb4ce9--

