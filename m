Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE92FE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 10:30:38 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.15347.1736505032128437524
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 02:30:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JtSTCR7P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so22139225e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 02:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736505030; x=1737109830; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBNgOXpRR2hykxdlDOgSHlCNfILfkKgLILrRuRfaFUE=;
        b=JtSTCR7POWY90iFPVgtDiR4w6Ex+DxXoNtA5cObmNfinY4MQciVW2Srfd6xO/z3nM5
         uuKFIYI+xtfuyBFe3n69McGv/tx6k3VZozRl6fNFd+nbOCQgnezzSg/7s5teTVEUnemF
         vQV3l/25KhzAzrVx7wJoqi0It5Z5rgQDnUGaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736505030; x=1737109830;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PBNgOXpRR2hykxdlDOgSHlCNfILfkKgLILrRuRfaFUE=;
        b=OsxeLoC7k+b5l3lnjQa0kpAMLmZwr35VYYu6jfz3TSY2MbS7GG+jcbiE9MkiysIoRB
         a6EXnvHufYYAVu71j8NymwsULflEkHdGihlRePKKOT+Sl5AeDbizlko+sHa2lFSM6VT/
         hH2Q3Hutc/qUr+1UYoPp7UWXYFAauqWzFXq7w44W3BWX+7Sd4F6hMHvawgSLnvOH2mh3
         B0+zG1l89IalI/Rw5C9nIxtOCgBrEcOJdEA/RFPuhFWGH3iY5Xr2N0CJTDD20Ag5fkkF
         W0ljjiIqRCEzHozq3H+t6C0Ug3+Wz+qBCPUdUUg/1r69BRVlgFQaORviKSOeSVxRXLkt
         7qWQ==
X-Forwarded-Encrypted: i=1; AJvYcCULiu4FiyX2fAxh6X/CuQzNxoDW+HCxkWnzegRAtRL+Gxf4zXGIrGr2oVvNckqtgHJCCOTPUXnYXQ5Sf4LOm0ZFRQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxOwpKkAiGCm8dQmI48wS36YvBsJWxsfMmGcxobw9RQP1a0EVBj
	NFaFDDvKhIRYeTo9ViYwf54C/tuxYohOfJmzqL+A1GEc/o/tf8yI4Zo1nmtbz2E=
X-Gm-Gg: ASbGncvexHEUi3ciPoTvePcViyIm6nZFfqYs4A7IgLA7YWQp3aVJvfwbUxiufXOhgYy
	MsN3apMtAxrtH9qhIiCN4bB+JajA8Swo3NsiXmpCHRfTPSJ702bhn+q2Xwwba7vken5D1oY/Zu3
	P5H9+wS9357RTkmF7M3BjUyaVw4yBQHK7OiPrahszqjUqnvuP8PbXoUnvCr9GNL9Ng/wOiil0iO
	aiPYEawRpExItpi7zVSub8hvMnD+kZmGuRlYIBCfcrRtihJ34f/oupyfwrJRSSw0ZKLbRVNqh/s
	zL1EB+ZSsQcl+7mNcoyHjIaoGL1xEofhQAKePE+ueB/AXQ==
X-Google-Smtp-Source: AGHT+IFIHXoCZHObcoF1b1GPOG+RLdwP9K0pdtyNjJX67gW+pWCbQ1wPTOBKgDxUeSHQrtCthQ2gYw==
X-Received: by 2002:a05:6000:1849:b0:385:e5d8:3ec2 with SMTP id ffacd0b85a97d-38a8730b535mr9420709f8f.28.1736505030493;
        Fri, 10 Jan 2025 02:30:30 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d75e:67c5:40ee:6f3d? ([2001:8b0:aba:5f3c:d75e:67c5:40ee:6f3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1c01sm4228695f8f.97.2025.01.10.02.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:30:29 -0800 (PST)
Message-ID: <b370315d6569875756feb0f98babeae2fbbc59f3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] rsync: clean up configure/configure.sh
 fiddling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2025 10:30:28 +0000
In-Reply-To: <20250108154636.1431857-1-ross.burton@arm.com>
References: <20250108154636.1431857-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 10:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209639

On Wed, 2025-01-08 at 15:46 +0000, Ross Burton via lists.openembedded.org w=
rote:
> The upstream Makefiles tell autoconf to write the generated script to
> configure.sh instead of the idiomatic configure.=C2=A0 We now remove all =
of
> the Makefile rules that refer to configure.sh (makefile-no-rebuild.patch)
> but some pieces remained, so remove them too=C2=A0

"so remove them too" - was there a piece of this patch missing?

Cheers,

Richard

