Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 495B5C7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 14:22:44 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.145.1686061360913157882
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 07:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Zk5Uk/4I;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.54, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-30e3caa6aa7so3297871f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686061359; x=1688653359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytAlWOuMCRgLA8G0UfEZndzXj9wCGVvW30F8jv4jGAE=;
        b=Zk5Uk/4IIMm3gnpL5pLg8U1n4R90OCeNCKAsfiQDCGkbtnQSi7f1vzriRVfHYpxmbw
         g72EwtDMQJBsJOfb1cYPYoO9T4nRMePTSgSCch09NVUm07Jc8jbT037Y574G278kQebG
         nXURRGV7va0Hv3Gx5IPFV43nteG9CekUYE7qBg2JkUP66MYyG4mL9/jE7oGES+XYz93E
         IAp9By+9Nw4hLRmFvfHSzAy9EtmXVehNGiG7pOvCP076Pw/l2YI1IM1kNrK+1k6xbAVo
         rTlIjGwSA121tebBDXJwU/AmtIxhtlFTiCIh0Yc+RJLug6hxtGif2EuVU+qoiPewUNEx
         WXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686061359; x=1688653359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytAlWOuMCRgLA8G0UfEZndzXj9wCGVvW30F8jv4jGAE=;
        b=TScGyImv4u+3wquMC0neJr+cTkbiElF0DcDVUAlCop+FPx2UwvklyDZ56aVtZesvDQ
         nQZWX9lzlHsuS4EPzErP8LI6GUJoqgnZq1dQDIAqYTj9HKo1s5CyqyAimDIAX+Mgh5qi
         PrrYGjIB/5X7GqjA7qeF/LnsU00ZLJw40iotjzgky4ozqqcXVbG3kohAkz/kxfXcJ988
         1fcjIYhupeYLsiePCTgW/YAdYAS0Ko8KStivrejiTBd+MFte8+2waHzPVp1zO8J70TH5
         IByrdltGghLBDcz5ZXKcSMo5DbDBGc4k2q0y4Gb9C0C+SqVmG3e04MDry7UoXkKsx6Mj
         qnYg==
X-Gm-Message-State: AC+VfDya2GZT7ncGJEpTXNtm6lcZps08i7GA+/ebFobbr9kTQu0fKZq5
	9+DWocgccAqbVcF+6tJ3xH3tauGk0kRQKN8+6MaBTA==
X-Google-Smtp-Source: ACHHUZ5iIKtprhsKolaIc3HaG9d4rZ1KoL5LjJcNM5uz6asZ7EFcvRhUaV4UBfVvK50wlEIO/3ty6UwfbbaEO2uhICc=
X-Received: by 2002:adf:f18c:0:b0:309:4999:7549 with SMTP id
 h12-20020adff18c000000b0030949997549mr2075709wro.46.1686061359115; Tue, 06
 Jun 2023 07:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230606120647.3692694-1-yogita.urade@windriver.com> <176617A4790B46C5.31564@lists.openembedded.org>
In-Reply-To: <176617A4790B46C5.31564@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 6 Jun 2023 04:22:27 -1000
Message-ID: <CAOSpxdZa=_d15CRnvV33-z1geYWGDb4-ofgCezRbTT2M9Pp+xA@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-46691
To: steve@sakoman.com
Cc: Yogita.Urade@windriver.com, openembedded-core@lists.openembedded.org, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 14:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182441

On Tue, Jun 6, 2023 at 4:18=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> Hi Yogita,
>
> Thanks for helping to fix CVEs!
>
> Unfortunately I can't take this set of five patches in their current

Seven, not five!  I can't count :-)

> state.  You have crafted each as an individual patch to the current
> kirkstone head.  As a result, after I take the first patch the rest
> will not apply.
>
> In a case like this you should send a patch series, with each patch
> taking into account the previous patch.
>
> Regards,
>
> Steve
>
> On Tue, Jun 6, 2023 at 2:07=E2=80=AFAM Urade, Yogita via
> lists.openembedded.org
> <Yogita.Urade=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > A memory consumption issue was addressed with improved memory handling.=
 This issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS 15.=
