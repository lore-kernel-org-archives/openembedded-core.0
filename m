Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227E3D24458
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 18:00:08 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50080.1764871199348016643
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 09:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=az+e1D/V;
 spf=softfail (domain: sakoman.com, ip: 74.125.224.49, mailfrom: steve@sakoman.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-641e9422473so1007732d50.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 09:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764871198; x=1765475998; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ1YD/T8CQETYECL4OHr9Dv9Wn8kSxn3Q97ioHHblH0=;
        b=az+e1D/VYiqrGbya6aR7khGGzAGT3zZEqgsuimhoqJPhyuD6nGc8RwWQZjO2m+2Ygs
         MBOfEuopqFZQdWIYc7IhwnP1egjLd64XzlMPt6QHux3jc6jsSBDezPA8ucicctbnBfhr
         zpc9bhovPq+yfskTIie6NQBjiYC7yMd/H9If4H/HoEfkJgzy8hOLHF5Wh5GEuojX7iPW
         opBxq9+0pEE2yEVbZq/9DymRzBQCngos4gWn9jZNonpHeV/ds3Qp910Xpz+rgw1tpeh4
         C0vrDmmDBXL2Ohi1roEatTXJSmwOBCsrlnre+84Rgwc4yEInB0W5+MJfdbA5gspol+/v
         mzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764871198; x=1765475998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AJ1YD/T8CQETYECL4OHr9Dv9Wn8kSxn3Q97ioHHblH0=;
        b=EYLPmSaCKsEP0T3x2QtWkl3FVN7OCLRK2mceEbi9CDmBjtUadccdOcIRp6/sAJgT7t
         OVVK1tkSLFyqF0jSrMZHHL5tuECg7faTvsJsDIqg6iMKTDKWppnqSFGNCxcMVKfVdSl6
         K5OBhO+CmugpELGFzqf4gVDKPdUguy6Szl/yortsLMfqtSTbkz2OHPM9zohv8YQapwPv
         /NwOeGcDN2tkRawDNh+kGurC3leBG3trrtW819MpMYsxvyDSQBsoauyg7jV7kB10/Q3t
         9xQf353UBDqDYkwnd0sFwkbgwln3Bazo71L0I5dWyr98g+KdVKawSCK+WeOsxxjX9fZf
         pGTg==
X-Gm-Message-State: AOJu0YxivXniFG5iLqaw75MDiaQ4CjriTUKsqFNn8ppxx55VvtmfWHFV
	7sySDNCtG+O52H97ArVfI7x5V2lV7YUZBf0Aoa6FkpgTpOeSxkw3W/+omDddA/sWnptQ+qJ5B7n
	JR9e+UGqUlBynac0WQQ1VEu0EcHwsAu/WGgAAuQyyAQ==
X-Gm-Gg: ASbGncu9fEXnDJO9noMlTOVb/TC/nAdUUBMak256BTCfg3JFBqWRVGW/BEg73yzC+//
	SfeTXF1S0e6K2nBUahJJTJga9MDj/Rx52pFO3LCVpCEN7UUMGY1er7UtAy/vaRB8WYz4okiE+lT
	t1aH1FiIUkw11KxupL5pFSV2YxwJJVxdFYQsEfyLWOJ/hfYUjAriTVXwcIX3DEw6P25/PYEToQ6
	1dz46HCGuCht4s8gjKsDye5Rzn5pYKEbigy/ajDtdTbFVVW65eJX4eYPrFgqRJIC9d1Z9/Rh5Ou
	uRQruoZ7Gw+ZzvlqCmTxzBQI4Bg=
X-Google-Smtp-Source: AGHT+IHBdowfV+VZQXCMz0UFgPWBAXOnlJirgVl8JBqZqyG4GB56Io1+EaRDpw5HMaACJ1GGUGuZAlvWg1QpjJWHKE8=
X-Received: by 2002:a05:690c:4a10:b0:781:64f:2b18 with SMTP id
 00721157ae682-78c1890f52dmr60868927b3.58.1764871198275; Thu, 04 Dec 2025
 09:59:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764713862.git.steve@sakoman.com> <ce604b9bf682e404baa15800fcdbc01abd6a66e1.1764713862.git.steve@sakoman.com>
 <b0caac3f-5a60-48e4-bd89-15fb3654a91e@gmail.com>
In-Reply-To: <b0caac3f-5a60-48e4-bd89-15fb3654a91e@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 4 Dec 2025 09:59:46 -0800
X-Gm-Features: AQt7F2pDj2R4IwIEPMOZzOnLh9n4cASi0L2vplG1ftm3krqkbz2TgZovjVOAQTc
Message-ID: <CAOSpxdbBg_g6=LKqs58LnZnTG9SGSuXUUudvz=kiwVoTD-W_6w@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 1/8] libmicrohttpd: fix CVE-2025-59777, CVE-2025-62689
To: Gyorgy Sarvari <skandigraun@gmail.com>, Changqing Li <changqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 18:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227309

On Wed, Dec 3, 2025 at 12:25=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> This is quite a big change in the middle of an LTS release... not that I
> have a better solution. But maybe a warning in the docs would be
> appropriate about this removed feature and its reason (not sure who
> takes care of these).

You are quite correct, this is a large change and deserves further
discussion since it is removing a (admittedly experimental) feature.

I will remove this from this series pending further discussion on list.

Steve

