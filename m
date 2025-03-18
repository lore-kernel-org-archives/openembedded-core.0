Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF46C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 09:38:24 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.7615.1742290695345448874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 02:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eS03gOEF;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8fb83e137so44745296d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 02:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742290694; x=1742895494; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YNUaUl9l0hMpWxLzXsm2WcA7IcLz5+NBu5QTJc8JlGw=;
        b=eS03gOEFA/DL6yyfRSAG+4VO643yDmXesYDqOMvF+rp20SGLfEt5KwYs/PFjzeytTv
         qX4IobI2Qv0DW53u1doQ8n7K52wH9/xleZ25o8r5AgDiAWChlQbSEbWNvdC+mi297BPI
         PxRUk5v+gOMn6GHJFa8lNQ6IeL1U0psp3ZlxDiI2GBWo1BQVHF5dfZkkhbyLOEMZazf7
         V6Musbeihy6FbLAOiF5rH4CAo/54Wl+tE4rKjM+MvmS1MaFTHCDFHVlzAHNP2yZg6Fvj
         lfs8coLUN9yJoQiqUjm9lKAClQpKFphcA/uSH9GIkQbElPNF0AVR4uaMLPzm9Sf1n4Y6
         XczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742290694; x=1742895494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNUaUl9l0hMpWxLzXsm2WcA7IcLz5+NBu5QTJc8JlGw=;
        b=o5Y9X0dsmaXN8eU28vGAFjJJRQQGVgfL0dgvEqFUzUo+FD/FRJrm1L0/AydFOpjeaz
         /MlZPjv4LL0Y82uOlLUKj9absM2iKd3wiN0eywZpbB5L/edWrYd1N06MFwqh8xzQGIMi
         LDvvUl0vkI359b9SU99TcoJC90vNGcX4r87xItzzThecT58wkGe1JVZE4bKlK3vAy/r/
         4wR3LF1ef39lL17pKX9NFCQuXAebeJQBfz/wRW9E3uvgLqu2MzjFniwfIeJTu9OeU1iq
         xbSN8DXUq/uJvQNEmsPZbPEcBUXMmc8ht2XIfTKqbeT0ar86g7px5yr8Phv9o0prXf7+
         4H6Q==
X-Gm-Message-State: AOJu0Yy/6hUXeF0hA/BScf1jw4uxahMRkelDBG4AwVOHxHBUBSos9lx+
	7GixnCEK+b0ncjOc7WY1iYnYlTsoG+Y/UwZVxd/kySJd7gkmdJieYsRq5oxU7hrtpWonpYHgUXa
	hbALoP8Y1Dwl4lpRrhLR0Hji4Y9s=
X-Gm-Gg: ASbGncu1jq49mMMuvsNX1EJK8pUjg40x2o6dBmIJOfyoVU5wMMm17QnLLDpJtjI7dnF
	eqwiBYEY/MYvey0zNNV8AxT4J3WpoIpvVfqCbKfTPgg/EYbyDNvt2QD7fY0UidFYfwPa4I3S8Cj
	O/LY7dbG4OFEnIGwtd2Nal873/KSxUyuasHceBiFnX3y6C5gRE/qogHZ1uSxy6
X-Google-Smtp-Source: AGHT+IHCy7CbkHrN7R/OkJN747wxqVO9d41+TparKQ8b0dFcqhZUIMFdAgOXNxyBWP7mkwtAb2pZGT8KHRvKQ50d3U4=
X-Received: by 2002:a05:6214:40b:b0:6e8:97d2:99a2 with SMTP id
 6a1803df08f44-6eb1b92cb94mr41413936d6.39.1742290694304; Tue, 18 Mar 2025
 02:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250318043846.2422141-1-raj.khem@gmail.com> <20250318043846.2422141-5-raj.khem@gmail.com>
In-Reply-To: <20250318043846.2422141-5-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Mar 2025 10:38:03 +0100
X-Gm-Features: AQ5f1JoKrRRDVcvIThkeWIP9gysAjPCZtlIVI3C41bgXFX8MR1n7XcJajbvuSXU
Message-ID: <CANNYZj-_OsiNMuYvm8iVDvKrvcnGujFqN9_in_cB9qj-gdqVBg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/24] ncurses: Upgrade to v6_5_20250315
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 09:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213190

On Tue, 18 Mar 2025 at 05:39, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> Brings needed fixes to build with GCC15
>  # commit id corresponds to the revision in package version
> -SRCREV = "1c55d64d9d3e00399a21f04e9cac1e472ab5f70a"
> +# v6_5_20250315
> +SRCREV = "5fa5aea6d020750dbe601c1136c7cc35a8a53dd8"
> +PV .= "+20250315"

I know we had them in the past, but ncurses' YYYYMMDD are all random
development snapshots, and I wouldn't want to update to them. Is it
possible to cherry-pick needed fixes?

Alex

