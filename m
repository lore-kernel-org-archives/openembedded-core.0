Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20E0C369C2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 15:12:58 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.11463.1744902769614011817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 08:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jj+dpI+G;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb5ec407b1so139022666b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 08:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744902768; x=1745507568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkBXS5U2akpr53cTcCNhDdteG63Ai4oXjzXn74VBtKA=;
        b=Jj+dpI+GFao6eWfNAICxphacEWjXU+WMkaqiQCNY0ZGhEEKZ8jLhldqmgDDmL4p0Hw
         zfbgH4+HfitVEn5IJNMn5a31QSAEP21u/L/GgMRaOu52ohrqwAEUX5Kbeq5VH6OzJu0D
         b7GjpV6R7hH+JuC+l8uCUwrpDSvF6SGVXsJH2qhpP9li/c8qTf9orrnvaUDtqWTf92B/
         ztsrxNLv6PGsZCLuwx/mknPiS6H/5t5zdj7kbqsdxd1Av7KRIIl9jkilAJiqogDWwF3m
         wuwrDJcfNmtx4Rky62D4R0pEkq8MTanrZkBm6rVLLPGkdFSX3ljA2HlLKzb4e83q02QB
         fEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744902768; x=1745507568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkBXS5U2akpr53cTcCNhDdteG63Ai4oXjzXn74VBtKA=;
        b=bc0L286knh4bsfveDFVMMiHgJsBj9FX8iwTRKLSRCsRB2Amj6YIr4k4L3kN0J/xAn9
         ekXkV1bzSlwJ54XTQbn5fCWkxVVWEGtKBZANmdgWlbiKmtuZND09AycE9j85kGYJDIgQ
         3ffXIM/FxhXPF7dYd9I5Mc2R98loIjy/2UwzJyQmbHIC/6bo8bwOLzK/PeS2MBwtD8TM
         0GPFFoOrE5rLaT4zEbxrMmnDyP/Reh/M/nTnq9ZjPtNHm5jiQgR0iy+Lie92E8Vz9ObB
         aeg1acS0PNtfZK+x0s0Yp+Sid+fOip6TmRlnQgQKNK/xMzfxYZuUmMypOl02pBQ41rnc
         64wg==
X-Forwarded-Encrypted: i=1; AJvYcCVUydGT0LeMY2D2ZnnSAYs+0yRsZIjmhjZca4vm29c7PLtTg/+rQnFfD3ym/g+feUJtAF4HwHZhDQe3w6GFZZ6hNg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw5pDH3qXLM0e0DehB4k4gnyX5fjHOE2FUaMLDi4OXmTeL38Uyb
	/SYbwuorzUcnf8l/ZNU5CNhTWwpBheXKoi96aPDdt+om8q+QAPav
X-Gm-Gg: ASbGnctOkMivTzGN4jDQh07z8apOa6mu8L0nyabCWt0dmC2YqfuyRadIUPBH219+oRN
	Iv+5x/I3tGbxrU5uh4HKoDVBnOOoz/n7zt+4mPXX9cxLZ+YFei4Zdfzxm/10U/0bjv1y9NZzzSJ
	ld7zwlYISEWi0MnYlQMfHsInSXlArcqIa0A2nPofpt79Tvyh2CIy/q7FcIfO/t5HD/WrnwBjxe1
	M4bIP3JrfrlAv3V3kJ003mjlLRqGTgsAomJas/Kyt0v+JarVD5QI6MWOY0pxEjoL5dGdKiqmuuO
	fiNBAfHmVN9NlOoxflQ9pXsbG8yYShc7UeJq1uu42k2tmYuBPd0vlXGv
X-Google-Smtp-Source: AGHT+IG/Yus9i6LWxlm5S6VYZ2KeJIQA4AQR8gXbxRNNbAm9s+bfvQs1ptlPFG5bOQEYOVdwozf+cA==
X-Received: by 2002:a17:906:c108:b0:ac7:e80a:c709 with SMTP id a640c23a62f3a-acb428752c9mr541110566b.6.1744902767787;
        Thu, 17 Apr 2025 08:12:47 -0700 (PDT)
Received: from localhost.localdomain ([93.159.28.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0b302sm6919066b.3.2025.04.17.08.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 08:12:47 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
To: bruce.ashfield@gmail.com
Cc: michalwsieron@gmail.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel-module-split: Allow for external conf files
Date: Thu, 17 Apr 2025 17:11:59 +0200
Message-ID: <20250417151158.282362-2-michalwsieron@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CADkTA4O_t=cggrERmZV8L64X9n3iEatdtqj5_NcGYxzcxAPDCw@mail.gmail.com>
References: <CADkTA4O_t=cggrERmZV8L64X9n3iEatdtqj5_NcGYxzcxAPDCw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 15:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215098

> Whenever we add a different code path, we need to add a test to
> the oe selftests, both for the existing case (if there isn't one already)
> and the new one. Without those tests, we'll get a better understanding
> of how this is supposed to work, that it doesn't break existing users
> and we'll know when it breaks in the future (since this obviously won't
> be a default path with our reference distros).

The problem with this is that there are no existing tests for
kernel-module-split.bbclass. So I would need some heavy assistance with
writing such test cases :(

But I do agree that tests are generally a good idea.
The whole reason I sent the patch is because I noticed that behavior
change between kirkstone and scarthgap caused by this change in
oe-core:71460993f350bca3d5a22115fd5551696f955c9f.

> A comment about how your high level description in the long log relates
> to needing to move these variables outside of the conditional would be
> helpful.
...
> A quick comment here would help as well. This is now outside the
> conditional, so a comment indicating that the file at "name" can either
> be generated above or placed there by a recipe will help with
> maintenance.

Will try to somehow explain it in v2 of the patch.

> Also, what happens if the file at "name" is updated ? I don't
> think the module splitting would be re-run, so would we have a
> "stale" file ? Should that file be something in the kernel-module
> recipe that triggers a rebuild if it is changed ? I don't see that
> mentioned (maybe I'm imagining the problem) or a requirement
> on the recipe.
Wouldn't that alter do_install's checksum? Otherwise I don't think I
have an answer.


Anyway, while I was preparing this response I noticed some other things.

1. pkg_postinst hook
There is this `pkg_postinst` part for "autoload". I guess I should move
that hook so it is also installed when .conf is vendored, is that right?
Although that wasn't there before the regression commit I found.

2. Duplicated entries in (CONF)FILES:*
Even before my patch FILES:* and CONFFILES:* entries for kernel
module packages are for some reason doubled. But that is probably for
another patch.

Best regards,
Michal

