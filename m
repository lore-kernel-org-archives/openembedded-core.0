Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433CBD12D64
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 14:01:27 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15892.1764770478884446337
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 06:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=drOmNpzC;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-93cdceac5bfso3442694241.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 06:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764770478; x=1765375278; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HBfMrllgvFMw9nVMd5uOPdF6OLpFget2jq0oIHihtTM=;
        b=drOmNpzCrv8Cd2gtPPE9owC4Zgkbtv+9ggxX0C774a0OlK0isdJ9fmnrHCFOmxnXZS
         mjTY64OVA0yN1uVeiuAk2Swl4ezLPFs0BqBXHeqFs6xwJLqPkx22mlxKYRtZRbR6GGay
         bNoPKaiupe9fBTvZEvlnxr1PVv0vVmw5F7C3Boh6ydWfrH/Vy/hx+2bL7wsV3GPPJMcl
         r90BWjXSoZZwRr1CHY5XDjuuUE1uq2zVbFJ33HSsbJu9K3rbWOQ0D6xX3EG18puXPmeW
         0yx+Klekmt/gF9qx+uZ/BLPlAmUhcVpzYgBhcVsFhgr5EQDvVKtPtPmFJAOag8cZ1bBu
         LFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764770478; x=1765375278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBfMrllgvFMw9nVMd5uOPdF6OLpFget2jq0oIHihtTM=;
        b=ExV0YdyBZqHlw5V8UGtPReqz7Wlga7Ldjw31lIeFHyJshoVFutJ0YxIUK66CTK7pmv
         yTrNPgqI62C4WIZPACXxr8YXk6T7kjpF/gPg7VgLY8Wd6WRbVk9fb2frbqpxvGEoPKrm
         d6J++bxAsl46IbevxFF1L2A2sAj85xqFMvUXzvgKgVoboYe1FI3WB0dwzNQ0+VRya7JM
         MA0yZsBo74yc6HPv8S5i1qseDDLQE8Bcq1Nc2bZHs6Z7deRfhPDOD8qSMhZ6S03Nbamw
         ou8TWnnoFVXgpiEMTg4rrIWX7u4qArlvgxwKXoeLnRsd7GJ6NyG3pbFxPSI9U1j5gkfB
         jCOg==
X-Gm-Message-State: AOJu0Yz35xyBhT2wYq+D8HAyMlwPsxSVtWnh4GxURo5hz1XL/YNfjX0l
	iARIEWZAPonUxn6sUWDNZyeCCcxorPBxbXRcBdef4l05N7Ec13ilgAoaPksOjKLPWRqZTTQIDxo
	cgX/aVaXIszZER28IF2w0Ho8Pn5XdhQU=
X-Gm-Gg: ASbGncvbjLn8furywI5trrZCIn0BKnolhdvtmXbWOUotaeqnqRjmBXKXY0O29/8P+qW
	lpLGjKglbVZ0U3B7dA62NTEUkfhxL20z/ueI36WIpwlQ8DJOTpBy3SpMgqYshO7n8UhUx0AOoZ1
	jaIKWY+CR6SFL46ySRxLJsU5n9VQU5+EFz2j9BO/buzgX6mHIY+wPch9xNeNUfCEBtZihauVBl6
	QZq/cA7ooYSAeBnUeeuJAp3VL38a2hUic8jtoCnosNSqwefL2CS0fClkBDE1u2LlVQIRtg7nMRA
	wkChEbltshBJeb6talaHcXJ98k9xDXcDnrjlc63E
X-Google-Smtp-Source: AGHT+IEBhjdYQ9A0hDwxrk7JWmqfKYEgB/sGscM1d14+NTS9wXpmtr6RD13xL060bVwomi4vytHHWCnTlEP8NS2AT+c=
X-Received: by 2002:a05:6102:570b:b0:5de:78e6:494d with SMTP id
 ada2fe7eead31-5e48e3daa83mr679403137.45.1764770477064; Wed, 03 Dec 2025
 06:01:17 -0800 (PST)
MIME-Version: 1.0
References: <10f454b1-e85a-81e9-d5e9-9720cdc3d427@crashcourse.ca>
In-Reply-To: <10f454b1-e85a-81e9-d5e9-9720cdc3d427@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Dec 2025 15:01:05 +0100
X-Gm-Features: AWmQ_bnlOVEaoTp5OwLtpOshv0ePYNWXuG-WQgIwEqUhSKAZ4srwplxXpTFgTg0
Message-ID: <CANNYZj_ThkGTvg2=Q80bvvDgHL8kLTa3VHaaGdUTc-3ZS0tOLg@mail.gmail.com>
Subject: Re: [OE-core] why would a ptest-enabled recipe have RDEPENDS include "ptest-runner"?
To: rpjday@crashcourse.ca
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 14:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227226

On Wed, 3 Dec 2025 at 14:54, Robert P. J. Day via
lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org>
wrote:
>   currently writing a ptest tutorial/presentation (maybe i'll offer to
> give a tutorial at next year's virtual summit), and ran across this
> oddity in OE's cpio recipe:
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/cpio/cpio_2.15.bb#n72
>
>   RDEPENDS:${PN}-ptest += "ptest-runner coreutils"
>
> why would that variable for *any* recipe specify a run-time dependency
> on ptest-runner? that seems odd.

The first explanation you should consider: recipes accumulate a lot of
obsolete or redundant cruft over time that no one has time to research
and clean up, and this is one such. 'git blame' might reveal why it
was added in the fist place.

ptest.bbclass has:
RRECOMMENDS:${PN}-ptest += "ptest-runner"
which supersedes this.

Alex

