Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6145FE7719A
	for <webhook@archiver.kernel.org>; Sat, 11 Jan 2025 18:46:38 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.21722.1736621189510693856
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jan 2025 10:46:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G6nhrwsW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436249df846so21872825e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jan 2025 10:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736621188; x=1737225988; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=88RAl62RnlqFOtWVSGB72YnZdyjlT8CuqwjZnpIwKeY=;
        b=G6nhrwsWMLlvBlUWOuwRTkxxBeh1CLOLwR48/vTWH1UU+GJz3x1B9orYEXhAcQtLC1
         8Y8LZUuHDrf6mHMn+uQ6B5hhRnV1e7p89RP94f7kMav3djaysOiYS7adOub47RpAao95
         P+t8P4H4zp327rsMvsJ0tETsMICF1cDM0tFXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736621188; x=1737225988;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=88RAl62RnlqFOtWVSGB72YnZdyjlT8CuqwjZnpIwKeY=;
        b=jZ6Alc2ikdSB2eOnWKlzttc/wMj2i29AvCJwy7wFyKZAztjmmKtmYSG/mB5rnqbPRQ
         abDNDIyFvUurO0+l/vmv6DMgNaZ8zDZQdTlAElg7BZ1nY6abyjaWAacIqrpj0Aqp/+YJ
         tkCKFQkvIbcZS3huzMOPWjUMszlMJnaWIVyKuQQ7v5VEMDZ7J0kE2ER5tpr3iTQ43WmN
         wGKqnZq5ddQcL0+wHCOir0TmxmUsyBnjaUANjqd62jczYOcJVASl5WdQmbGSG0vmmPPx
         QQZ155H/cHiJSF6MCizBEFMGaHcAKRccyCH8hQbVuwQGSYxYu1PUgoy08IdBWod7NcbO
         yZcg==
X-Gm-Message-State: AOJu0YwJ5WAnaUQ0uoAqmG1LUvAhXp18y7rDWRI20GbT7wmuSskoK7N+
	H+0SH440m2OfRfLCujy49xY9tH33qCfi+RMqm3OLDtonF+aMA5GXGfydCFi/A5wqWMLsq4SLYck
	5QC4=
X-Gm-Gg: ASbGncvs6bs8WAy4T1DpMWEXEkKOJx4t3Qe40ga+iQeFD3mnbegeTH+oDDVk5bq3frP
	z9hsdptibkayvCOjc4T0ESun5I4OLkVsDojV3WD+wbpO+aFI0hdv82Duujo0wD+WLJXtas2eErx
	qSNGFjhGhLnD18B19GwDfgHnHwax27s3quWNihlYduodcorPoB5jYLKmnSOxKCmJ19p5DyycdME
	fhorGrVwAsfVF80I3Etz5wgLKLLoRV1WbB4eVefT155CPPy4cKSoHCucn/e+ExvYAPN/uQaaKQZ
	+wlLtuFtMy98ExzA9KB0IbqLTRYqkzqmcfQiwEWnhJhlWw==
X-Google-Smtp-Source: AGHT+IEwsVsFVa2wGO4wuEoiFzITW5pQ/7L/q9VcMY2wPOnMgxqDNRJwTA0Shwy4RPq5OISf9o3mRw==
X-Received: by 2002:a05:600c:314f:b0:435:9ed3:5688 with SMTP id 5b1f17b1804b1-436e26a1f79mr148366025e9.18.1736621187922;
        Sat, 11 Jan 2025 10:46:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2dac:67d4:48d9:fbc6? ([2001:8b0:aba:5f3c:2dac:67d4:48d9:fbc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436dd11d8b4sm103439405e9.1.2025.01.11.10.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:46:27 -0800 (PST)
Message-ID: <43c8d8c9516959beb23e263acf89cf013f2052ca.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] classes/qemu: use tune to select
 QEMU_EXTRAOPTIONS, not package architecture
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: martin.jansa@gmail.com, ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Jan 2025 18:46:26 +0000
In-Reply-To: <CA+chaQckoaDTGVik=PW4FtnK1_qjdVLJhd+2AR6_az3vphAtEw@mail.gmail.com>
References: <20250110130116.894607-1-ross.burton@arm.com>
	 <29D20DF1-96A7-4A24-B3EA-8252C23D15AC@arm.com>
	 <CA+chaQckoaDTGVik=PW4FtnK1_qjdVLJhd+2AR6_az3vphAtEw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jan 2025 18:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209673

On Fri, 2025-01-10 at 18:52 +0100, Martin Jansa via
lists.openembedded.org wrote:
> Too late to easily ignore as it seems already in master, e.g.:
> https://git.openembedded.org/openembedded-core/commit/?id=3D5e14a1b26cc77=
b35c3e36869021afae9455bb1a8
> or do you mean some other changes?

Sorry, I backed that out as it wasn't intended and there were issues
and untested changes in there too.

This series has merged now as an additional fix was added in.

Cheers,

Richard

