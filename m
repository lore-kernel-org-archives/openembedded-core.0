Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9835DC021B6
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 10:07:20 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.5113.1740478031455440135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 02:07:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z93GVs3f;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e41e17645dso56190056d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 02:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740478030; x=1741082830; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yByCYSSEzkECovCQGZDfhvx190eIHBQx/42yaxwgL6c=;
        b=Z93GVs3fyY+1eQXcB0MxtVtT+lnPt9Hz3ROPGnFIjfB/hE9yZKmQU01BfTD3O8HEy/
         UOk4Ui1pbt/DmYzi4+1FiTrDj9EkY/oddF3PCrce/CsuqUUw4wsm2k2TjterMcMmcYPH
         0sbE6Qy13QLZeG4OA0/1ZNMXj2h4/r93rYwVhEQZmi0KHW7MpY3jtr43XXKJz0cB/YZz
         jLDGt4uFz9c3halaq5gi2fwfVUKVovftr2ct22k893iuKb/Mh1R4kUMvkUXLTz+ztLQj
         kNq06zxlL1ympdInQ5QnEUN3Tu6skY3Yk2ygL1rDmWgANrmmsdO2gH/TzqQRt9K0tMyj
         mbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478030; x=1741082830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yByCYSSEzkECovCQGZDfhvx190eIHBQx/42yaxwgL6c=;
        b=pfJZ5I8p5chC0kXwnjSTU0h6KDkM6HJjFFlW8IcEOsUfAdhrxzuCqDUqwqZRUOwRl8
         c3epOEKkquuzQdwyx2ZBagLNQLFnfmxW8auFTGe0O1g3BBZ63Anqj+MMLjFE5N7Pv3LW
         q4hiTYpwlM+X5OHZHZxDOwIMtAHJA0mQ8Pfv/CpAxBlif/U7eAUM0JawdmYWnUTYdfy+
         8679b6uMo0JjR932ELIdbg7MO8lrkbKYwGc4eAhd2lvklLBnZG5fQIWbXRUHOzbz1dvZ
         sRhX+c/+rM0e1loWGqEb8ROipnsrwJwO4LLez3AMbgicXhs6qawzGCa3yFjuiw3misKB
         bkpw==
X-Gm-Message-State: AOJu0YxH82t8YzK+lrISjwYXHAVj77qiDrK8Ladz+giqG5tyLMYbZifF
	PFHSGrL9P1wlCuRr/qNH3f3114F00VrO+TW1s79w4u7Rfpz3J7PYxEukRj1UpS7VzpHwkvL4Aix
	YHjX+TyOzTeLP0w0Inr3L0elfnTw=
X-Gm-Gg: ASbGncvAWXxNt/6StYZjvvQucuvKjGMASvV7dfDp/q/sU2Aki0CuxNtpT6baAAw80ua
	wKa4G1VTo+TWGuNfycNJvX4yortbNSsWKTdxAtbnuMI7QV6fgv3YBIkbVBZIT7raKzTaEyb+SCn
	PKCvxQvWCaqaUTPAGmO/UW3xDrcBKIc3Z41jvut5L4uw==
X-Google-Smtp-Source: AGHT+IEx7stWUjIj8YNaMtfBJzpLxszH5pKzv6Gxo2TvSNXleEh9cz/5YKVVaCZCjtGmP/43IQPyNJbwKukckY+XeFU=
X-Received: by 2002:ad4:4ea8:0:b0:6cb:ee08:c1e8 with SMTP id
 6a1803df08f44-6e6ae829f42mr268443996d6.23.1740478030415; Tue, 25 Feb 2025
 02:07:10 -0800 (PST)
MIME-Version: 1.0
References: <20250225095755.12352-1-gavrosc.ref@yahoo.com> <20250225095755.12352-1-gavrosc@yahoo.com>
In-Reply-To: <20250225095755.12352-1-gavrosc@yahoo.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Feb 2025 11:06:59 +0100
X-Gm-Features: AQ5f1JovvoPOd73_ARNQaM01GyiTVShD9IL9jpc5Iqy0GzVRtgW6vf00OPIQrSw
Message-ID: <CANNYZj9LUf_N6=cAWBakqbQ0zPyxS+F119mma-=U8kkAr3Tw_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] oeqa/selftest: add a newline in local.conf (newbuilddir)
To: gavrosc@yahoo.com
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 10:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211869

On Tue, 25 Feb 2025 at 10:58, Christos Gavros via
lists.openembedded.org <gavrosc=yahoo.com@lists.openembedded.org>
wrote:
> +        # if the last line of local.conf in newbuilddir is not empty and does not end with newline then add one
> +        localconf_path = newbuilddir + "/conf/local.conf"
> +        with open(localconf_path, "r+", encoding="utf-8") as f:
> +            last_line = None
> +            for line in f:
> +                last_line = line

You can replace this with 'last_line = f.readlines()[-1]'.

Alex

