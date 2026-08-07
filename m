Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9459C5ACAB
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 21:24:02 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52543.1786137835254988436
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 14:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KzGid5YE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fe89fb333so2380332f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 14:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786137833; x=1786742633; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=opE5SP1JnXTnx1bBzCGbiaegH+2XZT1TvNA2ocEjr7E=;
        b=KzGid5YEel/emS2zUQw21OU4XPvjTcXaUfdCEdY8VuiM0S46phRWuyM/2JgarzEcym
         v1f+MSTNYuogpIu8VOoRIwOAPSFh9GtJhMrdVmNU4qA19mfnTfcteJH+zEu+hl1lH7lo
         BhQyJZxs98ElEzeU9oL8nduebKph8h0Rbj4NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786137833; x=1786742633;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opE5SP1JnXTnx1bBzCGbiaegH+2XZT1TvNA2ocEjr7E=;
        b=RLjxLcibLVlqRH4jQFYNe+0xIFGI1TfJOGavNO2nuCOn08eKtTZ30k70i1lVMt/br7
         Gc+ImEK7t3UnLTsDbghzjdS0RNKAzOsodwaotZB+ZekQB6X9e7qTGLVbA0DAIJEUUW57
         tersjEad8bb9pAlCPzBLekCuxCS16cP08IqTK9Zg03E4IdaY1ove1ZFBjVZ4N0m27AKi
         x3D+HCLsoTbiT6uKMOpRiJQP9pdBUJNeZ8kNsTMQpC/eCaoZghIabGLPrNX0KmrqVoXU
         ENtclDUjPfUj+S5mPcZcm34dr9QHAElfhmdu2dOI+eyq0mxU7JWWIdBtX9rYsmbm5kwj
         yMIw==
X-Forwarded-Encrypted: i=1; AHgh+RpFPpaH26se6nDJ3uMtLi2DO8U++sBtqg8P7g6K0h/PPAoqy/Ejhyyn6Ccl1fGJVs4uqdclFHKqSA1WblEszhr70Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwuzEJ9GvVUdni3zDl1nZd2Yr166Z21JNbTZA/Op29bC03e8yvH
	+V6DOQHJKyA1ECr03IZck4uUeam0+WQY+SjlaQfeGsXTxN5jJM3B8o6HWh9MXz2XshA=
X-Gm-Gg: AR+sD12DKzNwiIvhyNsIy1jSyPyRY7zepVSSzMHtnUH1x+4xg0QihCkYLsDFimUng0c
	ZGfaup/1VGa78L5YFgW7yO3EgFaLKCrTKyehpTKj4npKzT5/C0SqyxKwcSvnnB20Us/9DjueP8P
	roikUKVNM1e17NjZkW6cceiZTO71F3gtJRBjW5QD3wc4y8bqgqcRTjVsat2EkZioRuDoq1vharG
	pmz3fHZDk/h0+BicZLJITjdTNM8gSQX2WMwZjZQAEyFJXSlP994X10p+S/NXcLmVCtEUQMJWPm7
	Hgb0bYGLYY2HGGG31/f/oGe7lq/J5H+lc8DEBnXyrzAlSMJcynY29PagSzNWcbP/9kLEdC08Tj6
	///X/nrJWkiZksZ4vzzPTIyHYD5p98kRv7cQ0ryAS0BUmJ/S8VBeY/x1/A9EyeAC38DQknu5NgE
	0B25BdzDZELpJ5aTk9kVYPpraIR4j233RF6I6L2C0rlerALbWTa2B6gIUUHqsANyayM31VY8Cjy
	gCf/bm2aFDwCB0ojHLi6u9gBOkO6gXejVcXnrEvK1azlzAJsRQPGw==
X-Received: by 2002:a05:6000:299b:20b0:462:e086:35f with SMTP id ffacd0b85a97d-47fec52b1aamr34005906f8f.21.1786137833346;
        Fri, 07 Aug 2026 14:23:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a6c5:6fc8:1801:1e69? ([2001:8b0:aba:5f3c:a6c5:6fc8:1801:1e69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm8242956f8f.26.2026.08.07.14.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 14:23:49 -0700 (PDT)
Message-ID: <c31ac176c2733e3b8e65d87ee03bf07a6c57116b.camel@linuxfoundation.org>
Subject: Re: [OE-core] "Checking sstate mirror object availability" progress
 bars
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: chris.laplante@agilent.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Aug 2026 22:23:44 +0100
In-Reply-To: <DM8PR12MB5430689E7FD5CCD1E6FF60AB8BD12@DM8PR12MB5430.namprd12.prod.outlook.com>
References: 
	<DM8PR12MB5430689E7FD5CCD1E6FF60AB8BD12@DM8PR12MB5430.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 21:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243028

On Fri, 2026-08-07 at 19:17 +0000, Chris Laplante via lists.openembedded.or=
g wrote:
> I have noticed that some builds cause an avalanche of =E2=80=9CChecking
> sstate mirror object availability=E2=80=9D messages to fill the screen, o=
ne
> after another, preventing me from seeing the more useful per-task
> progress bars. It also hides the =E2=80=9CCurrently n running tasks=E2=80=
=9D progress
> bar.
> =C2=A0
> This tends to happen a lot with builds that heavily utilize multiconfigs.
> =C2=A0
> My screen ends up looking like this:=20
> =C2=A0
> Checking sstate mirror object availability: 100% |#######################=
##############################################################| Time: 0:00:=
47
> Checking sstate mirror object availability: 100% |#######################=
##############################################################| Time: 0:00:=
07
> Checking sstate mirror object availability: 100% |#######################=
##############################################################| Time: 0:00:=
07
> Checking sstate mirror object availability: 100% |#######################=
##############################################################| Time: 0:00:=
05
> Checking sstate mirror object availability: 100% |#######################=
##############################################################| Time: 0:00:=
08
> Checking sstate mirror object availability: 100% |#######################=
##############################################################| Time: 0:00:=
16
> Checking sstate mirror object availability: 100% |#######################=
##############################################################| Time: 0:00:=
08
> Checking sstate mirror object availability: 100% |#######################=
##############################################################| Time: 0:00:=
06
> Checking sstate mirror object availability: 100% |#######################=
##############################################################| Time: 0:00:=
13
> Checking sstate mirror object availability: 100% |#######################=
##############################################################| Time: 0:00:=
05
> =E2=80=A6
> =C2=A0
> Does anyone actually find this particular progress bar useful? I
> wonder if we can be more selective about when we show it.
> Alternatively, maybe we can just tack it onto the end of the per-task
> progress bar list?

These things are tough. Some people want progress bars for everything.
Personally, I hate the complexity they add to the code, and that
they're near impossible to make actually accurate.

Access to sstate mirrors or hash equivalence can be slow and users do
need some indication of what the system is doing rather than just
sitting. Some sstate mirrors are fast, as it probably is in your case.

We do already only show that bar when there are more than 100 recipes
being queried iirc. I was asked to remove that piece and refused, for
exactly this kind of reason.

Next, you'll ask to make it configurable and go and cry quietly as it
means more variables, more docs, more things to test and maintain and
have break.

I/we can't win :/

All that said, I'm open to trying to find a way to improve the output
if we can work out the specific circumstances where it is poor and
there is something that isn't too complex we can do about it.

Cheers,

Richard


