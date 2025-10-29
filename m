Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8ABBCCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 10:50:46 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.3571.1761735037683486103
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 03:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ghG+0bOe;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-87fbc6d98a9so41045286d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 03:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761735037; x=1762339837; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aOz/y/jB+UuUguvqNVDQdiVQ2PQAq0ssCjV6wlCklYY=;
        b=ghG+0bOe5z2D1b2dDNFqAAWW1gNS6OqeyEzpKisX22/kxwt+yycZo71w3RQ/3AQ49a
         El7Hu4+0G3Me0KxWdwS7c6exyha+xkwhG3UgktepXZaSvgKXiHgj0E6IhDTLt+UxPNPr
         Ou0TQBgb/2PotjNaXVovpQH2tKYBnQPuucoZIgdEHg6JYVmcmbCnVmjHPEgM1KuUnd2a
         hgP9XbU5PZAo5UfMr6z6PIsiXLOgeHRoz8Ln4WEtjcu2Mm0DpID17YDwnzE3UuwktHPV
         Ta76t4XCJJ9vFDnkxJqXFRLieGNzgR+jtR+e2wHgI48V3c9op82ajGoiMateJMrdDp1/
         CI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761735037; x=1762339837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOz/y/jB+UuUguvqNVDQdiVQ2PQAq0ssCjV6wlCklYY=;
        b=Eh34LmJebWuL9/tPOOGX09RrOqnsdIKCoMRx2juvHCrjQIoMHAoX1yQstog55izB/X
         k9zQ65LpvFQWDoaY1WcUUg11cqiTBq9qesIC+XvdVaUbFokeaTvc8wG2+x7GcuQv2vn6
         enogauppIoFyLjTj6ImhfutA/+8IzQHxNpyKwVFnkANp87xGYRm8FhCroMJb6EYClaPQ
         3aUVdIXiPF6iaFFDzMdVuyeX++eGfsnAV4OA1mqSM1ND73jdJmwSLcZUO6v/+O567tmP
         9ccEMfKP7uKXxe37BB3CvvNlX00Sh+cC61RgScGWYjFn1FlwaznxXrV8/99L0NgwAmbr
         jFCw==
X-Gm-Message-State: AOJu0YyeyAy37zYA3d2ysh7trBLihj37gqK00ezWkczfQPoutnv6SGVj
	S328/qfM45ETn86cCRt5R7A8H77MgKfwV0C+CqZ4cWvgAPUcKeJpbVprR54ByoT/UtSbJTVM14z
	k4f+fxo3eNALD6Y6uKoERW5LgStls1cVL4A==
X-Gm-Gg: ASbGnctg8Az4hjlUZKGvb5/3ogyAJrD6J54KWk64vLI90JZaQO2fv8WIPhEM228iVQn
	ybdwj8SBc/qpoAiK1ANBTh5Q3+MYvITbUTPQRG7454wmpB+ML7v/sDD71Dvm4CQ05X5YovUhd88
	R4MXHap3W+GaKBXY8j6l7PsCJz/16GzhfvQ5XvQDNkBvqxlQg0bPSTvTehV2onkuZ1eqbGNsBjZ
	CA/p1LXj5GqdXNvKyRe5VFgotuoriGXoNUjKbqBRvjQeiWVt7D1MxBsRgmMKgoUstozgyEF+PJn
	/FbPdxYvizhnQPJV1D2GDvQy8xXJGJ2KfEYjaf6TWRB66VlasgNiWr1rD1hYSssT2hVBMu/ADmk
	BL4bAgdEyB+lgyGGxCeKKjmiy7XWGNFZVtEfsgbM=
X-Google-Smtp-Source: AGHT+IEB6hxQBzHUQnxxTuQPbjP69x8VBMNpH8+yj5+xBqEp4lqHFp8ocukL1jU8ciNPsgry3jf77aEE7ObZ1GDNAgE=
X-Received: by 2002:ad4:5c84:0:b0:87c:1d41:575d with SMTP id
 6a1803df08f44-88009ad8404mr26677756d6.3.1761735036639; Wed, 29 Oct 2025
 03:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251029045527.2865818-1-Qi.Chen@windriver.com>
In-Reply-To: <20251029045527.2865818-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Oct 2025 11:50:24 +0100
X-Gm-Features: AWmQ_bmrlLpqByQdN3vGhEs-yuqg43wBHITRjsu6exCXVyunZJkk9-hAEe8EV2A
Message-ID: <CANNYZj-a7AVDtX4R4VDSfgmTOFd7XpxeCrbmnaskrw-QPigvrQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH V4 1/3] base-passwd: add clock group
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 10:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225446

On Wed, 29 Oct 2025 at 05:55, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> +Subject: [PATCH] Add clock group
> +
> +The clock group is needed to "to enable applications like linuxptp
> +to open clocks without root privileges". See the link below:
> +https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd
> +
> +Note that this group is needed as long as people use udev from
> +systemd because 50-udev-default.rules needs it. See the above
> +commit.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +[
> +  MR: https://salsa.debian.org/debian/base-passwd/-/merge_requests/17
> +  It was rejected by upstream. See details in MR's comments.
> +]

Thanks for engaging with upstream. The upstream-status should be
Denied [link] in this case.

Which brings the point that (I think?) has already been made: as this
group is systemd-specific, it should probably be handled in that
recipe.

Alex

