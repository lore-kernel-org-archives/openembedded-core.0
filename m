Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D88CD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:21:10 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19016.1779189668818704793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 04:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems.com.br header.s=os header.b=qwbVwIIQ;
 spf=pass (domain: ossystems.com.br, ip: 209.85.215.178, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c801d732058so1429610a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 04:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1779189668; x=1779794468; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IybtpoFP4EcA+4d+VbWS5w3xI1tyyaA5XC/ACu4S4w0=;
        b=qwbVwIIQ4J9qA9qQE0Ps14BV/FJeV+NENbQVS8YGAEA0U0sCz9lRSrOP0t3UqtUwhG
         SuO89z2R+W81T2UG/MVU75C4N5ZMjJHU64DxqhpMWsCvoKphW2nnqiGt0h1is91i6RGU
         BabzhptcoFcLenlWD+1B5QhO19qYfHYPPvYJucHxI3Mt4rrnSzPJguePZM0TtBubZIaZ
         M1Yfof9gduQqjszGtFlKT/33zWDKTv/oJ2Uwi52Xqxn85afb68he8UZs0MKPl7bPMjmR
         NG9sO7aPbbSOjASBnNX5+o7IdirUomjKyDN9IsOsnvbP7kQdvtlKsDdk4w9g7s7KIIWZ
         toHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189668; x=1779794468;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IybtpoFP4EcA+4d+VbWS5w3xI1tyyaA5XC/ACu4S4w0=;
        b=DOp3ruyplKrb8eSMQESNn3p484UNoTPmrEAT1ECR9wH7AVlBr2JUKLSGdInEnFcquo
         wJYJRkjTuMIucHd/RcD6T2pLWct5lNXnorSmye7ndMPYtY6Jn6bBXt8iGkGeBReFDLCk
         adTOqHIGJQ+9NUy1aMNACyFDi6EE6pNJGTKVRUo3CWUBjo4LFNnS+35AiVS141wvj77y
         2BJPDKefNeILLJfZr6MZUdk0EnNmfiVEHWhPS5jlOZhYY8M/TlbvGcaMbGt6KbP/VQNm
         CbNI649uVnqV7uMfphsfxSo/mwtyd58Ci5M1sf9Afn5M2dHWvNtvA0jlOvSn9tNHO2st
         bpng==
X-Gm-Message-State: AOJu0Yy47KB74XeacWRzFxebDq+uxkj8JRl/vgaPFZ+2w0WUpYG1z1Ee
	bkH6zUcvrGInKPloF/6stK4hCZapQkRzqQFDrs2pF9Y8QQUIryhpF3CHv4WsR+VLn1RUaUgehim
	VA+IE3Kw=
X-Gm-Gg: Acq92OHQikOFiG+m/OL4Cc04nh6UZGfkjgo/6l22X6O7+xHS7ioDwukc4uU2VWmOpWO
	koj0AMHDttzaHtcR1/uaUHBKlJUorAFPeo9hoHCsXqogLDcxf2nuAI7yR6EJ/S/yi9okJBUOge3
	ZEtscPCcsk/peQ0rXoOoKCyyecBWFhRQi3+jwCvHMC0HE5Cu21YKEJ/FQeKJ7Jt5JB0R5WNCGEv
	s6akLKhATnO4BE2TnmcvuwsLv2UaFxUh9G8v3VzW10oE1e/rAtITp6H+RShVD8KdZyES/oWNk47
	vNoPzzI5zR92D+N1iAyhMXI0+ElYSax6sN6DilqZnupC3NgK7ozp2YlJthO6TQTD7PdpjnvccaG
	zBei/AoHtHmNUTL+C/VR6UCNIVWvXSlXbVldwWq9QI1nfHFvqygI0ZBSCRlZ9cEvJ0Rzg6Szz1R
	0AEAX4nEYgSe9oiYBlY3cujnQWyIn3G4OZKRAZR0mHmUwYdVrUo2Ueo1chCegI6sy/P64CQ1TQm
	rpaS509ATglNYmjqoQ=
X-Received: by 2002:a05:6a20:72ab:b0:3a2:e26b:295c with SMTP id adf61e73a8af0-3b22d389fcemr18007475637.18.1779189667797;
        Tue, 19 May 2026 04:21:07 -0700 (PDT)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com. [209.85.215.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f67eff284sm7158541b3a.8.2026.05.19.04.21.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:21:07 -0700 (PDT)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c801d732058so1429585a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 04:21:06 -0700 (PDT)
X-Received: by 2002:a17:903:1a43:b0:2ae:5ab4:f4c0 with SMTP id
 d9443c01a7336-2bd7e8bd12amr165829795ad.13.1779189665453; Tue, 19 May 2026
 04:21:05 -0700 (PDT)
MIME-Version: 1.0
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Tue, 19 May 2026 08:20:52 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq0E4gjR2R6TXK38v-a3wQa5Yi892BVOB=3YoU+ibM23A@mail.gmail.com>
X-Gm-Features: AVHnY4J2pwV9KctyEIQ1uP4Ek5wYEk5cVlaKzma9UientFkzhaHVZeS_QYEbhX0
Message-ID: <CAP9ODKq0E4gjR2R6TXK38v-a3wQa5Yi892BVOB=3YoU+ibM23A@mail.gmail.com>
Subject: Re-visiting: bitbake-setup on PyPI as the recommended install path
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: Daiane Angolini <angolini@gmail.com>, 
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000ff5b24065229df75"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 11:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237312

--000000000000ff5b24065229df75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'd like to revisit a topic I raised on the list some time ago: making `pip
install bitbake-setup` a viable, stable alternative installation path for
end users. As I recall, there was alignment from the BitBake community that
having bitbake-setup properly published on PyPI was a desirable direction =
=E2=80=94
it significantly alleviates the friction of getting started with
BitBake/Yocto for developers who'd rather not clone a git tree as a build
prerequisite (CI pipelines, container-based workflows, and newcomers in
particular benefit).

To be clear on intent: we're not proposing pip as the primary install path.
The git clone from git.openembedded.org/bitbake should remain the
recommended approach, consistent with the Yocto Project Quick Build guide.
The goal is simply to have pip work reliably as a documented alternative
for those who prefer it.

Looking at the current state, `pip install bitbake-setup` still resolves to
2.16.0a1 (an alpha from December 2025), which makes it hard to recommend
even as an alternative. A few questions to move this forward:

- What's the current status of promoting bitbake-setup out of alpha on
PyPI? Are there known blockers (release tooling, packaging, version
coupling to BitBake/Yocto releases)?
- Is the previously discussed plan still the intended direction, or has
thinking shifted?
- Would coordinating the PyPI release cadence with BitBake/Yocto releases
be feasible, so users could pin to a known good version?

Happy to help where I can if there are concrete blockers =E2=80=94 packagin=
g,
release automation, documentation, or otherwise.

Thanks,

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854

--000000000000ff5b24065229df75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br>Hi all,<br><br>I&#39;d like to revisit a topic I =
raised on the list some time ago: making `pip install bitbake-setup` a viab=
le, stable alternative installation path for end users. As I recall, there =
was alignment from the BitBake community that having bitbake-setup properly=
 published on PyPI was a desirable direction =E2=80=94 it significantly all=
eviates the friction of getting started with BitBake/Yocto for developers w=
ho&#39;d rather not clone a git tree as a build prerequisite (CI pipelines,=
 container-based workflows, and newcomers in particular benefit).<br><br>To=
 be clear on intent: we&#39;re not proposing pip as the primary install pat=
h. The git clone from <a href=3D"http://git.openembedded.org/bitbake">git.o=
penembedded.org/bitbake</a> should remain the recommended approach, consist=
ent with the Yocto Project Quick Build guide. The goal is simply to have pi=
p work reliably as a documented alternative for those who prefer it.<br><br=
>Looking at the current state, `pip install bitbake-setup` still resolves t=
o 2.16.0a1 (an alpha from December 2025), which makes it hard to recommend =
even as an alternative. A few questions to move this forward:<br><br>- What=
&#39;s the current status of promoting bitbake-setup out of alpha on PyPI? =
Are there known blockers (release tooling, packaging, version coupling to B=
itBake/Yocto releases)?<br>- Is the previously discussed plan still the int=
ended direction, or has thinking shifted?<br>- Would coordinating the PyPI =
release cadence with BitBake/Yocto releases be feasible, so users could pin=
 to a known good version?<br><br>Happy to help where I can if there are con=
crete blockers =E2=80=94 packaging, release automation, documentation, or o=
therwise.<br><br>Thanks,<br></div><div><br></div><span class=3D"gmail_signa=
ture_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" data-=
smartmail=3D"gmail_signature"><div dir=3D"ltr">Otavio Salvador =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" targe=
t=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a =
href=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossyste=
ms.com.br</a><br>Mobile: +55 (53) 9 9981-7854</div></div></div>

--000000000000ff5b24065229df75--

