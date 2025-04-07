Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A64C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 10:27:30 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.43908.1744021637167820138
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 03:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KIDdhDVN;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6eaf1b6ce9aso48216626d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 03:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744021636; x=1744626436; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NLb2CxvKZTtuVwzQkR3T8AAqWsL3WTTrUlnZjmJhJwI=;
        b=KIDdhDVNExfhNAicqZ1hTEMoNBO3P4Bmr4OiuJt2V7QxHhOo55ZjSeCkJpLM4I1+K3
         H+vAXC7P/vHkIlynaj5QSilrear0y++chT7JvBgiUIvueBNPLidkI3Ag2pmHZcNR0qcl
         s1TwrxRNX8K4q8ensxO6WVrEdYYYS5ySWUUgES4qWySAXf2rwHQYd2WELojHD7gX2hXu
         slPRAgyPGa2wkow5MjcZC6MBjdMwyNF5AXAuutJQLPY0tNOmVuY/wiqPANcN7KETRXKi
         /Hv6YuH9bLLo0znLMtEjg7BKo/OPsMuVhF8A2h9ItfRUXU78y10oW+mRiooTymAAoQio
         YAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744021636; x=1744626436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLb2CxvKZTtuVwzQkR3T8AAqWsL3WTTrUlnZjmJhJwI=;
        b=RfdMg3o+7GK2qJp4rgrDXX8mC9RZCpWIGqx0h+UZlUnmqMHY/iCvh2J5g292vZzD/c
         GENYhKuCcJtHMmuNjyVFJPkEqKxOzSMAzCzvfm0We1sJyUP62tuJKbCS8oOoRu3vcTZv
         CFZj0DfF1CyXPg+0naUHaQL+txlVSZC0jDr2BBHsO/XSkb7EZcmv8sdROJlqklvpBcnb
         RqNELnUQH/zXgINyNOkZxN+RUSl3nN89icoEz2LkxIp3PUwEQy17+Ce68urRhkC0ulsb
         MOGvwSV6k36S3U54cnVbnonouInnDE0wQJz7QHPH5x4kN/Dp0DwLxUr4mLDQnPhmAHeW
         Q03g==
X-Gm-Message-State: AOJu0YyKLAtW48P5rs369RXv5kNiQOYN6LJyaT8zkH5kgiWzJBek8KIz
	FDp/+uG2cWoinyHBr+nfr1bdkFxEApDqgHfh5HrwSJfUCPZURWF1XwaJYlxAikKstzdEKitYFZy
	+poHP/PAhkOt4lDr0nWCUvyzOpbZGDQ==
X-Gm-Gg: ASbGncujrYdDVUZp8hzVQXbA9etVf8YCDPkIn4A12MGlb6reqUeyxmrqdel1ezZ5w4z
	2TSgbIFoLIM01QBR2xvOxTRkMF0k10YOPUueGDkR61fQ4a2zevpDkTZcriDpU5EU4fP3Wy4m9Tr
	YNjFuMbhEJyS+Pq7Uu4Ai6O5N/TOdEvaUcO2yeYGFG8wV9J7riPLbTtumALhYx
X-Google-Smtp-Source: AGHT+IFxDe4VgURoLOifORvDt4GB3lL0mlLhb5kHvXnjffO+NvRNKUGSUlHpbn+FNRz26QAscw/FkkJhFBoaF4avdFI=
X-Received: by 2002:a05:6214:ac1:b0:6e1:6c94:b5c5 with SMTP id
 6a1803df08f44-6f0b73f560cmr136868216d6.4.1744021636212; Mon, 07 Apr 2025
 03:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250407080931.3926302-1-hongxu.jia@windriver.com>
In-Reply-To: <20250407080931.3926302-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Apr 2025 12:27:04 +0200
X-Gm-Features: ATxdqUEmu6Cmsw33vHXAEIjxiVIcdRnM3yFr7-rn8OW7zzTCbPjzt0VzF3YCQYE
Message-ID: <CANNYZj_6nTK+y23kjjyDgzXgfxwim8ppSoRNC5mPPnRPg9+myg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] barebox-tools: fix host contamination on libyaml
To: hongxu.jia@eng.windriver.com, =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 10:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214447

On Mon, 7 Apr 2025 at 10:09, hongxu via lists.openembedded.org
<hongxu.jia=eng.windriver.com@lists.openembedded.org> wrote:
> +Subject: [PATCH] fix host contamination on libyaml
> +
> +The barebox-tools uses host gcc to build dtc tools, and test the existence
> +of /usr/include/yaml.h to build with/without libyaml
> +
> +It caused host contamination if /usr/include/yaml.h existed on host.
> +| tmp/work/core2-64-wrs-linux/barebox-tools/2025.02.0/barebox-2025.02.0/scripts/
> +dtc/yamltree.c:9:10: fatal error: yaml.h: No such file or directory
> +|     9 | #include <yaml.h>
> +
> +Explicitly define NO_YAML = 1 to disable libyaml for host dtc
> +
> +Upstream-Status: Inappropriate [Yocto specific]

Please report this to upstream, rather than just make a new patch and
mark it Inappropriate without engaging. We have barebox maintainer
present and active right here, actually.

Alex

