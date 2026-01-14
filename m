Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF6FD30CFD
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 10:22:33 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7256.1768386143539624950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 02:22:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SRbAaybw;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b29ff9d18cso917401385a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 02:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768386142; x=1768990942; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=scYHjRN8X5l/M/0y5EJKVxOY3UTYse2I4SHxEHPtC/E=;
        b=SRbAaybwwIeuI1QF0TAOI+fzZqyB36ywEOMVystNjLJ/rfXUt0K5X3cJHO+6QXtY4q
         SsR9zmIMZBxm9BMTAvb0ieWW80TPub91e68EsqodHdhwq1ubg5vXbXI7dUVP8046QIIu
         2ERmejeHioSbempVf37RCsRtrPGfysfUK5ep/QWD7Cn1EI5/GUcN3fK/J44vullhW3Ui
         AVTfDcY0/2STLiS9cuYh68uF0LrxSF0jpHI4WKSClzRK2Sd8gy/KRI740QFrB8fmx1pz
         PAW0usJDgE6LijuJQieql/HV6/bjvEIrr3EMdzE/Gmfp0TUSJHBNM7LyHwnG2/S81Ck5
         8FHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386142; x=1768990942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scYHjRN8X5l/M/0y5EJKVxOY3UTYse2I4SHxEHPtC/E=;
        b=OvA277GRLH6PddToU/fhXUXukPQk9iIAeLMAP7zpG08Ss89pa8Wnrb34VinEbUhmmM
         re+RjX0/iep+x8gSyx+yZrRok/Wh2UzAKcz4so+GEtOiFVwwI5kH8ltTIPq2OeqJ0Xaz
         ZUweK6LiNSM0uAV9P3CgZl2njKPAadUDZN6zE4XhvWgS5/fnVJg/uqaPnpG9p3TZaMNB
         G5sOghkOjlub/hcdshVDo+ys0h2WwDAm8NaeHynzMqa6SrZKta+KGS/n1POfIgdAJiyQ
         d+JK1xDY6xHWbsfVYAellEnCTFaIrv+9kL40zEfVN+UfephZen+VDYlqM9iYascFg7Vr
         FZSQ==
X-Gm-Message-State: AOJu0Yys8wO6Z4lynU9I+YHBeWkBCZrlLlybKt5zMDWte17AM03S+a0t
	dsqPeav1u8egx6CQUXXTdz1ANAsSG/c9ZzZ6Vj7ApA68+LuLNefMTHUYMEzjqSMVZHO5qvPDsIS
	EAUtCAHdt+mdMhFLGKp9ondvLgXQ2kh/AqMyE
X-Gm-Gg: AY/fxX564Ks9BoRgY/dIkLtjPUf50Sm4CTBWCxWzbpnYTHhcxyiOyMx4OrHtSQqJ8s6
	lMmET257+0DvNqG5Z8DtzpuckG1kQMpQ0w1u7whNdxdle6BX8UmnWPOFhstDajj1SnY7r2sfxXK
	9slO0klWK8pQoXZkQc6+9LzQLTX1u7dYy0Em/UekwGR6XaxzLFlMSkNz3WHV0KUUuipuI74IoDs
	44UmL8Gg7un/Rk8kquUJIvxbKGMXGbEOVqC572QtlmdsU2/z2hv35yuav0/Gc/d6f4pkHjI
X-Received: by 2002:a05:620a:f03:b0:8b2:d6eb:8203 with SMTP id
 af79cd13be357-8c531808de8mr189633885a.69.1768386142467; Wed, 14 Jan 2026
 02:22:22 -0800 (PST)
MIME-Version: 1.0
References: <20260114090413.586488-1-changqing.li@windriver.com>
In-Reply-To: <20260114090413.586488-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Jan 2026 11:22:11 +0100
X-Gm-Features: AZwV_QjeYH1CE0VPFGT3hjPa4j2JeBtRe6MqDVDP9-J1z-g0hFpiCvdItorIj7o
Message-ID: <CANNYZj-+Z8c-FkxSPqMvMgzyzoHnVvX48c0FNGkyAsrH47eLsg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: Lower the length of TMPDIR
 limit to 300
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 10:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229314

On Wed, 14 Jan 2026 at 10:04, Changqing Li via lists.openembedded.org
<changqing.li=windriver.com@lists.openembedded.org> wrote:
> Refer [1], one of the meson.build of gtk3, the list of files is long,
> and with a long path, there files list will make arguments huge for
> ninja. Refer [2], the open issue for ninja, meson need to improve
> to make this work, and there is a fix for this, refer [3], but we can
> still reproduce this issue with poky, I open an new issue for meson,
> refer [4], and meantime, change our TMPDIR limit to 300 to avoid
> this kind of issue. I also tested with 350, not works.

This kind of fix will just encourage further reductions in the limit,
as other components will be discovered for which even 300 is not good
enough.

I'd rather find a way to address the issue at the source, and carry a
custom patch for that, if upstream is sluggish to resolve it.

Alex

