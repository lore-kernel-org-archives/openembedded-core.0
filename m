Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D32CC0218F
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 04:20:45 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.108884.1738642844757883797
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 20:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jJWXIZR5;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2a9ef75a20dso2863655fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 20:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738642844; x=1739247644; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKiSxavo/dRk+w2evZ88MCn6n+nFt3op8NGsmsYhiB0=;
        b=jJWXIZR5QI/c535rPQOvBY1RUxj+dG+iD9YmB0g7GbLOksrZYePkMM1B4auC4m9qps
         kFP4fht1ypjXgHwwY5u7jYUxiTw0y7z/5DmhW6sNE6c6FXGkQNL6an80zg3COezX+tEM
         42c/7NzA8Icz9J93eJW4Ra0CDTdrGgN+BxxNB2b8KApnYMhyPpLwOzPKWH+ECzUItpgu
         S2AxcyWU/pZk/DKTlP4Bx0kWhEvlZ0HrYB9FoivHqwRyplaT6ZdcvJA5hPfjWFcz3vZL
         VvcjBLb5644YAwwir5Z6WdQ3Z8aAZSgFcPewFlZcvonjPjN7wlYKOckOvvKz1MqHFkUn
         4BHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738642844; x=1739247644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKiSxavo/dRk+w2evZ88MCn6n+nFt3op8NGsmsYhiB0=;
        b=g4ZW9Ph9C9qqrm7nDyZa10VbyoFMIxr+jVTh3fFCWaA4QVaRrA3SLYwR/G92q7l4D9
         bNgurD0T0wRjzLiVc21494PRv7ecQb+Du7stfAyVjFQKpycpQsw9SNfT6UctvumEgj/6
         l+xOhvYxVj2kQpTe3z9uXxccvmqcQAAykL80qB9umq3FVnNjQiWg4Yf/ThtiLfM4fzLz
         cvwi53k0Hir+Sr8JNThO6vn8/ojUtTNEaW7rzt3Rh2yb2VeVUeVIdu3j4xOAfRXHLDfs
         gOF5uBe5cJVV4gRXv9U5Qvo7oqD0kjP3MplH28UHeBx7TEi+8y1exp1kAJkAoJFPrQ0Z
         2tCg==
X-Gm-Message-State: AOJu0Yx80y9NuJOhamcLK16pIlccg3nKAydjRtjw8HRhThLMEKnsJNRD
	AJbYbDl41kZVOXAu+MubY0UamzYOYcB39eevaVvCKk7ytVtu7b0uUFqZtEOaipmaZ7KVq+iSl5H
	wkpoxrTSCLJD2DwRZvFjjM/r8MiSeudt1nTk=
X-Gm-Gg: ASbGnct5TTDDusNVoB37Wlv0hd/4aSJoTERgv/lAtZh4zHK78FfdqLNpXwCGYcFYd3+
	HbdQP1JY8zFeA/gq99evrAuejmtaWvSrMp6B4UV1s7kO0Tkc1pJaRzO2S3quckkJ8znpO6Dk=
X-Google-Smtp-Source: AGHT+IHJm/Voc82dWU+H7pEismL2iLMQI+EVDG5ETr/OHvyWIBSb70Pt2dlrXpXTR3KpjrTMYH1WHqZm86nwtuayAzU=
X-Received: by 2002:a05:6871:a6a1:b0:29d:c764:f873 with SMTP id
 586e51a60fabf-2b32f368b7cmr15463622fac.31.1738642844083; Mon, 03 Feb 2025
 20:20:44 -0800 (PST)
MIME-Version: 1.0
References: <20250204013925.2005184-1-Randy.MacLeod@windriver.com> <20250204013925.2005184-3-Randy.MacLeod@windriver.com>
In-Reply-To: <20250204013925.2005184-3-Randy.MacLeod@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Feb 2025 20:20:18 -0800
X-Gm-Features: AWEUYZmuJaAIsAR64qpvddSIh7KIPc3e28-9yCEUO9AN9EzoUVK51heGjH6CZKM
Message-ID: <CAMKF1so_JhEichRLL7ivxXvYYj8jJGE78_=5FwDdxVeCy5G8KQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] ptest-packagelists: remove valgrind
To: Randy.MacLeod@windriver.com
Cc: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com, 
	mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 04:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210749

lgtm. I thought of demoting it to PTESTS_PROBLEMS but that will still
run it and occupy resources

On Mon, Feb 3, 2025 at 5:39=E2=80=AFPM <Randy.MacLeod@windriver.com> wrote:
>
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> The valgrind-3.24 and glibc-2.41 update result in lots of valgrind ptests
> failing. Remove all valgrind ptests until that can be fixed.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index e2a90c1c2e..f3fdededf6 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -126,17 +126,14 @@ PTESTS_SLOW =3D "\
>      tcl \
>      tcl8 \
>      util-linux \
> -    valgrind \
>  "
>
>  # python3 ptests hang on qemuriscv64
> -PTESTS_SLOW:remove:riscv64 =3D "valgrind python3"
> -PTESTS_PROBLEMS:append:riscv64 =3D " valgrind python3"
> -PTESTS_SLOW:remove:riscv32 =3D "lttng-tools strace valgrind"
> -PTESTS_PROBLEMS:append:riscv32 =3D " lttng-tools strace valgrind"
> +PTESTS_SLOW:remove:riscv64 =3D "python3"
> +PTESTS_PROBLEMS:append:riscv64 =3D " python3"
> +PTESTS_SLOW:remove:riscv32 =3D "lttng-tools strace "
> +PTESTS_PROBLEMS:append:riscv32 =3D " lttng-tools strace"
>  PTESTS_SLOW:append:libc-musl =3D " libc-test"
> -PTESTS_SLOW:remove:x86 =3D "valgrind"
> -PTESTS_PROBLEMS:append:x86 =3D " valgrind"
>
>  #    ruby \ # Timeout
>  #    rt-tests \ # Needs to be checked whether it runs at all
> --
> 2.34.1
>

