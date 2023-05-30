Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29CCC77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 14:54:47 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.1214.1685458486180141553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 07:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=S7DEQTY8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-30aeee7c8a0so1459713f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 07:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685458484; x=1688050484;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wHc4ZKdu3u9f6iZVx6DRifRPVnWI9qmnF9IG0cRiPIs=;
        b=S7DEQTY8n+5y+1dVsNtZeT0Q3b4PT65ZzN/EpJArTeTTqhLKto6Tf16YuuBN3RzK3l
         ZJr5E2LEjYa0MTleJMuZmu05BY24lD93CZmhHrujHVfgG0gFqiyf+rX0N+EHotioZ1jr
         LQKC0Q4A/ZK4z1WoaxLUhhKD9hlANPWN9o6Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685458484; x=1688050484;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wHc4ZKdu3u9f6iZVx6DRifRPVnWI9qmnF9IG0cRiPIs=;
        b=X0t5wumHfEe3YKcOFvecXW+9AtfiDy3NwcFTnuBc1D352stya/zGgC39ATpYLuhgK/
         itxHsutcIt5ldV0nbEisui4xnlTpQ3lMPj+MoXFf9bcgX/8WATxuYiEuMXL4OhapjwWW
         LVZcSWit2L1tzbGHk7xhOQ9qiqgI7j7q9LKSqcVYfw2qTH5dWaoRB70Qth6wM2JIqPFQ
         SwcVG6lMRCxVDaCLUZUOAtKAg7xjTCL6/vSqbYNBzn4q9IWUEy7NOoFTfShQThaZ6ntF
         UOeaGtwR2y2ZIOCpm6v/JM0AztEC6mLAjorxKunqWUsWT5S4lOHMAAkpWlz8K2s5mSbi
         JtKA==
X-Gm-Message-State: AC+VfDwVgkfcjpDn/fMknlsFUEe7jsOtCp/cmQViWKqdR2WinJoDT3CE
	6S83MHt1Ea9LzFGFYGTN0TzxBQ==
X-Google-Smtp-Source: ACHHUZ5jN0ZgJmsjG+w9/p1XxEgRAYmb7KwXwItNw7WxDYuTSfwmympi08b1U3gOMr+Gw3Yv87eYdw==
X-Received: by 2002:adf:ebd1:0:b0:307:8ea4:f8f5 with SMTP id v17-20020adfebd1000000b003078ea4f8f5mr8899572wrn.27.1685458484519;
        Tue, 30 May 2023 07:54:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3? ([2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3])
        by smtp.gmail.com with ESMTPSA id u4-20020a7bc044000000b003f6f6a6e760sm11130992wmc.32.2023.05.30.07.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:54:44 -0700 (PDT)
Message-ID: <01fcd740217f9836f3d13deb15b77ea94910f62e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemu: Split the qemu package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2023 15:54:43 +0100
In-Reply-To: <CANNYZj9xxEnyxEyWv9q4AY9Cj_zpw6fSyqc6uwLOwzkFYFnZvw@mail.gmail.com>
References: <20230530131708.1916975-1-mingli.yu@eng.windriver.com>
	 <CADkTA4MLkWsaiLWJoj_7A+2uc4TP13Zyp=JASyZnraNZqrTwsA@mail.gmail.com>
	 <CANNYZj9xxEnyxEyWv9q4AY9Cj_zpw6fSyqc6uwLOwzkFYFnZvw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 14:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181933

On Tue, 2023-05-30 at 16:33 +0200, Alexander Kanavin wrote:
> I might be missing something here, but can the free-form, anonymous
> python code block be avoided? Don't we have PACKAGES_DYNAMIC for this
> purpose?

PACKAGES_DYNAMIC is for when we can't predict the packages a recipe
might generate. A good example might be kernel modules.

You're right that we could add a do_split_packages() call to the qemu
recipe have have it generate these dynamically.

The downside would be the namespacing as dynamic packages need to have
specific namespaces (e.g. kernel-module-XXX). This means qemu-mips
wouldn't be an option (conflicts with non dynamic packages like qemu-
dbg).

We could use a more specific prefix like qemu-system-XXX and qemu-user-
XXX and use do_split_packages

I did also wonder about using more specific inline python for some of
this, things along the lines of:

PACKAGES +=3D '${@" ".join("qemu-system-" + x for x in d.getVar('QEMU_TARGE=
TS').split())}'

I'm also not a fan of the python code block.

We do use do_split_packages() in other recipes like gstreamer to handle
things like this.

Cheers,

Richard


