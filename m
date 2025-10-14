Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DAACCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 07:26:57 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.9515.1760426812985885107
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 00:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cCGhVip0;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-7960d69f14bso37905976d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 00:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760426812; x=1761031612; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7err38pjFopKk07QZ3CLjtLQQSNzZt8I+1yuXaFrFgc=;
        b=cCGhVip0WggP+/Ro/p23VdqUorHnVk79joMQkXLZzy1/cFVc5QrMf5OUvFLC7azG9G
         jmL57dfYvzmMXymYNaRU8xw+MQb1ye+H3zA14h5dSGjRbtpSXExrOTsyvfOYAS3su4mb
         4swyYF/BGBslySFcykCFR1+kJmzvignLOHBCRjUJZlHYkFZa3UNy5W1bVoHDqYVVmwqU
         Ea6/X4isMHeR6ID+/+Myfz/DyBr+DPpJoK9d1doG3WY0nQLyEJYaF2MrKGuL03EHv1AR
         4B+/7vDBGLzlZ75xnJ2TM2mjaygSloyxbbHhJgxJyObOGn34zfe22ocBe0oj1TWPLMAt
         4joQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760426812; x=1761031612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7err38pjFopKk07QZ3CLjtLQQSNzZt8I+1yuXaFrFgc=;
        b=IdAjT+IIcvmZtls9v1++0kPOW4GD+oIhe94yKV71AtveDprJlQ6LGPz9N65seLJCbs
         dAyeIqlLQSwxeJxZDiNEqzXAotINNWQLRGZwxhQr6Ij5N6O4dMwjJL4n6kbNxf9ujov1
         OppcKbVqLZI/ccDb+d0GlWnFS8+ZguqBbF6PDOsTnZLN3maJXeK4tS1QWFmjyoUb3ONG
         52o21kQkrCipZ0F+yAvrCTTqv/06uWA0/CHMBEKVwASsEscT9ZfZ/2HHAhSnwNBgT2zc
         SdkozkOeuGcYK9HuIP77ScErzYWOw3hug3zLP9Gzyl1hSl7PknOcMuFFxexCVmnNhdWs
         8+Ug==
X-Gm-Message-State: AOJu0Yz4ysw87MbO6yoiaPX/ESPdGzvrLUaZchZWk9ukvLuu/gvSTrj5
	LmJyd+Fm24FuAcZWPb7vfvpdFeyI4gr5ol5Jw+XsHSEAbnCVtxDLlhEEq3d1DZC4B6HQ4RcwBgA
	L6nsZIYae+M+O76QH+yGnOAbcdDGNaFI/fyOZ
X-Gm-Gg: ASbGnctIhOBvgoXL1L5U3wOHwrd0qUcNHUU9hU31+hA7ldnimB+/de8JWDNok9caa0z
	RSgeeqTfg5Em9CI9WnOaIaKiaVee58/1O8x4jvF/+h02g6hRi6wbAYYny48gKvYw3PHnpDDjrYX
	6g84WlBe7SuoSzhfTDZHH/ZrVmZgXsh/8RdlYJiwMAQ63kwhJ4F9ro6aKZC3+P8cEIXfnnFthaK
	Vk7jpJ6KooPZVlCIit/LKdvq+i9I9zKioM8WC+Uymafh0dwMjWNkuLzb+FhnYlyJEf0+NGDUNE9
	4tXo0hhfezctIz+K3Zh9fzWA+g==
X-Google-Smtp-Source: AGHT+IET69PG8caPm5oj1Y71mXl+jDNKMBsNiRL7pnpJSVYl0wvuYiE57o+6xDZzgYDyhSwLllgLPZcIO6Az4wLIr0k=
X-Received: by 2002:a05:6214:238a:b0:7d1:2764:2aeb with SMTP id
 6a1803df08f44-87b2101ea54mr333269096d6.19.1760426811987; Tue, 14 Oct 2025
 00:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251014025639.5114-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20251014025639.5114-1-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Oct 2025 09:26:41 +0200
X-Gm-Features: AS18NWAmtHQbexGTgF7GGf-_gRyvVjeeKBpTJJH24dbuidQMBgA4dNBfhdcVYjQ
Message-ID: <CANNYZj_SHfbh3yQSBa_0PWJL-wFXGYgw_zLHNwWpf6JxCVNuBQ@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] kea: fix conflict between kea-dhcp4 and
 kea-dhcp6 multilibs
To: liuyd.fnst@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224812

On Tue, 14 Oct 2025 at 04:56, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=fujitsu.com@lists.openembedded.org>
wrote:
> -From: Kai Kang <kai.kang@windriver.com>
> -Date: Tue, 22 Sep 2020 15:02:33 +0800
> +From: Liu Yiding <liuyd.fnst@fujitsu.com>
> +Date: Tue, 14 Oct 2025 01:37:35 +0000

Please do not change the author of the patch to yourself.

> -Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>

Same here: do not remove previous s-o-b lines.

Can you submit the patch upstream here please?
https://gitlab.isc.org/isc-projects/kea/-/merge_requests

Alex

