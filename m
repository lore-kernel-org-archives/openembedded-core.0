Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348B3C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 11:04:28 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.5679.1750763063497800580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 04:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PUck22i+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453608ed113so45646755e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 04:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750763062; x=1751367862; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YI2lhRzR1ZrBzG4yVRj504lDNJfVGICKCOd9MxMyur0=;
        b=PUck22i+XtIm8sPWyRvkd+88c2ahf/YCGTCgiJ9jySbVRDmeoz8IlQAK+2883rlF4H
         TyUGEoj1WljFIha51vtreW/dyusEeYPSMrreZof9gYo0TdXOcmD/Lw5umqxxwJ69TAOY
         y7/aI9NrwRxeNupzeIE+ReQsdGKIhRFfwlLwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750763062; x=1751367862;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YI2lhRzR1ZrBzG4yVRj504lDNJfVGICKCOd9MxMyur0=;
        b=hbg9XY4rwxjKT7lyZa0DN69fOtrzl/4g4LqRb9j0hG4bIfVyjJDkV51wjKCKKWkQw/
         +wXr5GTReHhKEYoj6O9K85bNdyf+y7q78M3xTRUTGUgRwYQwEI8nh35X2W5TqLjE6lRw
         EvuA/9G5ob/gTLetp6xEkPNFJzlHDR7l5Mhr9ZZjRm+e4WjH7HHq0WxFb4cDJg4mtCg4
         JwfAEM2O0A0GRaUegmHGZhLIKnyky91yUhUx0f5zUdM66arrgo6IPGaxEd/M667UVDIJ
         yIZk1RSHvQYDRDva3ZjafbzbngD6yOj7/kee6a7fONGV8WwOszmGsLIqnq8o2YDtAllB
         1mFw==
X-Gm-Message-State: AOJu0YxZO2bXZsEOcznLLn7fkDFlJ6mjMHEcOHd97sDA68BdAhVCz87/
	RVwwLx9DtfBl3SpQL9dTIuhwugTgBEPzfL2WNzpeuyEnGUjqBzuLbxf4XjOKQw+rQnE=
X-Gm-Gg: ASbGnctemqXgG3AC9urSF2gzwATKocflNmsejA1UzvtiB5MuCNiDVvcs9us9NR5NnS/
	TMX+LJO1sTDLizim+ZfpVPU1CuEDchH9WZrkyGC6ycdP/+32o3pE5VQ3a+Jp1gNr2VQ0zU+uoto
	r8uFQoFMVp4phSn2Iq9e5T6bKojN6TPva4TE/iVC5SpCKiEndajwv8JJc8+sri9PFGIq1PzJhUp
	qFbpAt3tlgSgLuANgG+wJf9R74ATCn/SNfcW6uCpZ8KK6YKRnvXCknL4j3AFcFSpmIV5QTGAyPX
	pQncfoq2wqxZqKj0+BVA8eGSZn2asYi2FzWqye50GpqctLwAypMsTLvKyAIEL/W59oWybK/jt+8
	b63QpOAHRpySdYazdRmX1lNrpIWZatAnLEoUOQCiM+OikMglf/50=
X-Google-Smtp-Source: AGHT+IH0vdJghJlx7VmhZ26Sj04rx5u4XRULm8Dew4S/tZmz/TejFW+CiH0hK9o4wBPLdB1ibGBYMQ==
X-Received: by 2002:a05:6000:2308:b0:3a4:e6c6:b8bf with SMTP id ffacd0b85a97d-3a6d1325a45mr13127059f8f.52.1750763061829;
        Tue, 24 Jun 2025 04:04:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:341b:1360:3bd8:8ecc? ([2001:8b0:aba:5f3c:341b:1360:3bd8:8ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805e0fesm1657535f8f.30.2025.06.24.04.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 04:04:20 -0700 (PDT)
Message-ID: <c92f23bb010974292047071e680b9b78e7800536.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RESEND][PATCH 0/8] fix runtime versions
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, yi.zhao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2025 12:04:20 +0100
In-Reply-To: <CANNYZj82+jT8iUCnSdXdD17hGf_O0b3iXzFhxx+mHGcdQs6L-Q@mail.gmail.com>
References: <20250624104155.559827-1-yi.zhao@windriver.com>
	 <CANNYZj82+jT8iUCnSdXdD17hGf_O0b3iXzFhxx+mHGcdQs6L-Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 11:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219251

On Tue, 2025-06-24 at 12:50 +0200, Alexander Kanavin via lists.openembedded=
.org wrote:
> On Tue, 24 Jun 2025 at 12:42, Yi Zhao via lists.openembedded.org
> <yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
> > This series of patches was sent in April. Ross suggested discussing thi=
s
> > with upstream to see if they could update the scripts to address the
> > issue. I talked to upstream and they declined because they believed tha=
t
> > "autoreconf may result in different built source code than what has bee=
n
> > distributed"[1].
>=20
> Is there a benefit of carrying these patches in core to the broader
> community? I don't think anyone's particularly confused or misled by
> 'unknown' reported by executables at runtime, we have procedures to
> verify that what we build is exactly what upstream has released, and
> various built time reporting mechanisms to see the versions.
>=20
> Wind River obviously has invested a lot of time and effort into this,
> presumably because it has a paying customer that is obsessed about
> what executables on target say, but I do struggle to justify carrying
> and maintaining these fixes.

I guess it raises the question of patch vs sed too.

Would this be more maintainable if we just had a common sed like
function to take these out of autogen.sh? If it breaks, it isn't the
end of the world...

There is the advantage that it is relatively standardised.

Cheers,

Richard

