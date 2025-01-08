Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE805E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 16:30:22 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.24448.1736353819748500055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 08:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bjIT7Aa2;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6dce7263beaso59666d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736353819; x=1736958619; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8nFHNZ/C4bz3dl9T2ZT8l5PlD9xSf2Lyq/Fzt7PsyCw=;
        b=bjIT7Aa2K5HXgMAWqMpFS+5vLTx6BwvvDyIlw0DrmlQbjuGQJvVutD93+uG/QgZUBS
         Me88tOPGc+Z6PiiEYHRTmmK4C4YikUGzGNP+V/o4ZKgqJIIdCpuJFQeiRou4SzyBxfFG
         9brwAWYPCEEBwigyjUJe1vPL/C9gYWdK/cevSswwnSAdkKCZLSpuubMGI5NNItWH5/II
         mRlKHfTTAkWGwejj6jmnYY9PMlbOdv88uqJ1xxeC3+80pTYaxTdfCPgofamR0lkAjINf
         um3wMe6HBePQGwzG9CoH1Fs+o9laRBzmuA8lKBIchM+Tl1qx0na9jbxVAHmQ85tdWc1F
         oEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736353819; x=1736958619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nFHNZ/C4bz3dl9T2ZT8l5PlD9xSf2Lyq/Fzt7PsyCw=;
        b=QNv0EpQ56t4TmDmFZ7Xhj32KRS9yH2NSzLkhEzXBZspFxdUNhskrfVZqQ/PLmQGBzf
         SkIVgF//0AZCGLJbwZJ6rqlG2rO8MkEtjw+vt5UiRO6qWWzm5lCYs6fzyvrMCCkZUB6P
         wKEolemXWKVqm/GeqjV3la0VfwSli6ss59HVH24qJtKNW2EQA3qsUrfl5FmcxQwW1X30
         srk+SE+WwG3RjHF3uIr1MEUwcbyUqTYBsC2VuHhl8INBfG/XfmcPfwrULSDJiFa39EN+
         jKi5WL1sFtSql2x9JUuIGwckYktwI56AuRF6YSYWS4qwgG0RDnQLpUsHU2pPVK78bPwg
         KULA==
X-Forwarded-Encrypted: i=1; AJvYcCVQBQpwAC8Y0hlBU+HR28aGYEp1TDrNXMJDnKVwsQCT7lJHLYhiMdvgZCZ8EdUsM0oDR068gs6oOB4pEEes4Twr1w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+yEe65fqVriZKiDqyP5UVDUzaYN7NylEqMKGyQatTm28Nr4nN
	d+VtD5mXup+ewhK87tTYytWUt1FH2AO6FT0I4/Z8ZDptWfXZaPSmIb31qt0NSHzVBuWlXp2zShO
	zdj+aLfDuiViHc2iuGFMXFm7Tf0U=
X-Gm-Gg: ASbGnctf4LIsPJ27XkxptxDBTpljRzvqq3Q6k+hCpQxRWcUKIl3PJ/sxGO3YPFweQeh
	U5iDspyvJG6bWowfXeyomFZBr/nauO0xpMQW3iiq/71+bZiKZvWqsFkuR41PIJnkmZ7vbGebz
X-Google-Smtp-Source: AGHT+IGYrpxaX1/4JCICe2RYLQdR9XTYTtWD8LOAwrydhNTElSNLhiO/+iTCPHQjJM11Cvhz33YJvYtFePwufV9JB+w=
X-Received: by 2002:ad4:5943:0:b0:6d8:96a6:ec22 with SMTP id
 6a1803df08f44-6df9b210063mr51710116d6.23.1736353818775; Wed, 08 Jan 2025
 08:30:18 -0800 (PST)
MIME-Version: 1.0
References: <20250107203009.3251029-1-derek@asterius.io> <5f83f87b91961f4c1ba449029b4f904f288c3a6c.camel@linuxfoundation.org>
 <CADNbA1ojY=For_swJjC5SFRY3uRyayx2JAwNz=uBJ4GD=nhNyw@mail.gmail.com>
In-Reply-To: <CADNbA1ojY=For_swJjC5SFRY3uRyayx2JAwNz=uBJ4GD=nhNyw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Jan 2025 17:30:07 +0100
X-Gm-Features: AbW1kvaQ95JO74_Wo_F6gRFPs2zVMSQSI4HvGQasAAAkgCkNuSOSDnc349UJwV4
Message-ID: <CANNYZj-ubCw7=fqGKeNENh5z+gMnVJ6rxRp50EsM+gf6855e0g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/ptest-python-pytest: simplify python
 ptest file overriding
To: derek@asterius.io
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 16:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209580

On Wed, 8 Jan 2025 at 01:16, Derek Straka via lists.openembedded.org
<derek=asterius.io@lists.openembedded.org> wrote:
>
> Thanks for the review!  Yes, I shouldn't make an assumption about the execute bit.  I will send a v2 with that and an update to look at S or UNPACKDIR as the key to create the default run-ptest in the morning.

Yes please, do verify that overriding with a custom recipe-specific
run-ptest works (and bonus points for writing instructions into the
class comments about how to do it).

Alex

