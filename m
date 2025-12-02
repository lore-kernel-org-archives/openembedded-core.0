Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49EDD116FE
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 12:02:00 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6243.1764676917083358541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 04:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NmUnH2yU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47774d3536dso44054495e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 04:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1764676915; x=1765281715; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RiwWcYInXxqMhKWe9JtgaNWZgWHBXX5DsWxwPVfDo6w=;
        b=NmUnH2yUlihCm2KaZlOwnYTosF+bsCeHCJwnKkXrXk2h4Q5Vgwg6syiiH5RURHK2Qk
         JxH0Ee4JF1je8OzrAFM5iayGXVc9E/66W4ukREPtJWF5mJo+TSLcrzhQptcv4Eft8xoy
         ax32AZc39HYOvc6MXkuupK8xXNjAj2Li4P4/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764676915; x=1765281715;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RiwWcYInXxqMhKWe9JtgaNWZgWHBXX5DsWxwPVfDo6w=;
        b=DXDyCY9/+ctdp2OcehPXSstTt27d2IWh38j50TpwD9qjYgKb2OI/rMGK8butAtQqkF
         Sqhs4rRfHyHhy3COEfexMuaFsJZfWAHPol248zlAsRNlQSscNBWmkvQY0qC9oQbjTyHM
         UOPo5NNxZ8fyBWChx2wefxipJTaK7XxpqWcEnFmGm7zAUjlwjvLZ3ibJbOcoo5h8m9xl
         1TXjIetyRVcfIkC//V8ZbeqT7rjIdVgzKd+CNmyeo5JH2slXvTVr0bXX56qN3SL8bt5l
         4HEYQKhusB/Lhyi2Z1++++VdWsHb9sZuW85OQ9iyvxUmGh5uIcCaditx4XD/jdbVrQS/
         Ljrw==
X-Forwarded-Encrypted: i=1; AJvYcCVFV//Vx0NOmvruP/1RP2AaadGQheZCi6hUKGKCx7fgOLr09bYx7pGMBrqhev+AjgRnaL08qyXxXfX5vgfM/oKBSA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwHKYFipur+kE+NhXo1ZzY8dOEnpi760IlQs1SCCNClJjT6Qv9E
	2HwUYQ+i8KVjpNFd5OnPfuJB/SwGJt707I4BJOzA/kbmji6TvP4nnsgEwK115V85bAQ=
X-Gm-Gg: ASbGncuCPaj/QsqnKfADMrW4ECGNHwRx6LLYn9Tou/GAj1U9rwtjoC5JcLWqL/ndmn+
	2ICBq1NkLqAWzXyYEgLST/AM/PoQQmZP4ASgOKMD6L2v68Dx6UdYf8ZsInZZdj3EngFWrMOMxl2
	M9BzAJ300u21avoFVb67W9Bi5rGh/cW5+Spa2fTJT14aZpMC4j12VpqSz93Wxn64tAojUsHIipO
	mGt0ODlF07HvQisULGFhcHzxyM/nL0CnfydomXRmTnpOgIUXQ/6dpvX+kW4rayf8DSt7Q01XqAT
	0W9WjZ2xD9ZkrdQU35plVMBO7e8nVbjP8x/d3eVFJpDyyEOcB342RURUaoGyxv/0WVtzJayr64+
	52S3RSwGXC2R+t1l0qX+t2Nn7znrWhRmkXtakrAHFO+VYBCC92SctAtPdEINvIoOqA7i7hFVXKR
	Seap+/tI6FJEs9GvxKsRBlpEr4sEcvqDrQR20YZsOYnDC+Iepff138rHfVzh1zoLGZLNkiFGWm7
	5iOaej34GbpvQ==
X-Google-Smtp-Source: AGHT+IGb5sGowVYkhYXKAgdMChfkvfz06e4dp7Lm0NGI3adfvTp07jOK5/Q99qDuJhUIwlNADSxoYw==
X-Received: by 2002:a05:600c:1c9e:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-47926f80703mr26873235e9.2.1764676915400;
        Tue, 02 Dec 2025 04:01:55 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e6f5:c2db:4a3e:b000? ([2001:8b0:aba:5f3c:e6f5:c2db:4a3e:b000])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792760e31asm55293595e9.1.2025.12.02.04.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:01:53 -0800 (PST)
Message-ID: <e48f35c8b286c03c0e423ffd5feccfccc995c282.camel@linuxfoundation.org>
Subject: Project role announcements
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-architecture
	 <openembedded-architecture@lists.openembedded.org>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, bitbake-devel
	 <bitbake-devel@lists.openembedded.org>
Date: Tue, 02 Dec 2025 12:01:52 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 12:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227158

It gives me great pleasure to be able to announce that we have filled
the two recently advertised positions.

I'd like to welcome Paul Barker as our Ecosystem Engineering and
Operations Lead. Paul has been around both the Yocto Project and
OpenEmbedded for a long time and is a name many will recognise. You
will start to see Paul helping out with the day to day running in
various areas of the project, giving the project some redundancy and
enabling me to take a break too.

I'd also like to announce Yoann Congal with backup from others at Smile
as our new LTS maintainer as Steve Sakoman takes a well deserved
retirement. Yoann/Smile have been doing great work on meta-openembedded
with our various metrics and tracking tools as well as being active in
various project meetings including bug fixing so many of you know him
already. There will be an transition period as we transfer the role.

I want to take the opportunity to say a huge thanks to Steve Sakoman
for looking after multiple LTS releases in a careful, considered and
smooth way. I no longer had to worry about them, I could just trust
everything was being handled which is probably the best way I can
illustrate the job Steve has been doing. So a huge thanks to Steve, I
(and the project) really do appreciate what you've achieved there and
you set a high standard to follow!

I also want to thank all who applied for these roles, there were many
good candidates and the final decision was a tough one so thanks to
everyone who applied.

Cheers,

Richard


