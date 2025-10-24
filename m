Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C656CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 11:30:40 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.8055.1761305437055495314
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 04:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dbKMNsgw;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-88fa5974432so212943785a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 04:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761305436; x=1761910236; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xVEAo5UxGmIy3cG2FpvUng+5Ti2nW9I0hVU5bm2i3PA=;
        b=dbKMNsgwC/3sbc2qtdBZf0DXuxIiBMT+GL3FADI0ORzBGlu+osRfeKcD2ZZm0Xj6mf
         VUIuypDRvmyAh/QNvYFsfMthPYT61Crr7zlNrek99GwfwaVveLUmBxWkoj2jtDX6xJqw
         u3W1TndimGL7QJSNORNkWGatVK6ChQSryOjtjNQuX6eU6G+t2F6h3mlCjFeUt9oqMozD
         aFzmSnZo/MJHQq/GpJc7cliSwJC59z4zGCxnQiaKeU8QsPCsomVRTWvdrw80i4qHJHS8
         QMfTq4fb3M/S63NfvxCFQN22GL7sngHMQd6blOTW8OftnpMRVc95mIkfemaeyejuw3Rb
         sCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761305436; x=1761910236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xVEAo5UxGmIy3cG2FpvUng+5Ti2nW9I0hVU5bm2i3PA=;
        b=frAqR3iCLhbsxNRCE2ukVhrJAad9Vj2DEuDcB3lgBmJGTI9lqSwOf6HeUtwLMn6LQA
         Q8W0fVJwCU6z/qdKc9gMG+Yo8e39HgHZ/rg93WqeVqLX1mTQ9pvM5UNXaJays0NpVi8v
         xLAd4bx2oWACfWiAcug5F18kk09bh00N0TPP0UErgFAKrMWhguEM/sopYbo4HJFqRwMk
         GSqzMgKLT2kE808te7ANX/tZhEdO99u6a2Jnr+UDVQURqiKPCsX0wqQ50ppFeW3pF8pH
         omIL8tdTnXXVqsS2ptMQ0xqPP6qHL9dY73Q//gz5+t5iqVmVjU46c7BQdr1gf8+OUi6b
         xo4A==
X-Gm-Message-State: AOJu0YzXExeqsZ6g3Qo54Jiacast9YWQe9w98Xwykz4r6kfgOCIVxEBU
	oOS6YpWBFvHANqOpDKsD/0nacofQHVvqSSH3F6M8jByJv4MLOKPVAWEWtwwifVpcNUtR1MU43iT
	IUK/fij/Aa4QYvX6MHqQdTvtT4xdWvLa9Wg==
X-Gm-Gg: ASbGncviu+BvNKqZ2nIyKaNTqLAGrA1pCI5+2xrGTgfPIGQNvXxNGDKANlSwwLLh5DF
	Z1a63kEMh4jLkAWJsmZFmgnRiKbaHX3Z9cZKJzkQ8S4U8Y4RqnYPb7t0CmNSOhHmpE2X5G2GHQN
	GYxnY9/lebtAXOnG1iiGob6S6Rj8Ab1lgz7XqGGYmDHPAH3zflWJvoHk5sK5xXjh9gm0OgAAjeW
	gXzK+tlajVtV+odgz1l1MjD45i4nUz0aeuqI3LbJw8okkMq1JOyWmWRzfcP/yIjQpUSP4ngGnM4
	lJxgpwajgOLy6wA0dDjMJntIu5nwM9pJTYZB4tehVlg8hrUOsWwhD93P6s3fCdzHptWXmw2t3G+
	pZ9SrecImlb2q3vkw9jfHRAOSPpD6MsdkPpv7SPs=
X-Google-Smtp-Source: AGHT+IGMmmrBx3m2qf30wOt4dfZRRS76ifMrsB2Ut9IgWT6HECO2AtoADDsVjJm/FK5ZiVW+gGNHRRepTvCbwDlScWU=
X-Received: by 2002:ad4:5dc1:0:b0:879:b99b:993c with SMTP id
 6a1803df08f44-87fb63af56dmr18234996d6.18.1761305435945; Fri, 24 Oct 2025
 04:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251024072750.2756709-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20251024072750.2756709-1-jiaying.song.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Oct 2025 13:30:24 +0200
X-Gm-Features: AWmQ_blr6yFEc3ek_gLVL75P9aaId_J6Q7OOKHHmEnwqMcfPC33A_9w-t8Erz5I
Message-ID: <CANNYZj_8wwBWhU5Aogn+cZ=ShtprSn-Faajkj+xJ8rD16AqX5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icu: use automake ptest output format
To: Jiaying.Song.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 11:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225290

On Fri, 24 Oct 2025 at 09:27, Song, Jiaying (CN) via
lists.openembedded.org
<Jiaying.Song.CN=windriver.com@lists.openembedded.org> wrote:
> -       ./$t
> -       if [ "$?" = "0" ]; then
> -               echo "PASS: $t"
> -       else
> -               echo "FAIL: $t"
> -       fi
> +    ./"$t" 2>&1 | sed -e '/---\[OK\]/ s/^/PASS: /' \
> +                      -e '/} OK:/ s/^/PASS: /' \
> +                      -e '/---\[[0-9]* ERRORS in / s/^/FAIL: /' \
> +                      -e '/} ERRORS/ s/^/FAIL: /' | tee -a "${LOG}"

This sed expression is both hard to read and brittle: if upstream
subtly changes the output, will it still capture the results
correctly?

If any of $t fails but prints nothing, will this be reported as a
failure? This changes the logic that is based on return codes into
logic that relies on correct and useful output by any individual test,
and I think the new approach is less reliable.

I'd rather change the icu code itself to produce the needed output
(perhaps subject to a command line option), and offer that patch
upstream.

Alex

