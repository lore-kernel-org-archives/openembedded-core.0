Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F80C6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 08:29:50 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.3937.1678782584744615628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 01:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G+Jkv2hP;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id j11so18883126lfg.13
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 01:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678782583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1ZBYCQn9/CvgcWC2x6cQEORjlMEQRN1IKGM4xsyR6Y=;
        b=G+Jkv2hPT0swPN588qy4ZLjPEFHwmbW0/DlVITb0S8f+fc8HbvmHfbGGr28Hsn9zzX
         mlbSdXUksCTbl/ysvcMJ+Bk02EDNq0N/+CGWSIN07eQjL4T7yJ6D15+tdHrg2rVCGxiU
         qQmhGAYVrGCllwPv5uACZXB3Le2kY6PAriTBLioOtY9CNzZsqlsUf3qOhMtb7mrj5V8G
         I89PlZOh7LfrWhZgloJ8WCcg9FeKYMzHMOaEs2cdrpgLYIUjdgvmENsvByI9vS5d3t71
         MhDY40VxPMTQJIderodsM9OwAcdETiL5ekZDas/ehaCnHxfDBd1QgLPGIcbm9ywK0SV/
         RdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678782583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1ZBYCQn9/CvgcWC2x6cQEORjlMEQRN1IKGM4xsyR6Y=;
        b=S3F/BrPwDXl1WxABi5AhhS1mEQG0WZpljnbtvmpHH6yuYkkBDeps+fnpxK6yTu6AYE
         0pgHfg+VfSKXMvUcy9rqOyfn0Y4euFCCvX7lQSDgVaLHNOok7we9/FYknfQP5ZC0LXYi
         X3a5MldRcUNLl7stVgPW9Xy3/dKrnZWlD6sr2umGTkKD9nIXaXz3rgLhHGMQMTL0KQTW
         QjAtq5bbCIHZRSY0mxCtwOtexkKTqKhXZlILgxYXTi/pzU+aUeY9lCjsURuWopNJRd/F
         e3yKeNQBLH5Moo+GgNm5nTJpO/wSyp8fH/B4+G+YNxXair6R6lb2HP+sy2pZZu5GCXnG
         kLeA==
X-Gm-Message-State: AO0yUKV/Qqo0PEiMwwRtxRQ2leMJjww79KiwFrrla1moKSGXAuxxkyMd
	/cR90O12baDqw68jQDUDiC0dg604U9cF53h4HHk=
X-Google-Smtp-Source: AK7set8g3MHC9RxJF7/kF0XlrIFzEpLxDKAcm8VcncFaegK7uGhH0s3rbbT/07KO3OlU8lu00zmkgx3fBxgGDw2HAHc=
X-Received: by 2002:ac2:5385:0:b0:4d5:ca42:aeeb with SMTP id
 g5-20020ac25385000000b004d5ca42aeebmr448230lfh.11.1678782582716; Tue, 14 Mar
 2023 01:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
 <1678239619-21210-4-git-send-email-wangmy@fujitsu.com> <a217c248c8fc840689997f43e61ae076e5420b0a.camel@linuxfoundation.org>
 <OSBPR01MB18456733D9BEA9717A0DFE45DCB99@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <CANNYZj8LM7xWvqVJeZBqcOO=YTjx6008mTpoEp-gHxZnNm28Kg@mail.gmail.com> <OSBPR01MB18457B80A5B04BB8024B8F08DCBE9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB18457B80A5B04BB8024B8F08DCBE9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Mar 2023 09:29:31 +0100
Message-ID: <CANNYZj-qFOyFstHux-+BpoXnKDKdZ2Pj3r14HR262nVq9a5afg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 4/5] xcb-proto: Fix install conflict when
 enable multilib.
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 08:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178475

Thanks, in this case the correct fix would be to install xcb-proto.pc
into $libdir, as it is indeed library specific. You need to patch
Makefile.am in xcb-proto's source tree, and offer the patch to
upstream.

Alex

On Tue, 14 Mar 2023 at 01:49, wangmy@fujitsu.com <wangmy@fujitsu.com> wrote=
:
>
> libxcb needs to find the python package in the path specified by pythondi=
r recorded in xcb-proto.pc. If the libdir line is deleted, libxcb will repo=
rt an error when compiling:
> | Failed to load the xcbgen Python package!
> | Make sure that xcb/proto installed it on your Python path.
> | If not, you will need to create a .pth file or define $PYTHONPATH
> | to extend the path.
> | Refer to the README file in xcb/proto for more info.
>
> The file contents after deleting libdir are compared as follows:
> @@ -2,10 +2,8 @@
>  exec_prefix=3D/usr
>  datarootdir=3D${prefix}/share
>  datadir=3D/usr/share
> -libdir=3D/usr/lib
>  xcbincludedir=3D${pc_sysrootdir}${datadir}/xcb
>  PYTHON_PREFIX=3D${prefix}
> -pythondir=3D${pc_sysrootdir}${libdir}/python3.11/site-packages
>
>  Name: XCB Proto
>  Description: X protocol descriptions for XCB
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, N=
anjing, 210012, China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Monday, March 13, 2023 3:50 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH V2 4/5] xcb-proto: Fix install conflict w=
hen enable
> > multilib.
> >
> > On Mon, 13 Mar 2023 at 08:29, wangmy <wangmy@fujitsu.com> wrote:
> > > When libxcb is compiled, it will read libdir from xcb-proto.pc to fin=
d the library.
> > > If delete this line, libxcb will report an error because it cannot fi=
nd the
> > directory of the library.
> >
> > Which library in particular? Can you show the error, and the point in l=
ibxcb's
> > code where it happens?
> > xcb-proto does not install any libraries, and so there is no reason for
> > xcb-proto.pc to tell where the libraries are.
> >
> > Alex

