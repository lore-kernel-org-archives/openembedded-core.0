Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E381DC5321D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 14:57:32 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.54086.1724684249391519674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 07:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bveQ3SLh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3719f0758c6so2614005f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 07:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724684248; x=1725289048; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UB2ix+I+k9VVYKRW/Nse6mDV9odFUSdlaJl06xJRWz0=;
        b=bveQ3SLhmUNgadxDLz2YjREUbzqfaK7WIkr0hJTBHOVli2izruTbHHfxrxvb05rwuz
         NcEaCiyeytKGtGXcOyCYtS1guQQ0b+cw86WNe/W+esydULi/abxB2Ts9jQ3/HAcmvxrB
         YU5dAQSEzTABY+fdpaAkkrdbJjVFTuQ1MkBVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724684248; x=1725289048;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UB2ix+I+k9VVYKRW/Nse6mDV9odFUSdlaJl06xJRWz0=;
        b=e5c/ysImmMWu0MUzuuypmpHL3ylkvFSBi/nfF/ZBrwKr1RqQwVkK3g3YGxCJUFm/aT
         pTAbOt4v08fKxsTtQcGagbTGmfv1n11OHCDKFwPeGYKN2lOgMPSXPKFFBmm+2cjg1c7R
         Xsh5zqhhv8t5dQIFg3xMvsoPfwxRymEz3btwnp5h62fQ1U4C4N9og7mu4jL3baHzreQ0
         zi5CgVDQkxXpRFOY4z3edamMfGUgnhhOIPyvotbECSzi/F2zD4v43UfIt+3JUtY0DBMC
         jWD6PYmxON5wnMfM0Rnf/NtGhYXNfdVE4E1uhRwPr5Yu9RMgSXM5OGxNW4vqT7UX5cS+
         PsXg==
X-Gm-Message-State: AOJu0YzVNFFd6k3CDeZ+f1deZ5oIUKqjLkn0qSmxtK4aZF3htwh6Cnoi
	F3mYnzg9pIqgEriblnCvltu6aj9YUY6cOoTqaRmDd2X6j8aX18LSWvSnegdSLzU=
X-Google-Smtp-Source: AGHT+IFsMbf/vHv0CiyyqwDXVK511zhVO5KrR3QCm6OdwrNmwVYbVwtdOgdQmPL+M0nnNwsYg1PT/g==
X-Received: by 2002:adf:f5c3:0:b0:371:8c1f:6692 with SMTP id ffacd0b85a97d-373118e979amr6673159f8f.52.1724684247530;
        Mon, 26 Aug 2024 07:57:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:152e:7c20:baa0:ecce? ([2001:8b0:aba:5f3c:152e:7c20:baa0:ecce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5180339sm154954755e9.43.2024.08.26.07.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 07:57:27 -0700 (PDT)
Message-ID: <74c6c6dd6da70cd336ebf0507cdcc1910c3cb9e5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] makedevs: Fix matching uid/gid
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Jung Jaeyoon(Jay)" <jaeyoon.jung@lge.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 26 Aug 2024 15:57:26 +0100
In-Reply-To: <OF10F3E6EA.D1D8768A-ON49258B85.004B3DC7-49258B85.004B3DCB@lge.com>
References: <20240814025507.2284408-1-jaeyoon.jung@lge.com>
	 	<06f400db1cfee385b6f5b0ef384fe212e5c32c1d.camel@linuxfoundation.org>
	  <OFA445513D.23ACAE75-ON49258B85.00379293-49258B85.00379293@lge.com>
	 	<OFA445513D.23ACAE75-ON49258B85.00379293-49258B85.00379296@lge.com>
	  <e59c8a2d8289459ad555eb8bb414fa9fac7a6d92.camel@linuxfoundation.org>
	 	<OF10F3E6EA.D1D8768A-ON49258B85.004B3DC7-49258B85.004B3DC7@lge.com>
	 <OF10F3E6EA.D1D8768A-ON49258B85.004B3DC7-49258B85.004B3DCB@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 14:57:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203754

On Mon, 2024-08-26 at 22:41 +0900, Jung Jaeyoon(Jay) wrote:
> As an actual example, suppose there is an entry as below in a device
> table that makedevs receives:
>=20
> /dev/system=C2=A0 =C2=A0 =C2=A0 =C2=A0 c=C2=A0 =C2=A0 =C2=A0 =C2=A00660=
=C2=A0 =C2=A0 root=C2=A0 =C2=A0 =C2=A0 =C2=A0system=C2=A0 =C2=A0 =C2=A0 100=
0=C2=A0 =C2=A0 =C2=A0
> 0=C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =
=C2=A0-
>=20
> then you will get "system" group for id_buf in=C2=A0convert2guid().
> and suppose there are two entries in /etc/group where both start=C2=A0wit=
h
> "system" like:
>=20
> systemd-journal:x:900:
> system:x:2020:
>=20
> Obviously convert2guid() should return 2020 in this case, but with
> the existing code it=C2=A0will return 900 because the entry of "systemd-
> journal" comes first in the loop and strncmp("systemd-journal",
> "system", strlen("system")) returns 0.

That makes sense and does indeed look like a bug. I think we should=20
change the strlen to MAX_ID_LEN instead?

I'm still a little worried there is an off by one error somewhere in
there too.

Cheers,

Richard

