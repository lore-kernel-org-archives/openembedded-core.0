Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF233CCD1A7
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 11:59:26 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.16363.1760961560061879644
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 04:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RItT7Ouh;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-791fd6bffbaso72383086d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 04:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760961559; x=1761566359; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hYT4JQ7TnOmszmfBmi6TzUIGhH9siYZhSlUKH9yBHsI=;
        b=RItT7OuhW9sQMHweee8OrlO5Kpo2htgKSlff3feDg2hewgt2rxLrS2ZublHOZzLKDb
         dMbHf6LaSw3rIbjpxNuCrDXQDmkJ5EU9XdpcdHV6aypPmFtEZXR60OnvSJohySvcnizZ
         XCfc69Uh5Fv+1i7ewXUj1D7zazfqYJmCwkeXAvLQw6Ar48YOJlciqsjbRV5zaY86YVN4
         uuVWmntKWi235Ao6p4eImB+81GUUx0r79I/0OyJBpYIUrngQGZtWyV6tSgjpDsMDRjgg
         VG6mYPzTcC8EGyNKRFewlxH0kNxElxCpMrLtkGl8qoJhIh8IeJHiB19zA0+acIRKxV2U
         /uKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760961559; x=1761566359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYT4JQ7TnOmszmfBmi6TzUIGhH9siYZhSlUKH9yBHsI=;
        b=Ew9tjr4XX22ZtQEmtDrtNnwK5oUmchRFQ9apRlcl6w1FFzpzqJv5gxO49LqGFl4QSm
         gbjT6OuodIP9gayYLpW1YhRVuixRNa0rYLaiBK2ww3QFkf9QvDFf0J84x0kziyQgSyPJ
         EbX66nrXPc2EYVSm9Pahr8QZD7HOozYRryeHeeztdikBnyoxduCWvViKVukeWI5H8A04
         1A9b+TP4HeXMJuyrszjAoQDujtdMeP6XL8787GlMIo6XEbcmZ7IVAPquOvm2W2hZalfK
         M+0Cp4m2/u0/ZSvr5fJAPqqXFZf0UquN72rt3quxcBcu60pkG0Sgp70IgODXp2RooXkG
         wKbw==
X-Forwarded-Encrypted: i=1; AJvYcCUlOXAqX74U2TKD727Oh0Fr8HICvHnMPFGmpEESXPpxASWDLTGxQB8HD0Vtq05jSwoj7mTmMKuor2vVqjjSluHofA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxd80Y5s6YN8bthvtjQCajr+6iJspDsG7UMBwT8hsAUhrJ5rI96
	jFnsjKlt59P6yqE2WGZYbmQ4MDpwZTepYm9ruT1IN2P0uIE9b72NsedRYB2iGW5/wWeDGrdT09x
	jzdAQHh/FSCxjY1leiCx7tCnEaIseLOc=
X-Gm-Gg: ASbGncuKaACIWkxqXNVNMGX4jwm8Ql3KBQKK3R5/Lbqf7K+L+EncOPbNUJUhyY0/ODf
	RekKWtlQ0Vudc1Gi6RMLa/HB9eUgPq+Rjyy4Q/Yzue+XJXVQdhG46Tsf+qH+WXwQGQ8oSNoMYZp
	au/j2/ESimJusoTTB+BRdFTX2b+vdxH28bifgDqk/kQpNUypn+X9kxMar0+RMMx1pREQTuum8uq
	Wdjn0ag71GCwmEHhpzFP+CObxfTIcFOgqTjah+mDxZwDWrPA1lkVIVM64dp4Hx/VzvmQ6UvdZCl
	rwT3ppTvcZBujFyui4VKerlYpPOcnmqga6HOoiVCEAo69pr5mVQHTgCsx6QWshR0EmHWSutIkg2
	5UaHVWechebeqQwBCfrhO5JbGo4AZ
X-Google-Smtp-Source: AGHT+IGqZGNHGFGPUjetBmmj+ulVwSYsNgIkXmp7EV6VJvXNqagce5RvTzlmBcEgq6i5DKujKWtCQzQPv+ks80xNkS0=
X-Received: by 2002:a05:6214:1c85:b0:87c:1e27:f7b4 with SMTP id
 6a1803df08f44-87c2066890fmr163417656d6.67.1760961559076; Mon, 20 Oct 2025
 04:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251016084700.1537381-1-Qi.Chen@windriver.com>
 <DB5PR02MB102130824E86A46D0A830FB03EFE9A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <a7d6a359-5a4d-4314-939f-3fa97627bdc2@windriver.com> <CANNYZj8i4ksk_8kmDjswjA_pvQw-cCg_jOOCh47PYDu3TXw6Bw@mail.gmail.com>
 <6d4ae9fd-b708-4b22-a170-68af462a7b39@windriver.com>
In-Reply-To: <6d4ae9fd-b708-4b22-a170-68af462a7b39@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Oct 2025 13:59:08 +0200
X-Gm-Features: AS18NWBqMM_aGMwxgMD6WsPlFhPsMOZrdkNN7EYMXvg7ZyI0UX_vMaCSeiVunFE
Message-ID: <CANNYZj9mm4MrgDbfep8m_EW=cFJP1wFrJ9HKHr5kX2gvGbq2ww@mail.gmail.com>
Subject: Re: [OE-core][PATCH V3 1/2] base-passwd: add clock group
To: Qi.Chen@windriver.com
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 11:59:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225115

On Mon, 20 Oct 2025 at 07:14, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> I also checked base-passwd upstream and debian:latest container.
> base-passwd upstream does not have clock group:
> https://salsa.debian.org/debian/base-passwd/-/blob/master/group.master?ref_type=heads.
> And debian:latest is using systemd 257.8 so it does not have this
> 'clock' group issue now.
>
> I'll use gid 103 in patch V4 to sync with fedora (though not necessary).

Thanks for the research. I think you can simply send the patch
upstream to Debian via a pull request?
https://salsa.debian.org/debian/base-passwd/-/merge_requests

Alex

