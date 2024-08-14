Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D4ADC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 16:44:42 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.102830.1723653874720119254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 09:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uqkvc3n8;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-530e2287825so49405e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 09:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723653873; x=1724258673; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NZI4bWQW/jdi39fIfeKSvz5/nEY4vdClzxrsEVztva4=;
        b=Uqkvc3n8lUfcBZZmqyTMBZj0L56UijIUSS3QcGQNyvOBCIyBUpKIKP/WFQDFlA82Po
         1w+H/F14F3OpQ8CWIycxIJklNwNlShTdHZ4xtMdwq287Uppmg0nYG1tJCbxSrQgGP3ft
         T0cIqr3NQUEvtsIK3n0MLdKfrWIG5lhzy6ko9K4BZiut1vYhUBJN3gqM0ry3lC/IL4RB
         yZWcWcIr4tabALKFUlVUkvN1+rBTf3ByxwtNlVx23+YLgZGGoumSHwSOkzgd0/rVxp+P
         td+eIR/Jxa3N1Io6irOP5eGDQb86YGoRwiUkTJW5KLQ5DBCpJrbR19hgNsjJzzQpaT9I
         np/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723653873; x=1724258673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZI4bWQW/jdi39fIfeKSvz5/nEY4vdClzxrsEVztva4=;
        b=auxU+IN6RGDulz6iLC8MYoHLKX0i/0WQWTYe9W1WR+RDXdCyDjaLSbvgngCUQfvvaC
         MUu9RQZh0dN9SvquX/7KI2f1kwERL0QhuxxNgI123PqUBqHivuW3XuFGjSazuc1IwFnj
         t8Qfhlu1WdYLWqiXOe+rOl6i7T4OeLg5oMjTIPF6iVgt8xO7vvfTrHkhUv70NqnYyHF8
         4Dv15lZrUdfkZuxVxkcujbmkhixjvIYoKxdKXQyHdhCiTpv7M1IlC8J1c9WqRDYhmeYt
         exHSwWbb26jTPH7dlBTJbDCyMA8KetBuecKKQGv+fv7Bkq8gmojFHf3xlObZc2eRMuvO
         9AFg==
X-Forwarded-Encrypted: i=1; AJvYcCW21AYHkU3KuT3N8Xgngr6c7jlbeOGKDB5ENrQ+qCKGgHKG/41cRuCIN4FHg1lXyMkb7AREOy3R7IWZiUfcaXrtibFh4pL7ldTdJT3cR+ftANBws18Et3ng
X-Gm-Message-State: AOJu0YxDF2mrt+FMlkRrPRaqnYz+vUvYt+LK+mC3tCU6owAsFDnhoKNE
	vHNi85BWbHVV1JR7lkw1vY/uslr16C8PQeLH1Zbq5RR2IH7eZe9nv1hvd1M/00UwBbIXojH013C
	zRF8cUuRt4bHqeLYJU2xpWUfP/Aw=
X-Google-Smtp-Source: AGHT+IEME01v/Y6QQsOvSdN+Nzyb7J+MAJeMb2ET6iA2V4qXfvPn1YMDC22spY2Xb3alZ5ub1tIOZUXXJ2rwpnG+n+0=
X-Received: by 2002:a05:6512:3c81:b0:52e:f950:31f5 with SMTP id
 2adb3069b0e04-532eda6d427mr2422785e87.18.1723653872512; Wed, 14 Aug 2024
 09:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240813164101.3425564-1-tgamblin@baylibre.com>
 <7f6a3ca8-1eff-0288-d667-2824dbcfefc9@windriver.com> <00acffd5-d23e-4d6b-a653-d926f2eb417b@baylibre.com>
 <CO6PR11MB56029745F270021B2C2C81F4ED872@CO6PR11MB5602.namprd11.prod.outlook.com>
 <DB5PR02MB10213975EC7BD8B55D53B0D80EF872@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213975EC7BD8B55D53B0D80EF872@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Aug 2024 18:44:21 +0200
Message-ID: <CANNYZj9JA-g07X159AMpuzdeDPk7+wos9nn9CyO3icbKaeNg4w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] python3: skip readline limited history tests
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>, Trevor Gamblin <tgamblin@baylibre.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 16:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203326

On Wed, 14 Aug 2024 at 17:32, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:

> Note that readline is GPL-3.0, not LGPL-3.0, which means linking with it
> directly impacts the licensing of the entire application.
>
> And while I cannot speak for others, (L)GPL-3.0 are problematic and should be
> avoided if possible, and be optional otherwise. Which is exactly what Ross
> did when he changed the default from readline to editline in the python3
> recipe. Going back on that is definitely the wrong thing to do.

As much as I think that what GPLv3 aims to do is just, and its terms
serve the interest of the end users and general public (protecting
their essential freedoms from tyranny of the software vendors), I also
have to agree with the above. When there is a choice given to us by
upstream, we should go with non-gpl3 options if they don't result in
big loss of functionality.

> > time and nobody ever devotes any real effort to develop an alternative.
> >
> > I guess when the commit was made, the underlying API incompatibility was
> > NOT made clear.
>
> If the test fails when python3 is configured to use editline, then I would
> say that it is the test that is wrong and should be corrected.

Also this is correct. Python's test suite should pass regardless of
how it was configured.

I'd suggest doing these things:
- clearly marking the reason for skipping the test as being
readline-specific and failing with editline
- filing an upstream bug specifically about this, and including the
link to it into the patch. It's pretty much expected nowadays that any
new Inappropriate patch should come with such a bug link.

Alex

