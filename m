Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED7BC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 18:17:58 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3577.1782757072596029948
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 11:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JBbDOouR;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6647bc8f900so4344582d50.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 11:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782757072; cv=none;
        d=google.com; s=arc-20260327;
        b=nTOMh6hEsUUpc22OcvWk6GSmzeOnhujoqn4+wif2Z+EGTqk31oSi9yCjyqv0wMACAp
         LbFtz46hYjFl6kc4FKh/XTXHHP5fJx2mDC/eVCxX//OFcOWUcD3pUw3XQIs1DgFL2Jsv
         avUpM1QHP3TDwEfG6zD6L9ZJaj3cm7IuBcoumFnH5nXS0fspGku3ejXN+xTZwFOgT9dV
         3nSes3E6FvZHrHam7pHbRCmxgpdaElaLZZJZCzZ4gqv5yBRfhNItQkE/85Cs9Pl4pop2
         6GGFwkAtyGBhYxLmaPBGVuliRNLzZOZJ2ei7f9PWBn+sakTm5hPjT+sWmpwrqoGrWw6+
         qQTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/q7I8HEBEXHHgHzvsf9k+jqnWFDNMKYdoTsa4JsNQI4=;
        fh=QEHLwtqS71Z2YUr9+lozElpw6h8TYix4W/jHxWTlj80=;
        b=ZWLb8I9hi4seZH1rY7eNCRdGzpzAvWEy2tEUzAgcVwjCifoQNrxazbp8PIRTC/XHh4
         Bap9aOnFgcaO4I28Rf0S/e7LZVVNGeyLDPfd/1GfHUI8CbC8pdSo+Z8rPIowUrNWJqO4
         izPIR7LXG54kIdIgTLhyidXV1C0kJ6RAnMKmUQrRUpx55UH6oY+uAi7J6d9Po4tUFugl
         aghlUimCTGcVJE7xVyJhVpOpbI74O+FhtlzHCvQH6bP9jt5OPp8WAGBS0577a8v73TnJ
         E0BvQXWS6aVczwXE97l80ALsVAFqeZ3z3wZ+xYc/7n4zYoXCbAU2lvDJr3wjIEegICXb
         9kMA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782757072; x=1783361872; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/q7I8HEBEXHHgHzvsf9k+jqnWFDNMKYdoTsa4JsNQI4=;
        b=JBbDOouRtxeyKU4aDkg5vLoSjSHZGWZrwH/E4XfHtlqvikhLamOrvhw139OQ6z6w9s
         mqQZNXmsGtX/3G0/I0K6jjLCpRlPw6z0OPFBTM79xNnGeJ/r6+s+tsSjugNZG4lIp2xl
         Pzcjv8ahp6RWuSbNsB27hMZhJeTbzc/1EHA7ZJfNmS+ahvFCMNvY2Xe2/QQdazbzRTb9
         ibNuUk7jCDoLl0IV87YW0Z7voWXc5iSXI3UZA6LL1MuD2VozSM+wU0jcl9P9xkLrrZxb
         E3ZToH/8DxLTMzIwi6CFgT+Q2jnC2nQc88F9D8moBeymd6bFqaCB3UzzgwVeSfHs5BcH
         xW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782757072; x=1783361872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/q7I8HEBEXHHgHzvsf9k+jqnWFDNMKYdoTsa4JsNQI4=;
        b=R4X4UuPhIml/k0wv5NFv511O1TyhSs4b7fGVF/NIWNfzK5u4ttLyCLFuhvaBqQxLQX
         ZLja4BqiavmlAmwJXF218ALSWL+tuaGenaPu6cOZYeOI6lGJEZUhuFUlLPB2bwKNxFtg
         C38TZ/EhvZg/gd8FknpqJv/GLQZgJA8fARK3t8T/LxsqYoNE1HdnVRY14YFxK5H+k9g3
         jnq26gTS8qHD11hiplWjyGHBwihwsh6ldD+v9L8BHJiq1km3xTd1CJxytMn6F/MQjpUb
         06WnmwSshaY7N6HpfwPg6Fue2xuHSVoBaEBT73SIr0iJpb1bAeKJ8mHLnwqGjlVD4rh4
         B34A==
