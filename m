Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1907D206BF
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:35:53 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.44503.1729154150228213426
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kjLaZlxT;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb561f273eso6392411fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 01:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729154148; x=1729758948; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HKP9G7yOwX8VPlm3CA4nj/BURLzZsxSx2Dut+szeRQA=;
        b=kjLaZlxTQzGJe7oMSuQek3/V02P9PolmfhXYR3HzT2Ej55eOlr86gYJhi+2eDBhBFR
         JrgIMPwONOBJRbEJkpZMn1hjtMMbnieLk0Al7wbMpZFohNjuZ4xVVtvS7WAV/UWDzgiQ
         HkxLfWAAoSbu/ksccQ8onjAJAwdPiC6ZL3BpAGk6NzJYtRLes7CYQnxODXJaARLn2AMw
         8AnMWE0p5u7tbhxLc5Om7Tq0FS4Zc6Qv4hRS9IsdQYQosvzI2ERPfH/2YmYSIk4EGLzb
         B6Oum2+wSadSy5C3jWSAbDUp1HxRc8dQbDafvdfSEl7hEgYQqJ/ZxsQgTUrNAe/7eAPl
         0Txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154148; x=1729758948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKP9G7yOwX8VPlm3CA4nj/BURLzZsxSx2Dut+szeRQA=;
        b=DtOfVGSPdMRKmSBK4SUBzD4s+5S0Gbz08htM1GiH9TZ9P5NYD8n+g/Rwm96YN/E920
         CRAk/jTjgPQlfe2ljw1mmNQqIbc9Vy1Lb9lZWZNQ+Anrb0TX9KchmCrdwhw8HJRm/BE4
         TcZWstCpQPqv/vXR9SxQiLnocgRKm02hglm3LGkbJxTc2Rgpl/B6uuq2w/nbvBPIxCLA
         /rXsgeOpazn7VhwntSEdH5Efu9Y6fEQGl2Zgt+CTeURehTBdlecSt7l3XYB3E0pQtOW+
         o5nXaxEDPjZ4icGCi2uUNnmVtt7fXLyteBf5qG5HuK8XBm1LrJT6VPWkvdVJJ286r1SP
         givw==
X-Forwarded-Encrypted: i=1; AJvYcCULmagVufJKFo3FNfOsdg3+5YmLCWE2h02j0Q8G1jjpPShSCWd+KhpnMAS//E1wuwzb/Nmn265DJvhQYVizx0vhsQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzcGD5YkJZCJLaO1UIk+x8vtByJto3TP6ur/Pjv2Xqhf5u93WtD
	bNY7eT8tUhebbBxYHVYBg1WpoblHRGmqNTW1EXNNnpsVO/iAsEKj+ydw6AEPFiQGynWzox5fSce
	Qr8WiVIuB7gRduEJDVvIQKIZeiireTA==
X-Google-Smtp-Source: AGHT+IG8gVb69Xy/IzLcOcM9/kSy4yzUbKecIURG39QekLAkyDWsW6rr5V8h+byA9H4RoXgRvx2w8V3+vYX9rfrYMro=
X-Received: by 2002:a05:651c:2127:b0:2fb:3d86:d930 with SMTP id
 38308e7fff4ca-2fb3d86db09mr81154041fa.39.1729154148161; Thu, 17 Oct 2024
 01:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241016193606.3459951-5-alex.kanavin@gmail.com>
 <0101019296e6df50-cd055c80-c39a-4b12-a39a-bd4b43cad4c7-000000@us-west-2.amazonses.com>
 <f71e16dc-95aa-4839-aace-db2fdaed0d37@baylibre.com>
In-Reply-To: <f71e16dc-95aa-4839-aace-db2fdaed0d37@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Oct 2024 10:35:36 +0200
Message-ID: <CANNYZj8ZtaipnwJ5dFq_qDf4-D3PH6RtMDDUy9mcXkAvN649XA@mail.gmail.com>
Subject: Re: [OE-core] Patchtest results for [PATCH 5/5] python3: update
 3.12.6 -> 3.13.0
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: patchtest@automation.yoctoproject.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205989

On Wed, 16 Oct 2024 at 22:41, Trevor Gamblin <tgamblin@baylibre.com> wrote:
> > Testing patch /home/patchtest/share/mboxes/5-5-python3-update-3.12.6---3.13.0.patch
> >
> > FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> Hmm, another false positive for this one. I'll need to investigate this
> one...

Maybe the check is simply case-sensitive?

Alex

