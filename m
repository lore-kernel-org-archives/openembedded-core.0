Return-Path: <alon.barlev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE2AC3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 13:49:25 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web10.50759.1747057762425030271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 06:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jursBwYa;
 spf=pass (domain: gmail.com, ip: 209.85.221.173, mailfrom: alon.barlev@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52c65c00a02so619067e0c.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 06:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747057761; x=1747662561; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xw8SJN5eog+92gr5rudfVyknivm7kmJni4qa8xwn3X4=;
        b=jursBwYaelwjPDac5Y1Ptg5u++t8cMYkEVdkGzG8fkwtDCy7jhSVJpHdqqQMZGxqnP
         dMG84/5BN5J11xNI6Dpx5DoIK+16rytPHP5ugGW/0pDjYuHQ9pcm8OBG2HpyPTKni4u7
         Z2cl8CG8OiDeN8DWi0R3pVEbEkTGovPV9/R6epUbL6Htu44vevjGR7pR2iycuK7XizzC
         f6OlcAoH/KkB2eXEIaaXhQ3XwXP2RtWFIeUj28IaiqPsKZxIC81SFGhzZuK3aPTes5+R
         N/Sy3HnAiXrNKmMU1ZKwksKVfezV6QOMt3HRylIT+nPINzgs7x6CPtNQRVJT3rv+YCKt
         vaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747057761; x=1747662561;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xw8SJN5eog+92gr5rudfVyknivm7kmJni4qa8xwn3X4=;
        b=ni3bQSb7m6oPxePphEFg2YEzUhbJInU3LfpTkE9N9lw2qKhcGsxYgd194yfxn3Eqaj
         YE0uwWT1jUH7JpX2hzaZnVI3xjqb94yaSk86VnO0N79dHjkIUwDtU0vGTdvvdwD5Khod
         e014SyOhklIZNMJYRWGwaHB9cGogZ0giYL0bg1VF753usYiALRJqqSn24d7qA2dRqZlM
         wy0qpqYizk4QJBMEodrH6Psk6SvOdt9NoBo7L7fklY8aVb8bT71oYHEF3rcJkiynFPZD
         qluJ9J4A7eA7i/P/X+SR+eJ4YlxJ0vNMc/RHmLjHFln10HqT4NlCtG1foHbSwK91EGcV
         z4oQ==
X-Gm-Message-State: AOJu0YxmATRgmYXLI8WhQuaSH/H2jkylKVdMkEUg8Tws/hdxVWk17LzR
	SE/AVWv9M39IzxNnQDkCu0VYTsVmJQQWaIUosqH92cjFMz6KV2HvPL+9hk9fEdtvkYbmE9PyGWe
	9etTFWm81TPFjmBkxwp5H2zV5yuncHxDWX1Eqv5HKZP4=
X-Gm-Gg: ASbGncslcdrJfw1xEqGEKhTnsFr3UgQqrRTBNCp273YZ7koLWRRgjVxBkOsYR5lUbyM
	tysaRUG/smXF8zfva2IXP7tW7mlJQi9y4Sr92HhNBifqcVzUFLSv+J4WL4Aqb/kHWR+WDTQqZ+N
	1FJwMXfGXji/Ibc9MxHnO7fsHVZfm0ZqRgXA==
X-Google-Smtp-Source: AGHT+IE9XzW+bLlgC9FzKMTXgXBn+Gvqssz16OJ+RrBERSpxeCnsAhmSFsErVmuxo4Y7pFgAQi/xfpvI+07cmbqhZzM=
X-Received: by 2002:a05:6122:4682:b0:52a:90d1:ed2d with SMTP id
 71dfb90a1353d-52c53b37128mr9437278e0c.3.1747057761084; Mon, 12 May 2025
 06:49:21 -0700 (PDT)
MIME-Version: 1.0
From: Alon Bar-Lev <alon.barlev@gmail.com>
Date: Mon, 12 May 2025 16:49:05 +0300
X-Gm-Features: AX0GCFuX2WaRZ451AV5YaoJaoDaxgHUQy70X7rJPTDJbmQ94499Dxhtv15wPHNw
Message-ID: <CAOazyz0qBLixP2bfONcMs=HfSf6G_rxfz5AHoV+EZ+q8J7Q+8A@mail.gmail.com>
Subject: [backport] [PATCH] module.bbclass: add KBUILD_EXTRA_SYMBOLS to install
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000406bee0634f0950c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 13:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216370

--000000000000406bee0634f0950c
Content-Type: text/plain; charset="UTF-8"

Hello,

Please consider backporting "module.bbclass: add KBUILD_EXTRA_SYMBOLS to
install"[1] trivial patch to Scarthgap and Walnascar, it will allow
building kernel modules with dependencies without linkage breakage also in
stable branches.

Master commit hash: 483c6067eb1ee9562c0b21cea0d375c7f521bede
Into [at least]: scarthgap, walnascar

Regards,
Alon Bar-Lev

[1]
https://git.yoctoproject.org/poky/commit/?id=483c6067eb1ee9562c0b21cea0d375c7f521bede

--000000000000406bee0634f0950c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div dir=3D"ltr"><br><div>Please consider backportin=
g &quot;module.bbclass: add KBUILD_EXTRA_SYMBOLS to install&quot;[1] trivia=
l patch to=20
Scarthgap

and=20
Walnascar, it will allow building kernel modules with dependencies without =
linkage breakage also in stable branches.</div><div><br></div><div>Master c=
ommit hash: 483c6067eb1ee9562c0b21cea0d375c7f521bede</div><div>Into [at lea=
st]: scarthgap, walnascar</div><div><br></div><div>Regards,</div><div>Alon =
Bar-Lev</div><div><br></div><div>[1] <a href=3D"https://git.yoctoproject.or=
g/poky/commit/?id=3D483c6067eb1ee9562c0b21cea0d375c7f521bede" target=3D"_bl=
ank">https://git.yoctoproject.org/poky/commit/?id=3D483c6067eb1ee9562c0b21c=
ea0d375c7f521bede</a></div></div>

<br></div>

--000000000000406bee0634f0950c--

