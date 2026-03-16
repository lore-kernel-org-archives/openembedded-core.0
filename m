Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591D2F46433
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:31:20 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46627.1773653478087523564
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HmYT3Rpj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b611274bso2682792f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773653476; x=1774258276; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B8R/easukA8dRNPPAZsQoenc7pFa4jgw5jF3cMTQaJQ=;
        b=HmYT3Rpj+mOCgKIRTJDX/v0oUJcJB3GlxyTjl2/OlGbW+lAMnN6uwy32+VkFSdcE+V
         PXREbp4XF72VAv6QPhp/w5nOGNVhMQYVXl5oOIYXeSm0E8M4d0x+zu/BX0z0EY5RW3EY
         S8yOnE/4oF255C3YGubO4MkncWyc9rkmla/sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653476; x=1774258276;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8R/easukA8dRNPPAZsQoenc7pFa4jgw5jF3cMTQaJQ=;
        b=Pu8LEI6g2Suk8NiyQjDAhmcnKa34ecVpiyDjf92gpOxjD/iVHTJ7Ezdcb7Xb2vl6Av
         CAsgZK5LCIwW0vOYtfd7xZJvO0xNANYF/z4ROYgLbbqu+pHloMjxqQaUoimWw63mNNfE
         CWtlP5XU+7D3tDyhI71ArLZ2m8HVJ4KHRO81RjJXNSO8+DssFnpZnNm6N+O68iMMoZph
         GXyCbpZhRs+NTITiVtqHysAjZYtcxgcLPN6WYwXvhXPQ/YRBBu446pFh1M+6B7NbgDnq
         pedqSzIvYGMD4Epr2OIUeOPiIhfrdQj29J8SrDWCfI9LSidvT2G1aY46qgDhgUGGCXmI
         d2AQ==
X-Gm-Message-State: AOJu0YyP143QCGJ9R2s8ItpFxTA6wYbLqgGj6l/Y9m030B+Q9fFk6r6a
	QA75yQZFvXI6rqNtPKd/MWVh0jr6Z1PLI3EI2LPfwGqK8HRYjNH4mQn7wCnSsyW3GfI=
X-Gm-Gg: ATEYQzwBdvw2jIOM0Lo1hw0wqjo7BV1tb1JO2Eb6dcGqBCXc1ABUqKog8HiXAf4ZxYc
	EfVeMqze/m5UVpwhCcKDieUeF0GCHWTMn06IBtboHZCR2G50zrEzmv7RO1fPzqHGj1R3hDlspqX
	REQzgcGXImkXawvz4iHogSxRppdZx4wfwdbmRFsjvXKyf04Qh2hMfL5FVtQltBoW/wsLIOFuXnA
	dQcynuue839wIso1Qu3ftoAX39qSP2rHpwcHiqQsKekdJyJysmj9DtiPZS3Lerrh5irkR2qyFz9
	VMR/X1G28U7mAyvEIRfF7AXq1ECRph14MwsYNHCE/AMxKV66cGeAawn0NqCmgspq6n8eiSj1H43
	cS/T5i57/VZcPkUqbyStd0vjtkfUbqm6Na5HgzEwIeyO9qnBcm7lFEhlrExT+P1VA6fjAWibW7T
	oOsSCMMTzORDJhKJMCcxeZ/VT7lhTv+bRFzHaMUupquIYSf5PiuGQVmYJk9fNlsbeyrfZvSGGFZ
	Mx71v9CQMOh8Lk=
