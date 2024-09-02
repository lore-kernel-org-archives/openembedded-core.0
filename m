Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E1ECD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:56:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.36128.1725274571983586252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=THlP53D6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42bb9d719d4so28637165e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 03:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725274570; x=1725879370; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XimiKA9E8vjtar0XAeP6K3sBm0HZfb23/94V+R6Bq+Y=;
        b=THlP53D6tGr7oNlM0stjBShHtePH3lbFECu1FjknCcjSzaSBYeAbBi4xE1XuB69FGE
         1j2R7N+jJJCoW5QnnNMVperK6/9IPHesw3cUB6MLxS5l/2joE7h0pn4oN/TXXihHCeQF
         dpCqBHlda4Lw5Wa69s11r0iyfsJvDweHVbTw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725274570; x=1725879370;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XimiKA9E8vjtar0XAeP6K3sBm0HZfb23/94V+R6Bq+Y=;
        b=GbQe5YanxungBPBSruaRlB1O+4ILm/cYpqpfo31PeWSFZmgLP3ao4Wrf6YDLDhSfNZ
         TLEh6Qz30YWBF0cP0SHXMBJ8evOBDbyR3P8CkMavetdNd1knirSbiud+vDCiXJIOLhN1
         NYR1VsuPW9VKvwE048TJ5qacTjUZF3h0lhD+cQkfWsumI+Lv9myYy2NggRWc0W5WWrn+
         49ygwPmm8oNl6wRyTLExvkiiltG8ylcAtpy6IIn5bNKZ0s/sYQiP2k7y1ugOhi2Qdjjh
         yOQu74/CvG+ES2kL3Eb78ptxYe7V7imeRWnTAIx4tAdUh8+qD8LzFQ+sCdvp4Yc2jMMD
         bwHg==
X-Forwarded-Encrypted: i=1; AJvYcCVO/n6T3yhemjxjGqUhUOFYrq3Bap4G+jsYxJRXmDsNCqUPt30PZUfLS0mgCramc7QIDr9RMPuZguj5uE7CU7IPUA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzcm+BGCPavX5T99AMAUeJgxdlg29N+M39hel2dzBtdhXTHKcpW
	waMiB+8TDJmiH1sH3W1yECZ8EiXhQy7VGtLwGRAUkwHsVT9mYcKzyJaIeDDHwc2I9vN8SY6XOL4
	p
X-Google-Smtp-Source: AGHT+IF9hqi0X+9vBaIzRqx0jMEvaqLi0jwPEwxUOurdCybeApxgJobAnJ5JFFKX84ZtScUeStKSHg==
X-Received: by 2002:a5d:5591:0:b0:374:c847:85d with SMTP id ffacd0b85a97d-374c8470b8amr2391718f8f.29.1725274569599;
        Mon, 02 Sep 2024 03:56:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ed45:1ec7:2c83:ff6d? ([2001:8b0:aba:5f3c:ed45:1ec7:2c83:ff6d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df0a0asm134184305e9.13.2024.09.02.03.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:56:09 -0700 (PDT)
Message-ID: <dbba02a3a7967229e2133e69cd636349ac5374a4.camel@linuxfoundation.org>
Subject: Re: [OE-core] why does EXTRA_IMAGE_FEATURES += "ptest-pkgs" not
 install *all* ptest pkgs?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 02 Sep 2024 11:56:08 +0100
In-Reply-To: <5557141e-86f6-1a86-2069-9f566e766385@crashcourse.ca>
References: <5557141e-86f6-1a86-2069-9f566e766385@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204089

On Mon, 2024-09-02 at 06:39 -0400, Robert P. J. Day via lists.openembedded.=
org wrote:
>=20
> =C2=A0 i'm sure i've overlooked something silly, but in building a
> qemuarm64 image to demo ptest to some colleagues, poky by default sets
> the "ptest" DISTRO_FEATURES setting so all of the corresponding ptest
> packages are *built*, but when adding:
>=20
> =C2=A0 EXTRA_IMAGE_FEATURES +=3D "ptest-pkgs"
>=20
> only *some* of the ptest packages are added to the image. eg: while
> bzip2-ptest is built, it is not added to the image, as are a number of
> other ptest packages. if i *explicitly* add that package, then it gets
> included.
>=20
> =C2=A0 is there some obvious reason that a number of ptest packages are n=
ot
> included in the resulting image, despite them being built?

In your example, was bzip2 actually in your image or was it only built?

I suspect it only installs ptests for things actually in the image.

Cheers,

Richard

