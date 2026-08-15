Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F88EC5CFC1
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 21:55:56 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.636.1786830949134826922
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 14:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gB9zxYXq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1933739f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 14:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786830947; x=1787435747; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gPeTWHMxpE0tZMr0QUMrdSA87pZgUlauFhMWcDmF9vs=;
        b=gB9zxYXqvOKtgG9Alj+fo77gp8PQhINianmuGx7Pbn9rg87ZSciguSwMa2aWdmh8K6
         gOAz02EMLjTDyQds0GHuIzUEHtj3AOKyCSq0tU5PCQjYtHO7TkmD+bRuNWHhlGug1y36
         OyuAP5ydbW5CLLoF+U+93ZVCnB7KVYYOKFN48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786830947; x=1787435747;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPeTWHMxpE0tZMr0QUMrdSA87pZgUlauFhMWcDmF9vs=;
        b=gVsl545aZrxAXdtEL+wXD8LkGCVMprbsdI/LlvWqT8mb3MJoTAoHXWEjtJYz1uATeP
         KykpP1nl1Mh8CjRYSkaOs1egRd40yFfwLQgxi77kIN8KxZPOh45oBKG2gUbCjn5Ea8N3
         AhM45nE+UtfjR+vFI10oirII1db6DQ+rl3Qzl0XdbR5C5V7aZyzMMYE62+9T5MrnydHm
         rZBIShEPJ3BQFnz85KrzvqPzQUS8dFnYz9KexBw3/dLK+8DEkUP75CKJqyBx3eGzOEHo
         6bfkV90ZmYvfPyJI4q8b7fWkcirIpm9Rguhkc2Qbj6SuVSLBySiols5aBfXJiQoB7U9I
         tRYA==
X-Forwarded-Encrypted: i=1; AHgh+Rrpi3xHp9YP24AuRicxPpIfLO5D1m4XWbrjD+VQjBlPCOFSMmTLdlKQBtIcEluq21lMyUgCQwQ4tlQbDZ+dm8jmcA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxv9/lNUrTdRAurUrDyG2pds56VLnKNjzEWk8VChVjh2HsLNJhC
	Exz/84axaHfA/12Z+fVaBgSE29Jrx6g4T7hPQMZSu4UqiWg5Y450xxYJGRhgipoRoVY=
X-Gm-Gg: AR+sD12s8C3pUTroDSVIPSVhLA41/zD5KOezr/nLu00SxfwufgXsnKt+rJTxhTxQEr8
	b4/mDwECqcmZl+qMrqqmi6pgfUevuGm9sZDnHXRhgdFbBQbPxeXZhnPgkk8aJFY8RkOXA35AQMY
	i78cjBZi0RvwZew4mSoYsxwTS7wboxd5iZfYe50LGAk88RqTt7tyD1hWLgU3Y+pNk+WWDTtx5ci
	pJuZSzhXeS53G2dFGreL85cDn6iE6zQ3hlFH83dJK0epPaIc6/UJDM77w5Wr3l4CenQxLYDinVv
	AHbYWsewK69ozDrrG3l5/QGCVP55hI7df4sUX+LhOXUr8TO5Zf3uBzpNmaE7sBdX3ZDVhR1GKdf
	/auo/6igo5K7clX2YFa6zMD6b79DqOZ3XaMXOY/V7NQ9G00o4kwNGf5Os9f3j/f8miJ8hXPTDRy
	hgcW+DAeOgY72VzJjG/ofNxLUuAOODUpmNLJdHlKFzlr4w56LJH4XhlPGX2RESk+wDWd577YWDc
	Z8sU9/6K2KpLBF38cfvEbovRqbcmXS44pfQMrLcMC+50PrI6X3jKA==
X-Received: by 2002:a05:6000:1a8e:b0:47f:c648:e280 with SMTP id ffacd0b85a97d-481607d3485mr24369608f8f.18.1786830947316;
        Sat, 15 Aug 2026 14:55:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d120:1e80:5c08:16c3? ([2001:8b0:aba:5f3c:d120:1e80:5c08:16c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2b1f90sm18608545f8f.18.2026.08.15.14.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 14:55:45 -0700 (PDT)
Message-ID: <4c64d239ed5a24eeeaa7937abf1a3bbbf5e5cfa0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] scripts: scriptutils: Use
 LicenseRef-Proprietary LICENSE while fetching
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mathieu.dubois-briand@bootlin.com, 
	openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Aug 2026 22:55:44 +0100
In-Reply-To: <20260814-mathieu-devtool-v1-1-985e81a17bb3@bootlin.com>
References: <20260814-mathieu-devtool-v1-0-985e81a17bb3@bootlin.com>
	 <20260814-mathieu-devtool-v1-1-985e81a17bb3@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 21:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243504

On Fri, 2026-08-14 at 18:26 +0200, Mathieu Dubois-Briand via lists.openembe=
dded.org wrote:
> Switching away of the "CLOSED" license, as devtool users would encounter
> deprecation warnings on "devtool add" command.
>=20
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---
> =C2=A0scripts/lib/scriptutils.py | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
> index 32e749dbb1a2..b4fb6cc1845f 100644
> --- a/scripts/lib/scriptutils.py
> +++ b/scripts/lib/scriptutils.py
> @@ -170,7 +170,7 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logge=
r, preserve_tmp=3DFalse, mirr
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
logger.debug('Generating initial recipe %s for fetching' % fetchrecipe)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
with open(fetchrecipe, 'w') as f:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 # We don't want to have to specify LIC_FILES_CHKSU=
M
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 f.write('LICENSE =3D "CLOSED"\n')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 f.write('LICENSE =3D "LicenseRef-Proprietary"\n')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 # We don't need the cross-compiler
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 f.write('INHIBIT_DEFAULT_DEPS =3D "1"\n')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 # We don't have the checksums yet so we can't requ=
ire them

Perhaps "LicenseRef-RecipetoolTransient" ?

I'm a bit worried Proprietary sets up the wrong impression...

Cheers,

Richard=20

