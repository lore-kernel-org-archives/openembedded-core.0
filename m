Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FE7FCB63C
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 17:11:42 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74381.1772817093978853166
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 09:11:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Uwgm9bGD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48371119eacso112568335e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 09:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772817092; x=1773421892; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ttqg5mpf80PqgNT2cJPWPKVULLyXn7djU1QEr5nn4A=;
        b=Uwgm9bGDvs7wbL1YDxknxC03eWk9exyFHn1RPfpROfnArwVaHjaUliqhmJrTecGSOu
         g4Tofr3kPOZp8lVwKqy7Ry2nzqKslomkWK3EvkTmZ+LTEj70nMnNpeaWzdNDEiLFpbnD
         MvCEdGxp2AcUK/5qubcp6gsrdbdLPJc6futoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817092; x=1773421892;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ttqg5mpf80PqgNT2cJPWPKVULLyXn7djU1QEr5nn4A=;
        b=Hw+YwK1voSNDYxlS7XM8bipr7dM6tN6zWtlxSIL7DJOzONg3vht4MxZ1nJsdNOkpxV
         KwMpaGfCz9sWsu6HSVNeGHzAXRflWwMAAMJX1hi4J2mdWbQKxJM1qzJfJkF921blVDvK
         wWSz8FILDX7z4qpM9AZMG91CukT1EJcafI+9Z2DrirfEymHudUt5EU27uUozQucyBAP4
         2gdLroGboU+F0eZnO/xsBGSmd8k8Gti7cqKyPwEzTSjk00eif4JnMMAUIhuxndh1daYo
         YrRWyYTNlq3Z8fb8rRHQuZQiZ/lKaCeLtg2ToWahnHQsNpW7x1A25ckTHIGAY3Do6x8/
         UQ0w==
X-Forwarded-Encrypted: i=1; AJvYcCUxKTZilskO0e6l3zl+T8wwl60UFFtK/8RHWmXV/iBRUmmfZq6by7LPhzSbTj0NiLklt8GWvbrqZLq9G+Y9vsPlzw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx+t8HcXkiqYQ47OHaKtglXZxIsGXGhxmHnn6KM1S2fZXdXU0kX
	WLHGftPmOCbKrfv0fNntTXpkH5f5DycOTRk6W73Z8BUYg+lLsvJD7aqA8kVFPRmDaEg=
X-Gm-Gg: ATEYQzyd5zWFknnWuErPboCwU1Fi7Dg7NTTUDiwkyc1AYX7TEDc/WyKeaDc+upRMDwZ
	wys6R/MsV+hE405Jp+MvPpxbE3PU54ANcHeaLAxXQWdNEAkSWI+O70tjmDiSl9jW7adO/ncIgRv
	K2g1y+Xi04vYhEYkhgwu/8du+gqUQhmCCEq3hR4lHBS4PsyFkHEteWNeZ7xsxuVeakNOBUYy/DG
	WPR2BqBQ1kIaPHfbu6XlNc00TUJfphN7dWbOSWJC7SaAIp4n/niMhNm7dKR61XkkoMFapQHXS1x
	eY54AF2tsDqoGI8ZXHK+ScF1c01bTecV6QzyxM2GzfEv5tt/V4Cql7acAUZLfgm7+1atA2/SJo/
	wsvf7UNoryfhnaEZsKyefvTiwxS4UsP8zpVDCNSQoRFHFhleqW2eyJKUkneres+yIuwi1PZmfFY
	F53BvTpwJAqzSLdSfh4dreMNYIlC9lJ4WHMYmJNYbi3MVx+SejVd0CYwglIVwB1/dBUHdm62kml
	zp1aAJcqHlwuZk=
X-Received: by 2002:a05:600c:8115:b0:483:a8e9:201b with SMTP id 5b1f17b1804b1-485268bd01cmr51888925e9.0.1772817092209;
        Fri, 06 Mar 2026 09:11:32 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:dc4e:977d:644d:618a? ([2001:8b0:aba:5f3c:dc4e:977d:644d:618a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529a2fa39sm7396415e9.8.2026.03.06.09.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:11:31 -0800 (PST)
Message-ID: <66bd6aa1f573333e03280716916712033078e2da.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 8/9] oe-selftest/cases/wic.py: oe-selftest
 -r wic.Wic -> PASS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Date: Fri, 06 Mar 2026 17:11:29 +0000
In-Reply-To: <20260302003826.3995222-9-twoerner@gmail.com>
References: <20260302003826.3995222-1-twoerner@gmail.com>
	 <20260302003826.3995222-9-twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 17:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232582

On Sun, 2026-03-01 at 19:38 -0500, Trevor Woerner via lists.openembedded.or=
g wrote:
> Changes for the wic.Wic oe-selftests to pass now that wic is a
> stand-alone app and no longer part of oe-core.
>=20
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v7:
> - none
>=20
> changes in v6:
> - none
>=20
> changes in v5:
> - rebase with master
> - split back out into multiple, smaller patches
> - now that the sector-size re-implementation is ahead of this patch,
> =C2=A0 several wic subcommands (ls, cp, rm) no longer need a --vars file
>=20
> v4: skipped to align/combine with other patch set
>=20
> changes in v3:
> - squashed into 1 large, atomic commit
>=20
> changes in v2:
> - none
> ---
> =C2=A0meta/lib/oeqa/selftest/cases/wic.py | 136 ++++++++++++++++---------=
---
> =C2=A01 file changed, 76 insertions(+), 60 deletions(-)

I mentioned this on irc but for completeness, I should respond here too.

The commit message says "what" the patch does but nothing about why,
there is nothing explaining the changes.

For a major migration like this, the explanation of why is important,
it may well help other people convert their code for example.

In this case, the issue (at least as I understand it) is that the
external wic tool cannot call bitbake to extract bitbake variable
values any longer so we need to add the environment file to the wic
calls to make sure it has that information. This should be mentioned in
the commit message but it isn't. I shouldn't have to go and ask people
and spend an age reading the code.

In some ways, this patch would be better as a standalone patch before
the split out, that way we could test before and after the split and
show no regressions and it would make the intent of the change clearer.

To be clear, I don't object to removing the support for calling bitbake
to get variable values. What I don't like is the way this is being done
with no visibility to the change.

In digging into this, I also noticed other issues:

* the wic repo has both master and main branches. This is extremely
confusing and it shouldn't have both, particularly when the content is
totally different

* there is no explanation of the changes in the wic repo to make it
external. The removal of support for executing bitbake for example is
never mentioned there either. Where were those patches reviewed? What
will the review process be in future?

* there is a workaround for e2fsck return codes in the wic repo. Where
was this posted for review? Is that a change we'd have accepted in OE-
Core? I suspect not as I have serious concerns about a workaround like
that. Unfortunately that raises questions about the ongoing maintenance
of the repo too.

Cheers,

Richard





