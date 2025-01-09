Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D96E77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 09:16:57 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.43716.1736414206759059979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jan 2025 01:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EcTZJcy3;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d8f99cb0d9so5930766d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 01:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736414206; x=1737019006; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMk1/AOz2sDlnRyggjKp3imzuC9+mkhnqICGbuUwXwo=;
        b=EcTZJcy3rssGvLfYfH3swmQwZM+y3urDf5+hH27ApWoNVDzj3SvjK0MgA2y9NI2fpS
         Ur+d0wODzCYjraFuS21ifZQpND/W7Mg53mffHwpsp8LEer3DV1OSCAsxPDGC1LIIIG8W
         znphWx5M3Dne1vBL/XT88vun53Ua4H6GasNoDMUFv871ANzQ6lj8mq0QaK41vwcPVrf7
         a9XJ3g/cDj3JX/9cUg5gl5vpSAbukIEqLctEZ/es2ZaST/pEPHv+3qHF8bfGQrSc4PNm
         UVRo1l3YDrWiwtdz0YseegxrRimLujJnsPAwwvvJKF/ThQ2mq5QaK6sB8uExfkEjSav4
         0SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736414206; x=1737019006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMk1/AOz2sDlnRyggjKp3imzuC9+mkhnqICGbuUwXwo=;
        b=nMUHqxLZNRo0Y0P5oLlx9xO47AaVT81j9NRoPjV++NYd+p3UKyN0t0ItCKFzPrkQB1
         V8fHlhf7g0gJyw8wcvRE7MsrKhurgYzWxVswOJnY/5Nagw7/hr0s0wwQvXmdL925Hi87
         u13JWd4omTTIjWoDwlCxnFd/4xmmFbVfFvLm+G7fRAhFlebyTOb+D9f7aJoJ8rrYkiFf
         LypOd4AZwv8QmpgQgbDUhPodtEQGreRFZkH95zTy+GpECk0Ci5wvwvvlHTwffEyDKFK7
         7FORW4NMYgerWqy9dlKjd6n3+dn2QO1SGeW4xkAvQ4w5ARnEBROOh1VgW5vpoUnC10KV
         whqw==
X-Gm-Message-State: AOJu0YwmJiz1r2NxUOx395WsE5gAdqsEIEG1eYXCk7sOMTfcclB3cwo1
	hnbRfcwz6XyKZIryQjqJ5pb4+gUFCFRRIhDKTyu2x12bqrjDOS7j8x495LwxvR3ouEf9CtoqtcL
	nyANgbgFfz5qnGIhV/lSYCShjEXmTmA==
X-Gm-Gg: ASbGncu2rrrIaUsaN8N7a5kYNQSP5ysUbwfbFiNlgq1iy+fkmlHdbcZ+cmVdOwtjUmH
	9sBQ/Tod3kPDqC3Yzs7k0mcBmW9uES9UocDkuWQqWctViorQtNGJorSlbYPgQlJcGNCN8BmCr
X-Google-Smtp-Source: AGHT+IEc2fctYOm6IV+6xYbTjP1owtx+l9vUtUoPFpy7ZE5EWF/OcbucJqVP4UHK9NnEChRDTIUl/q11rguzkv3LxrE=
X-Received: by 2002:a05:6214:4903:b0:6d8:8e27:5a45 with SMTP id
 6a1803df08f44-6df9b2ddc3cmr108072676d6.39.1736414205710; Thu, 09 Jan 2025
 01:16:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1736388671.git.jiaying.song.cn@windriver.com>
In-Reply-To: <cover.1736388671.git.jiaying.song.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2025 10:16:34 +0100
X-Gm-Features: AbW1kva89m8wfB_Hc2Ox5Z51gaBa2WqgQHPNDkMv_ZnZf3i_tR-Q7gJsMJz-1Jw
Message-ID: <CANNYZj8AM4Tf5+oCLJqBL3Dgm0AKtEhQZZ4U83HJZUG717Nuhw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 0/2] ovmf: update from
 edk2-stable202402 to edk2-stable202411
To: Jiaying.Song.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org, liezhi.yang@windriver.com, 
	changqing.li@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 09:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209615

LTS branches cannot receive major version updates like that. Rather
the patch that updates the git submodule locations needs to be
backported.

Alex

On Thu, 9 Jan 2025 at 03:44, Song, Jiaying (CN) via
lists.openembedded.org
<Jiaying.Song.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> Due to the invalid URL of gitsm, the do_fetch process failed. The upstrea=
m
> fixed this issue by modifying the .gitmodules file in the edk2-stable2024=
11
> version. Therefore, an upgrade to edk2-stable202411 is required.
>
> Upstream modification:https://github.com/tianocore/edk2/commit/95d8a1c255=
cfb8e063d679930d08ca6426eb5701
>
> Error log:
> WARNING: ovmf-native-edk2-stable202402-r0 do_fetch: Failed to fetch URL g=
itsm://github.com/Zeex/subhook.git;protocol=3Dhttps;name=3DUnitTestFramewor=
kPkg/Library/SubhookLib/subhook;subpath=3DUnitTestFrameworkPkg/Library/Subh=
ookLib/subhook;nobranch=3D1;lfs=3DTrue;bareclone=3D1;nobranch=3D1, attempti=
ng MIRRORS if available
>
> The following changes since commit 01423828248b75e1f5afe2e5959ccd971df875=
cd:
>
>   rust: add reproducibility patch to eliminate host leakage (2024-12-19 0=
5:36:59 -0800)
>
> are available in the Git repository at:
>
>   https://github.com/jiajia123-wind/yocto jia_oe-core_ovmf
>   https://github.com/jiajia123-wind/yocto/tree/jia_oe-core_ovmf
>
> Alexander Kanavin (1):
>   ovmf: update 202408 -> 202411
>
> Mikko Rapeli (1):
>   ovmf: update from edk2-stable202402 to edk2-stable202408
>
>  ...ential-UINT32-overflow-in-S3-ResumeC.patch | 51 -------------------
>  ...-Fix-overflow-issue-in-BasePeCoffLib.patch | 36 -------------
>  ...ovmf-update-path-to-native-BaseTools.patch |  6 +--
>  ...ile-adjust-to-build-in-under-bitbake.patch |  6 +--
>  .../ovmf/ovmf/0003-debug-prefix-map.patch     | 34 ++++++-------
>  .../ovmf/ovmf/0004-reproducible.patch         | 30 +++++------
>  meta/recipes-core/ovmf/ovmf_git.bb            |  4 +-
>  7 files changed, 40 insertions(+), 127 deletions(-)
>  delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-Potenti=
al-UINT32-overflow-in-S3-ResumeC.patch
>  delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-=
issue-in-BasePeCoffLib.patch
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209612): https://lists.openembedded.org/g/openembedde=
d-core/message/209612
> Mute This Topic: https://lists.openembedded.org/mt/110509930/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

