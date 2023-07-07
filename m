Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0448EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 15:32:40 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.15459.1688743953682208902
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jul 2023 08:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rJJr/Jh2;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4fb94b1423eso3111707e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 08:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688743952; x=1691335952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y18MOdbDIxGC60CdNaG7TxzAEK/c7qDmYOLfZbEDE5c=;
        b=rJJr/Jh2eyIgcTtX4tg9ENXemLjlZN5qQazpYhx5ENYyMZiKhHMp2pgxPCUHh4Mr9F
         tZ3d2H9T1tsObrDl9FzZXZR/P38axsb1d+xF0uz0YDHzfgYhAx4T2gjN4NtxsBt5ezPK
         knpCED9mv78WO4MRkyxBBBSWHn4sOCc62UF6LYSuGFWT0RsIlODzTbAEPoJNfBjczAgY
         vZ54s38PgVLNXziX6OTJzlFT5M1RxNu0w7g0NeMd0GxNiLL1qpQofJsmi7/FQc50Yvyl
         f4wRu4qYSp1VMg0hkW/AWw2PiyD2U8d//6FHkdBKq9tb5NNUzDM1eiA83S23gNPDFQJL
         G6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688743952; x=1691335952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y18MOdbDIxGC60CdNaG7TxzAEK/c7qDmYOLfZbEDE5c=;
        b=d3Vd40fV2ijKS01o3vSkp+q0D3CKz8jEQrE0pa3ApjawNKowvpcBrIM/O7RSg6BWov
         dRlKAeDSlAxlYQq4Qy0fiOQrFrbGmYtX7aTjuvrwd+332BsLSQgTqMLdwugS+BVXRT4r
         hj4IHMR5PpMlYHOuLeab0yIcicXOD4Vpo+Kz/9wrkzjqKg1pJTeIftLFmUqMVnzVp3OD
         2cnMH8uSvf//7l1fZzG9Y1/9MV+JnMpI9XkQtYXIRff8WgU/xbjq+47Vkbc6hbrIebWZ
         lDR3MXq1qeP+woR4swTlRRRid0QqUT/9DPWbvlvXpPT8HKi1af6d5RicdSI4BUG4MDwF
         hqwQ==
X-Gm-Message-State: ABy/qLbVqyH0hGu47uX8WhvUNvaam7tRuZZ0B1rFrD4GMxH2VZIdcTuy
	1Y4riCuvGh4S+qvM8drpWuGKBGNVFnEYVmfNOR8=
X-Google-Smtp-Source: APBJJlFiqxJJXcOewTRAOK3yQJqRYgYLfaX8NgoTmmpe0XDdzh0vpK4l5D5zvZysvhP+Xv9AqqeMv3iawSOCLSat9iI=
X-Received: by 2002:a19:3849:0:b0:4fb:8771:e898 with SMTP id
 d9-20020a193849000000b004fb8771e898mr3931938lfj.15.1688743951528; Fri, 07 Jul
 2023 08:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230707132649.3841870-1-alex@linutronix.de> <386DC5D1-AEB1-4799-94F5-C999E1DD8C10@arm.com>
 <176F9F2A43D46D21.7961@lists.openembedded.org>
In-Reply-To: <176F9F2A43D46D21.7961@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 7 Jul 2023 17:32:20 +0200
Message-ID: <CANNYZj9vYiAWsfmj9Q3_-25jUjiq0iPpVtQvuOJ2AM4p+gp+3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: rework ptest handling
To: alex.kanavin@gmail.com
Cc: Ross Burton <Ross.Burton@arm.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 15:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184015

On Fri, 7 Jul 2023 at 17:23, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> Python prints at the end:
>
> 3 tests failed:
>     test_cgitb test_cppext test_zipapp
>
> Perhaps the module could be patched (no sed please :) to also print
> those as FAIL: lines?

A better but more involved fix is to have '-m test' write out a junit
xml with results (it supports that with a command line option), then
process it into PASS/FAIL printouts. I'm about to head out to see
Depeche Mode and then two weeks of cabin by the lake thing, so for now
I'm out of time for this :)

Alex

