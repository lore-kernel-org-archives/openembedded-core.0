Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEDBE77180
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 17:01:03 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.106857.1733763659505015046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 09:00:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SeuPmpa4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso44857275e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 09:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733763658; x=1734368458; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KXjO+rtozg2T32K1OaUS5FSiXiMv5ktoGeaHHjiVRzU=;
        b=SeuPmpa43OywUTFQ38mZQkBOEzJRYPtYEeL4JXkGzH61PucU6/fZ4DAd43rNqVRxy+
         w+j088yvSOVlkwpHJubF2gPMJyUBlwUZM/mNgy/elivzJmVSenbwgIHxVyeLrYA9Xp+M
         0ggqgRVknX6FAZ3QYZM7V1pzW7rrao3nk2PuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733763658; x=1734368458;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXjO+rtozg2T32K1OaUS5FSiXiMv5ktoGeaHHjiVRzU=;
        b=Qi/arJAiPUqLx1+2wu+8bCDK/3oDpW1i+4rnK61DiS97LHeD2rJQPsoKZGSfmaAeFf
         uvSYJQg0FQ2iITSgHLEifQzFdh5xBzxRUY7JIZZKS4mkhFtFg941BDAZbEY5+WLXOWKg
         q30nfqEBrXC4ig3vEZiFnm0jKrlnCMdhrtGoR8NkMpf/DPGFqasfKg+sfNHajt1zLVjW
         pKWqP2vCmEym//pypdv8XV45BY0pXEktA3ngWmC4en+2oIkYcB8UFOoA7f3Xs74g09T3
         96GWCyAHevqBt3sstN7nNRZ4aaO1bygCfXNqYcAIUJuYClw3nDbXAkXQNwOoZ0EkdUxD
         vzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz8Jx5AVZgFxw3BEchzOxNA6i6icadaBMg5At9FF/HdPhU5gYfSY9SYLeuOoGFeoBWjMOOvEQ3/Y9ma/ffdH3aLw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzDY4cDozEC/GbeI0cwDNJQytZo/O15WXkBjVEepXtZ+IzbY8co
	Maycw6KVVXDB0IJ1Cg5V9N9XSyqU7XGJT5sCyn1jMVb/JxQUYFihZY5WpUmk03M=
X-Gm-Gg: ASbGncuLHQOW6q+Ovl//WCC/d2dMu3BubSxuNjO97Qhc/e6AT+u6KnlR2EDrg+fbcel
	aZ00Xb0pkh8hgOsVGdNI6gDmS//KkFvuHsYjHr7mZlUEYIQkn+cCaiayVzwtMFurUUEEDICI4xp
	48q8wx1LYJmUDnMIOla3orj/fEcSe0vYqmiNz7piR5oQaDLjDvaeuF3075km8yK1M3qe5EqAvRm
	4Z/Rlsw6NhmDcMTJRO82RP+dZh/uRMtqXqbgfCUHW5wrLldQC/O9XS/HHdNmFKPpxlHJGi50OTs
	yI/Hxg6ehrFWZvW9Aw92D4pVLzs1gaFSupJJs+Y=
X-Google-Smtp-Source: AGHT+IE7BQHpV/FTVg9W6QGN4/eSwQv00YnS+vDnriXTdmwfUxhC1hdZhO/p8RZQ4y5mHewThM/VPg==
X-Received: by 2002:a05:600c:1c0f:b0:434:f8a0:9dd8 with SMTP id 5b1f17b1804b1-434fff307dfmr10740325e9.1.1733763657721;
        Mon, 09 Dec 2024 09:00:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b41:c06d:2eaf:52ed? ([2001:8b0:aba:5f3c:2b41:c06d:2eaf:52ed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434fb066874sm30545565e9.32.2024.12.09.09.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:00:57 -0800 (PST)
Message-ID: <c799588bada27abdf2b412115868c5b84c24a0e2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 3/3] bitbake-config-build: add a plugin for
 config fragments
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Mon, 09 Dec 2024 17:00:55 +0000
In-Reply-To: <20241118162643.1423409-3-alex.kanavin@gmail.com>
References: <20241118162643.1423409-1-alex.kanavin@gmail.com>
	 <20241118162643.1423409-3-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 17:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208490

On Mon, 2024-11-18 at 17:26 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> This allows fine-tuning local configurations with pre-frabricated
> configuration snippets in a structured, controlled way. It's also
> an important building block for bitbake-setup.
>=20
> There are three (and a half) operations (list/enable/disable/disable
> all), and here's the 'list' output:
>=20
> alex@Zen2:/srv/storage/alex/yocto/build-64$ bitbake-config-build list-fra=
gments
> NOTE: Starting bitbake server...
> Available fragments in selftest layer located in /srv/work/alex/poky/meta=
-selftest:
>=20
> selftest/test-fragment	(disabled)	This is a configuration fragment intend=
ed for testing in oe-selftest context
> selftest/more-fragments-here/test-another-fragment	(disabled)	This is a s=
econd configuration fragment intended for testing in oe-selftest context
>=20
> The tool requires that each fragment contains a one-line summary, and one=
 or more
> lines of description, as BB_CONF_FRAGMENT_SUMMARY[layerid/fragmentname] s=
tyle metadata.

The other area I've been wondering about is this output. I think we
need to take a quick step back and look at it from a usability
perspective and make sure we're showing the information in the optimal
way.

I'm far from a UI expert, in fact I've been told I shouldn't comment on
such things however I do have some thoughts.

Firstly, I think the "(disabled)" is the wrong way to show that
information. It would be more compact and perhaps more usable to show
the elements sorted into two sections along the lines of:

"""
Enabled fragments:

selftest/test-fragment - This is a configuration fragment intended for test=
ing in oe-selftest context

Unused fragments:

selftest/more-fragments-here/test-another-fragment - This is a second confi=
guration fragment intended for testing in oe-selftest context
"""

Secondly when listing the fragments, the current approach does lend
itself to cut and past but also doesn't group neatly. For example you
could do something like:

selftest/
  test-fragment - This is a configuration fragment intended for testing in =
oe-selftest context
  more-fragments-here/test-another-fragment - This is a second configuratio=
n fragment intended for testing in oe-selftest context

I'm torn on that but it may be easier for people to read. We should
also think about how terminal line wrapping will effect the output and
try to ensure it remains readable.

As with the previous email, I'm open to other thoughts on this.

Cheers,

Richard


