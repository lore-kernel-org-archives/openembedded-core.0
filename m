Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EA0CD4F54
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 10:09:34 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17220.1779876573559438795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 03:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VKxS1VZk;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-912475287a5so1276592485a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 03:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779876572; cv=none;
        d=google.com; s=arc-20240605;
        b=P8klUSay7HRnKtqojzIYdbN9nT1Nsx50AubIdMpki2q6PG7Kw7qmlDMajjB+lwJ5av
         NyzBwnrbYGV415COzMShK2VmIbNOSRdP0grV+yfp4/BwlzttyhZAG2EcGDJTVwTiShhe
         uQz1OMxsnCN8EuprNc0pD9AIbXm9CZbV0zvqXM38fZhNC5HL2rkC6rv9/D9s3j0giHtr
         EOHNIcsUDG9OWevkGqlpybI060JZpdgbC/BJD0UFY8J2dtotVTv3wzv0fLqKy4Ia5OSa
         f9QeUqOOfeiY6z+tCX7rgJRI0/1taXOqmkX7H96QYpbiBolzytqoqiv8UId+42YCsuwv
         FhcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J4h8dy3mG5VFM8cXuaGPtVLW3gnDboWIR8HJd7/FgVc=;
        fh=id4bvVXxeKLMyJKYo1r/36bf56XxVGTU/UNGB2yLhcg=;
        b=Gfe7/WfhH7zbTqizlvYNmZ+Im0PymVZcsAkSOUFZPMVRwLWZfBv7pl9+lV09fFtdi2
         1ABCytmXpFEOy6NqtDMmMoxBU1LePjM30ucCRh6xB30xBRoS0ikpNhJAbGb6dJIC6UpN
         iXdgHsAwLLqlrTmT6v1Li9JYDUiCuJ+IfyLtV36CXknYrDDVYJS+LjMN3w3pszPyiALR
         aAcqkd5x6eZ/JHq2s00g5BqoNz2K+0qorGqP43Ub/itjzkFV33ihXNlY0iUsDsTNzamh
         8KgT6S3PJhVInW3CewdF2KUvYqt71eFinlmdYIoWCycsuHWyUjpfl3pAOADhyHsX3G8Z
         tB2g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779876572; x=1780481372; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J4h8dy3mG5VFM8cXuaGPtVLW3gnDboWIR8HJd7/FgVc=;
        b=VKxS1VZka39TZAs/ESFrbXnRa2K5LQh12ShRIbkv/WYSr23gEVm1os4yEDvGHlju16
         9pqGpvBbscvg8FYST+gPFXzaBjriFt3/+DiZOjwifR4DdbcRhxRbOZT3lZpBz52AcsAw
         du43ezqmledJ7F2imluhZuOQ8Z4E9p665B2JAi9w1hvioxAar5f0nprjqP75ZJQjWgYF
         AXvcaPk6qqZK/JCY6A4iilKXupSi2VMNqDHYkENQbmLL2a2Y7RCf727qgsqRIlw1iSJz
         oikkn/JvoRPsP9grygItol1M93zbZxHg8KgGNNIsc6CFqFdfAg8fawI164dJYFcU2ryL
         Wo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876572; x=1780481372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4h8dy3mG5VFM8cXuaGPtVLW3gnDboWIR8HJd7/FgVc=;
        b=Qe1x2DH4S4ehbt8OdQN14fM1Pn8cNaPxrNR3Vjf7GPfII+huFpIvWvUfued5guW7dS
         cFlLue2rYR9YzU3fgTbgqn6ykqcpSKPnenBPmiMfO8RvITFpJzPsBTii6CkG8Uw5K1Qz
         hGt0a0GXDZmgdK6lYiCBqKKI85QSvozDk39sZbAaLBc4lkmMJE36bAXRsixCChCUpyJ7
         33kOAGPCfI9Nxwl7Y/BW3xp0UfBNk/ZU3Fcr8jNKa4QbhYLDMiIy6mEfpiHDmvJTTwdu
         qTWnQNdD5nhhWf2GIS2caYMr1bcGIm/d3G/emmhA/Pt8+NPn1gSrWYF61Gr3+EgjC8cv
         Qrjw==
X-Gm-Message-State: AOJu0YypbQqyfY/JS/daPZ6NSt1Fnw4NeMZ0ed97vJgEvUboQvvn8XIZ
	9w7E7evK9EPBns72ye4PVFTwK4q5mtdl2JCNkjq8qbDJsFP3ljfC3nvUM6D7D347dPeYQbbhYE1
	tQw9XAQ5iY5QHYL1pDYbAC5zK22Op+djMmYIa
X-Gm-Gg: Acq92OGQLUqkcZYTtWxwIIqdSB8qJKtHTuRHmELTTHMNMipEw35TqKXBoO+UCFaigu7
	qMRyKSZqdkpjIMtnkFyxFcLufdLU9WVDS+/Lso4AQpIpbCgRTc0ftGEDIywHdoYkqlDyvkr+KJN
	w+YfGjkLZNmkYdWMTcTvIdEsdzj1KAdkxjHQJAYvOWajAVcx4UVbY9pEynaSAIpXIn4vUpdjXQ5
	gZyFIaoG6w8Retq1QxSPrQgvPWcgPNBRgIycmXPcXaHGQYHgi8lRUFGqPEvOVqY/9zn41fvjOSI
	1HCHCSVokuVPYKA+ai88eee9tUs1yvEshFR1ykWK4jX+2Yq0sENp
X-Received: by 2002:a05:620a:a49c:b0:914:bf8a:ba72 with SMTP id
 af79cd13be357-914bf8ac18dmr1974999085a.57.1779876572434; Wed, 27 May 2026
 03:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260520023754.2076160-1-haixiao.yan.cn@windriver.com>
 <CANNYZj_1Fd1c2FY_34-=Yin+D2HMws=Uc6Ms1BKS4NDXsyZnbQ@mail.gmail.com> <d7f4839d-8294-49ff-aa75-bd20befa020a@windriver.com>
In-Reply-To: <d7f4839d-8294-49ff-aa75-bd20befa020a@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 May 2026 12:09:20 +0200
X-Gm-Features: AVHnY4JH_XrMWKOuCkWc7tdHWabpQXv4pMPCzWRKn_Jv_UXt3idG2REduOhL6xY
Message-ID: <CANNYZj8CAoNk-aaM=jAG1Z3vWihg-VSoTtFztmWGX0zew6+LZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] subversion: fix svn-revision.txt conflict
 when building for qemux86-64
To: Haixiao Yan <haixiao.yan.cn@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 10:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237638

On Wed, 27 May 2026 at 03:47, Haixiao Yan <haixiao.yan.cn@windriver.com> wrote:
> >> +Upstream-Status: Pending
> > There needs to be an explanation why this is 'pending', or patch needs
> > to be submitted upstream, or an upstream ticket needs to be opened,
> > and the patch marked as Inappropriate [upstream ticket link].
>
> I have raised this issue on the subversion maillist, but there is no
> response at the moment.
>
> https://www.mail-archive.com/users@subversion.apache.org/msg30267.html

Thanks. Can you resubmit the oe-core patch, changing Upstream-Status to
Upstream-Status: Inappropriate [issue reported at
https://www.mail-archive.com/users@subversion.apache.org/msg30267.html]
?

Alex

