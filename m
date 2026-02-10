Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A04EF0702
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 11:38:14 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17503.1770723490320036163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 03:38:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=faxCtzCZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-89549b2f538so14345556d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 03:38:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770723489; cv=none;
        d=google.com; s=arc-20240605;
        b=CMGCO/0A4k9Ww4JHbiIEfi74vC4gyK9JTdLp1zoR2TbsP3/eg073RUlZgAO7/4jXsX
         18JO730CBV9ANIbry9E+1/bf0jZbNNE3jhQTwQAtj5pLnOwlP1+XEdzosaRweZlRFgSK
         i2Gp6sEhE+IPdHWsAdQjmGbqrM/N8rBSbqr4Gy1uYPdWnTYhSju5MHrP3yZFhh5O6kJm
         IisEkfb3ogJtDiMDN2tSLZVaNPJQ3UqSWJ6Sr2b414c9lPRqKwINbxRSwHPW7XBKiVr2
         PwFQW5VOfn0CaoxLWZy3HqbwEjEZCYLi5nyLLVQ5MnXhqLlSJ18QgYjb/4Is08u1BHN7
         jLlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mCMk1k31janlx9GrVEpniKplUWjfv+JN+u2o2nyxE18=;
        fh=85FywoQ4TyE09dpZ07ihji6RE1UFygBEWt/2b8ei3sM=;
        b=UB91369OoxLH+crAgEGE9fo3DA8cFTFms10eqTA38rKMcmNKFo3lEK3uX1UVGDl9mZ
         MbkGvOmZ+XM5lVX1kl9Cj+n2G5Iy8ADhjVo+WXVMmwT4wxs4hr//UIHYXQZJCbckfP2N
         Cnze7SR1eQFoIo/+cVDys++TqJGS04JKaN59OkhZqxV6VjH0uTQ56Kqe1QlGxJ/zbkKe
         WaL3o8WmcBnqQBDbUbfqky8of/uMJO88VrB+2lhGJxY9ywG3U421n7SbEVVA9TXYqwK8
         A0gwWnOPT7O1k/YU/yrfpIpgnvTBor/n6zVzBX2PZN80reSMWVvYJwgQ13tzxxiGtktj
         RPxQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770723489; x=1771328289; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mCMk1k31janlx9GrVEpniKplUWjfv+JN+u2o2nyxE18=;
        b=faxCtzCZxbXZnZRZvj80A+a7ECpU1H01KDKTS6y5XbWnSpTQMGqOZLt276E67bh/VQ
         R7+kBp4ZyEztSYfosl5iqr0Mdf+J+TtVYqUGEKx1lX8zwiJkeEa9MwJ9amT75vMRHHaU
         I5CrVrzXd1st6OJIcNxLRywfPLoHTgVz71RRb3lkaerji/P1bSGetKUwnqKNWdgBiALe
         QrSnoNVc6jd7KEE5o2ZDwmpE5RcTVMOXOXu/toXh2utPbzfQzitsOJa1uj4tB6LmHVwc
         zZdiZBO9nLd5RrynsR2ztIm1N7jhuiuCPZTTsPGC77zcG8oKB2b0v0TnHupH/D60KdGo
         ipKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770723489; x=1771328289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCMk1k31janlx9GrVEpniKplUWjfv+JN+u2o2nyxE18=;
        b=kzp3O0Nj1l0SicPlRxfTu5/xvFphrmVMtz21n9kxlx2IUXV2HlsoIvt9pU4sQf382/
         7x0q1nozyI5/1OU4oTT8ILslzpYdYwmUA5dJRovi5SGZH+z9F8j3qaHWBmVQ1LDlOq8F
         5DZ0ILis2CbeZDZ/+PFvquQEIVPhvs7ZUaJ8gnQ0kGFYWVPzJZpC8LejvLN02Oc4naeI
         mzVubbfFjMGCvW4NWRKxZaPCf4iiuP/02Ym9KoXRX+huoe8ILwPfMt8ABrnluPx/cuRJ
         HfCgIaADO6HjcVwYe/NxxNXUsmDn31g0UC67sc/F8MzXB1EygI9vK/uDfPsW6/VhAI3L
         45xw==
