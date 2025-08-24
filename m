Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1654CA0EEB
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 15:23:31 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.18700.1756049002525194849
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 08:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SS9NZKMM;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-70d93f579fdso24905456d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756049001; x=1756653801; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IwP3/7n0zvrsKvM3QwlU8mDhEmYQfw3szHiYSDv+0T0=;
        b=SS9NZKMM1IMCwYw0YYnGa5HZrlH9fyb4Q26qY5NlBNfnL3MDIihb7YFx9Cnn2X83A8
         plHnfuaV33ZFJD2rMYV0qH1KTY2PLHeI/EgQzQ4mP7O6CLdB8pYxEQdeumyQAWfvLWH3
         0qcmOOF6n6fPBXUuHUDs00NmTxSHEL+gbQ6tW3MBc0mqLqziTmFTUxWvDxFOAKKOjo2N
         qNLkoK7B/T96zEJUa76VkUZMwC7hI3qKMqvq8ImWGFK1BiHG1hJEcz208Sj6Z5rBDL0l
         F3JbzbMN4gWvxj2K/qszxdIBb0NoqCjzjcQV4A9FdMVeCOBTyCajpS+5enI0N87KKQb9
         gPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756049001; x=1756653801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IwP3/7n0zvrsKvM3QwlU8mDhEmYQfw3szHiYSDv+0T0=;
        b=vtus5QBkrfIacV0swYi7Mk5QAiF6abFJ8MJLYTJ9yNw1Vzwt0kDlhGpWGrAMBgYqK5
         HVo72nsAzFRaAVybqE8dqFDRJAfCUAY9zIa1gzo20AQBf5IZ5LY4bDazLLSQyhGDTa9M
         5G1DWB7LESLm8PtSg0o6k8z1941pTQUXxlcpKjF2H3HthnqKkqRH82hbul7FBZBkFHYQ
         9L3YLtI1gmTtNB1JeGyiAb5LbfWyeOrEYOOcLXQtpHqQoCl17/G7+5odFThzLd+LWJj2
         rbQ43f6Q4JBVwXKyL2ndE+VKVDXgNvw4bOV1Sn+CaK2xfdSQJD0kl1fttRTRiYgSAl31
         b7zQ==
X-Gm-Message-State: AOJu0YyCY6/sKdQjhEWVx/Yr1pXhowl/tDYi504mHnw1v44/i3IYzsA3
	iaqDuAYuxX/h+kqHXM2auKV0KYLTEN2NTkJXIxqe9tLLUfojDb6AyFxBejXreBvQ6iImt305o3B
	4G6faPoT9eHAuALCURXUuy1Z3k4lfmfA=
X-Gm-Gg: ASbGnctsBKMD2Mtr/K7cfDEOaqS4bUdmmx+k+wKIJa3OxBS1UK9SEHXsv4QXCOWF0sy
	xTrJYuf/fOdKhq8bBZ9i2E6blYvGpPh12jovtK+MO/dt/WKHbf1ImLl6aOiLCxqkLF8BTkHwYkM
	uJ/XMHRuFzm1UqSezFGl4e8hbbnfBQYvBYJXdwxeJ4BSq3Y0/h6ViwGm6C/SkWBJc3DzQbrQCLi
	w9gFI8=
X-Google-Smtp-Source: AGHT+IEvCFL1S+jLIHqwrZwAAmGedjYLgKARnTRaETfhgbqc20sF8NW8HwWmG+1FDmjhfWTfddBnsxOO//sy/77L1LE=
X-Received: by 2002:ad4:5bc5:0:b0:70b:a189:a571 with SMTP id
 6a1803df08f44-70d9722fd19mr115951196d6.25.1756049001470; Sun, 24 Aug 2025
 08:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250823200405.680409-1-raj.khem@gmail.com> <20250823200405.680409-2-raj.khem@gmail.com>
In-Reply-To: <20250823200405.680409-2-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 24 Aug 2025 17:23:10 +0200
X-Gm-Features: Ac12FXwehJatUdZrOLF2TkBqzaGzRcOe-Px-dWLKYt8Ph_GI7w8ab1RSVdUFDrQ
Message-ID: <CANNYZj-5oJzsUvcnypDJZrFSMgeRdmau-OmC1gunV2nbv=ZJ4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] lttng-tools: fix unix socket high FD count test
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 15:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222388

On Sat, 23 Aug 2025 at 22:04, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> +The HIGH_FD_COUNT macro in test_unix_socket.cpp was set equal to
> +LTTCOMM_MAX_SEND_FDS, which could cause the test to exceed the
> +maximum allowed number of file descriptors. Adjust it to
> +LTTCOMM_MAX_SEND_FDS - 1 to avoid hitting the limit and ensure the
> +test remains valid.
> +
> +Upstream-Status: Inappropriate [Musl-specific]

This needs an upstream ticket.

Alex

