Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FA0C44524
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 06:24:28 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17906.1784787859992227328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 23:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ule+wP+n;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f7444576cso132529f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 23:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784787858; x=1785392658; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lluZ4v+3llFzby/egPYQvmzVN8DJ9iA86V/11Vu9jsc=;
        b=Ule+wP+nLnnT3xQXRRj/c0feZNQ+arBggjXIOiCg/tNP0KsOgF3AJNEJeKxj0JSoxQ
         pW9C1htXNan3f7DvFnUDY+yP6z46KG/R7yTh/b54kxUU6YdCwZYUjigv+QdTBqVT37S8
         hoJ4LXuGG9hH+y9eNb1jMIy5LfP4kl7mOpW6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784787858; x=1785392658;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lluZ4v+3llFzby/egPYQvmzVN8DJ9iA86V/11Vu9jsc=;
        b=Lqb7EijhwlFviQCTkGd65C313palUBN3UcH7sFt91IkUVpV6MQGVmtsarMABMUbE0b
         kHc85m0Ri3JWYTy3IfBz+ZU1SRgJRLqaScl7lIME57aWbpJTGulOyaia1JGQ3Bi3CMCP
         1/z3Dk/FE468HOtRoYcMj4vYt7fgsFZ9eGpMW0Qcs4baX/9epliqwl6Yf8cUVuGDWleC
         vWuwlLfM87ZHviBBobF4nH99QPdgnAiRmp7iTsnkbrDKA5Pr5rObKN+EWzhGU6Lgi5Rn
         e8GcMxwEXOqg/aS9EM9ffYdDAkBVw0WM5r9V+lXJC4QNJSc4FIRdd2XJkhvNOkEiQVjn
         5kuA==
X-Gm-Message-State: AOJu0Yw6+P3eJty/mWdY+ue6rRBhCvQ3rVoalmWHh7VS7Fyai6GXxek9
	uOdLp4LZkbG5Jh5/plWg+CDT4fMZcdi6RTBiR/KV/ZYdvq4sppyb7dylu3pI/bNo20o=
X-Gm-Gg: AR+sD13WPCbm8A23lnor6fOKCdDNrJhUBCezxK6V38Dbil5cBXn/mXpO8g6bQd+g9I9
	WjuWMMRtM53a4wk2xGai7lXIgHB2l/Ub4S0Q0KYbgPDJf8WnDfYK3mNCd5p+huBLkFtpfgb899N
	njSkFpAch42wAJhtYtYLQalCsg2iIXq0QKNPn2RXOEpNctXJGbKpl6HcxxW8H/Y7pyLrwQGGeDS
	R8993j8K0Ma4jbk0ppUTmI8VFjC/Swa4tBh1Oq7UOiHxgnsTIpgXJpHZNp34+1M1+2KVY8/NgJv
	8FHxapQnAQ53tHCPVcc4x6/99aFPEPhjk9GVqsoxVE2vDSQmlLKDGAvpeIS4xNk2rScvv3DPI+N
	KY6kMaCxN781FvpAuk3rN9P8UiyBLhAwnX2Up6h36ifpNtl1hiO4LpSVuraUjbJ/pOx5EEPX4bR
	QV4CdogWeU4AknZjf7mXKjKXzSBoMb6X7KH873+KkpIUT5PCiCdTkrgTBx91IYSu41tSQ=
X-Received: by 2002:a05:600c:e558:20b0:495:6f6b:fb75 with SMTP id 5b1f17b1804b1-49573d21858mr9644415e9.38.1784787857921;
        Wed, 22 Jul 2026 23:24:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2205:d253:2df6:b9d5? ([2001:8b0:aba:5f3c:2205:d253:2df6:b9d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b5c2108sm188713885e9.2.2026.07.22.23.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:24:17 -0700 (PDT)
Message-ID: <c0b6580923f58aff444ea8c9d25452d30cf638be.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/6] kernel-yocto: stable udpates
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2026 07:24:15 +0100
In-Reply-To: <20260720155842.569263-1-bruce.ashfield@gmail.com>
References: <20260720155842.569263-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 06:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241776

Hi Bruce,

On Mon, 2026-07-20 at 11:58 -0400, bruce.ashfield@gmail.com wrote:
> Richard,
>=20
> Here's the latest round of 6.18 -stable updates.
>=20
> I'm in the process of updating the -dev kernel to v7.2, and that will
> be the release kernel for the fall release. The plan is to keep 6.18
> in the release and add 7.2 for those needing a newer reference.
>=20
> As usual, this is a single series spanning oe-core and yocto-bsps
> to show that they are in sync. If it causes problems, let me know and
> I can send separately.
>=20
> libc-headers will also be bumped.
>=20
> Other than that, this is a routine set of updates.

Thanks for these, they passed testing cleanly along with the other
kernel updates and that backport so they've all merged.

I've high hopes for the backport as I think we might be able to fix
three of the frequently occurring AB-INT issues!

Cheers,

Richard

