Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5DAC3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 07:16:10 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.38757.1721718963067592479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 00:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YbI8e89q;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef2cb7d562so25894531fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 00:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721718961; x=1722323761; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/7j7DMovVfFhxBE1ro5uVduOLLpFm7SNzrAkauqgJeg=;
        b=YbI8e89q/i+opY3l3lhE9YQtCZPt55USHUi+kViC/niICo1g9YILfUYIMmfX8q3P7/
         CMaqZJ/pPI0YFRCqrvDnIXuQ+blWnjp5n/JvsMr3OoO/NDy/eg5D9pxQxUVdqqBxSwqe
         +qMKmantbn2s8EE1TKcHIgVRnESzH9LMYlqbpV9/8qhnG0SblXDDk5Gn0zJnO0yuDcqd
         n4f/1NJfJ2znMenaozzxcn/iUgcvspiWSLSLgjLyFUTzCbpMm8xGyuzNplHWadMXqx8s
         tRxUFRqOHotUCKYY+2X0MpkwuaRL59CJPdefkcWT/WjvvcECw+0BeTpMgtf3Zh4PJK7f
         zM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721718961; x=1722323761;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7j7DMovVfFhxBE1ro5uVduOLLpFm7SNzrAkauqgJeg=;
        b=wzZqT4uWgMXevDRgCzizPboM2aKcDY6BvGQU+rCcR5u5KiTgihObrRVXuWNp3ur4Ly
         rFbueyWYOyUiQgPBSs+/lwja0m6KX/R93C38TKnbiDMiYL6Wm/LjUp14Inei4jiflQ44
         EOGLF3NC0TqhBeY42tUGi+dcaOF028j2i2S4Jt1YS2XopBHpqs7MZ+8v4XzLLEQpjN4q
         KBzwNWbOBT9ImZyfqi07harWyKfSHy9EE5zSUfpEvyXKrVBuch7sQtJm7uJ7ZcyAM8Ak
         InFQV2hdSlF8wA1jdXLk3MRXnCGCDMmfqE8jiXQIPkcovVwwRrbbcY3CKPeQuAcTgqSM
         OaIg==
X-Gm-Message-State: AOJu0Yw4RCLDqu2J6Kl0faVaIfgolrAdfj+JCh6ETGnyDneTQcVVZ6sK
	oRKuTveLW6BSJpYYBwlXj+EAXMH4fav+qYP3YopSzgRlvWcFRTGY2Me0/84fP7E6Tc95jaXPav+
	ZjeUEPTzYtI748/PwoqvwLwhm1Vc=
X-Google-Smtp-Source: AGHT+IE5Br3ZMkhlPUtP34VpfR6nvdnhVdVPRSmQOe6xXjN+iodn4UdGv5Oo0lfZhy21tjcA8nzJFJF0eqEO4Ci/kpM=
X-Received: by 2002:a2e:2201:0:b0:2ef:2281:2158 with SMTP id
 38308e7fff4ca-2ef2281239fmr60377831fa.1.1721718960904; Tue, 23 Jul 2024
 00:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240717182216.1661015-1-alex.kanavin@gmail.com>
 <20240717182216.1661015-2-alex.kanavin@gmail.com> <c52ad793f05ea2fd92ee97711dddb29c039a175e.camel@linuxfoundation.org>
In-Reply-To: <c52ad793f05ea2fd92ee97711dddb29c039a175e.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Jul 2024 09:15:49 +0200
Message-ID: <CANNYZj9fxRzO2pwUaYuDCagMEmz2+sa=D_56p-pWr+fq0yNF_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] lib/recipeutils: add a function to
 determine recipes with shared include files
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202330

On Mon, 22 Jul 2024 at 16:44, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Your patch is good and I'm happy to merge as is, I just wanted to
> mention that it might be possible to catch the mesa issue.

Thanks, I just pushed the corresponding changes to AUH. It's possible
next AUH run won't be perfect, we have to wait and see (I did test
passing/failing lockstep upggrades with glib, but AUH is notorious for
running into corner cases over the complete recipe set). But you
should be getting perfect qemu upgrade patches from now on ;)

> The challenge is that even if it were identifiable, the code still
> probably can't know how to actually enable it for the upgrade/testing
> :(.

Yes. We could insert that data into the recipe to be used by
AUH/devtool, but that's even more work, and all for a single known
recipe in core (mesa). For mesa I'm tempted to go back to the 'simple
file rename' proposal that's already implemented; in reality no one
tests mesa-gl either when they submit mesa version updates. And we
have to keep telling people to include mesa-gl, because it's only
natural to overlook that.

Alex

