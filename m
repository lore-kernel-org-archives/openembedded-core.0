Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA7CE7718B
	for <webhook@archiver.kernel.org>; Wed, 25 Dec 2024 15:12:35 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.8359.1735139549801212045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Dec 2024 07:12:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N5fsMVYM;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6dd049b5428so48291456d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 07:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735139549; x=1735744349; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pyznNKtK1WwWf5gxX1vQFyarWf8baSRyTcgRPowTJXE=;
        b=N5fsMVYMnIInTmn73f3dvOhFRSbK8JwUkuLtzbR1LMaQUBpU7t+XbNJBKqP3rZ6e8q
         kgDw1g6l//WRTazjpQHciVemPEMUeuARnjIUAOG/UQATCaSlz/BueC+xkmm8KpyJTkIb
         oI1DbYGIxX3nN2vOw84wq3ARqP408bKo2ItTFONjZcjlC66iFOgmt3nKWjElMVLv6Mty
         +EMHTc8d4+1Ckk5lnQ482bGe/OHegXNXae2atdUwl03Uh2mM29bMXGJO5X3oczTYizjx
         3XzC1m98UBWtajX+vsQFrgyDvQ/g3lvVUSmQB0G/4gt0kH2Fbp+CL9L2n5BH7Ig8bg5E
         LhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735139549; x=1735744349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyznNKtK1WwWf5gxX1vQFyarWf8baSRyTcgRPowTJXE=;
        b=eZyja5UMpxCmNPG3hXMNPF8bjDYa/xS+srWwXrWZF7G5gAHET3/nI6jlWMqrjLDbQm
         UXc2TIVlqQQcdPjdlSbGuPh8Oxlz03QwBRxteLgVPs5zpxPyoG5qYdzyuIDwj4mHt2m7
         LVGmrzmi4lg2hgcnSY1oPXU054obDH8TaW1JD5n7XjXm3r5jGYy/wpEstJH3/j9Ukgwf
         AX7xD0ccGRyJL78i8+d92LOXTCv0vrsPa7DojryngUR1OJE8MfxWOUGOW4ac0pWW8GaV
         CiNqypgJF2+Lh65mxHCxRkupW9tlIj5XCzK4t0GyWQ6ts831iPJUadHDdYjwalS4CINY
         J2xw==
X-Gm-Message-State: AOJu0YyRr/1eE+AHK9kWmKp1SV0AE0N+YTRVD90YIP3AbOAQWoktwrBI
	3wqLN4liGfK0lCnuUcZnpWG7ChOYGia5o5pW+wDQDo9fwwKbK3x9Hlw0+wbczzLTwVP+JIZoDFv
	8hCjH494D85Y/qO94HoAqVP+QkzIKBA==
X-Gm-Gg: ASbGncunR4UELCsG8V4gIoiaOBjSc7BKHXW3OwCujG7bzVh9mi7wPwiD/MH3IV2IX1m
	gNwdhXbj8RafcvbMV3eoYxh38THRLlCEOV1sfoF+Ob/tx+DWz+eJN+LJAgKhwPLUpLeP5oz9N
X-Google-Smtp-Source: AGHT+IF1tkFkCOe40RRU6EM97e0bnv2rDw3sME5+80gH2uvm9IF8vpSAJ1WKPDNDIxTVKBw0jF5UXsdeoQc8DyNH+pg=
X-Received: by 2002:a05:6214:f07:b0:6d8:88cf:e690 with SMTP id
 6a1803df08f44-6dd23308e19mr364951976d6.3.1735139548795; Wed, 25 Dec 2024
 07:12:28 -0800 (PST)
MIME-Version: 1.0
References: <20241225081408.2262171-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20241225081408.2262171-1-jiaying.song.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Dec 2024 16:12:18 +0100
Message-ID: <CANNYZj-FRjTwBV_u=9eeizq+4N0_7WJZ8bBcoK0dVwvo+bU2dA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] expect: Replace tclsh with tclsh8 in the
 scripts used in the Expect
To: Jiaying.Song.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org, changqing.li@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 15:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209081

On Wed, 25 Dec 2024 at 09:14, Song, Jiaying (CN) via
lists.openembedded.org
<Jiaying.Song.CN=windriver.com@lists.openembedded.org> wrote:
> +Upstream-Status: Pending
> +[Since the upstream (https://sourceforge.net/projects/expect/) has not been updated for a long time, the status is set to "pending"]

There is a separate status for this situation: Inactive-Upstream. Please use it.

Alex