X-Gm-Message-State: AOJu0YxULCuqyniNe4G3uCKZ2m5CGR6eCwCLQTVnZTN+QgbLtdhjKw8L
	RmGjaCg7nizJGpP2hrjM6QRUyDNDdMy/q0dQMZs5dwSYC8W8GL+LZPBScN/5vjC7FIQXFTRrMZv
	d+csXl+oegKh+6ZVl9LBk2qrd4qTNB5Phog==
X-Gm-Gg: AZuq6aJ6k4ZO3YwcSP08blVP0DAer7Fs/i6iRldfFKJLrUJfvAXqKUjrFwZcj4ZVd2Z
	RUuGvUGWDnEtp1+0KMkzF40Jze/xze4r9NOR7zZi3uTCVYQ+V+J7Ic7mT2+nlL9usszASPaJidN
	kVtHJ9Wh16yZtdI7HneTLc5yeHovGNJJbgaRY20V0mTd6X5Bk51MS17o7ORWR4f2wBINFwzF1o3
	YUEf78Xo6fysVwU91KJRkjMM8Dwe9WLP3AAWoPK8nXi32371UaE4QUZmItG7S9CbjHn06+qnJwj
	Qiuw0ifN96OoxQeAX2wF1HJySLWioXCAkh8dzyF8Qg==
X-Received: by 2002:a05:6214:19ed:b0:894:3c22:e790 with SMTP id
 6a1803df08f44-8953cd9118cmr244240856d6.58.1770723489241; Tue, 10 Feb 2026
 03:38:09 -0800 (PST)
MIME-Version: 1.0
References: <20260207051305.2363194-1-Qi.Chen@windriver.com>
In-Reply-To: <20260207051305.2363194-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Feb 2026 12:37:58 +0100
X-Gm-Features: AZwV_Qi-91IXyKSC_YNbxT2GXBFzGhAcAZM4OMuSQ3pxARZGLZianDGDL4TBgbg
Message-ID: <CANNYZj-0=nQQOLY1h1w2SH9PFOa8K63+wELwNB9KKHuEPu6S9w@mail.gmail.com>
Subject: Re: [OE-core][RFC][PATCH] oeqa/selftest/sdk: add test_sdk_runqemu
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 11:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230885

On Sat, 7 Feb 2026 at 06:13, <Qi.Chen@windriver.com> wrote:
> Add test case to ensure runqemu works in SDK.
>
> Using runqemu from SDK has been supported for many years. Add a
> test case to ensure we have no regression.

I set and ran this test. This indeed does not work:

====
alex@Zen2:~$ runqemu qemux86-64 kvm snapshot nographic
runqemu - ERROR - In order for this script to dynamically infer paths
 kernels or filesystem images, you either need bitbake in your PATH
 or to source oe-init-build-env before running this script.

 Dynamic path inference can be avoided by passing a *.qemuboot.conf to
 runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`

 Bitbake is needed to run 'MACHINE=qemux86-64 bitbake -e', but it is
not found in PATH. Please source the bitbake build environment.
====

The error makes sense, doesn't it? How would runqemu be able to figure
out where the image it needs to run is on the filesystem if all it has
is MACHINE value? We can try to hardcode something relative to SDK
installation, from some environment variable that SDK sets, but that
would be limiting: in the context of an SDK, images can be downloaded
and located anywhere.

On the other hand, if you pass the path to the image directory to
runqemu, it works perfectly:

====
alex@Zen2:~$ runqemu kvm slirp snapshot
/srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/
runqemu - INFO - Decompressing
/srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20260210110409.ext4.zst
to /srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20260210110409.ext4
/srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20260210110409.ext4.zst:
43323392 bytes
runqemu - INFO - Continuing with the following parameters:
KERNEL: [/srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/bzImage]
MACHINE: [qemux86-64]
FSTYPE: [ext4]
ROOTFS: [/srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20260210110409.ext4]
SNAPSHOT: [Enabled. Changes on rootfs won't be kept after QEMU shutdown.]
CONFFILE: [/srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20260210110409.qemuboot.conf]
....
====

So would it be okay to set the path to the image directory explicitly?
If you have several images in that directory, then you need to pass
the path to a particular some-image.qemuboot.conf file, and it will
still work:

alex@Zen2:~$ runqemu kvm slirp snapshot
/srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20260210110409.qemuboot.conf

Alex

