Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8681C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 09:57:29 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.13121.1746007044956813188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 02:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kdqnCLFP;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so9744866d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746007044; x=1746611844; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=geqakurEeSOuSK6gi4Pru6VX5zN47TuKm7o/oR/WtyA=;
        b=kdqnCLFP+n6i/gZtnlVrOXkxUS3XTCom5TTvolsJzLFDZm5/pHQKUDYjQWXwW72c/3
         yWPsG9I3ISDF/UOsbJRySO5Mj0Le4k2gIwfM+0D+Yv3umMlpAgRor2VP0bCFhkYEz4AB
         d+vLn/FHwVk1FM8ohExAqRY1p0eAfmbuoZ3dJVeK37kA0SbUGk2cWY5fHpPwdhcMzrcB
         54svOTCprWfhw6ELCNNboV9ixfiNGRzgu3DC/SYWdHwgbwFDyM6vHIK9TIE+YqvyxGh9
         5nGEdLTGOCPM6rZyV5VDZPyt2XacYjE6yfL0d68G8zFL9VHDm1iplL0XAJl12t0iTWll
         W6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746007044; x=1746611844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geqakurEeSOuSK6gi4Pru6VX5zN47TuKm7o/oR/WtyA=;
        b=GpREU5Ov7a9fpDIddolZJxfrt0Txn1+JZI45jTvTVpn3gYnnExybS5/bVNHUfBe6nI
         12ck/a4cMI03P9sNWfgBp5sDLCI3fBBdCyR6g7ueKCP21xiqVlTljJ+HmOb83L9qOIR/
         S5VMHTV4ESf5XbryRzdKZA/qAAcHV+6zQQG2TjOEKzLxVR7cxz3VOZAr56f7QYVoTmj+
         h9YKLV7AOqfjsGvX4VweyL7V2I0YC680dqE25XfmcUDKXt5OhoxrLlBEC5+QYraMBsAT
         ieqV8/UGKKodnoDxjY5I0OkC4PRyDgIuemnIfurn7krLTHbeRKCBTOOfQvnxdnoC1uHt
         PjTw==
X-Gm-Message-State: AOJu0YwIVm4xI2eFMRmhxRFpty1+rczbDKdZ42Thzxi2TFTmLXmUSSMO
	IElEl7perJY0x9q5XjVemkWum096i4g+8o0B979XV8R/aUeJ0hC89ZmvhGDw7CP6Qvq8mWdw+pD
	C5bGFbfu9eoiDJxXzpX09Xs1Fdj+UbA==
X-Gm-Gg: ASbGncs1nIHtLxUTT1mfIWr01VP52TDahtP1iPH5HKxIpdausIF73qY4Yr5AdF4aKIu
	MCSl5QKBdXix80XWCQmpM9ntYOHNaF/4C68kPdHfD4TjaAmb+NUw0aCyziz7ItbSw92iiTef4fo
	XMViLthce6Sy6tNENfBHZ1NNBmml/gSR/iEg+H1Llm2veMGK+Txec7L/p0
X-Google-Smtp-Source: AGHT+IHlZH5x0nW5hNDh5J1ygnS+n8eukSRy3s+RzPbuzrAStgVgi6c7a5wuMbEuvBySYsjyadmveHFFNB0BHd1FovA=
X-Received: by 2002:ad4:5c85:0:b0:6e8:f387:e0d2 with SMTP id
 6a1803df08f44-6f4fdcb104fmr28370026d6.11.1746007044035; Wed, 30 Apr 2025
 02:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250429183801.1125000-1-tgamblin@baylibre.com> <20250429183801.1125000-3-tgamblin@baylibre.com>
In-Reply-To: <20250429183801.1125000-3-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 30 Apr 2025 11:57:12 +0200
X-Gm-Features: ATxdqUHlyumxCEGhrCXypqUvX-WfFsgpHn2YzZOS2PVTg9S_2h1CEAh9S1DiLxM
Message-ID: <CANNYZj8N0LnX131spYUn2Z+HoXTZck_ZpgvsftTmtHjeMakJcA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2 v5] python3-numpy: fix ptests
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 09:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215737

On Tue, 29 Apr 2025 at 20:38, Trevor Gamblin via
lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
wrote:
> +# test_mem_policy fails if there's no C compiler present, but we don't want to
> +# include gcc as a ptest dependency, so skip that. test_big_arrays uses up a
> +# large amount of storage, so skip that too.
> +pytest --automake -m "not slow" -k "not test_mem_policy and not test_big_arrays" /usr/lib/python3.*/site-packages/numpy

Sorry for not replying earlier; I disagree with Ross here. It's okay
to require gcc and we shouldn't be skipping tests that want it.

Alex