7.2 and iPadOS 15.7.2, iOS 16.2 and iPadOS 16.2, watchOS 9.2. Processing ma=
liciously crafted web content may lead to arbitrary code execution.
> >
> > References:
> > https://nvd.nist.gov/vuln/detail/CVE-2022-46691
> > https://support.apple.com/en-us/HT213531
> >
> > Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> > ---
> >  .../webkit/webkitgtk/CVE-2022-46691.patch     | 43 +++++++++++++++++++
> >  meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |  1 +
> >  2 files changed, 44 insertions(+)
> >  create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.p=
atch
> >
> > diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.patch b/=
meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.patch
> > new file mode 100644
> > index 0000000000..ff9df40433
> > --- /dev/null
> > +++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.patch
> > @@ -0,0 +1,43 @@
> > +From fd57a49d07c9c285780495344073350182fd7c7c Mon Sep 17 00:00:00 2001
> > +From: Yijia Huang <hyjorc1@gmail.com>
> > +Date: Mon, 10 Oct 2022 15:42:34 -0700
> > +Subject: [PATCH] [JSC] Should model BigInt with side effects
> > + https://bugs.webkit.org/show_bug.cgi?id=3D246291 rdar://100494823
> > +
> > +Reviewed by Yusuke Suzuki.
> > +
> > +Operations with two BigInt operands have side effects,
> > +which should not be hoisted from loops.
> > +
> > +* Source/JavaScriptCore/dfg/DFGClobberize.cpp:
> > +(JSC::DFG::doesWrites):
> > +* Source/JavaScriptCore/dfg/DFGClobberize.h:
> > +(JSC::DFG::clobberize):
> > +
> > +Canonical link: https://commits.webkit.org/255368@main
> > +
> > +CVE: CVE-2022-46691
> > +
> > +Upstream-Status: Backport
> > +[https://github.com/WebKit/WebKit/commit/fd57a49d07c9c2857804953440733=
50182fd7c7c]
> > +
> > +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> > +---
> > + Source/JavaScriptCore/dfg/DFGClobberize.h | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/Source/JavaScriptCore/dfg/DFGClobberize.h b/Source/JavaSc=
riptCore/dfg/DFGClobberize.h
> > +index 0363ab20dcd8..4b1bcfea1fd7 100644
> > +--- a/Source/JavaScriptCore/dfg/DFGClobberize.h
> > ++++ b/Source/JavaScriptCore/dfg/DFGClobberize.h
> > +@@ -811,6 +811,8 @@ void clobberize(Graph& graph, Node* node, const Re=
adFunctor& read, const WriteFu
> > +     case ValueBitRShift:
> > +         // FIXME: this use of single-argument isBinaryUseKind would p=
revent us from specializing (for example) for a HeapBigInt left-operand and=
 a BigInt32 right-operand.
> > +         if (node->isBinaryUseKind(AnyBigIntUse) || node->isBinaryUseK=
ind(BigInt32Use) || node->isBinaryUseKind(HeapBigIntUse)) {
> > ++            read(World);
> > ++            write(SideState);
> > +             def(PureValue(node));
> > +             return;
> > +         }
> > +--
> > +2.40.0
> > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipe=
s-sato/webkit/webkitgtk_2.36.8.bb
> > index 1dac4f5677..02258f84e4 100644
> > --- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
> > +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
> > @@ -17,6 +17,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BP}=
.tar.xz \
> >             file://0001-When-building-introspection-files-do-not-quote-=
CFLAG.patch \
> >             file://CVE-2022-32888.patch \
> >             file://CVE-2022-32923.patch \
> > +           file://CVE-2022-46691.patch \
> >             "
> >  SRC_URI[sha256sum] =3D "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d21=
36edbab2c133d00437"
> >
> > --
> > 2.40.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182440): https://lists.openembedded.org/g/openembedde=
d-core/message/182440
> Mute This Topic: https://lists.openembedded.org/mt/99361658/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