X-Gm-Message-State: AOJu0Yzc05WRR4I/PWbY408b/P5kUSjXvn9gXFSKZ/UVdr/PMXFkxKy9
	bpoQiqHBt7T1NsJ7DDlz/mqxuCtDcNBsSXsAwPVshF6TAYMVZQeDa9FmA34b7Ng/iucCw/5c+Gn
	TFMirMo4q13Cg5PRIpwRw8qdNxJFl8lg=
X-Gm-Gg: AfdE7cnVX1vIEl7a/obWtq/HvAW53LQVIJBcFr8rDlXXN2HnT9+7xwPXiqUU2opV1EI
	yMSlN027LW5sFw80jjiBXdFpk31/J+Z01ax2d7qn/h2jq2pQiTVKi8AGwxMGv8NgtQdjKYU/utZ
	B6Rem9NJgg+eWibN4zDUdUsltjnFBmJoEUiMrNP0DzoeLGoqyNJt5ZsSsTXVSULLMmPXl+vXltY
	MOSn4KOQWmO+LtwtLxrZMUWBjRyY0C5wsWcLNcr3Trqvj1i9S+SBbl0vqpGwnZtbmc36dpLGF6Q
	Nfe6ilV8Tk4wP4Gf5vtwu9wuNhL1TPCV0U1+yFWTO4MPjgOty+x7EcbUJhAOOxQ+KzZrYNDxVTg
	iXRvONwC4U7Lwbdw4LaTW9f3RIfu4CYjNM6p/9A4hziN5g1pTcIsBSyj+bD700sZ8VXldDg+it+
	upnmQF
X-Received: by 2002:a05:690e:d50:b0:664:d52e:e704 with SMTP id
 956f58d0204a3-664f98ced69mr646388d50.43.1782757071555; Mon, 29 Jun 2026
 11:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260629141559.1305873-1-ross.burton@arm.com> <CAMKF1spi6u8p2GN1cOgRhwifTtH5ZX14Y8OnByn2fGjU+AtoYQ@mail.gmail.com>
 <2B810764-3EBC-42D8-BF96-B9AAE9C087B2@arm.com>
In-Reply-To: <2B810764-3EBC-42D8-BF96-B9AAE9C087B2@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jun 2026 11:17:40 -0700
X-Gm-Features: AVVi8CcpF-E2YJNzc7Dkk2UkTA1rbRlLfE81MQdncT_L_l17EcvDTYaHNEopZmw
Message-ID: <CAMKF1srMzTTYVC=Z-7ZRHMD+oXRQidq5E_HFBuq37y_wPP4D7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] classes/meson: use ninja explicitly when compiling
To: Ross Burton <Ross.Burton@arm.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f893120655687963"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 18:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239818

--000000000000f893120655687963
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sometimes they can make non trivial difference in compile time of they are
large projects

On Mon, Jun 29, 2026, 8:58=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wro=
te:

> On 29 Jun 2026, at 15:32, Khem Raj <raj.khem@gmail.com> wrote:
> > Like cmake verbose could be a configurable knob since its being added b=
y
> this patch
>
> -v was already an option, but I=E2=80=99m a bit meh on adding options to =
make the
> logs useful.
>
> Ross

--000000000000f893120655687963
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sometimes they can make non trivial difference in compile=
 time of they are large projects=C2=A0</div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 29,=
 2026, 8:58=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.co=
m">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On 29 Jun 2026, at 15:32, Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail=
.com</a>&gt; wrote:<br>
&gt; Like cmake verbose could be a configurable knob since its being added =
by this patch<br>
<br>
-v was already an option, but I=E2=80=99m a bit meh on adding options to ma=
ke the logs useful.<br>
<br>
Ross</blockquote></div>

--000000000000f893120655687963--

