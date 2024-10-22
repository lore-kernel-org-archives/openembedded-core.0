Return-Path: <gael.portay@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B49D2C57C
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 23:13:33 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.7590.1729638809343133579
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 16:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H1x835Lv;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: gael.portay@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315855ec58so10020475e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 16:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729638807; x=1730243607; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCvGae61oDAyrNRT+TLJ8vLertZcgUHwZNuT8vPDh9I=;
        b=H1x835LvWM9GaqGnaFXv5CwVcRe8zH+/rSASY1NEnJHasPC+udV0kSmOOB+C4lS+c5
         azd+GcKMhfgRz12KVr20+aYsXc/AJwcqdG/GP5w27Ay3T9woERn4xbHH9nTsPe/j3xs7
         DM5xjtyQ1utphIs8j1hsSKmtmiLDmxKfI1LPK+yRaAZtdqp6uRus2HzsyX14iGvfGzlU
         61BegzGmSx+n/Nl8STRC/ryJaPDvEBlD151QJkaC+vXKgHU2K4H5eFFPQcy1zHISPME4
         q0virjqwcKMsy97336vy7Q9z35pUOLR0ZCOKEZ1OCTDclMN7KKAOjDcEms03DfMiWtGb
         VDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729638807; x=1730243607;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gCvGae61oDAyrNRT+TLJ8vLertZcgUHwZNuT8vPDh9I=;
        b=o6cDexpytr+zWp2TZKAM2cRRhFYyPtysQuiCkPjaQDUbuTPkE+STVMvvv2i+K8uF/f
         BqfnHhrY25xGAgBVT8sDF7ZW6rfuWEj3VGZVi+7U3CW4sEmnUd2R/3sIn9LUSH/WRqSt
         WGnrPJfcLL4YlI9P+GN0g5Nt3y+kNOmEoXJ/jOylQRCoiX3lteJGFVDI+AiWOjkzqfi5
         +XrUyv7f58AygTiyxhLH1s2neTc7eoaKKHCXQNQ1DdkV0uDtpTGBNqX/wMRaeNhbM8sL
         2yGa2/WS3V9glcLp30JifICqSuoXdylb7rDCrhJqPAM8LXm0OiBJPecVmBbLotz1Rkvc
         +tqw==
X-Gm-Message-State: AOJu0Yw5VV/JtdHqP0Xxi5dVrHrIMAuTO4fmKbt6L0V4WphsGUOtiSGm
	SgtdMvmFTYPE6WGeByEyfjqnlnxiDDH9HlCaQv2Sd+RGL7G8b0Na
X-Google-Smtp-Source: AGHT+IEQVQ7/A8zFFnQUomjN9StxbIgn804NQgDsz4Fp9XTB/1Sz/BGqxZ/spI3OSsS2iO30BzFn6Q==
X-Received: by 2002:a7b:ca4c:0:b0:42c:b870:c52e with SMTP id 5b1f17b1804b1-43184948c4emr1174565e9.1.1729638807397;
        Tue, 22 Oct 2024 16:13:27 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5cb918sm99828705e9.41.2024.10.22.16.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 16:13:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Oct 2024 01:13:26 +0200
Message-Id: <D52PSA6XBLP9.2MFBV8VXOUWR2@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] classes: rootfs-postcommands: set better sane
 time to systemd
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
To: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>, "Alexander Kanavin"
 <alex.kanavin@gmail.com>, "gael.portay+rtone@gmail.com"
 <gael.portay+rtone@gmail.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241019021935.2105739-1-gael.portay+rtone@gmail.com>
 <CANNYZj-bdtFmFHnK2ppSMY+iXRDX-J5GwWaQjYMwX_t66SnJoQ@mail.gmail.com>
 <D51N9GUUD7NN.KLL01VZA4V8U@gmail.com>
 <DB5PR02MB1021350D7997973E3054958B8EF4C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB1021350D7997973E3054958B8EF4C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 23:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206181

Hello Peter,

On Tue Oct 22, 2024 at 8:40 PM CEST, Peter Kjellerstedt wrote:
> > I have created a rootfs-postcommand to be able to set a better time **a=
t
> > image creation** to keep the systemd package untouched (not rebuilt) by
> > updateing the variable $REPRODUCIBLE_TIMESTAMP_ROOTFS.
>
> Can't you add a pkg_postinst:${PN} function to the systemd recipe and tha=
t=20
> way do it in the recipe while stile executing it at image creation time?
>

