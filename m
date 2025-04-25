Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22975C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 08:48:57 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.2427.1745570929207800470
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 01:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fhsL7SM1;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso13220405e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 01:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745570927; x=1746175727; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYKqeLtsqaL4X/gvpWGaps42QgxIXJQegvDAls7OtMQ=;
        b=fhsL7SM1iFDiE3egCs2jUEmLG/+ZNqYh7DmXW6TWCahDbm3coBgp2Pl4xZqDbNZkNQ
         4Jh1o272mIwq5lNSqtJWBk08wQaarqtRwxuGYfga5GD6VLJb3uqpK5XNuMOnJrNMRt/O
         hva4PEGoDrEZHbrfgqjZqUrccQqQfpS+sU16A3BiKjU3NJQhewsregxLT84RlALT8DRW
         75XZAFjTdP+GqEAao0owyVML3HHPqpTBjf9N4+f6AO+dXPPzi+E7AthV5C5xGyZLqFyd
         2jBxt/VZSdEDzcJtNFvwF1xf8zi0WJWiAZZGbO7q9HK5+/YmfZ7TlD3M4nX7C2Bv1ocj
         Wblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745570927; x=1746175727;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pYKqeLtsqaL4X/gvpWGaps42QgxIXJQegvDAls7OtMQ=;
        b=DGTRPzgzZf4p6jNOm9+EikpFNCfv9fzkhG1X7Fd4Sjy2i1bjmXOunbHTirHLLHWUty
         I8CTTnywMmMZlG0jJGtHUiHM8aHL0FdFPZ5rBTIuq0Pfx8VJNt8O8a5MUkZbcp4whvLG
         544xDmTmnFjI1BDzzK4C7nyLwJwnTqQGepr5G13EkXcZ5LURGo8TOCxvb6/wDbhn8Nnv
         fglWW1hAvVvZ4e7S6WnLs4aN2U/hMIVaweldp6qSGr3UELeBQFcSHpdpqrNRUT7uHVVR
         Eb0Ld/KTwyNORqKvkaZm2xD6kuALt96Jp9fowifq0eCXYeyu4llKB5cFAqNTqnZcE0ul
         OSxA==
X-Forwarded-Encrypted: i=1; AJvYcCXtde4tkTiMj4Su0t9bVpI4xemY/TQILAP5yvlS9nTTNtE01nEEDHketkexhkKIYe9cq37rKufJEXn26MTkw5B2KA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwpdUQjVmYxfPTnAYRhRXtXqrp/ZxpLyqrB4NfcfKuYM1QbOH9J
	hFTZLFrhfydsBJMzwkWXSNsIz3ztf3LU0WGyq2zVgD1NIxh1kQwM
X-Gm-Gg: ASbGncsIeCAPBSIXj8jZjRJzCegY/gZAFUBJCvXQZz3xYbnHktdkkLbpEmWfsXlYZfH
	JWayn1CfeobUtEr1IFkbCRgWeQTpVVUqLylS5LnNzyvWsQ7/bB3IPPWP1yPpTi46SYHbvPBXX/X
	PVz9BEGKrRhwklLo9GfRbcPFvxyrsBFRbHnGZeV9oK5RcuZv8oBe6aQNtEcvo+hD+7+K1JgIvny
	6O18G5ERPblKsnJwWOVS3KubIMrnaOjq0csvbSjUK5ATJoGZ9LDBfJu36hfV02i3T1qMmxFoZjL
	CIiLG6ETGG0kjSdyNc8CJ/yMEe6hV0o59okF44O/7XEj3lmheBdDcbaJLeG99VbIYKlZHG2da3L
	/3cvtQp2ri1BdxQ==
X-Google-Smtp-Source: AGHT+IGo40mmQOlYN7H8e1WQdNyfq7CgKhaIeE/At4XV32mSF5cJzOwI8A7mZD4MVNMND/niW5m0/Q==
X-Received: by 2002:a05:600c:c17:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-440a6692a28mr11087085e9.10.1745570927262;
        Fri, 25 Apr 2025 01:48:47 -0700 (PDT)
