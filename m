Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E46C369D3
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 15:36:27 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.43186.1745336179570856986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 08:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ji/ASsvz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43690d4605dso43773785e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745336178; x=1745940978; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gl8dxqkv1K8KUuzrBKowUh5CVf6hqcbAYIUJMfUi+rs=;
        b=Ji/ASsvzIew5px87GwfbGpo8V6i8lqWk2V0rbbTubT6gM9fzX0Zd7+S8tnGs1LE3j+
         t6q0AWhrcRAxfTQupz+C/9z8ZXFWvj0JPQ8hg0MvSleCKalY1M/cPc8eX1xPHlxQpOo0
         DX4qwPeJp0r1OpKL+sj742TSY+HcXIrmEzWFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336178; x=1745940978;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gl8dxqkv1K8KUuzrBKowUh5CVf6hqcbAYIUJMfUi+rs=;
        b=bk9bfXyZKqpRNDOflU8HDlkTdwxSksDhdL72H5VT++mzl31TJU2EKt2a2+QbsEsWCh
         UNwANigIbnDIU+wXErWBvdab/4SxRIJYBTyjAySYG7M7ModeZNOw6BYQfm4Th/UKah4x
         5nFs+xDaP7NpuO7h57GqljNlhP1N5b7Zg4Ks6uaEQ04b1QlGvy/LlktR9PAliezQyvDa
         5yWpKc3DU0b6UCf6arhPAiZAbmTUOB9eaFbQMk7ATzfnJFQIIvdTeF7tE5rUG6imwLZY
         R7DeZ6/xq1mtXv8o17hH/AE8WZ5BewocMtxOr8hlLpkmyzXs+DyCib99857gC65BwBH3
         T80w==
X-Forwarded-Encrypted: i=1; AJvYcCVoTHHBwkC2AmmWyHu5W8hFX6ggJ31BcP/s3UriUnMyTkwvxw4xrJFWKv370g0QBus8yF+A4z9HceocHJ/u68o+ag==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwCb9ZeKwfZgPR7z9jCboUDX/IvWe07nIg3LcEB/pKbJadXgF+Q
	ZQUjCoYYu6zlTeMKVj7NbnrJb6cKCFKvtD/6lDoDShUK/KGaA3Rt1oHOuIH1tmU=
X-Gm-Gg: ASbGncsgi4HnNaUu6058TStK6dE0+3hu5+QADoA3kCBSuIiUDMMRwNl2NnHNlEPTyw8
	W/Po699DF2e7hD0pJu3A8wagTSH5vUBRKyLmOAAmnMZNRwHZQMn832dfhAk4YBakqd6vAIZ1b3I
	qtEKs/wh6s8lxVLlvoF3gUEtgYqm7uf4cAELHjMNREc2XRdhXz5TwJJm6T/m0eRkOpGRSUIz7UN
	jIZ6PRXTvB/o3wRrsK1nU+ESpP38M+AV3QKW1hbp4WdAYT7BAQRSg4UWJlzXlsgI793srOkyfJg
	BWV7yR48c1s8NhmFl19nI0SM7cPLgM9YSdym1h8Bio6OxXuihCmZBiLgoS1SWpMwWV6STb4zJo4
	KASn8xKynjSGy5i+QYeVC7xrvklEK5w==
X-Google-Smtp-Source: AGHT+IHKO6k9QPZO3yju795xXAVitoEYcW3EhuME/UDSnTQqIk7XLH8ndCN7xTV3GoMzVsWp22wZxQ==
X-Received: by 2002:a05:600c:3b8b:b0:43d:fa5d:9314 with SMTP id 5b1f17b1804b1-4406ac272d1mr106220975e9.32.1745336177953;
        Tue, 22 Apr 2025 08:36:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8382:2711:3bb8:b397? ([2001:8b0:aba:5f3c:8382:2711:3bb8:b397])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5d6f86sm175912825e9.35.2025.04.22.08.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 08:36:17 -0700 (PDT)
Message-ID: <41b65472c37b399e2d4c770819bf7868cd145665.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gzip: upgrade 1.13 -> 1.14
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, leimaohui@fujitsu.com
Cc: Denys Dmytriyenko <denis@denix.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 22 Apr 2025 16:36:15 +0100
In-Reply-To: <CANNYZj919ZzBoW6iDURx=aH2DRFyB0Yhy0V8TLwBv_5xH64cTg@mail.gmail.com>
References: <20250417102130.800-1-leimaohui@fujitsu.com>
	 <CANNYZj919ZzBoW6iDURx=aH2DRFyB0Yhy0V8TLwBv_5xH64cTg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 15:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215233

On Tue, 2025-04-22 at 17:24 +0200, Alexander Kanavin via
lists.openembedded.org wrote:
> On Thu, 17 Apr 2025 at 12:21, leimaohui via lists.openembedded.org
> <leimaohui=3Dfujitsu.com@lists.openembedded.org> wrote:
> > +Subject: [PATCH] tests/reference: fix invalid option of od issue
> > +
> > +ptest issue:
> > +| od: invalid option -- 'A'
> > +| BusyBox v1.37.0 () multi-call binary.
>=20
> Instead of working around busybox od limitations with a patch, ptest
> package should rdepend on coreutils to pull in the real original od.

Agreed, I've been meaning to reply to say exactly this!

Cheers,

Richard

