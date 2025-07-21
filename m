Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221CDC87FC8
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 09:39:52 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.36541.1753090791079850175
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 02:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GNA6BEis;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fa980d05a8so24758246d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 02:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753090790; x=1753695590; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GGjmGrZ5omsl9gHAwUI3WczUWU7BHrsGfpbPC6T44fU=;
        b=GNA6BEiskB5IElQkRF8mW30QlmMnm0W2KrPJwukHS7ljNdPFpL4oS61snAZWlxGjWQ
         BBgUxaI7nLVGvzrEAmKWHnnCTqxZg/1LSP5G4w33JphjwI70AFv3sPFjYp+V9Jc/Xz72
         WzMtd3OsyhuiLQNBUge40J/c7jRfErRBjONIvTJbFl7mG3YDmLm0tGQKe5TFn8TsWX5e
         aKmINrSzYQn+3FqYx8rcYj4J7BonjSiV/AXdDE1GCNPxEUPH/t7mTtks78tPJ1O8v0mT
         Pm8uHJqGKvbhWOgGAY2JKThaFM8BMwmCeQepMCtC7l4PTTK7wCuvkv8vld+0RfciI+0W
         E4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753090790; x=1753695590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGjmGrZ5omsl9gHAwUI3WczUWU7BHrsGfpbPC6T44fU=;
        b=IytNRkDuwQaWRbM8Jp9aCBkDM5l234GUl9TPvQSDz8MTRGvfsizrcIqZoNsClPM3q0
         CHaIfMvjz9XDgyFsYVDPRXL7n7CINyQ3aucK62x8qhZ9rx9S+r2i4cFBiTgm49o1SSBW
         OyUydR2CM0U9FM/vdVC34FWwE87twk1KHTqkFJCPNgdHhCJkMGr+LrP53uz7F4uA/Xyq
         9ijGHd7RJjZ8KaBv3m5pK8Z1ePiSxZ9usJ5R5HsG3Z3pCXngtUSO7lZEHayhoLJ4n/1W
         QBCntI8+w/wAAhFUs4Xv7oVfPVQbAMDmOvXJCXlVTGZrRvNXywCKxU+IuBccGPqOL30H
         rgDA==
X-Gm-Message-State: AOJu0YyB6ENWpJuuPGytENsbOrJbV/coAURAM7rIKJqtAh0SusILhUff
	XnisimuYuo0pFjAW/LJWighBmXK5S9tUGxLxiHcrFZX7LcDuaEQhIg7a2+q4c8cTp5DdtO2huUP
	4P1c1Ai0Ksc097VViOU2+S606TFXLCVAy6g==
X-Gm-Gg: ASbGncsApY5oU9i5//xkleRARmxDCyjiArn4HfTL0lO1RRQGesu/M+TlcgyBIZ7nE3k
	SqQB2I3ADHemKvdc58ouzO1jR7N32aWvd5Qne0/ubpHaT4dQKPmXMdaosApd2XofAE1fRMRMzt+
	yw0yVCsJZiAK/jqtMZ+5/x/2KX/eS44NCzgrkMSrMImnVr3OVU9g2JmPve9QAuvgCP9vz4L7uRT
	mZeA8+En4bWvo0I6G+vB601YDkLf2fkJEV6DiyV
X-Google-Smtp-Source: AGHT+IGsE9J/z5VWtrZxct+x+4ivaabQidYzLhfhAnAxy16+mGsnlkIJGHRj+B7man2A3gSpdzCicnZjwPGGfCQoGIg=
X-Received: by 2002:a05:6214:5d04:b0:704:ac29:dda0 with SMTP id
 6a1803df08f44-704f4847877mr305813916d6.18.1753090789882; Mon, 21 Jul 2025
 02:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250720090010.3122861-1-mingli.yu@eng.windriver.com> <20250720090010.3122861-4-mingli.yu@eng.windriver.com>
In-Reply-To: <20250720090010.3122861-4-mingli.yu@eng.windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Jul 2025 11:39:39 +0200
X-Gm-Features: Ac12FXwIv2rH2cxxhwu0b_p_EPc899mmppUvL7neP7T5HAusKm6PbT1oHqSpkAg
Message-ID: <CANNYZj9f__cZUjYT38jyYPiVTFtwiP1bWCwNt1H4mWXBwUMh+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 4/4] lttng-tools: Remove the scope resolution
 operator with musl
To: mingli.yu@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 09:39:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220671

On Sun, 20 Jul 2025 at 11:00, Yu, Mingli via lists.openembedded.org
<mingli.yu=eng.windriver.com@lists.openembedded.org> wrote:
>
> +Upstream-Status: Pending

Please no Pending patches without a clear reason. Submit upstream
first, or at least report the issue.

> +SRC_URI:append:libc-musl = " file://0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch"

Why is it conditional to musl? This will cause complications on future
version updates.

Alex

