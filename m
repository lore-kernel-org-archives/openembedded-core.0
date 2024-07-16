Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463A6C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 07:49:07 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.5452.1721116139765639406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 00:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QeMDI0e1;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52ea1a69624so5419928e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 00:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721116137; x=1721720937; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KBqwdt3safYtIgs3vCihfQw6tlC9kO3wfWHyxiUvUBo=;
        b=QeMDI0e19sgcyIPAEjyRap/FcCPu91djqoyjq78GiquDYUzgiguYApmnFlFpzk4a92
         pvQeLYOGO40NwNDr3jiJGUqsyW6oqatUPnpta7oB313d//RDsUFZRE7oHA2LN7rrquTr
         KWOXGz5YoXHhGZxmRd1e7F+4AzirAdmgqztlvdlKOVPUiyqXcyURLT9Ms4XOZC4OWv+6
         a3I+Lux98V0XccQBIL6P++Ni95IRTkV9BwTDRnhdlLj1sXNMPMXfEUYjYr+7jXtHYWFk
         N7wnnDM/9pfGQOMaGSzvXTOTUsIRu6OSH+qdHwp509qq8m7K8zpxAzP4GpnjP5NHYQLL
         chqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721116137; x=1721720937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBqwdt3safYtIgs3vCihfQw6tlC9kO3wfWHyxiUvUBo=;
        b=UeM6zMXHY8WVGYNIeYBOAZWGpmKBtYcX1r5TSA18eoLyNjPESOaYJvM6y0ipnT3K1R
         Rbs0n6tHCLgzQB8jyz5/W6nbHooqg6mGnyWN/SuYn1vvEue99jrH1obqu4qHpNCaRgnx
         67bbmhAngLfKtVN7Kf0ymP5N+EW4UNi26rVvi4hYAM9C2NcaezsFv5APxVSl0HPbNy7c
         vzcRbAovq6qTwC8gHcTjA8XdAjG+/FhQxCnj+7cmb+NKB27Z57rLyRADfsE35yYlRYdl
         g60vV7Gk/u/6qRdYC7/4qpyTWkgW8UbPUkwlGikG/ehFKbeYNjhwR1Hw2y3BzEix8XlF
         nGJw==
X-Gm-Message-State: AOJu0YzjbPIH/vlTeUOZDCo68C3fJG7MVzcKsrJDj30YOd889dleNQN9
	3SihTOM9UspljO6lHCUtANalmnBOXG5Q2h4EQea3lMQ6bWQLXIvY4k6HKGAFupxsyWWm4Pn3ODM
	rNrxsOwA40a3Krcwengnym0kI/Ug=
X-Google-Smtp-Source: AGHT+IFYtplMzMPfOmuTLoMO/gZ8vEVYfKfIrqTRp8Tb5B/gl/fYe+QfVzpxn/S1XXJrlEX8l6eIG9dtXpypiCWL9sc=
X-Received: by 2002:a05:6512:3ba3:b0:52c:fd46:bf07 with SMTP id
 2adb3069b0e04-52edf030beemr957626e87.49.1721116137154; Tue, 16 Jul 2024
 00:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240715180205.2493035-2-jose.quaresma@foundries.io>
In-Reply-To: <20240715180205.2493035-2-jose.quaresma@foundries.io>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jul 2024 09:48:45 +0200
Message-ID: <CANNYZj_UaF5VkQB2DaxB_2nDeO4aEckvd92PZpGQo1AdJj+=-Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] openssh: upgrade 9.7p1 -> 9.8p1
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 07:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202084

On Mon, 15 Jul 2024 at 20:02, Jose Quaresma via lists.openembedded.org
<quaresma.jose=gmail.com@lists.openembedded.org> wrote:
> +From: Jose Quaresma <jose.quaresma@foundries.io>
> +Date: Mon, 15 Jul 2024 18:43:08 +0100
> +Subject: [PATCH] regress/test-exec: use the absolute path in the SSH env
> +
> +The SSHAGENT_BIN was changed in [1] to SSH_BIN but
> +the last one don't use the absolute path and consequently
> +the function increase_datafile_size can loops forever.
> +
> +[1] https://github.com/openssh/openssh-portable/commit/a68f80f2511f0e0c5cef737a8284cc2dfabad818
> +
> +Upstream-Status: Pending

No Pending patches without a (good) reason please. Submit upstream
before you submit here.

Alex