Received: from [192.168.0.7] (159-226-191-194.pool.dsl-net.ch. [194.191.226.159])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4408d8d191bsm79240285e9.1.2025.04.25.01.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:48:47 -0700 (PDT)
Message-ID: <bde7ccac49b5417cda5c964055f72e28a3bc84be.camel@gmail.com>
Subject: Re: [OE-core] kernel-module dependency mystery
From: Max <max.oss.09@gmail.com>
To: mike.looijmans@topic.nl, openembedded-core@lists.openembedded.org
Date: Fri, 25 Apr 2025 10:48:46 +0200
In-Reply-To: <5a9b30f0-c189-4841-9821-6dc26de4de84@topic.nl>
References: <5a9b30f0-c189-4841-9821-6dc26de4de84@topic.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 08:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215446

Hi Mike

Am Mittwoch, dem 23.04.2025 um 14:34 +0200 schrieb Mike Looijmans via lists=
.openembedded.org:
> I built the same image for 5 different machines. Only one of them fails=
=20
> with the logging below. Note that all machines install the=20
> "kernel-module-dyplo" package, and on 4 machines that succeeds just fine.
>=20
>=20
>  =C2=A0* Solver encountered 2 problem(s):
>  =C2=A0* Problem 1/2:
>  =C2=A0*=C2=A0=C2=A0 - conflicting requests
>  =C2=A0*=C2=A0=C2=A0 - package=20
> kernel-module-dyplo-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9 requires=20
> kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5, but none of the=20
> providers can be installed
>  =C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14db=
5 needed by=20
> kernel-module-dyplo-6.6.40-xilinx-g6a2cb0f14db5-1.1+154+bb94f350+bb94f359=
9b-r0.tdpzu9
>  =C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14db=
5 needed by=20
> kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5-1.1+154+bb94f350+bb9=
4f3599b-r0.tdpzu9
>  =C2=A0*
>  =C2=A0* Solution 1:
>  =C2=A0*=C2=A0=C2=A0 - do not ask to install a package providing kernel-m=
odule-dyplo
>=20
>  =C2=A0* Problem 2/2:
>  =C2=A0*=C2=A0=C2=A0 - conflicting requests
>  =C2=A0*=C2=A0=C2=A0 - package=20

> kernel-module-dyplo-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9 requires=20
> kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5, but none of the=20
> providers can be installed
>  =C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14db=
5 needed by=20
> kernel-module-dyplo-6.6.40-xilinx-g6a2cb0f14db5-1.1+154+bb94f350+bb94f359=
9b-r0.tdpzu9
>  =C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14db=
5 needed by=20
> kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5-1.1+154+bb94f350+bb9=
4f3599b-r0.tdpzu9
>  =C2=A0*
>  =C2=A0* Solution 1:
>  =C2=A0*=C2=A0=C2=A0 - do not ask to install a package providing kernel-m=
odule-dyplo
>=20

We had an issue with the exact same symptom and had a hard time
to find a fix. It turned out that:

- The kernel is built with a patch applied from SRC_URI
AND
- We had LOCALVERSION_AUTO=3Dy in the kernel config
AND
- The kernel is in sstate
AND
- The kernel sources no longer exist under tmp/work-shared
AND
- The external kernel module is not taken from sstate

If patches are applied in a kernel recipe they are applied
with 'git am' and a new hash value will be present with
each run of do_patch.

If LOCALVERSION_AUTO=3Dy is in the kernel config that new
hash becomes part of the kernel and external kernel module
packages.

As the kernel is from an older do_patch and the module
from a newer the hashes used in building differ and you
get the above OE build error. Even if it wouldn't the
different hashes become part of the VERMAGIC and the
kernel would refuse to load the module.

Our solution was to no longer build with LOCALVERSION_AUTO
and since then we no longer see the issue.

Regards
Max

> I'm on "scarthgap" branch.
>=20
> The "kernel-module-dyplo" recipe can be found here:
>=20
> https://github.com/topic-embedded-products/meta-dyplo/blob/master/recipes=
-dyplo/dyplo-core/kernel-module-dyplo.bb
>=20
> The isue at first glance appears to be that=20
> "kernel-6.6.40-xilinx-g6a2cb0f14db5" mixes the git version hash from the=
=20
> module itself and the git hash of the kernel. There's no such package,=
=20
> it should have been "kernel-6.6.40-xilinx-gd7b52381656b"
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215287): https://lists.openembedded.org/g/openembedde=
d-core/message/215287
> Mute This Topic: https://lists.openembedded.org/mt/112412917/3617484
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
x.oss.09@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