Well, that is certainly doable indeed; I have not think about it. Very
good catch, I will give a try, thanks.

To be honest, my first intention was to reuse the existing bits (i.e.
rootfs_update_timestamp) that is there already, and I wanted to make
this existing bits working with systemd as well :)

---

I am openning a parenthesis...

As I said, the variable $REPRODUCIBLE_TIMESTAMP_ROOTFS is to be used for
rootfs (i.e. image) only, am I right?

But it is used to compile the kernel... see:
 - https://git.yoctoproject.org/poky/tree/meta/classes-recipe/kernel.bbclas=
s#n371
 - https://git.yoctoproject.org/poky/tree/meta/classes-recipe/kernel.bbclas=
s#n427
The change was introduced a long time ago (2017-08-16 00:03:15 +0100):
 - https://git.yoctoproject.org/poky/commit/?id=3D55e9485735ae8393b410f3097=
3c785236dc402d2

I think the kernel should (now) default to SOURCE_DATE_EPOCH_FALLBACK if
SOURCE_DATE_EPOCH cannot be deduced from the git repository.

That fallback variable was introduced afterward:
 - https://git.yoctoproject.org/poky/commit/?id=3D7e9c2f33d4ea9f6449dd56d19=
ff4522a9ddc2df1

But this is another story; parenthesis closed.

---

The worst thing is I figured out today my work does not work on master
branch; there must be changed since kirkstone that break it.

On kirkstone, stat() /usr/lib/clock-time at run-time returns same mtime
timestamp value than the one set in $REPRODUCIBLE_TIMESTAMP_ROOTFS.

On master, stat() /usr/lib/clock-time at run-time **DOES NOT** returns
the mtime timestamp value set in $REPRODUCIBLE_TIMESTAMP_ROOTFS.

It returns the values set in $SOURCE_DATE_EPOCH_FALLBACK instead! And
for every timestamp values, see:

        root@qemux86-64:~# stat /usr/lib/clock-epoch
          File: /clock-epoch
          Size: 0               Blocks: 0          IO Block: 1024   regular=
 empty file
        Device: fd00h/64768d    Inode: 17          Links: 1
        Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    =
root)
        Access: 2011-04-05 23:00:00.000000000 +0000
        Modify: 2011-04-05 23:00:00.000000000 +0000
        Change: 2011-04-05 23:00:00.000000000 +0000

The variable REPRODUCIBLE_TIMESTAMP_ROOTFS was set to "4000000000":

	root@qemux86-64:~# cat /etc/timestamp
	20961002070640

According to https://www.epochconverter.com, timestamp 4000000000 is
Tuesday, October 2, 2096 7:06:40 AM:

	Supports Unix timestamps in seconds, milliseconds, microseconds and nanose=
conds.
	Assuming that this timestamp is in seconds:
	GMT: Tuesday, October 2, 2096 7:06:40 AM
	Your time zone: Tuesday, October 2, 2096 9:06:40 AM GMT+02:00 DST
	Relative: In 72 years

Therefore, the REPRODUCIBLE_TIMESTAMP_ROOTFS is set properly, but the
reproducible-builds resets the timestamp to $SOURCE_DATE_EPOCH_FALLBACK.

Is it the expected behaviour? I mean having the file timestamp created
before the binary is compiled (certainly yes, reproducible-builds) and
before the sources are actually released (maybe no)? or is it a bug :/

I have to **REDO** the test to ensure what I am telling is true for the
kirkstone branch; but I would not be able to do it before next week or
two (unless I found some free time to test it).

Note: IIRC, the files are created at the real date on kirkstone branch,
but I am not sure (i.e. do not use any reproducible-build variables).

> > 	+
> > 	+       if [ -x /lib/systemd/systemd ]; then
>
> Umm, why are you looking at the host's files?
>

Oops, thas was a just snippet written on-the-fly for the post; So yes I
forgot to prefix the files ${IMAGE_ROOTFS}.

> > 	+       if [ -x /lib/systemd/systemd ]; then
> > 	+           ln -sf /etc/timestamp /usr/lib/clock-epoch
>
> This too is trying to create a link in the host's filesystem.

Indeed.

>
> //Peter

Regards,
Ga=C3=ABl

