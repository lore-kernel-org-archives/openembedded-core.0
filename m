Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9B0C71159
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 16:39:02 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.1840.1750091935841267978
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 09:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=C40EmTYf;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.174, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e733cd55f9eso4326345276.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750091935; x=1750696735; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hU8V1BPbPUV3z9Ot6ARem6H5bEqEFiXYBWuEM4yzfB0=;
        b=C40EmTYfngsqo0uRGp6V7EpMHihhVOBYtlv+uOZNB6YOMBA9T+nJddhcO0YTEwyd5c
         TxYp20qVu6MQl5tKUoyoOvW9chfhIuyLRPBJFssCcip8/Ete6AG8Uz7sqYUkPFl2ypEi
         Pql1vU/Fra+NFymo2jXbJeGpbmQcDoiKkZqbABf49JyNpCXNfbwhoCVeFxRV+fiu2y1i
         4NpBzyT1Aus+Y9ieZYjf08y/wQojZ9XPKQn2J2NFL5t7w2spmJvsWHaGdt88uw3efp9U
         VsAAuDgjcXq7WCEMMoHBEdiAxk5qJnNGE4jtXAKlrl79YnJ73cxBHFMAtIli6Cwg0Vru
         +hjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750091935; x=1750696735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hU8V1BPbPUV3z9Ot6ARem6H5bEqEFiXYBWuEM4yzfB0=;
        b=vvtgaY91++oqwpTlCoIDz7sA+zai9Y1wBFVaWVEcwSGCFOlL6MCddPX0H4LuTZ+AGL
         FvtIcOXUVdz1etEaKFH0w7TwARrXG11Mt85C8pqT1QaQnfaWmZz8U0fN7/At84W/kz9L
         9uWAyeP8XI2mpHicbCE38K0GfoIMo+AMtqqHMd/SFCZOib6L5BXY+tag0dZy1RXIZVgi
         u4QFCaD1rnRjgHmXmApDG+9lCYs4TyZsqWCaZ6TJz9JKHxi3RdLl+Xr6jy8APwhkkYN8
         RR/M+aFLFuC3uh7wymnKvw3wxkcuuGunbKKqD/+L8eE0mMCZlcaum8eyF/KBnjCcLNxx
         W7og==
X-Forwarded-Encrypted: i=1; AJvYcCXbiahfUKs7RWKoQ+mS4an2NMnHDRk4W9i86g+WG2FLiR7TlMwLhbLzpI6HjjuVmQ0nDlKYKoobVYiTBc6aTmjlbQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwIDeoSi2eAi3tmgq1ECPXLtFt2m3TaoNZ8TKwgovx/5nwYE30K
	XaSmCUQs3yoKJisGl9vvGklgiAHAc1uXg1ziWkhyJBd+Fi6ciue3n8Do07IwXMzL9WRbv1ccfXv
	3Wj1G1EUyHO/YVz3u4NT0tlt8iT9eBSsQHWnphxfz3Q==
X-Gm-Gg: ASbGnctTjU0X2U+ms2iGIFBsMjj/0hiJuKRnDcxU4gekSbS2TquCxaVzBse22GU+Wpw
	8QDc6kVeBe7WpPIvA02IdXwZi0rb+XI4BF0+tEAeKAh+YPDSdeU67L9gkixQFehSWoNI/1CqX5I
	0fv/nyOvIUc2/z6Vo9Mp4BxSdAy+anJx3iEG2jeboG0cEOlBVBVZbwmrAV6bAtz+hkMOgJmj5Sf
	w==
X-Google-Smtp-Source: AGHT+IGzjmLYujWWTTSxMvTVFOcQScHKajJbAmT5qqGXF3PmGMLD0G0DLwqo5dj49xI+cvYumNw+aou49DcE2+wPGHU=
X-Received: by 2002:a05:6902:140d:b0:e7f:7200:c58d with SMTP id
 3f1490d57ef6-e822ac2f6eamr13595186276.7.1750091934240; Mon, 16 Jun 2025
 09:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250613110126.187329-1-vanusuri@mvista.com> <ac6f29e2-36f7-497b-a733-c892cae2fa2f@gmail.com>
In-Reply-To: <ac6f29e2-36f7-497b-a733-c892cae2fa2f@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 16 Jun 2025 09:38:42 -0700
X-Gm-Features: AX0GCFsHoBEWWLZpsrWuywVK2am3GkqJ3zedlzG3L-GJ_ZmH93dSVt8tJH2ZtuA
Message-ID: <CAOSpxdajhrk16_obwLkaNrTG4iT+9-BB9cjjgiEmpdgcis4HxA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] python3-requests: upgrade 2.32.3 -> 2.32.4
To: skandigraun@gmail.com
Cc: vanusuri@mvista.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218844

On Fri, Jun 13, 2025 at 4:56=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> There seem to be some duplication in your and Wind River's contributions
> today - this, and some of the libsoup CVE fixes in Kirkstone are also
> duped only with a few hours of difference.
>
> It's mostly an observation, rather than anything else.

This doesn't happen very often, but when it does I'll typically take
the first one to hit the mailing list (unless there is an issue with
it!)

Steve

