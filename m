Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9D7C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 06:23:11 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3120.1784528585913318783
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 23:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=T2gymPct;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-472326ca506so7450295f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 23:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784528584; x=1785133384; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6nulG1hXLjrRYPly2sM9YqdOQoXlnmEPJMCt+dzsn1M=;
        b=T2gymPctnx/qQw1lYzDJ5BBp0+EhJ88wDHqZaDI/r//cpCe8+EEZcxqMXX13UFMXON
         4/TLYEMTX4DPvhDZ1wjHVh6KiEoDaBbzl/Tor8eeEVuQ/6UF6wU6LC2MdTCHCrSoZil8
         /0eM09X3ueFI1eRtDVMs8chkMgIoAOPFJkBC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784528584; x=1785133384;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6nulG1hXLjrRYPly2sM9YqdOQoXlnmEPJMCt+dzsn1M=;
        b=MCmSWnHw0NM1zF/it1ro4gFb5it45r9FuxN//CeNYEMx46gPMbMakrS/Fm1pbt8QKf
         PBSvAJy2b0dni//cVGgiU5O754awl2NwK06h7cxOT6ABQMXSOzcM58TfNJ5uFgm4OrQq
         Fwzv+84M7iVQQwdaUvf8IrI647knv5+EJZwaCVNQbme7xgp0XRkTS7kyDpRa1UcQeEpx
         v9g9nOkKI251oN82iXlYA7lztazNWxat8PUkIOupeLLe8uPjnAT2CusQ5SSDl3+LCmO0
         b+smAZYKOjaWrBDWR4pDUX/b7HaIbNl0xqVm1MigQkMH7AipvDBqfNTq0SwVBTxrtYF7
         z3Cg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4I+FEhrzkoiLvGxni7BLxWe3z6Rtd9b1yvdxiFtE7+8FC2IWe/ovIFiPusSzotS0ECloJ+wrZemh3pg4JJW5rGA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxsYbAIpHyujUIRYEys8FAAtGebLA5mT4TqS2fjmots2HcrFdxu
	6DOlm5rWnE0MWof+AgiluogM/K+EuMTiXm+0emv4LbQJD3JOKovfi5Mrv80nKAZ1ERg=
X-Gm-Gg: AfdE7cnSs3bllWI2YA5leCujTtur1nahqU/AJqJ0tMN1Cw/HRIqWAq6GVBDOjMQdxnG
	GcZytCeX90C7V0kZgp9JmGewBNxCYKlXbGbAQemPdMp0Qf85Xiv1yLgroADJpEMHuaymXhE9KzG
	KQQL5MTy1U6M5o+qw7bFRHcjAJTZ6soBCofAo3tzxkjLmcyc1TNIXd+1JaOiCrPkR7u0I7+lqd8
	we/GgSzLGqjC7ReLW2rvwmvIolxTQnwJzTuwckxyyWb65CSCYGMFr+PKE8PawTbJCvEpQzX2Uou
	2Pq9Hkr5lT8bloEgsNXFhvUjyqat02UV9FrDzq2GhW2w1lq7psTaXkLJGibasIeXWFejC8dVKqT
	X26Lq+MjguDtRYHMoDIs+lh50VK/C34aL9d7LRs71ul8rfufNhPvDJMsjcHsokR83/MTGSKRwFo
	wGQy7aTWKXF/DCSFUi1nd2An1qIm4niUzyJd10
X-Received: by 2002:a05:6000:4a01:b0:47a:b86f:3ed1 with SMTP id ffacd0b85a97d-47f623060bemr15507011f8f.21.1784528584033;
        Sun, 19 Jul 2026 23:23:04 -0700 (PDT)
Received: from localhost (22.106.204.77.rev.sfr.net. [77.204.106.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed244asm25696509f8f.20.2026.07.19.23.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 23:23:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 08:23:01 +0200
Message-Id: <DK36L51LLLOK.39Q32176DFBIF@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] binutils: Add CVE-2025-69646 to
 "CVE:" tag
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Sundeep.Kokkonda@windriver.com>
To: <Harish.Sadineni@windriver.com>, <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260706090659.2543025-1-Harish.Sadineni@windriver.com>
 <d9b4dfb530a0898fd230ad6da09ee7bf90dd063a.camel@pbarker.dev>
 <DK2FFQBSC7HA.15XI81YMBOZY@smile.fr>
 <ed5831c1-386c-4463-8ff2-74a660fef088@windriver.com>
In-Reply-To: <ed5831c1-386c-4463-8ff2-74a660fef088@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 06:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241325

On Mon Jul 20, 2026 at 8:03 AM CEST, Harish via lists.openembedded.org Sadi=
neni wrote:
> On 19-07-2026 02:36 pm, Yoann Congal wrote:
>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> On Tue Jul 14, 2026 at 2:53 PM CEST, Paul Barker via lists.openembedded.=
org wrote:
>>> On Mon, 2026-07-06 at 02:06 -0700, Harish.Sadineni@windriver.com wrote:
>>>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>>>
>>>> CVE-2025-69648 was marked as a duplicate of CVE-2025-69646. The
>>>> existing patch already fixes the issue associated with both CVEs.
>>> Hi Harish,
>>>
>>> Where was this marked as a duplicate? We need a link to some evidence o=
f
>>> this, or at least a more thorough explanation.
>> Hello,
>>
>> FYI, when reviewing this I took the fact that both NVD entries[0][1] poi=
nt to the
>> same patch[2] as proof of duplication (albeit weak).
>>
>> [0]: https://nvd.nist.gov/vuln/detail/CVE-2025-69648
>> [1]: https://nvd.nist.gov/vuln/detail/CVE-2025-69646
>> [2]: https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D5987=
04a00cbac5e85c2bedd363357b5bf6fcee33
> Hi Paul, Yoann,
>
> Here's more concrete evidence of the duplication:
>
> Bugzilla bug 33641 (assigned CVE-2025-69648) has been resolved as a=20
> duplicate of bug 33638 (assigned CVE-2025-69646):
>
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D33641
>
> Do you want me to send a v2 with this info added to the commit message,=
=20
> or is this sufficient as-is?

Hello,

A v2 with the added info please :)

Thanks!

>
> Thanks,
> Harish
>>
>> Regards,
>> --
>> Yoann Congal
>> Smile ECS
>>


--=20
Yoann Congal
Smile ECS


