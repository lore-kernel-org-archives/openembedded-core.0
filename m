Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA0BC004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 17:10:22 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.51353.1674148219361557852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 09:10:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BkOFnZg6;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id cf42so4222225lfb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 09:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ScXqa9EBDUZgEftb8WYSDR/cOrsYqfTnmscRp8BJATY=;
        b=BkOFnZg6K8A1ewTjGUsVHXDSs+poYZoDU178SJg8Qnhw6ouOoTEj/3wc8LKzb/U0/z
         aBkyl/echdl/xYfbdmoJ9kYsYtV+wFeyuXRZQ8iPz2fidy2XjL4Rz3QKCycRWc9zoxTv
         VqPgpJLXpLMflpXE2//Y+TB0DnCqjpYpuBGCsra8WNLvp5X+sgwKoVdvl/qcibydD/je
         LnYxEnfHEqp9rYGoz76LU8KyJ0IuZ4h6BA5jhD3KGZ3a4wnQMUYlarQmJikZZ5xEvRRE
         nlxODIfbZ1MBFIAFxXRqtlg3wFFxSI7+9gcM6V23yfi8g/nQmaJRxSdFMKR60DmrbfFB
         hVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScXqa9EBDUZgEftb8WYSDR/cOrsYqfTnmscRp8BJATY=;
        b=zYgxtJXyWBIj/LkP19uJJ2ZFYVPscXqfngtN9P/gbA2CVz9Da152oNHQ5cyPRTVkTn
         rbVErisPgnGEcquEiaWY48Qk/j2Qw4mCyNvbcYn76PZtlEmojVt3WXSRCGXYyVEeP2Ke
         i0GOwaYzVm3KvgefLVMYf/qAPpaBERpBZFI4kw4FLosCD7ss7imHFY593cdB3iZTw00W
         uJ6TlfLQ7chamj+qIWYeg+Z9NM992W36zUTfgP3MxSBT31xf28DFQU1w0bgauSHGUXX+
         dw2WDuHFfaN1n1oOHwNnU8ZhmU5VlM1jc4ztDnmQyqsTnkzPILTLuGwJUyEguj9b/d3V
         KPAA==
X-Gm-Message-State: AFqh2kpG2VeFSsH5tAbDOAx3MsvV2U2DN5Fh9KXC4+jN5K9KbxBWIkzh
	MAtRDwbiBbBxi4k2GoN2MqL8y8vVr82L8sHMpcQ=
X-Google-Smtp-Source: AMrXdXvLP6hFVFGdYMX1EtiLrPUtCTFiG9ZjUqADpLkN1p37Bxx+bybjIWrnHPCEhLczSVlFArrfHQ2Y1SogssL2DPA=
X-Received: by 2002:ac2:5281:0:b0:4cb:2508:f535 with SMTP id
 q1-20020ac25281000000b004cb2508f535mr905207lfm.131.1674148217451; Thu, 19 Jan
 2023 09:10:17 -0800 (PST)
MIME-Version: 1.0
References: <20230119131853.27372-1-f_l_k@t-online.de> <CANNYZj-ihaDgJ1Nar=h6oxq0GcA_J4-jouWfTacdoViNmRZuTQ@mail.gmail.com>
 <G9OQOR.29KQBNHWF95M@t-online.de>
In-Reply-To: <G9OQOR.29KQBNHWF95M@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Jan 2023 18:10:05 +0100
Message-ID: <CANNYZj8DpFxQfTJtWoyGyUkLRjZgKRoLKKJu4KXB77r755hEQw@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gptfdisk: add follow-up patch to fix with
 current popt
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 17:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176152

On Thu, 19 Jan 2023 at 16:27, Markus Volk <f_l_k@t-online.de> wrote:
> But its neither my patch nor am I familiar with sourceforge or the actual issue with popt ... and I'm not keen on changing that. I think if the gptfdisk maintainer wants to release a new version, he will be able to find the patch on the net like I was.
>
> And if he wants to get more help from the community it would be a good idea to have a git repo available somewhere. Or am I missing something and just wasn't able to find it?

The git repo is in fact on sourceforge:
https://sourceforge.net/p/gptfdisk/code/ci/master/tree/
and you can open a merge request there. There's one from Khem for example.

Please do not come up with reasons to push this work (submitting
patches upstream) on me; I do not appreciate that.

Alex

