Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CA0CEFD19
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 22:37:28 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2311.1767739041089507175
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 14:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hDj9zRFN;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.175, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79045634f45so17958367b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 14:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767739040; x=1768343840; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4npVDOo5QKdpwT/DQIgLR8mpGHu9uhclss9G4kBhcg=;
        b=hDj9zRFNHi4XvN/ho1Pqjz2g8b4vt9Tvz07EbEDQPqsLu7/V/n4V0/WSfpe4kb8RsX
         VwR8QX6eu07zi0o2h7xRjmW1T2bLsN2V12wzOlidX4ns3Z1vXKuoleF/xatEQIA8kwv5
         zuYxWpESXjePakU9tpnhAehETxsVjfsE06NSLahrMD0HCIfPJNprxmkjo/3w6JZaPNQe
         ofZikEYqSm1NB3jGkU+ZDtuKC4DviYV4oikgGsLBvrcqDZbWgB+7eUWeJDqh3LI1KG6T
         x++SrzUyeqLcaBUQ+Videcw8XjCs2UvPiLaRff6d6DezprDCmcjTmHYkPNr6nws3Avf+
         eQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767739040; x=1768343840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q4npVDOo5QKdpwT/DQIgLR8mpGHu9uhclss9G4kBhcg=;
        b=ZN8VX9KEx0K69+cJeSTUiSihiH3uU00W5+4Gar+43vZKbOHrxKsW/SN1N8T6GCzm8i
         eT0GHuljE2oclQz1rWOyZihIhrIlzp9qcLgP8/byKjxrDgMt0OaDBa6cxL4E/PEd9JCi
         GIiXWOmFoZTBJV4om0fPTfIRyiMTTk3hsNY8SGR4aX7igGBTOWQWzkPqN4pLfaWU3eJt
         1WzVVoxyq30VgNmGYICTANTAeHiT3+nvkTvl9S5SyNkh0Lg52hawsyIqgz25TIjf+5RJ
         fcaPjghmkjA4iJdPwZNuktvAaJW4hFLNsDLTJRhK2LiUSzIQk3PMAts0jKjyBe995U/m
         gpHw==
X-Gm-Message-State: AOJu0YzrYtburjKR70InhbrGxsAzuAQohN4wNwUN0XB3c96L8GLGKQkz
	vR5GOVTedb8lBV+CR6sqb2yg10gf3qrEV96UAPWJ5m9/+sbm8xk/V34egdX9Nin6IwIO0+ilfDY
	X927q9JyBit9KDYRgKNKJd8ujcOxZ34NyJJATe1/DYw==
X-Gm-Gg: AY/fxX7zwa6eI6kP12TbTn4qgNaRxGQFD+HAM808OhOPO6HIBhRrDZtAz6iCi/jtFUs
	2VnllZqYU1XUCFbODXP18NICzUz6Mym3+hfwmAT20jl3mO2rFs4w6UPBiOThYMBx0xaHXTDo4Gl
	JPvu7CbHXwXWyngSyIDV0Mxagp92lxGeSL8nnjKbvlSEmWRQ5/n0ExtGP2stCR2iit2IrsPYFD1
	q7OLn9awhFzmWkNAUmJmCM4zj4Tx2Lm62BmsRofoD0CKLxQPTNqs3dQfYYUt3ivrMFNUH5f3s99
	rBReG0FEPbsmm1Kib+zjeg4vl88=
X-Google-Smtp-Source: AGHT+IEKuoegjS8HiUhCVpSCZhu2HXrU07j0ADZNKRfitPfBBXv0ws3vrB3lFtTBTuMJeJSbBF8GWp3+1WUqBNUGMqo=
X-Received: by 2002:a05:690e:1301:b0:644:60d9:865b with SMTP id
 956f58d0204a3-64716c809b7mr516784d50.94.1767739040083; Tue, 06 Jan 2026
 14:37:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1766352840.git.steve@sakoman.com> <9964fa3da2fa1e7243fba1a826e59f7bb1813706.1766352840.git.steve@sakoman.com>
 <b7923b2d-98df-4a16-b8a0-8d99035cedc5@windriver.com>
In-Reply-To: <b7923b2d-98df-4a16-b8a0-8d99035cedc5@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 6 Jan 2026 14:37:09 -0800
X-Gm-Features: AQt7F2qCkMvIh89id1-DLhvs9kusKYMMIDA5AcB-1_p_JW7oTq00XjOPRqp-o8Q
Message-ID: <CAOSpxdZCjccVF+D-s0m29N1+XwzApY1DMVw=Uyd+Ynd=pXm7xg@mail.gmail.com>
Subject: Re: [OE-core][whinlatter 18/18] populate_sdk_ext: keep SDK_TARGETS so
 SPDX/SBOM tasks remain in locked sigs
