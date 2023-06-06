Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48CA7C77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 14:18:34 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.1.1686061104899241734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 07:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=L/8yB+w2;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-514924ca903so8719627a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 07:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686061103; x=1688653103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1Ux+MzFTAlfHaLVgY6gfV+Y/FHNhnGQQXcJ/mU7x88=;
        b=L/8yB+w2h7+KQNPDVoQfzgfX+/HrapFJ50yXnhANNo+HiCXZeJEaJuY9At0TRspr+N
         SrAAn6HXYEtkooD8DZq97zq3mLzuvM7zV6HhRrlYOwrO+sr6rLn5asye3b7N2DfGVBD5
         fSK2lFayfzMlFRiWnqRUn5xahLgE2kQEhNEKroRDixSSbd7H1GcC7RkOZax4rpwYhcEO
         tkGHfpIh7O81C8yWDWa7cHbZQf+O7WPugwspllUvjTtRet33ISvQQipuFXQJzBr+H5qh
         Uctlrg3x7Bo0VY6DtHnFCsA8OotiVCbK+JCek26n4qT54Qy9BeHx9/feUpc4tPpTDTI+
         AtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686061103; x=1688653103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1Ux+MzFTAlfHaLVgY6gfV+Y/FHNhnGQQXcJ/mU7x88=;
        b=HUESAD/x/f2oIAd2NDfDXohKVV8oJ5toT055/94Np30zlAnVHo1ojW14/g/W8RTtMm
         efNdMi4AzGMXruNY/RR/ZfidY06fO4fc7HrTPYiJA1g+mHwQHLgcIf+pekGwiU3MvAgW
         z4HI3Bsi4HEeRO0OntlgWc159s3RYzi8ecRMO+XxsScohPHls9DeVpLYxYt76Ti+go36
         T4qgJUKBqGzFpb6pG6zSyGEZumcgC9bTsNinQO4fyG6Boeabx/9s5BSFjqbn+cCFPgHi
         oarvL+RH1Xg3oF3X/Mxbwv3DZZDCtw83lwe3Zlu24rHEuIJnyoMaOOfAA4FwswZyU+Ly
         Ptjw==
X-Gm-Message-State: AC+VfDylgaEC//zbjqiojxl5s6DdCQpxoIEBOhi7oZQziTY4vAt5SabZ
	NAkvGtUd9ATvvFL1E4Cbo0rBHbS1XE1qDGiWJEdVrg==
X-Google-Smtp-Source: ACHHUZ7guky+vn6HITigHMnPQnlusdZsGITHpmKG+o0xvKXgauchDBN3dnrXX/VFUkzpO1x/4b3E8ZgHiMzWriREg+E=
X-Received: by 2002:aa7:d74d:0:b0:514:8eb7:d587 with SMTP id
 a13-20020aa7d74d000000b005148eb7d587mr1828677eds.17.1686061102670; Tue, 06
 Jun 2023 07:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230606120647.3692694-1-yogita.urade@windriver.com>
In-Reply-To: <20230606120647.3692694-1-yogita.urade@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 6 Jun 2023 04:18:11 -1000
Message-ID: <CAOSpxdaHbhkrFP1cmHoGcwR3yCBwLk7iPS-m7=Q_psfb4WsV8A@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-46691
To: Yogita.Urade@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 14:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182440

Hi Yogita,

Thanks for helping to fix CVEs!

Unfortunately I can't take this set of five patches in their current
state.  You have crafted each as an individual patch to the current
kirkstone head.  As a result, after I take the first patch the rest
will not apply.

In a case like this you should send a patch series, with each patch
taking into account the previous patch.

Regards,

Steve

On Tue, Jun 6, 2023 at 2:07=E2=80=AFAM Urade, Yogita via
lists.openembedded.org
<Yogita.Urade=3Dwindriver.com@lists.openembedded.org> wrote:
>
> A memory consumption issue was addressed with improved memory handling. T=
his issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS 15.7.=
2 and iPadOS 15.7.2, iOS 16.2 and iPadOS 16.2, watchOS 9.2. Processing mali=
ciously crafted web content may lead to arbitrary code execution.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2022-46691
> https://support.apple.com/en-us/HT213531
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  .../webkit/webkitgtk/CVE-2022-46691.patch     | 43 +++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.pat=
ch
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.patch b/me=
ta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.patch
> new file mode 100644
> index 0000000000..ff9df40433
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.patch
> @@ -0,0 +1,43 @@
> +From fd57a49d07c9c285780495344073350182fd7c7c Mon Sep 17 00:00:00 2001
> +From: Yijia Huang <hyjorc1@gmail.com>
> +Date: Mon, 10 Oct 2022 15:42:34 -0700
> +Subject: [PATCH] [JSC] Should model BigInt with side effects
> + https://bugs.webkit.org/show_bug.cgi?id=3D246291 rdar://100494823
> +
> +Reviewed by Yusuke Suzuki.
> +
> +Operations with two BigInt operands have side effects,
> +which should not be hoisted from loops.
> +
> +* Source/JavaScriptCore/dfg/DFGClobberize.cpp:
> +(JSC::DFG::doesWrites):
> +* Source/JavaScriptCore/dfg/DFGClobberize.h:
> +(JSC::DFG::clobberize):
> +
> +Canonical link: https://commits.webkit.org/255368@main
> +
> +CVE: CVE-2022-46691
> +
> +Upstream-Status: Backport
> +[https://github.com/WebKit/WebKit/commit/fd57a49d07c9c285780495344073350=
182fd7c7c]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + Source/JavaScriptCore/dfg/DFGClobberize.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Source/JavaScriptCore/dfg/DFGClobberize.h b/Source/JavaScri=
ptCore/dfg/DFGClobberize.h
> +index 0363ab20dcd8..4b1bcfea1fd7 100644
> +--- a/Source/JavaScriptCore/dfg/DFGClobberize.h
> ++++ b/Source/JavaScriptCore/dfg/DFGClobberize.h
> +@@ -811,6 +811,8 @@ void clobberize(Graph& graph, Node* node, const Read=
Functor& read, const WriteFu
> +     case ValueBitRShift:
> +         // FIXME: this use of single-argument isBinaryUseKind would pre=
vent us from specializing (for example) for a HeapBigInt left-operand and a=
 BigInt32 right-operand.
> +         if (node->isBinaryUseKind(AnyBigIntUse) || node->isBinaryUseKin=
d(BigInt32Use) || node->isBinaryUseKind(HeapBigIntUse)) {
> ++            read(World);
> ++            write(SideState);
> +             def(PureValue(node));
> +             return;
> +         }
> +--
> +2.40.0
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.36.8.bb
> index 1dac4f5677..02258f84e4 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BP}.t=
ar.xz \
>             file://0001-When-building-introspection-files-do-not-quote-CF=
LAG.patch \
>             file://CVE-2022-32888.patch \
>             file://CVE-2022-32923.patch \
> +           file://CVE-2022-46691.patch \
>             "
>  SRC_URI[sha256sum] =3D "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136=
edbab2c133d00437"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182428): https://lists.openembedded.org/g/openembedde=
d-core/message/182428
> Mute This Topic: https://lists.openembedded.org/mt/99361658/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

