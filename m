Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5088E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 12:46:10 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.93168.1732796823396555275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 04:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agregio-solutions.com header.s=google header.b=I0mEcSuB;
 spf=pass (domain: agregio-solutions.com, ip: 209.85.218.47, mailfrom: nicolas.gillen@agregio-solutions.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa539d2b4b2so144522866b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 04:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=agregio-solutions.com; s=google; t=1732796821; x=1733401621; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UC8Kvkil/FnnNyK//djsGTAcTuWzkSximghh6up6Yvk=;
        b=I0mEcSuBrjSigtEMCXMEhY6AJ3OMq9q1I9h11jBZ9K+xuOrfH57YUiIgpHJlwukB2I
         /52DUPDFM77oHX57P9LWbqa+K/WbvFWSAAqsuL5LnccsSdyvM87deQXp2rNcTk9/HcIT
         pDut6bIQppwokE7OhFNvQWVdBu+X/smU3fEsUTFdDMEui/S97wZG4K56unhmm7XC0L49
         IarIuLMjludvVegAUnwjkCCwJHl78wGbJWYz3w19hF2iJpgocJvwTuzuRkAlCNBSbi23
         okJOIEu0RBLZJpO3GtbHWKd2toWWxhk85NvYB+Q2ASBWKV9/wRpPiqOwZWmekOqO8Rh1
         pZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732796821; x=1733401621;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UC8Kvkil/FnnNyK//djsGTAcTuWzkSximghh6up6Yvk=;
        b=ODpds0mtMIXermpCiE0mQxZd1CDDGcBCiDpoMt8QkpvfD9gTuEK/Wrh1915EdVQYRp
         g2+FFDz9rWCm7HsgnB9Jd3eVrwkK9/h7xm7oAtghPm9gVa8vJlTa/oqmrrQBm9WiyYSa
         1KlT3Msv38Jbwk+jN0/ndz6zVpXVKh1O71Ym5prxZkMvHWGMmyAy9dV3B2BglL6PzUyM
         enBUcvRQxQ2fvR3JjKtkpwYTxLdlrgKLZVp9Swwp8Fhvk9DNYP+PnnUpzTxIvw8sf6RB
         MRz+FzYAf/bcVp+Dsi4IQKE5Km9bhPbL+eSr+S3lEKTsb5wXkvSQ71n/Wez/Sc0szZG4
         6XCg==
X-Gm-Message-State: AOJu0YwSu2ZmY4TlYgmYIrc3cgArpbY6VZW6bvu1lPPeOSa5sUb8wiHl
	eeMq1XTXocYl8q1ErXnYADPOG3QEoENHWYB/912WAlbzZJbcWDzKyABSvCpfLHxTDqFmaEElgYX
	p47C7OyTweoIJzAybNnSRvBD2Co+QVNNf2BS92Ne3a9UshUbiVIY=
X-Gm-Gg: ASbGnctLj95KP29PfQNTIxKuELhXIZ5a/mN7U/F2kE6GFBOoOK6hGYBAT3tASO4K5CA
	q3i3w7JzwPywqx/V4LtiEO5mW7LE8qJx/V8uYVEr1ZV/7LocP1UwRle+cy70ME0M=
X-Google-Smtp-Source: AGHT+IGJAJZqLAxgZY0NHLwAOYAMGW03JMNr9/jJMsn0V3cSogL6lTvdpvbR4ZW50D8Zh8S/FtqvHu66gTOBdBfloQA=
X-Received: by 2002:a17:906:3186:b0:aa5:4d1c:78aa with SMTP id
 a640c23a62f3a-aa5945058c7mr321208866b.5.1732796821009; Thu, 28 Nov 2024
 04:27:01 -0800 (PST)
MIME-Version: 1.0
From: Nicolas Gillen <nicolas.gillen@agregio-solutions.com>
Date: Thu, 28 Nov 2024 13:26:50 +0100
Message-ID: <CADcMJG_mX3pXOexbA_Gk_VMY4qVaJTna5Gc5ZW-9_R-LncSBpQ@mail.gmail.com>
Subject: [BACKPORT] rootfs: Ensure run-postinsts is not uninstalled for read-only-rootfs-delayed-postinsts
To: openembedded-core@lists.openembedded.org, steve@sakoman.com
Content-Type: multipart/alternative; boundary="000000000000fc0d880627f832d3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 12:46:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208419

--000000000000fc0d880627f832d3
Content-Type: text/plain; charset="UTF-8"

Hello,

I need to have postinstall scripts working on a read-only file system on
Scarthcap.
That's why I would like to have the commit
60f587475dda99eaa07848880058b69286b8900e
<https://git.openembedded.org/openembedded-core/commit/meta/lib/oe/rootfs.py?id=60f587475dda99eaa07848880058b69286b8900e>
from master backported to Scarthgap.

Please let me know if there is a better format to request this.

Thank you!

Nicolas Gillen

--000000000000fc0d880627f832d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,<br><br></div><div>I need to have postinstall s=
cripts=C2=A0working on a read-only file system on Scarthcap.</div><div>That=
&#39;s why I would like to have the commit=C2=A0<a href=3D"https://git.open=
embedded.org/openembedded-core/commit/meta/lib/oe/rootfs.py?id=3D60f587475d=
da99eaa07848880058b69286b8900e">60f587475dda99eaa07848880058b69286b8900e</a=
> from master backported to Scarthgap.</div><div><br></div><div>Please let =
me know if there is a better format to request this.</div><div><br></div><d=
iv>Thank you!</div><div><br></div><div>Nicolas Gillen</div><br><div dir=3D"=
ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><p style=3D"margin-top:10px"></p><table></table></div></div><=
/div></div>

--000000000000fc0d880627f832d3--