X-Received: by 2002:a05:6000:2903:b0:439:d7e1:fc51 with SMTP id ffacd0b85a97d-43a04dbeec1mr21776864f8f.36.1773653476048;
        Mon, 16 Mar 2026 02:31:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1225:f5c3:a704:878a? ([2001:8b0:aba:5f3c:1225:f5c3:a704:878a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b41ff92a6sm13281872f8f.11.2026.03.16.02.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:31:15 -0700 (PDT)
Message-ID: <ce20618de38f8d51b744d440b43581436d7a3298.camel@linuxfoundation.org>
Subject: Re: [OE-core] TMPDIR, bitbake v posix
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <ravi@prevas.dk>, "Rasmus Villemoes via
 lists.openembedded.org" <rasmus.villemoes=prevas.dk@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org, emkan@prevas.dk
Date: Mon, 16 Mar 2026 09:31:14 +0000
In-Reply-To: <87cy14p1on.fsf@prevas.dk>
References: <188B34BEFB66411E.2721127@lists.openembedded.org>
	 <87cy14p1on.fsf@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233240

On Mon, 2026-03-16 at 10:24 +0100, Rasmus Villemoes wrote:
> On Fri, Jan 16 2026, "Rasmus Villemoes via lists.openembedded.org" <rasmu=
s.villemoes=3Dprevas.dk@lists.openembedded.org> wrote:
>=20
> > Hi
> >=20
> > When some task uses mktemp(1) or similar functionality (e.g. the
> > python tempfile module) to create a temporary file or dir, those end up
> > being created in the global /tmp directory. That's obviously not ideal,
> > as those might be left behind in case of an unclean shutdown or if the
> > script is not properly written, and won't be cleaned by do_clean or
> > RM_WORK. Also, /tmp is often a tmpfs instance, while some tasks might
> > want to create rather large temporary files.
> >=20
> > Most such utilities/interfaces respect the TMPDIR environment variable,
> > if set. However, since that name is used by bitbake for a rather centra=
l
> > concept, one cannot simply 'export TMPDIR', as one doesn't want that
> > top-level build dir polluted by random build files, and it still
> > wouldn't be removed by do_clean or RM_WORK. Ideally, all tasks would
> > have a TMPDIR _environment_ variable set to something below ${WORKDIR},
> > maybe even something unique per task (say ${T}/${taskname}.d). But
> > there's no simple way to do that that doesn't conflict with bitbake's
> > use of the TMPDIR name.
> >=20
> > Can we do anything about this?
> >=20
> > (1) Do nothing, live with this limitation.
> >=20
> > (2) Special-case TMPDIR, so that all tasks are created with a proper
> > value of TMPDIR in the environment, not derived from the bitbake
> > variable of the same name. Could be settable with some new TASK_TMPDIR
> > or do_foo[tmpdir] flag. Somewhat hacky, though.
> >=20
> > (3) Bite the bullet and plan for renaming TMPDIR -> BBTMPDIR, so that
> > the TMPDIR name becomes available for use with its standard POSIX
> > meaning. Obviously a huge thing to do, but hopefully most direct TMPDIR
> > references are in core or bitbake and used for deriving other standard
> > variables.
>=20
> I tried doing TMPDIR -> BB_TMPDIR in bitbake and most places in core
> (there are some places which use TMPDIR in the posix sense), and it
> seems to build a core-image-minimal without problems.
>=20
> So it's not impossible, and one could prepare for the transition by
> eliminating quite a few direct TMPDIR references using already existing
> or new derived variables (e.g. BASE_SHAREDWORKDIR =3D
> ${TMPDIR}/work-shared), making the number of places that would need
> the rename rather small.
>=20
> I'd be happy to send such preparatory patches, but it would be pointless
> if the community doesn't deem this to be a problem worth fixing.

I'm not against the idea however right now, we have several other
ongoing issues=C2=A0and the feature freeze for the LTS looming one week
away. I'm struggling to get the intermittent failures in our automated
testing under control and this particular issue doesn't seem as
pressing as others. I feel like I'm drowning with different problems
and adding the fall out from this change isn't particularly appealing
to me.

The change will potentially have huge impact as you mention and it
needs to be handled correctly.

I've thought "tmp" was a bad choice of name so if we do this, we should
take the opportunity to find a better one. The first step would
therefore probably be to get agreement on what the new name would be.

As well as getting the general community buy in on the idea, we'd also
need to agree when we'd try and make the change.

Cheers,

Richard





