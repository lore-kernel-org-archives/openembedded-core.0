Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A72ED0E6EF
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 10:42:07 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.43488.1729507317524176629
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 03:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CD9WHw0Y;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e4b7409fso4312056e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 03:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729507315; x=1730112115; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIEOx3bbW0eL2C97YGVo5G1v5KLDXjHjUnp1w2X8Hx4=;
        b=CD9WHw0YcDUC0/R2Cgd+StIxD1xX0u9tiLxye9oH1CzcnflVbRCXSH8s3CyBrDFUJz
         wofMMVweTh0WIkihe55o9azfD7lfqjCg1lZiqcMozka+K9tbE8Jf3Xj7EHnxodccOPer
         vOYVBf3SmpC9ciI6Pj+9568I8F0nfA9nUWBMfu0DnBWj8AS1Q02kMZ7b8f+5BIzG8D9x
         gRs1GQYFzCcdjuJNk7w/uyvnKFQ/sZaEa+4alxL2LGzK+0foguwmcVggGaD+Sebr6DHq
         fqHw4SjkRnFndJSLZWEGfdU6LOEm07q9tLgj5Xk2rD9KQV9kX7tkpnz77+oEpUPIjA9L
         k3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729507315; x=1730112115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIEOx3bbW0eL2C97YGVo5G1v5KLDXjHjUnp1w2X8Hx4=;
        b=RjGgdoNCqPJ0g8Sh0g380ME/9D7j1sTKkNeArjrQAhI9T1EmWyOQ95+b01507/mt1/
         7ya4GA7Nzjp0199ACLCv5as9V5j9LvwVaaoQbnoWcAonThM46+91JY29sgohx70F09Bs
         6htAmeojpUoqkKvOagjLPg7hdPqXzB1lxdvk4j4bCoMZf3WrEp4wZXmsY1ZQdKDn6RIU
         MF6rsjXFF9ZdS/eM97VnMJ7K6fpkg4dbIWGhRAdIYDkt3EhZMyO/zSgGyH5oT7IWCH+4
         USi6a+rrZTSARHEbszKU4voJPmjaQCiqg1CHfX65A5KDWGsdFbxgWLV7kRqYAHXmyRrz
         +cfA==
X-Gm-Message-State: AOJu0YzpAh8dkUF8uac6yPTtFOGPK7C6SrxyNiyYK+c09ACM/63b38Hs
	yQhrJYkGzjTJ+kuyg8alfvrPbN9XRwVR0qIGrzHdK2IKIQ0uMF6jIkwF1ruY8Gz7/S5gIi3tw9X
	udxs/WeXaIqwcRFG/0G82p2LNH1yvzQ==
X-Google-Smtp-Source: AGHT+IEb1G2lQ7z3UJqKzBDhb02VLW+IzdWKZsRz7d90IkGfDL+0is++ye3QLxaDp5sPfY1+v2vpq587y//qG7g7hac=
X-Received: by 2002:a05:6512:3e1e:b0:539:e3a2:3a25 with SMTP id
 2adb3069b0e04-53a158625d8mr3402503e87.18.1729507315284; Mon, 21 Oct 2024
 03:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <GV0P278MB0241B5BD9E5305D57A7EBBAC88422@GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM>
In-Reply-To: <GV0P278MB0241B5BD9E5305D57A7EBBAC88422@GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Oct 2024 12:41:43 +0200
Message-ID: <CANNYZj-QhbtH7zzDp_pMV+EeX=qmQLx+e6MKKohqEttpL53XQw@mail.gmail.com>
Subject: Re: [OE-core] gzip segfault with mandb and qemu when building rootfs
To: diego.santacruz@spinetix.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 10:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206111

It would help if you replicate the issue on master, and provide steps
to reproduce so I or anyone else can observe the issue.

Alex

On Sun, 20 Oct 2024 at 14:59, Diego Santa Cruz via
lists.openembedded.org
<diego.santacruz=3Dspinetix.com@lists.openembedded.org> wrote:
>
> Hi there,
>
>
>
> We noticed many gzip segfault errors on our build machine when doing eith=
er do_rootfs or do_populate_sdk for images on which the man pages are enabl=
ed.
>
>
>
> We traced this to mandb, run from the postinst script injected by manpage=
s.bbclass, which invokes gzip to scan compressed manpages.
>
>
>
> Our diagnostic is that mandb is executed via qemuwrapper with LD_LIBRARY_=
PATH set to the rootfs lib dirs, which is expected since mandb is from the =
rootfs. However, PATH is not set to the rootfs bin dirs, but instead to the=
 various sysroots and wrapper paths, so it is gzip from recipe-sysroot-nati=
ve that is executed, using ld-linux from the rootfs. But it turns out that =
the ld-linux and libs from rootfs are incompatible with those of recipe-sys=
root-native, which results in a segfault in ld-linux.
>
>
>
> I fixed this in our builds by simply adding -E PATH=3D$D${bindir}:$D${bas=
e_bindir} to the qemuwrapper command line in scripts/postinst-intercepts/up=
date_mandb. However, I do wonder if the correct fix would not be in qemu.bb=
class to systematically set that option for any qemuwrapper invocation, as =
the problem can potentially affect any tool executed via qemuwrapper that s=
pawns or execs some other executable using PATH to locate it.
>
>
>
> We encountered this on kirkstone, but our local kirkstone branch has this=
 commit backported: https://git.openembedded.org/openembedded-core/commit/?=
id=3Dfbd8a57aa307bfda70a08cb78af3c97f05c39a3a Hence the modification of scr=
ipts/postinst-intercepts/update_mandb and not manpages.bbclass
>
>
>
> The problem does not occur when building images for machines which are no=
t x86-64 based, since the build host and target architectures are not compa=
tible. Note also that the segfault is gone with the above mentioned fix, bu=
t gzip does not run successfully since /bin/gzip from the rootfs is an abso=
lute symlink to the active alternative (e.g., /bin/gzip.gzip), which does n=
ot exist on the build host, but that is another problem, at least the segfa=
ult is gone.
>
>
>
> Would fixing qemu.bbclass make sense? If yes, how extensive should that b=
e? For instance, explicitly passing the right dirs for PATH to qemu_wrapper=
_cmdline, like it is done for LD_LIBRARY_PATH? Or just implicitly setting i=
t in qemu_wrapper_cmdline?
>
>
>
> Sincerely,
>
>
>
> Diego
>
>
>
> --
> Diego Santa Cruz, PhD
> Technology Architect
> spinetix.com
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206094): https://lists.openembedded.org/g/openembedde=
d-core/message/206094
> Mute This Topic: https://lists.openembedded.org/mt/109114254/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

