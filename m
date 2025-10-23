Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D66ECCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:10:42 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.17591.1761217834149916295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 04:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CqUQx5nZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-7960d69f14bso4838646d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 04:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761217833; x=1761822633; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=syQuolWwk6kJDv5hRyKNmXWsR79xCf4d9b4twWe2v1E=;
        b=CqUQx5nZm+MI8cwCXtjhA56kZkeYgR3d9aRWSeXUBpzmWznBlt+gv0MQY8EEdig+rO
         /W9yd/g9ux1y5ztxpPnuhgQwdcHdUvsYxsqYOq6ArLGJDkF2GH7KlwXHBX0UBGjqNvW9
         +qKRq2ykCw0WHRjfzOatG/CXvebduBzFDD7ceoN6OwQagVQ/O2SaMuVAVl8SjN6POo64
         wqSBhkEOwXl/MdZ0A13Z7TM5+xsB+x/RTt+s69AMarlG6ETwzag/iFLXxKVjbkc2LiiZ
         u2zFG+1VOYsmFl4+sZveO6qOVYIwGf68/Sj1WTjoSecj7tczIeUinb5fWlEXKtyJ9tK+
         PzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761217833; x=1761822633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syQuolWwk6kJDv5hRyKNmXWsR79xCf4d9b4twWe2v1E=;
        b=jYYCsPSUgUBhZY0M1atcC9Fnv6fNP4AtiChgX4bBiZspfCO3auUGusw8yy74hzKCxL
         qiPKzvRCakAfoyDuDp9dzMTVd3JnAu5UAoFXdVxB/YQ5oBfWSGp2HFXQQDbkfnDCApKC
         nSDooCNGIIPlkbrE8G4y6m4U/35D1XHxnFwjDkCBdv57NDhWGwaaYS2KGyEMjRUm9PUC
         XpN25qJAqTLSWoQFiJDk3OWrDyUW6m4ofjh9oVPSh0t7qp+S7N5X635wyFJkPzTSvTVW
         mjxXYVKQLx/pWWS7m3UZC7AOTNe8qWvmdMjU48kyiR8xVGBLRS4HuRKRYz5HRXqRhaOi
         agwA==
X-Gm-Message-State: AOJu0YwiMd/kNeB/lcx2CGOOcmZ2/pArQTdfXU38hmqVtNfn56z+O56l
	Q+OVpsH7QSb5XIkinOcYtTD69+Z+tTYkFXuF1K2PJd50Ialx3dCbhxd/cPrK0KYVut2puqJR4pG
	nUwdxovFS4e4O/OAEimbFAisZuUgVgwU=
X-Gm-Gg: ASbGncs7qUS2/T7rgITZKS0fQUjzrSfZkzu9Rx8cwASSSugxc724D0Z2snlCwVWGwak
	rH9nkJ3kxSMrKrDYOy3og2IbgNsWwgAoM+CSJzvvQKK9Lilatv3ajVBRyWD4X41gA2v0h0qnDNx
	MiUL3FeYOWDbe1HlTSU+S7MVTut5W4ORWX+Rz9VJVPI8vFMNIYEY6gGZXBqYHsUXaRfUIPMETMe
	mahSawFoJNFL1sGmoH5CR/Q6IbfznygziWrqYMTXho3qylRbXJuMISqy3/rztGIL+hbaFCFSEzL
	ecsjMl8SELiGo98YMKyoDfEUwywAuamQAvG5e4qG/Z/1hRScMGRzFSl9IA==
X-Google-Smtp-Source: AGHT+IE24F4VeZJiIOL7cN8AMMoloTizD4Vh6P6ErvnAiBZIW0sQbIoCpU9MkTjXCFt/WcEDLxxtovXRtDxjg1aDMc8=
X-Received: by 2002:a05:6214:ac4:b0:809:5095:4153 with SMTP id
 6a1803df08f44-87c2061a2e6mr345829386d6.31.1761217833050; Thu, 23 Oct 2025
 04:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251023072513.280477-1-yoann.congal@smile.fr> <20251023072513.280477-3-yoann.congal@smile.fr>
In-Reply-To: <20251023072513.280477-3-yoann.congal@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Oct 2025 13:10:21 +0200
X-Gm-Features: AWmQ_bkN2Jy5JT1TpC51nwtTZNX83FvD2zGF0k6vufD555fdXf3SlwQLV6VWvnk
Message-ID: <CANNYZj_jgYBk3pj=GDwjriv2T1OL8v=p7_c4rcQ-_jp8QVof_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] selftest/bblayers: Add a test to validate
 bitbake-setup registry schema
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225235

On Thu, 23 Oct 2025 at 09:25, Yoann Congal via lists.openembedded.org
<yoann.congal=smile.fr@lists.openembedded.org> wrote:
> RFC: This structure takes ~7s per schema validation. I guess because of
> the multiple bb_get_var in each loop. I'll glady take suggestions on how
> to improve this.

I guess you need to refactor the code to obtain them only once on the
top level (or even in the test initialization where
python3-jsonschema-native is built), and set as object properties:
self.something.

Otherwise lgtm, now that we have a schema and tests, we can start
messing around with it :)

Alex

