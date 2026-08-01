Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435BEC54FCD
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 07:55:01 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1360.1785567781290039107
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 00:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y77L7sVN;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: collin.funk1@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c96c92c0980so1002420a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 00:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785567780; x=1786172580; darn=lists.openembedded.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ptYeg8/9H/tRWHtpa73hv3y7XpXteCBFmmud/u3O6z8=;
        b=Y77L7sVNL8ko5sBBlApuR//HUvMx3TwfYdXOE9Tr7Kiz9BjS7vGREQEhN0HC5jbrF3
         6KwjdpcwgGErJRkmg+IB5h5dbyFwPkLTlw8liJkYIkFxYjSKcyZRUZAdAQ7/QKGVzRaQ
         fMCxhlugbndwK+QcGYL0f4ApXY02rnhq9hDAHJc7I81bEahIS606WgIB8BWUccDKcvnN
         CQuan5PYikEaz9oGuRkjHYDvy1G+MCLa6Pd0/unvmmdHA83+hxtWf655MK4dZt7t7f01
         ohSmgA7yjGTI1RHZqQGOpeEd+2wbxEMi9mje+DpM9eEwqsB6a/QmRzdz6n1KMLUFXb6B
         5cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785567780; x=1786172580;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ptYeg8/9H/tRWHtpa73hv3y7XpXteCBFmmud/u3O6z8=;
        b=Glt/Eo7ifHK8MjLcoReB5GV1Alttp8ViPWOBPAP5iGfAgZm6YpbT6FoWPC/ryIyDp3
         Vj+JVGZs8A+S5anICScZWBtiOKVg9zFQqupLba6fSAy7D9KRqgr218tJV0Nf02RnQy/N
         uiVB8xUvNhCWjmRJagsW1dfgTxqCh3DmnIdglD9sqb6ekz0fPy8JYrWZajQbz3uOrvYs
         oI/xdl5/SJ9PwxAVE+EOM+8O0Crcm/WdN6X4QLtrikAstmhoVtKuL0UcXmNuvQl5r6NJ
         5dzhQ/iID9VqKbGyTjQ/2PlpuaqtTAc8tqCnB+z171bGojEuHhRyiVcuYbHkYu8irvHQ
         6HMQ==
X-Gm-Message-State: AOJu0YyJ1Bi0rTm5jE8ivR+u3hGwgWhsBjZH90oMp4gh19cKAAvtS7a5
	feLrHe5ZfizK6pA4vfSN8n7qfAl5wj8M23TE0UCgnd/y3eWCwC101WUG
X-Gm-Gg: AR+sD13ToccbLFN3+qluS0rTXkmhzvLQns5QfWJhN4CT3mKF6eR8CaEwVU73rc/rk4O
	ANPxsANNKJV+9N9OxIYI8YMLoF+TCAeWNq37vsULKhhCk4fTLyUeMpYnku6Y5yPuSUjv3k7aMPe
	7vu56Ub8DvGjtBcTJIXcha2SB2iBg46yMUnHuVkEkPP5Y3ZRoXFNxqN4YxHwzhixPshmHxOeb4J
	R6weOklYUp2zIzFwHj4RHmORkwIz1Fp+7A/mVTVl+TrBmmbHE8magFBxcrLySxiO0WbWytfhMPT
	pubVvBV3HK0vSp8VGiv5tjKJsoM9IzFhX5B5vs3cqG6K/fQ+D1qCRECYg1nBRa6OFMDHslPN02f
	suJ+1j9GvivIYRVfGvnwk9z07cvU/Ur0tp/kekwEgKuVkdAfiHlgF1LHrnazO6RH4AUecVae4ks
	w7MOwjxYCsEWZaZDyRquFZCbiUfTLCDBid50Y24BRarysYFPhRuY8=
X-Received: by 2002:a05:6a21:1f83:b0:3bf:7994:ddca with SMTP id adf61e73a8af0-3c92a84deaemr2454016637.29.1785567780436;
        Sat, 01 Aug 2026 00:03:00 -0700 (PDT)
Received: from fedora ([2601:646:8081:3770::4bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm10982031c88.1.2026.08.01.00.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 00:03:00 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,  Leonid Iziumtsev
 <leonid.iziumtsev@est.tech>
Subject: Re: [OE-core][PATCH 0/2] coreutils: fix multiple CVEs
In-Reply-To: <f92d86a076733c5368cae9c94fb76a14cac2cafc.camel@linuxfoundation.org>
References: <m1o6fm66ok.fsf@gmail.com>
	<f92d86a076733c5368cae9c94fb76a14cac2cafc.camel@linuxfoundation.org>
Date: Sat, 01 Aug 2026 00:02:58 -0700
Message-ID: <87a4r6jpb1.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 07:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242478

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> Sadly, I suspect this is becoming all the more common and I share your
> frustrations.
>
> We have an difficult position on whether to take things or not as we
> probably don't have the time/experience to tell in many cases and not
> taking a CVE fix means we'd get beaten over the head with the patch for
> ever more as "there is a security problem" :(.

Perfectly understandable.

By the way, I suggest applying this patch as well [1]. In the 9.11
release, short writes could cause issues with 'tee'. It was a silly
mistake on my part, and cause SUSE some issues.

The patch applies with NEWS removed. E.g., like this:

   $ sed '1,49d' 0d6fcb99d691d920961938e61c43478566ef626e.patch > fix.patch
   $ patch -p1 < fix.patch

Collin

[1] https://github.com/coreutils/coreutils/commit/0d6fcb99d691d920961938e61c43478566ef626e.patch

