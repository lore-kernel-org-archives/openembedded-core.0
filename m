Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0369DC3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 09:38:59 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.70937.1744105129855050646
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 02:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JfqWt2s1;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c559b3eb0bso290148985a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 02:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105129; x=1744709929; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LJxo+CikwGFPGaYTCF8ELcjbENrkTbSwL7WPf6BFAXE=;
        b=JfqWt2s1vJF2t7dhCOOa2Zr9F6gvDnXee94hz87OB5PON77ePy8kjqZOJqsOe82IBl
         AwwnXdazdSkaWfUqn3uQvLzb3CYvjuNxTDBs8Z+wiVQgxkuYEYRVnMREr7hU22OtHJli
         1Q5RzzEeQ6EomfZZE8s1RVyECvWYve/qfzimhZNFwz7rnpjVdeO+kwv/EDIGjBYAV5Xz
         zXFKkL3THG7FKCNVFf3tGn6jqt5kH+HlGlwGObUL86CQzNIGhh4vhMtnZxuPxIgU+S56
         yHqlf2azgvB1fzafv+/fLEbAjd4muufujGVD0cFDBIbtP1J4DK+xOuWdAb9nSiBM9dmz
         m+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105129; x=1744709929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJxo+CikwGFPGaYTCF8ELcjbENrkTbSwL7WPf6BFAXE=;
        b=HwHW9A43XVI5cx8lFa8fA0ike+XT7MHrNV7iUHKFA4nOqmD6udkKhwPw24wGKgt/T0
         HSInZ6SQ35IDNlZEIhuDf+1h0DPIjDkF/o5u0zI/vgO7Uv9VVeHgIuEFOVspsvVFSNLI
         nknEcNsL8WSPgQgS91T0rUPK7v6yQn8JwBWsP+Cng9o7qJaaPrjVnnmQkrHoyMaHcOi4
         tpB2JHoqpKVetxndLop6zwzpG8/6Yg2eeSzBnP/4L9sZoEjbdm5GVJNhGayVZVoVQHlm
         8RdH0208yoEpk6kU9har1UqquxrAlYVHaHZn3ZoNDSww6sUA6JFTde+OfgJmNgzJZ98U
         Xy8g==
X-Gm-Message-State: AOJu0YxBcSG0vYnyAuizVZB29fqoUTcx/VsbGAMBD71djEo6OW7Y2jEQ
	PFWpcIiCyz4ygAYbqRWO0J/M0C2VdF/UHHEqgk3bWDNceehtw24Eugg4ZKxFAX3e8XwsG9iDLpk
	EbyH54F35LvtQNF1sO1adm74ggPY=
X-Gm-Gg: ASbGncsTkja6Te7jpi2uHXlV0pYxsByG7oJEyCXF38weUrQtV1DS54pZsNAmbr6efpu
	x23x30qB3cPwSO+9qSzzKt5KqZi4J2xeNr6a8DMK5MvM3tCCBquc4lCa961S+LWY3K86kTOlQkx
	soT0W38ly+MROh8p3pXzVaaFb4H9guCRHYSo0AHf717zFUTvxPejrB4i7TfU7e
X-Google-Smtp-Source: AGHT+IGSgcpC5rcSR1HYOI+K4ZlYz+d5aB+gtQaQ46nJTR8pj8FxZ0KHRMP9mvek+SmZPg+clyDDWWzJs9TzDgth/x8=
X-Received: by 2002:a05:6214:f0c:b0:6e8:fe60:fdeb with SMTP id
 6a1803df08f44-6f0584edfadmr184388676d6.17.1744105128675; Tue, 08 Apr 2025
 02:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <1744103876-30713-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1744103876-30713-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Apr 2025 11:38:37 +0200
X-Gm-Features: ATxdqUFL6b1xXjwCO0IYxMaGHOEB5XagqwTASz5iP3UlPUt5fV2CHVhO3EQKVsI
Message-ID: <CANNYZj_ViBU3WtAq1L1xkU3MMzmtt6wpjW8hMHVycshj0+S-8A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] libsolv: upgrade 0.7.31 -> 0.7.32
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 09:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214520

On Tue, 8 Apr 2025 at 11:18, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
> -SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
> +SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=${PV} \
>             file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
>  "

The request was to update all the recipes in the set that fetch from
git://. There's at least hwdata, systemd, and possibly others.

Alex

