Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2651FC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 09:59:34 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.7888.1742291969407868445
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 02:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ljx5bnCi;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8f05acc13so60254256d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 02:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742291968; x=1742896768; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2kayLs6czKv1WE0hW2pXmlD1Z9IlQfjaLrrFbhgz5+0=;
        b=ljx5bnCiSfebdrtPkYYeV6P2sAVkZc61ptF+j0vMKSbaGgR7WjQzp+DMU6mK4U4Fzg
         bzgwdje0DECYO4zs/6kUkASnuo5so4iayXwcLAqTg91oezJz3UssoErZD3b9yySUTNq8
         sFUEN2vITScpmuX3/KeMPcqJm075+IiDcgqpz8Wm+iIzJ2JAjLnVRBtvH1Tar+t6i5gl
         rEwWwAOR23RT1N1zzOWvTBesHgO/DQRl2DQxhrnSol8PlOGAOwMjS8MJ2qn2gngZhgi0
         oWgt6v8qRXPSkYLaE/Zm8L15fpv9SYfba1sFe1IPmntkwe+bh6ZtbKolnjZAEzaPS1eJ
         IJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742291968; x=1742896768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kayLs6czKv1WE0hW2pXmlD1Z9IlQfjaLrrFbhgz5+0=;
        b=c4+wPu+nYdWKcKNoSr/AKUodv8vM28yUqnzp7GVRC5j9nnMOusNNF7peK+LGzhrsKZ
         +L1pNRPu4xK808tPu+PqtUcAiFYFjbhBJV9GVXMjuc2PkW07bGgcF0i8JBFx4DmExW4u
         q1vWhQlndbqfCnjN62TDXWfVkYR/J8LiKE78EF4/+4QuPM0OUKpLTnxN4NlJ7kcubbdh
         twmyIPfLBa9o7FpogjK9K+toETjO8ZsvSyCRNFezp4Hw5cejWAA2T4nZEfoTP6VGJowV
         97JeZYT2NJIh893noVgLpgqW9/R8UZFPXjdJqlzIqxQxNpnjrsIjycWyTWHk5Onf4gX0
         iG9w==
X-Forwarded-Encrypted: i=1; AJvYcCU8JOLFca9E38kSRnMUkpSAHaltXry1bXUDhtgPVu9KkCberGD4ANVXte7j7s3KeKEwneKcG3tlCl58WfTbOV+z9w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyhCSv+2ALrpdKEQfe+WwOhsyW4ZQOLjr0G+xSJZiE5eHfdqbWo
	c2X3e7Ll6rxXy4TUZ8/iz9+aWSJWV/jx/fumPeYB3m4uxLtfhBNIQv67p46noqN9ebehWGepe6Y
	MsmSqrsAuqnK/YVwx8CaxmoZf6i8=
X-Gm-Gg: ASbGnctKBIdu7UMPNCQpb7GkVorbAYIWING+9RDGEdPOkGnAYKue7HnH7Z3vil3RYnx
	40+s8h2J5wmXOTgHTj/0eQXnAF7b+eHjodrHhFNytpA232AWBqyqI4lbvQ9+pLNrXxat4AyAt3u
	64wcHGLC4Vm3lXfvWidk3zisXj8+Uk+2qGO2oGH7i0SSUXW/GHUV95dm/MGVUE
X-Google-Smtp-Source: AGHT+IE7Pd6eoKxt66mihB05Nok5vOMcndgkPlEIfsxAo7xWX2bZJ+PwOWGVm3qKvR5c3Blyey9jNfhEJQzPSSo6BmY=
X-Received: by 2002:a05:6214:ca9:b0:6e8:f3ec:5406 with SMTP id
 6a1803df08f44-6eaeaa1d006mr237506806d6.19.1742291968175; Tue, 18 Mar 2025
 02:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
 <1742278912-2989-12-git-send-email-wangmy@fujitsu.com> <Z9kjJzXOkfoHT9Gn@nuoska>
In-Reply-To: <Z9kjJzXOkfoHT9Gn@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Mar 2025 10:59:17 +0100
X-Gm-Features: AQ5f1Jr1bEGIlplr-MDH8wARGekRhzSCKi7qFZjxxq19IFRLwu5VAIuWXBHGpf4
Message-ID: <CANNYZj975eQgZ7L1C7ktD-6rmMB+GPMDYydJeYuJ+q-mYm19dw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 12/12] systemd: upgrade 257.3 -> 257.4
To: mikko.rapeli@linaro.org
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 09:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213196

On Tue, 18 Mar 2025 at 08:39, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> >  rename meta/recipes-core/systemd/{systemd-boot-native_257.3.bb => systemd-boot-native_257.4.bb} (100%)
> >  rename meta/recipes-core/systemd/{systemd-boot_257.3.bb => systemd-boot_257.4.bb} (100%)
> >  rename meta/recipes-core/systemd/{systemd_257.3.bb => systemd_257.4.bb} (100%)
>
> systemd-systemctl-native should be updated too. Or set the PV in .inc?

I wouldn't mind that. People constantly forget something in this
recipe set when updating.

Alex

