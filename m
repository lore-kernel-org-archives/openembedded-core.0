Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD2ECD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:26:00 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19080.1779189955987718730
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 04:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hq74/iUf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-448528f4e69so2280189f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 04:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779189954; x=1779794754; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C6QxwCjvGm1nOmPCaWozLZdgI40CH5a2+LS9KkPgUKc=;
        b=hq74/iUfhVd9fd/ytWLtVkkvGVTDOA1A+teHqpmjdL3qnV1HBQQQNPad2jz8UUps1y
         /g1AfXPtDTyH3LzZhweDy981vTdAmWZcBF9qYQQ1/4gqFcEJctmUUwQotJVBFHRSQ331
         tDIibRIwfh1FRWI7+cjshxCtSH9PG+Db8ACKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189954; x=1779794754;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C6QxwCjvGm1nOmPCaWozLZdgI40CH5a2+LS9KkPgUKc=;
        b=JrDyBDUf8/eGjYIKker59E/csqcxQ+qzyvFrwEi/NtS5VhO3uZpdbgovyuBzFUAz+m
         olTOy3xeX9DVnQpivBaDqQFqDwFv8a01VSt2PKTsze0Wrx52nGvPU4mS6RwNRZKsCsmW
         ZPSl3/F6F12Iyd6rVecxiprmcSowk7lFXYVAW2dn8+3MaR014+FiOeC3EgkWl2QzczMX
         ag11TaqjKyZ5kTQhSVTxi3cIzY3/uVmDRr2xz8wzj0A/k2ovFdp3xveOtseCUzdpLDbU
         zSxuHMOLCBnOqymw/o1QoNFI0umjJoFzDGYktBFkALCI6TOrsqTqsFL9SQF4zMnHNxDG
         YtWw==
X-Forwarded-Encrypted: i=1; AFNElJ8CXYPMjpNMRqEMnZdhx2tfOhkqVRBmEIkwj8+12P/JybtH2xmUX/z4IAyHhmb9kQqn0qlQ+O6p6YImDbSHOw6xEQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzKbki6wcSlwZpWdVvi1EF5jqBUOr4dI2h6c93JgrGoU/UU6UQ7
	D84R2jzYJM5YGzQLD15BMievKg4Q7NaPsBSBEtjcrhVNJ6gwXQP2t64NQt24HRbWFLo=
X-Gm-Gg: Acq92OGdRF9ezlJWyTiAhU5TpmwzsIBrK4MgIZV5xRedkW8ZKQRaQImjj9VqIT2WCk3
	54+t6MKIoS0Q0/i6OG9G405eAdi+Nokgxs0/KEqJYN1l/t3qC5quh/et3FmBKSghAYh1JFvPD7i
	fjq7cbP0T6DmYB6wDlHyGr3YwMUk8Zd8POKKi1smpylNMhpn1fmol7I72uYvzg0Qp1AyjV6J36G
	WcYLnGK6IXeJcxh46kOZQdpcPs8pYuXWLyCU3hKybdZruD1bsmY0qAM4vhmFEAPx+UT2FWvgVCy
	vZlFHzedlKe7I8Qz+OE9YPCQ4fnvlBHJ9I3qIVzP7v6U6M0Ir8yuRB3dvAdjSK9f/tm0tS3eMvL
	BIp+yxc4AS0djndl9S/UHUPP5aonG70EgUxV9QFMHeiYu5yvToRm+MdqPRcL9GPsmEQMfj4SWAF
	ZEk/X8UTNeQYZa8d+XOn1G00GiXecr6algVvh5SKa87Pj2NqgJwMI+HTlI4FoIYcVnIh7pXiB99
	Qh68Hph5hWNxM0sJcBCiLkmmsU=
X-Received: by 2002:a05:6000:2f8a:b0:45d:817c:b8b2 with SMTP id ffacd0b85a97d-45e5c5cc656mr30824936f8f.30.1779189954194;
        Tue, 19 May 2026 04:25:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9c0a:1d5b:88a6:aea2? ([2001:8b0:aba:5f3c:9c0a:1d5b:88a6:aea2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768bcesm47073479f8f.4.2026.05.19.04.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:25:53 -0700 (PDT)
Message-ID: <da740047848f706c420629378838229833bc9fe4.camel@linuxfoundation.org>
Subject: Re: Re-visiting: bitbake-setup on PyPI as the recommended install
 path
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Patches and
 discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: Daiane Angolini <angolini@gmail.com>, Rob Woolley
	 <rob.woolley@windriver.com>
Date: Tue, 19 May 2026 12:25:52 +0100
In-Reply-To: <CAP9ODKq0E4gjR2R6TXK38v-a3wQa5Yi892BVOB=3YoU+ibM23A@mail.gmail.com>
References: 
	<CAP9ODKq0E4gjR2R6TXK38v-a3wQa5Yi892BVOB=3YoU+ibM23A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 11:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237317

Hi Otavio,

On Tue, 2026-05-19 at 08:20 -0300, Otavio Salvador wrote:
> - What's the current status of promoting bitbake-setup out of alpha
> on PyPI? Are there known blockers (release tooling, packaging,
> version coupling to BitBake/Yocto releases)?
> - Is the previously discussed plan still the intended direction, or
> has thinking shifted?
> - Would coordinating the PyPI release cadence with BitBake/Yocto
> releases be feasible, so users could pin to a known good version?
>=20
> Happy to help where I can if there are concrete blockers =E2=80=94 packag=
ing,
> release automation, documentation, or otherwise.

We still have the intent of doing this and Rob Woolley posted some
initial patches on the bitbake mailing list. The timing was tricky with
the LTS feature freeze and we ended up focusing on getting the release
done.

There are some logical steps such as needing to properly vendor the
bitbake modules and needing to work out a way to correctly version
bitbake's library and main scripts so that incompatible version
combinations error appropriately.

The patches as posted currently aren't right, we're struggling with a
combination of review feedback and getting to the right patches...

Cheers,

Richard




