Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DAEC00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 17:17:43 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.9126.1659460655945219455
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 10:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pvr2PdTv;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: sakoman@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id z2so8068491edc.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 10:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=I10KzWAehO+ZbW9l/OBuXPxrN/ytttA5jRTGDCtQZeY=;
        b=Pvr2PdTv6LsTQ3WNx0i5+r8ZHN7eRBhCsC/oIRpCIKlSX14iIbsfq+lSlPbWj2HGrL
         mWJsDgunX+FAmGyLuKnCnz3AeUrXhRJhg3433MHW19K530Gx489ZUjYiyFn2pQgSoIIH
         g8qoJVftYlEnc4acQqfQJDw5lKa9h6L6VmihgP1AyJTD7P1zJFrzcvkosO6XBa1WuOna
         tqg5Y6m+/334J0/PlTLs6lg/Qk0suoGNXKy7PYc4q7JElQF0XMIpwz6u1khKcFpnLfDa
         HgzF+FPlGHqDSPPvlxkO9CqPRPBxrT/zXRHNwvgG8NfD5AA63ii6e5Yu5Bf0Mbb+A3Xc
         0gNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=I10KzWAehO+ZbW9l/OBuXPxrN/ytttA5jRTGDCtQZeY=;
        b=InSOMnXjcXb6hDdyc+floVZV/NLr+JKjjv/hZ7GgCmLrEvSlSdZbc8zZtNhgF6/Egq
         6sm8/Vh6vS2SYnYZNkEdR5VytxPHcwDXwIki8+84IYl7npHU2dx9W2zsm9m8bg/KMXQL
         xayxwu9WJkpL7qaegEWqyQINERtXac2IHXS6lgaHCUwlZtARZcO/WUvUBmUK/woNDWdT
         /bsKLp6DDFlATuEnddA3mROIyTPG93RXhNpw2GHM4LwClh2+fI24jy/Npjmkf8CJz6LU
         5P/H2BqnAsXMgyOjtrMLOxX8XJgMhL25QhzwedrgES9HCALuh95VveuIyUP4TmANU01q
         og3A==
X-Gm-Message-State: AJIora8CNtSQLq4rK/xJyxFNgTaHoroDmTLk9qJC42uxAl/IAj6uL3hq
	2AaE3SqNOrZQ1UMuiZkCCqgDaAmJqPqm8CZtsXemry2O
X-Google-Smtp-Source: 
 AGRyM1u2Hi2VDK7d1o2F1U0JTlYzsPF9EOOD3QVWFJ0RlckCgNxi3H4SIqiEV7SMVLhDrQDLc9U0bZ+NOWTGBdqUa6w=
X-Received: by 2002:a05:6402:240d:b0:43b:c41d:b0e0 with SMTP id
 t13-20020a056402240d00b0043bc41db0e0mr21232726eda.318.1659460654391; Tue, 02
 Aug 2022 10:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220731110127.15278-1-flowergom@gmail.com>
 <20220801180433.GW1146598@bill-the-cat>
In-Reply-To: <20220801180433.GW1146598@bill-the-cat>
From: Steve Sakoman <sakoman@gmail.com>
Date: Tue, 2 Aug 2022 07:17:23 -1000
Message-ID: 
 <CAGDS+nnm--fF2wMzDDYFuHpx7qtpNEQSarcSu8VZrSn5wuYjPg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] u-boot: fix CVE-2022-34835
To: Tom Rini <trini@konsulko.com>
Cc: Minjae Kim <flowergom@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 17:17:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168799

On Mon, Aug 1, 2022 at 8:04 AM Tom Rini <trini@konsulko.com> wrote:
>
> On Sun, Jul 31, 2022 at 01:01:27PM +0200, Minjae Kim wrote:
>
> > i2c: fix stack buffer overflow vulnerability in i2c md command
> >
> > CVE: CVE-2022-34835
> >
> > Signed-off-by:Minjae Kim <flowergom@gmail.com>
>
> Reviewed-by: Tom Rini <trini@konsulko.com>

Hi Tom,

Thanks for reviewing.

Did you build test this? I'm getting do_patch errors on both local and
autobuilder builds.

Steve

