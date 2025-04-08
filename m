Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB80C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 08:08:28 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.69686.1744099702276489305
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 01:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z15NM941;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8f6970326so51121126d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 01:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744099701; x=1744704501; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OXh92gf77iWxbcaGx4x5/lE+nPGP9NynM5d0i9STNm4=;
        b=Z15NM941pnbU/wxGPiJB5ppGVEoiSc2MeRLOFN9mW28MCanHrF3ng/daa9Y9NmeZfh
         /cFsKnD/rRmPDlgHPW2ohQKRurMJA7ubDwT/HhZEytZxTTd2dknfIn8eyYv5AK61M2rv
         huuwvmtk8g520Q2Zdq0ZJ/P0dg94FmlfNl7X9AKHSS8GcHszvs9wLPlqzxH4ZnE5t2f6
         J0fv11s4o+avGLzGi5ZQQmHPYJGAuypPkQL1lO/m7N9NJGEDI1TABMYNrP7HFlUr/5Kk
         1PGplH7xNZTSndVMT4vhEJGMhyOSKQSGAp5p8rBmZzW9iw+02T5DbskwAYWMSCv7TfLH
         Xfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744099701; x=1744704501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXh92gf77iWxbcaGx4x5/lE+nPGP9NynM5d0i9STNm4=;
        b=ML/CsnBT1tBrX13yYi79y/byj9tvUswYNaUBhduBwWRRjOxEBoyM52qJOO2wbRo7Zy
         O9U2KmeRwpEH1bVd4mOdYksSXvGof5aBO1ty60KopJ78R7wgPZGVjPNxnhK/p4dlvvZa
         wswvS7zQY9dtlTerF2b7gyYMmiA7OISIhNcXTOuSvVYoxHQ5glfzboRE3tkbXPPIRtoP
         WcOY/LbRVIKxf81NiwjAkTLsd67fMyIV35wgbGNuig3xA0po8v3MUp/nf6W67UWLOLwW
         IWv3udT5PyS7LC0QLj7Lr8F7PeRFFLVnePjARjJjxXM6Ak48ZbFiGA9X0C6Ii8+rTDjk
         XNNw==
X-Gm-Message-State: AOJu0YzV0nzlNYZRB4rqfRfV++WqieURy/icmPOSHuLMPSCLEQD2Ul25
	7J/dc7VUrvj3W7jLLLb7JY2exanX8KnPsdcWuMoJSCic5iYaEbjF3GygofCpYSZ9DrPksWsBTvP
	qEwt8tRnLqtSqyvNeM5S+ER5m5kTfDg==
X-Gm-Gg: ASbGncvr3iG3GR5ofkmGrwwEuzBE0AxGNkb2Id5OapSB5uO9DOoksHRA3QLFjGh6qW5
	r06a3ewa53EoAk0e7U9crEQMfuttwzHNhRI+i2gCfcU0ZMXIUeMCc45bpLGAueCpbPhOBes9BTa
	0619HqOnXGcSftxvohiDgrXm7y2Legg9WWpIzSwWK5pDTww66VJUeZVw2EAm1u9yeUAyOZx0A=
X-Google-Smtp-Source: AGHT+IGa0V97wkHabKzh4pyWv1N04Ok0skjFteYnmaJoV/VuKJ2Mibz3tp0wgE7l7xS6N1mZ0tJR/4hHBz8CR5Mq7uY=
X-Received: by 2002:a05:6214:20a5:b0:6e8:fa33:2969 with SMTP id
 6a1803df08f44-6f0b7413861mr216100206d6.10.1744099701295; Tue, 08 Apr 2025
 01:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com> <1744073502-27695-6-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1744073502-27695-6-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Apr 2025 10:08:10 +0200
X-Gm-Features: ATxdqUGNqJnPTCVoBJcYxnKyf7KMC7zm04FNpFVukooedvbEUxh8d0-anh2DUJ4
Message-ID: <CANNYZj8-kxkezeRcyMXLzzXHg0L+5qXvO-zW-iMefp33eXdPfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 06/15] libsolv: upgrade 0.7.31 -> 0.7.32
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 08:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214513

On Tue, 8 Apr 2025 at 02:52, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
> @@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \

Can you please add the tag parameter to SRC_URI line for commit id->
tag verification? And please the same for all recipe updates that
fetch from git and use SRCREV?

Alex

