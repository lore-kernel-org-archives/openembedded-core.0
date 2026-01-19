Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83894CCF2F6
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 12:30:30 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33865.1768825828113067086
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 04:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nXTQak+c;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-88fca7bce90so49693946d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 04:30:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768825827; cv=none;
        d=google.com; s=arc-20240605;
        b=ikg2h/t9H830/2TfAcUL8jZTdOjfJHIjl1v9bdImZkZZJGkhHQgOdP7S97rAOErQwB
         aPwSJqshYza0dXb4VA4RKosZXfnNmDQC5oIxsVqspjGfHGwnY4tIlC0GpEZaCtrYTMBG
         C3quriCw3GFwoqZ0Xewl9XQZOWZGOO2t86aSAY97Jxo5YG3WjswMZm030tg0Sp2iann0
         4Immr3M1m+0CJrHE+vjy/8kNcEJUX0HQFAz855d+QKf/O58SPCMJPQizzXN9ejIAsFzL
         BCmSHAk0B4XBMzT42OS0DQkn0smwnwKkbDhZE9XF9u4FWVwobKzNyfif1MFgj4uxZ0wn
         NLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J3rpzF4tNYOYS7sJrtb9/0gwTBQ43ye1kWqwvoxxup8=;
        fh=TtWEwYxAhL06BO0lrR+38mEnZFJSo94qJHK6mW5fsWE=;
        b=M46kxLboTlK9yS9XkKltWOKmbY1vSwCJJtP61wPA23lMMTyGP8mSKkC3F987lG5NpY
         XpaTX1GNawQjZL2YUFSl1vBmN5thUExT0sE5bn83vuK1IYpvh7izK7L+eiY+c1/kXBW/
         asIK+/2mODMkIoQra3+6l2+AHeECDUBNBtweDODqwR/CduwTIHEGZWikc0lavDZruIIJ
         XGmeNgOXptx+EN0vSfTJc/QFqtNAfQAUyp+CvkuAwjfInn8ugh4jFGkCs1aDePXQedmS
         Xt8ZTPDdlgjA3S9tQJFbk17IGMKfanMz+G4SBKlJQC+cG8BT8O+qRopdwe2r6RUhQifU
         fMFw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768825827; x=1769430627; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J3rpzF4tNYOYS7sJrtb9/0gwTBQ43ye1kWqwvoxxup8=;
        b=nXTQak+ckhrj2DE3o470fnJcIPLmbegfQKP4uALVvlGEbn8Tv8sTBye3y9c7xY89H9
         7njUy1vOjreUnDy1eAAN17LTlvneVYvq1toe+UIMdFBfb2qL/q6RxL6ATaE52jK5inf/
         ffTsNjW2VQzwbVkr1iNn9Wj2JuV0iB4j5n73EFUzuFJS7lTkLveX5qKoC5tBxQybDPuQ
         9782IaAL/QtXaPd3ffIKQoEIQgyAivdfQLr62g+a/P7EvIYGE122GL/oTTSe8PeqzPq+
         k8jZn4Xp4hpEZJRmAjLofiddRIrhFngss843TIguQEd7qjjqGM8OQ8oWKeLli1G/f9Rh
         llPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768825827; x=1769430627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3rpzF4tNYOYS7sJrtb9/0gwTBQ43ye1kWqwvoxxup8=;
        b=RgXSUTV8ZYj9M/anS5F7IAPNgOy6dtxWZZs87njJP594SlDfY/6mI7y9rbRE1tXdaA
         NwiRirtCNrm42YG7WQ22AuFxfPcP4aBbJT7GzcZCUosI3gvppVhZR8Qj9zmrZfAZfQiC
         kD7PG3HPmrQTzp3qCgTEh9IKmwKCfy57n7kxkjVjr3kVhveI/aUsZYzHgjqefgifM2Fc
         rx/Ws3fcBKo1h1ksPD5IIFRE85vltcIRHfav5eKSy1ooDSvqSiG1N2YWkh3djUCK8z8/
         YEpY/pyWqYNHPaNljluy/Z/9XDmSDJGRC0sq+DidGpzjLpP0yXTAbV+3OLqfOm25W1Ve
         VKpg==
X-Gm-Message-State: AOJu0YwC1us9s3ezrLyF72UfX/TLBcKnZrTQd7J47sEQ4ByTao7gzNKZ
	G8T/m4aQ81NH04WqcpqWXKBHAwEX0xUonPyHNMhffo/+ie5qkVcDXDpCUdgcsbZtbwBYHzN434D
	wBdXi8uA7CWAflsUl9ObF6cQYFWw7Vr4X2A==
X-Gm-Gg: AZuq6aLk/DB+thIvg8dcw1azGB+b8I3jaFJT4jnhoKscKLMlELiu8LJzhOnaH3h7Bkq
	0jYbK3QnHW8/9wr2/gmy5rNKmpBXKj0xZlSBKIrlTiMWt2xQnGApQgeOLL6VxZ1tzU3kLVM6aqa
	d+3Fb5i3Kz1Yzza7ZCzyPk9GFqcYsA17GGzteLtYWORezedR4zs1WU8DHg/2lgi2ny2Lk1jDdRu
	jz+5Y9Km6acZ9jiccUGKu0GiQNTi4OlDAZdwSXpMu3CEjS7X+CoulKYm/pm7m0h+8X3GDoPNojU
	m86V5t/FL98Zg74Po26Wt7vjX/yHVw==
X-Received: by 2002:ad4:5e88:0:b0:88a:41d9:23d7 with SMTP id
 6a1803df08f44-8942dd70d15mr151321686d6.39.1768825826975; Mon, 19 Jan 2026
 04:30:26 -0800 (PST)
MIME-Version: 1.0
References: <1768683431-5604-1-git-send-email-mark.hatle@kernel.crashing.org>
In-Reply-To: <1768683431-5604-1-git-send-email-mark.hatle@kernel.crashing.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Jan 2026 13:30:15 +0100
X-Gm-Features: AZwV_Qiq-UHyfBExsx6EFZj4tL-dk__RbRlM5jwBRbt0ezGLI3t9O6jZH9YwYHo
Message-ID: <CANNYZj-fAJ4xS2GuHazHeExo7FQduObgdvjXYcq_wShv+sp4mQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] dpkg: Fix ADMINDIR
To: mark.hatle@kernel.crashing.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 12:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229611

On Sat, 17 Jan 2026 at 21:57, Mark Hatle via lists.openembedded.org
<mark.hatle=kernel.crashing.org@lists.openembedded.org> wrote:
> +Subject: [PATCH] lib/dpkg/options-dirs.c: set_rootfs was not checking
> + environment
> +
> +The set_rootfs function was using the hardcoded ADMINDIR (define).  It
> +should be checking the environment, and then falling back to the define
> +if not set.
> +
> +This matches the behavior in db_dir.c.
> +
> +Upstream-Status: Pending

Please no pending patches without a reason. This should be submitted
upstream first.

Alex

