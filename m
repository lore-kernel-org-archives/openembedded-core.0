Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE46C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 13:50:10 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39174.1789132415445428233
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 06:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g66EPV3X;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: zhanxusheng1024@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d9520b9155so9025815ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 06:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789132415; x=1789737215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUYg3HowryQAuO27DfEqiXTAxLwY1WzNGpT1wKHulbI=;
        b=g66EPV3X9WOf02VVTyElNYLn3ex6yJB/1gW5YHMRYBJDlIl+ABVt0lkjWx7Q7SJN95
         6qUBUyRnaXgH9BUmGNwRa42c56JBuNbz1sXcd4YUlRnQJwBN4jQbfVG9xe6qSXWp78Hy
         9lYhHmSRE8ZMLp0qzC4MybZ0q6qxpxfzUEiRLNfZNDLerynO8D2Qq0bmYXJNjeHKuZQS
         MMw2h+rHCq2eR5T4Wlk8UygEwHThds5LZwQ9XM+3jyHssC+Ltf2LtSRJveEkji0baKZK
         oduK7rcBkmJSLuR3c5RnRu2EEJy5Lwk71QHBfdcHiTqVvOVDFcg/4NjBBFDnTz9syt+8
         qdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132415; x=1789737215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vUYg3HowryQAuO27DfEqiXTAxLwY1WzNGpT1wKHulbI=;
        b=UQEBR1NNJS8kW73bdIUG23ofNyR3sVzWidSLcfB856tZhIwcEAM8UTS/reArFzPmzc
         vINqQ3z7Vv/IRIVP0bfh8nRhDke5Z/s1qi6d99rxlGrnfHjgHOw7X5vl0kdux5GTCPtj
         MRRUqEwUfXQye6nzLrLNn+qrOmUnTAxVQxd1eGVKj3D9uFy3DyhY/KJPz+ky0dmfeisv
         +SUxazJqbwq8+zgSKOw+FDqQzq5EQ/oDYJGGYcQx6AjepCBebra0u6dPDM8KZfP203sz
         O3CS6QM2uCGU0UgKN4qBDmv0V4j6WwffEOeEhj8+T2H+8XkDs9aLT6tvFtQVZMUulOQ1
         atZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzN5tl+MPyJP9J4xvPki1emf3kaYbfngosSCKfyKvYo8BDqeNGZKNJ+fS4Qt9bI5YzswNV16Cu4VisCUHNIr2lcig==@lists.openembedded.org
X-Gm-Message-State: AFuF++nwOzRNLCy2M4nBBcGFI+LjhHHP1XZt03kh7yE3xT5gLEG2CzyY
	fCO2IYcm6V7PRYEvCflqtWvichUCVjmd/wYMqgsznv0h4oNYR5laGlL3
X-Gm-Gg: AYBFou3q9K+wct7ZTgLBhe4qMeH6aUsL182Os/AeGc9Wfyhc3NGEJ0VkwSEgm7vNBoI
	KqyamfsmPWATDrI8nWLtLREpM8Z8L3po0L7hs8TsUT2YbdwrUkCVdFyck22Fsm5GXrvqetxSjAM
	PNg8QVb4eWBEqWVeVrEFCsN95At6HUHUbF6KyZ5sZgmfnYTnd5pqh45a2xSR4jfDojDfarEAaoR
	SMztzL1/8n91eDSv/dT2RAhOvz9jFGIUzLPhYv6YHavHdu8zivlkfR69/cFhaJATrzaj2eFJLoo
	i20LhaMRttD51MMZAIw683enGT2N5nCx9YzQX/+f4kzq9da3jKRvLEZpiMwN3KN6R3kDQX/KZcB
	UaovbpWihQGGZMTOrqzbEk3yzKtx4COl5pxrjcqUrDtlUAsNJJbOxkX48TvpIieiLki1fph2U9h
	KDkdQYjHqpw4vey362BPnc3OzPKJ1TdIjBY1BGM0+xw02Y5XHVHV6qE8sBPUdJFhybBkLpb/fiY
	/VCKNg0/u0=
X-Received: by 2002:a17:903:fa4:b0:2db:210f:c111 with SMTP id d9443c01a7336-2dd2a1c4529mr84464195ad.2.1789132414804;
        Fri, 11 Sep 2026 06:13:34 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfda68esm11232165ad.64.2026.09.11.06.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:13:33 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Michael Haener <michael.haener@siemens.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	openembedded-core@lists.openembedded.org,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: Re: [PATCH v3] sstate: fix access to a cached object rewriting its modification time
Date: Fri, 11 Sep 2026 21:13:24 +0800
Message-ID: <20260911131325.3262532-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911070121.39436-1-michael.haener@siemens.com>
References: <20260910211821.48424-1-michael.haener@siemens.com> <20260911070121.39436-1-michael.haener@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 13:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245650

On Fri, Sep 11, 2026 at 09:01:21AM +0200, Michael Haener wrote:
> +        os.utime(path, ns=(time.time_ns(), stat_info.st_mtime_ns))

0 ns difference here.  ENOENT still comes out of the helper, from
os.stat() now instead of os.utime().

Reviewed-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

