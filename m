Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F47BC47BC5
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 07:45:37 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85455.1767685532159750812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 23:45:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AMtu4B7h;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6446d7a8eadso670805d50.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 23:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767685531; x=1768290331; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=chnnojEiMOGgg3LjQ5t0P2Yt10PwL4yMFweF41G0OXA=;
        b=AMtu4B7hVRRZfXC96ANgP1lcaXSRponDl7e4MUM7VOez3iwDQ06NDvvVX2ymC96wlQ
         N5Xaq5bQL78cvLfHMGKDRv03VYv1olgnctv1ulOj4NvfJ97rciWXeTh5NC+JMjPJ2XWb
         e2kkJM2cVE+luBJz6bfKeP3TfuA2lUX2epMV+jbNEnz48yJfCXALUb0wTivlzijmnVxf
         LEg04O/KBOZCxsyElKpF2XVm1E6F5HzU23nGwsuwLLLGaqt6xY8tONPAjS8rAx8cgc2L
         dfHC5fF9mYw1vfjbu1xTS6PXbNXLXBLuo4xyLjWIkm8jXuBz4f7vDFnJb5LL6aKbo0xn
         34aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767685531; x=1768290331;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=chnnojEiMOGgg3LjQ5t0P2Yt10PwL4yMFweF41G0OXA=;
        b=tp/OXSgJObg4CzKsmmrOIU3z04qI3cSdwqg1LuHxiHL2USQLGj+NVaR93yu66IQu/F
         WZiXj1R9X9kXqd2WqmsCg9+1csaYeM4+iHLfEnMG0rZVT47CKtudhIWaNWUsKgPbVbi6
         CABnHSA0ro4gNEyIbqXZQC9FqqLuGSYI3zW+h9QVXZbg4KgtH2+Zm8zwJwvURK4acB8m
         BA9CKP2qf26xPvSKwbG9UGqHo5ubPBXxNwbj0pH1Viy0yCay19LbtfNifuOD3/D0gWM0
         XSlzTi+SOPctYQV3JnagIGwl/wbsK2VOvOfz4yxSNyGJHKq/kCgUhOzTEp/P9ZbRery3
         hs9g==
X-Forwarded-Encrypted: i=1; AJvYcCXcjUnOo8WeKmpRam7+bO3BjuGntGFavH1cdYmSjEkdM+utgOXKkL+8YnRdUtPUFKk5DuITfmZrOM0H7Cc2jAXBuw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzyP+mXrLRij61pfNcRLGp86pwe90X1YQgDIxmllXafit2XsQw3
	znzqNu0p7OAc9SW8BAf7zoGd4GUXLUnBq1f8hfKXb2HtkWOybUKTXAiCqo6uTB8+wJd7fb1cWh8
	507AHze5P/m3d82gPmWgGi1jFRovvFjc=
X-Gm-Gg: AY/fxX7kbwl3DKglXAvpsTHILwOL7cCVKFv9wfn/yfGS1fFffjV8pj6P+vF0auNI4QZ
	lJWqX78CtD8shSwx+tNs+gQWLOP15X5OKh83gnZ1HB9oW/OOy7aXYDznE43uMc0kJPtpN0Dz4My
	1AdV5lRhhMhxNbnpj8r9e0z/7RfsCfW3XbyMG2yOT7guCz8MvUVQ3gA9GtJe7JuPXpcSvTaSbe4
	RJoSgpXIHQxP5fna2SUfek1AprwsysHlmgHYVoMAuZaVwPpP7Y3eL3fQ0H2oioYSpK+jMDgxCWg
	7MN1Lqn+ax59GsHPYRGe83CANdjAZejrhceeoX32Rmoh6D/RIMM57iua/fwkpcuzfwkMa0HlKWE
	tC24e53lVaEy4gifp6GSqa8XJxxsbrs74QQqkmSNY1WJiLMJrxgLQG6Ge
X-Google-Smtp-Source: AGHT+IHajyhrwLGxQelMi6gcCNlOp5XWF7PNCgAzea0CxToAGPD6J4lxR9gHCPisCrhtk2A/jUHyO9BEwey2aFRaC6s=
X-Received: by 2002:a05:690e:140b:b0:63f:a87b:2066 with SMTP id
 956f58d0204a3-6470c83c370mr1703682d50.16.1767685531326; Mon, 05 Jan 2026
 23:45:31 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Jan 2026 23:45:05 -0800
X-Gm-Features: AQt7F2pPQCwpEmdpN-2XKQobVSpq-LUiYQHaOFU5ROPlFAydkUhWsioqKYscctk
Message-ID: <CAMKF1sqse8G+-YQhAZc1ahUiQrfaqqVG70id=xxcqDcHmRmajw@mail.gmail.com>
Subject: New functions added in upcoming glibc 2.43
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002b5d220647b35c39"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 07:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228881

--0000000000002b5d220647b35c39
Content-Type: text/plain; charset="UTF-8"

New functions in glibc 2.43

memset_explicit,  memalignment, mseal, free_sized,
free_aligned_sized, openat2, umaxabs.

Thanks
-Khem

--0000000000002b5d220647b35c39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">New functions in glibc 2.43<div><br></div><div>memset_expl=
icit,=C2=A0=C2=A0memalignment, mseal,=C2=A0free_sized, free_aligned_sized,=
=C2=A0openat2,=C2=A0umaxabs.<br><br>Thanks</div><div>-Khem</div></div>

--0000000000002b5d220647b35c39--