To: randy.macleod@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>, 
	"Jayasurya, Maganuru" <maganuru.jayasurya@windriver.com>, paul@pbarker.dev, 
	Joshua Watt <JPEW.hacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 22:37:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228937

Sigh, this was my mistake.

I saw they were in master-next and moved them into whinlatter-nut for
testing and then forgot to check to see if they merged before I sent
them out for review.

We should revert them before the whinlatter release build.

Time to retire, I'm making mistakes :-(

Steve

On Tue, Jan 6, 2026 at 1:30=E2=80=AFPM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2025-12-21 4:37 p.m., Steve Sakoman via lists.openembedded.org wrote:
>
> From: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
>
> Fixes [YOCTO #15853]
>
> Steve, Yoann, and others,
>
> This commit as well as 17/18 made it into whinlatter before master.
> Was that intentional ?
>
> =E2=9D=AF git log   --oneline origin/whinlatter  ^master meta/classes-rec=
ipe/populate_sdk_ext.bbclass
> 9964fa3da2 (origin/whinlatter) populate_sdk_ext: keep SDK_TARGETS so SPDX=
/SBOM tasks remain in locked sigs
>
> =E2=9D=AF git log   --oneline origin/whinlatter  ^master
> 9964fa3da2 (origin/whinlatter) populate_sdk_ext: keep SDK_TARGETS so SPDX=
/SBOM tasks remain in locked sigs
> 3f57280caa create-spdx-image-3.0: Image SPDX/SBOM tasks are retained for =
eSDK installation
> 7f02b3f811 cve-update: Avoid NFS caching issues
>
> The patches has been sitting in master-next for a while since people
> have some concerns about them, IIRC.
>
> What do we do now, revert ?
>
>
> Apologies for missing the review deadline.
> Maybe next year, there should be a longer merge freeze around Xmas time
> so that there's sufficient review.
>
> ../Randy
>
>
>
> The filtering in populate_sdk_ext.bbclass was removing all image targets =
from
> the locked signatures, including the main SDK images (SDK_TARGETS). As a
> result, their tasks including the image SPDX/SBOM tasks were not added to
> locked-sigs.inc.
>
> Without these entries, the eSDK lacked the necessary sstate, and the inst=
aller
> attempted to run the missing tasks during installation, leading to unexpe=
cted
> task execution errors.
>
> This patch keeps SDK_TARGETS (and their multilib variants) in the locked
> signatures so their SPDX/SBOM tasks are included. With those tasks in the
> sstate cache, the eSDK installs cleanly without needing to re-run anythin=
g.
>
> Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 920c5de570ec575a9eaccb105461394d9fa0f1db)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes-recipe/populate_sdk_ext.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-=
recipe/populate_sdk_ext.bbclass
> index 2859320ddf..2838ca1a03 100644
> --- a/meta/classes-recipe/populate_sdk_ext.bbclass
> +++ b/meta/classes-recipe/populate_sdk_ext.bbclass
> @@ -460,6 +460,15 @@ def prepare_locked_cache(d, baseoutpath, derivative,=
 conf_initpath):
>
>      # Filter the locked signatures file to just the sstate tasks we are =
interested in
>      excluded_targets =3D get_sdk_install_targets(d, images_only=3DTrue)
> +    sdk_targets =3D d.getVar('SDK_TARGETS')
> +    ext_sdk_target_set =3D set(multilib_pkg_extend(d, sdk_targets).split=
())
> +    excluded_set =3D set(excluded_targets.split())
> +
> +    # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included in=
 the locked signatures,
> +    # as they are required during eSDK installation.
> +    filtered_excluded_set =3D excluded_set - ext_sdk_target_set
> +    excluded_targets =3D ' '.join(filtered_excluded_set)
> +
>      sigfile =3D d.getVar('WORKDIR') + '/locked-sigs.inc'
>      lockedsigs_pruned =3D baseoutpath + '/conf/locked-sigs.inc'
>      #nativesdk-only sigfile to merge into locked-sigs.inc
>
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228933): https://lists.openembedded.org/g/openembedde=
d-core/message/228933
> Mute This Topic: https://lists.openembedded.org/mt/116893601/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

