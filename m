Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62928C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 11:52:00 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web11.4084.1648209119338905570
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 04:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pNZcLR24;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id a28so3228886uaf.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 04:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X3XRzbG3dW6RBsBxDH9BGqSAPR8tpSBfeqOvmtyzbpo=;
        b=pNZcLR24Gg6khFrMyaUw4E4Sd10WLvy/aS6A3pz8w7+Tb5V7DRQgZYrE50hs6J6beB
         YBCszMZje07mLsTDBEEO6exbFi4BQLfhAnFU6aSWSny/Xb2ULwW8mSxaNR7XLAZDc6UQ
         4umgsYU6oH6UkzTDRPT6eBffmZQYlvVTYvQOQd7q17R39dJQezl5F3hbOzAT8GSSEXi3
         h/nZcj9xK48KW67ZJR4hMlJTeAxe0y/Z6IVgwNI6brTTHDA+U3K/vWLjOjp0AsI7K23V
         Ab1gNWrglTAHuFvvT0bQJXxvpm7QHDUY732UgShWReZ7tjXWcDToMjCO/34xAPJI58i0
         sPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X3XRzbG3dW6RBsBxDH9BGqSAPR8tpSBfeqOvmtyzbpo=;
        b=V+bFHeUx4YccTnQaetkps+h4UHL8Wc7YDz2VETLiZA6nkGSVlKC0Bhat6svgNNJY6g
         25fEKBdcf4FjQC+nD559ny7NtYTA/OnxWxpo37KpPLaAJyvKMB0uaIzbGGSSC4W+7o9l
         SN6fiFxu//dNhD8ELNGt8/6VivJHvFVxv8y+HPCgB4L+5s3krvx3HW8EtQMDw730u44l
         taJ0+KsigWbZ/Ns5IJ+fsVLwro34L6jDOOWAVdCvEQAQnq41NCKEaLgCmOdlUfA+zwbd
         FoPuCWvIeBiSukRSqCQg4uRfqH61IE0aXb1JSlQpv7HbidcOCnBz9H6V+V4XNj7vXKWv
         9DyA==
X-Gm-Message-State: AOAM531bGomDEKozPhzXA/a/UnSG0N53fDtAMYBRT1V0UAFRVhNqGQZz
	AueRWyvb7hXoVifN9yWWyKgh6NS8xBKI6blqdJ0=
X-Google-Smtp-Source: 
 ABdhPJwrl/Ham9q+bhaQ3lLjkxeGil2QcG2R46fMjxg8zdlh7iNegecHD19wURpGN3pNV1Tnj/kn/Q4NoYwS7CP0NQ8=
X-Received: by 2002:ab0:3c4f:0:b0:359:8aeb:4b36 with SMTP id
 u15-20020ab03c4f000000b003598aeb4b36mr5078978uaw.43.1648209118429; Fri, 25
 Mar 2022 04:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220322211949.7423-1-fntoth@gmail.com>
 <fe0f9ee8-e3d0-1681-af93-fa97019b8a0c@gmail.com>
 <e2b6066a69cf7933b0618a66b7e1b3589ff6da5c.camel@linuxfoundation.org>
 <a338dc08-b564-4f83-9f88-1e7dd1823f6d@gmail.com>
 <6dad87edfe80040678963ca18842a3ddf337e35c.camel@linuxfoundation.org>
 <9c616e34-d31b-dcab-657a-268698d34150@gmail.com>
 <0791e55a-cba3-3d7f-8a17-96b1591454a1@gmail.com>
 <bf0ea984-2798-ab9b-6008-7d09bebd9664@gmail.com>
In-Reply-To: <bf0ea984-2798-ab9b-6008-7d09bebd9664@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Mar 2022 12:51:47 +0100
Message-ID: 
 <CANNYZj-=ePLTQFG8xwt=tWREvqNOK4R8VKV6=hpDMe1674MnPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v1 1/2] gpg-sign: Add parameters to gpg
 signature function
To: Ferry Toth <fntoth@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Xavier Berger <xavier.berger@bio-logic.net>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 11:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163637

You can copy the sstate cache out of build-st somewhere where it will
be reused (set up local.conf accordingly).

Alex

On Fri, 25 Mar 2022 at 12:28, Ferry Toth <fntoth@gmail.com> wrote:
>
> Hi,
>
> Op 24-03-2022 om 23:11 schreef Ferry Toth:
> ....
>
> It doesn't seem to be a particularly volatile area in the code. I refreshed
>
> Xavier's patches for Gatesgarth, and am actively using unchanged patch on
> Honisiter.
> I don't know how the automated testing is working but I guess for RPM a repo
> is generated using a small layer? And then tested on a qemu running the
> rootfs?
> Should be almost same for deb/apt, maybe could be modified from rpm test?
>
> I think the rpm test is test_testimage_dnf in
> meta/lib/oeqa/selftest/cases/runtime_test.py. You'd run it with:
>
> oe-selftest -r runtime_test.TestImage.test_testimage_dnf
>
> I'll have a look.
>
> Grumble. I ran this test but it failed due to needing to run sudo to setup a tap interface (I ran it under screen).
>
> Is there a way to continue this test without first clearing the build-st directory? It take about 2 hours to get to this failure point.
>
> Thanks,
>
> Ferry
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163636): https://lists.openembedded.org/g/openembedded-core/message/163636
> Mute This Topic: https://lists.openembedded.org/mt/89962631/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

