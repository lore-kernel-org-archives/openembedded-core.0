Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7A5CFC278
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 13:28:06 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11347.1763731680649969058
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 05:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B+D5DLv5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so21840585e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 05:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1763731679; x=1764336479; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vh5fPhPw5gTXQca58QpbJlzzrTqv5blXbfHInbOlO8M=;
        b=B+D5DLv5tJFl47vVy4hV7ATr+1fm5HEJZIHdnbF9ue/enTjbS1Ekh469vGZauri8YW
         RphBbey0B/YnIOy9qliC8XTutYEbTPLxU9desSLw0HWXXJltAIguTJrYdvizrZrZHzaU
         Wk21pW26p1XJjB3BND7pA+yUfbE7YY1lG+FZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763731679; x=1764336479;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vh5fPhPw5gTXQca58QpbJlzzrTqv5blXbfHInbOlO8M=;
        b=tfuYnjx74rwIq6LiNGdhTkLrm9k5HIntpkbvkHGEMDpE3EFu+EAoM3qWLavn7bGQsk
         TEp6P6IoE0xn3B+bV2ZdlxiMMvmNpp46JBUo+4BjI6B3GKVfrFTQIDyqst4ck7B4GWYo
         vooBg32ij7mw/7GEspKaWNaCwEsU8PS4VaNZigGomLJ+y9tEmy95j01L0IYZxvarOaAZ
         RWvYaIjNLiotFdpc6g0ZErSM1eSkGo0HVBMvqVMzwgNQ/iYHkfIv4DcQvJ8bgLs4fqG1
         SkEb51N1Fr2CI7T9zeteYIKndGKlqgfM/yPuvuC6y87bL4Bvhosrm/qY3Z94hcQPbMHC
         Kt/g==
X-Forwarded-Encrypted: i=1; AJvYcCXkf7xUn8g0Y5UgvnfeQBPQB/kYKfnhLaljwdX3PaBGQvMyao+1y5P//YaeFsG4WYdnkkbCfque7q8sGP3TN20MCw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyRYDlLG5JGt0USqufEHx06OU/CK2gez+WX3Aeda0BCNadf3pi4
	XTTS5z3VgZ3Zl//UyNbWIa8FCYucyhB13sJkeauEGYTM72IhAxJRI4TW/LZ5Ffil/v8=
X-Gm-Gg: ASbGncskPi6/WbuvAJ4ijVOOojkEfmPGj8JvYbhU3ZEPDs4zeAyBGHCiFgYRVX/J3/p
	K1oKy3+M+Cy6Q+K272zBVV5kzE08qIAN0LIwrybQYF2pR12gOYqJHXMnAYJdbU3NE34A5c3kkW8
	wMLslFAAWUrA4HD0jHFmt1+bv0bgs4RdB6Dyj57iojS5yRRfGrLGg6jIZu6G0dQmoZHBbsGzSQ2
	fSuvAd026GEfW7bHg7+gK3AN2qK0Q1hjJPNPsY6gTqHtMxqvbZRR25b+Pd+J3c0vjUdc84pJTQh
	YjpVIWI+FiyLxpzCZiApObn6j19jU8C+8itjw8xNxzHa+ygkr3/MBt8rTN3SgtW/L1dkiVXx37k
	2N2aUsYwJhG4Bhz/kf2QHlsRLBp2xAdeSOh9OQogW//37Gvv18vULaobDnjnXNKsikgb+C7BJkG
	TXDsKxcpXp2+QT7FyUcueBNpllxbnGsyXWaD0tz/7BQDtsOJd/gvjXg8ycSBgOZTAY9GMUrsdS
X-Google-Smtp-Source: AGHT+IFQIQBIH4rkE6CekGdyejP2HZXE4RcN9dtfrvfzoWtv97cA/4s2dWYo3x2LqHEYGGMaXIv+bw==
X-Received: by 2002:a05:600c:1c25:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-477c114ed70mr32464325e9.24.1763731678426;
        Fri, 21 Nov 2025 05:27:58 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a944:2a75:79dd:caf? ([2001:8b0:aba:5f3c:a944:2a75:79dd:caf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e454sm11343014f8f.2.2025.11.21.05.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:27:57 -0800 (PST)
Message-ID: <c3d49e5931af8e746ed25587fdd9b180497dc343.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa httpserver.py: fallback for
 multiprocessing import without bitbake
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Fri, 21 Nov 2025 13:27:56 +0000
In-Reply-To: <20251121105951.1158626-1-mikko.rapeli@linaro.org>
References: <20251121105951.1158626-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 13:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226683

On Fri, 2025-11-21 at 12:59 +0200, Mikko Rapeli via lists.openembedded.org =
wrote:
> When testexport.bbclass is used, then build environment and bitbake
> may not be available when oeqa tests run.
>=20
> Fixes oeqa test execution:
>=20
> https://ledge.validation.linaro.org/scheduler/job/123974
>=20
> ImportError: Failed to import test module: apt
> Traceback (most recent call last):
> =C2=A0 File "/usr/lib/python3.13/unittest/loader.py", line 396, in _find_=
test_path
> =C2=A0=C2=A0=C2=A0 module =3D self._get_module_from_name(name)
> =C2=A0 File "/usr/lib/python3.13/unittest/loader.py", line 339, in _get_m=
odule_from_name
> =C2=A0=C2=A0=C2=A0 __import__(name)
> =C2=A0=C2=A0=C2=A0 ~~~~~~~~~~^^^^^^
> =C2=A0 File "/lava-downloads/core-image-sato/meta/lib/oeqa/runtime/cases/=
apt.py", line 8, in <module>
> =C2=A0=C2=A0=C2=A0 from oeqa.utils.httpserver import HTTPService
> =C2=A0 File "/lava-downloads/core-image-sato/meta/lib/oeqa/utils/httpserv=
er.py", line 9, in <module>
> =C2=A0=C2=A0=C2=A0 from bb import multiprocessing
> ModuleNotFoundError: No module named 'bb'

Breaks with python 3.14.

Cheers,

Richard

