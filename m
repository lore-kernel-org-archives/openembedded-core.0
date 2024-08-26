Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98893C5321D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 11:07:01 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.50569.1724670413619786616
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 04:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A95S4FJd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42816ca782dso36498415e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 04:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724670412; x=1725275212; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E5EEHXc8Y6igp79gLGNrXblBSuGMuUwH5V6COqQJMI0=;
        b=A95S4FJdMAXGXQymPVClrQKct1rSNoisCDaQ1gUAuY0conNC5D6A20ex7c4XjDYjx/
         vCw7xG1a2WYSovR98+YGvch+isYxyuRYYmG8fp+V7lDKYu4FpLEzPYB4j7JlDD+nCcO4
         kaT6HGk5JtittY6rZ2P4d4QZ10j1IZ3gcA82w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724670412; x=1725275212;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E5EEHXc8Y6igp79gLGNrXblBSuGMuUwH5V6COqQJMI0=;
        b=m/mrJ3kHix1oYqy0z63+GAwm3vVLgjpBiBg+bETGMAB+B31v96M/QVsJ1d2iCg5JZ9
         mPDyLh3ZYDCxL4/6ttkuTMxN+SAAbvP/NeEyg+OY5AmYKbgN2ZY8lH2pMGQoNH4rqMUy
         +CN7JemF6R8Rca0s3Zr1p6BjAP+uDbpc9sXWlYLb6jfvIKN3RPCb5ca4+y7QF61jdjZB
         BRpPAVZlJxUuTf/pPX0ydVxz/lQmNEKloiRE4Ko38LEzANXAw/UPv785wj4WB4Fqtbqr
         Jl0QWXS9SeuYHoDBSKbavkI+dsn5O4fUgrbXQSJ+SIEAGI8w3EbYrWUkh+GR65yr3h7e
         HbTw==
X-Gm-Message-State: AOJu0YxdIUNlRLLvCyZxbQLQj5jBNpxE55WaBcQuZBsHBa3Vur9/hTUO
	2QGFYOtpIKJmhgoiwKQI5bnewRj9iQtcNV5PW5uUeAynTBCRljchektuxrEYKUw=
X-Google-Smtp-Source: AGHT+IHCEgV8jYWmrMiHCuJ2n6qNGyKnMcjcjZN+M+hrm7yvBmiXznxd5JEF6ir1nG0cbFr74oorbg==
X-Received: by 2002:adf:ffd2:0:b0:371:88a6:80d8 with SMTP id ffacd0b85a97d-37311863af5mr6845381f8f.28.1724670411713;
        Mon, 26 Aug 2024 04:06:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:152e:7c20:baa0:ecce? ([2001:8b0:aba:5f3c:152e:7c20:baa0:ecce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5161dd0sm151221515e9.21.2024.08.26.04.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 04:06:51 -0700 (PDT)
Message-ID: <e59c8a2d8289459ad555eb8bb414fa9fac7a6d92.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] makedevs: Fix matching uid/gid
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Jung Jaeyoon(Jay)" <jaeyoon.jung@lge.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 26 Aug 2024 12:06:50 +0100
In-Reply-To: <OFA445513D.23ACAE75-ON49258B85.00379293-49258B85.00379296@lge.com>
References: <20240814025507.2284408-1-jaeyoon.jung@lge.com>
	 	<06f400db1cfee385b6f5b0ef384fe212e5c32c1d.camel@linuxfoundation.org>
	  <OFA445513D.23ACAE75-ON49258B85.00379293-49258B85.00379293@lge.com>
	 <OFA445513D.23ACAE75-ON49258B85.00379293-49258B85.00379296@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 11:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203750

On Mon, 2024-08-26 at 19:07 +0900, Jung Jaeyoon(Jay) wrote:
> On Sat, Aug 17, 2024 at 06:47 AM, Richard Purdie wrote:
> > I'm afraid I don't understand the problem here. If partial matching
> > is occurring, doesn't that mean MAX_ID_LEN is wrong?
> >=20
> > If we drop the strncmp() here, that appears to put us at risk of
> > buffer overflow problems, particularly if MAX_ID_LEN is too short?
> >=20
> > Can you give an example of how this is failing and where the above
> > change helps?
>=20
>=20
> (Sorry for being late responding on this. It has been missing in my
> INBOX somehow.)
>=20
> A typical case where it is failing is when id_buf is shorter than
> node->name and they match partially, e.g, id_buf is "foo" and node-
> >name is "foobar".
> Note that it's using strlen(id_buf), not strlen(MAX_ID_LEN).

convert2guid, where the strlen is located, is called from two places
both in interpret_table_entry() and there the buffer is defined as:

	char usr_buf[MAX_ID_LEN];
	char grp_buf[MAX_ID_LEN];

The name field of node is defined as:

char name[MAX_NAME_LEN+1]

which could be a problem if they differ but:

#define MAX_ID_LEN      40
#define MAX_NAME_LEN    40

so the only issue I can see is there is perhaps an off by one on the
length definition?

> I believe using strcmp() here is safe because it is guaranteed that
> both strings cannot be longer than MAX_ID_LEN(=3DMAX_NAME_LEN) and are
> always NULL-terminated.

Perhaps, but I think the existing code should work and if there is a
bug, I'd like to understand what it is. Is the issue an off by one on
the length?

I'd ask again if you have an actual example of the failure? Is it only
with strings of 39/40 length?

Cheers,

Richard



