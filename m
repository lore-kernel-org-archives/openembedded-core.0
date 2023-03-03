Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295B4C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 08:19:15 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.18787.1677831549422372757
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 00:19:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nBu5KrZI;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id b13so1519847ljf.6
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 00:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677831547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT7pkpXx66tiVT9dXaNk1XydEjbQwBMmBCHAYfgcsgk=;
        b=nBu5KrZIPJj2WG3QlkjOHJ12kFX6JMU6G26vP6+RAm/9Mzx2NWxyTjtsxFSBD+5jdG
         8XXwE8knMqABxOFlIk7rVEXYM3VzO8hNRF2bzFlgGGGzRCqptZciwZwcFyB3dpO7eZ5H
         8CxptJe4udF31S6gRYrmE+a02ZsXnUrIjpGG7NcBNHvA7d7hcPgyKhD6ClqGu9/NLt+t
         b3g9J9RRhwUUdeHBOr7e6wmxts7XyVUxxZk22J5DiCcK3817o/0NJcdsGdCqCFlviRDM
         dvLimH5e7jyQDvAG7maddIGj7GhcbYMFl8EkMxXsTY9GdW2IWum7u3s2WDMCuTAfSlcb
         pF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677831547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HT7pkpXx66tiVT9dXaNk1XydEjbQwBMmBCHAYfgcsgk=;
        b=4b98ZCsZm/UTN3hRBBTRtZWVjTEsQBhe0dNu0GMn8rZveiWNVgFtkpZxByc05sRs6k
         ewwDlp0idCVot4qKtCfc7gMzxZiYsbKDdwOQwD5MO7MaQgwLIPzvcTd/RqQ7+viODyuF
         AtpOQe/8WEk3pNMkc2XmNANVqW8DrVzeYCLy1x0Il5OBQ+xvT0dTVKPuroFdm/r4x+PW
         wMvktBnz/flMQpbSJAMpG1mf9+7Bc27Pl3zCRRJ0AsA4zMHorXD9tFvFxonSoFLPyVG3
         fDHJyaN+L9nioggmSyOjxSjOxaTztWq0CmXNLUXpXaFJWXuKw+zEqDeRr2pk4SRXG0Ch
         gcdg==
X-Gm-Message-State: AO0yUKX+ogTWl97sdVCJ47TCWqfW7pTDWrzFsE59jEMOrLi2u7WtXktS
	JFmV5joGGGqwzWNzrJWn5SU5S4fa3c1MQVHIo0E=
X-Google-Smtp-Source: AK7set9iOrNpxykU/2b5EnojcWBNFUAxs+Z550TYE8gTCJOS6SuEcLSuw7tU7VsfstoRcZgilgvOMV6Eg85fD6ssnoI=
X-Received: by 2002:a2e:aa1c:0:b0:295:9a96:a5fd with SMTP id
 bf28-20020a2eaa1c000000b002959a96a5fdmr288797ljb.5.1677831547460; Fri, 03 Mar
 2023 00:19:07 -0800 (PST)
MIME-Version: 1.0
References: <5c7f3677bc87451a87381f60eec00e80fc2bdf33c6be4ebe8c1530e6b086a38eBYAPR11MB33975C4236D66FF2F2DEE3FB81B39@BYAPR11MB3397.namprd11.prod.outlook.com>
In-Reply-To: <5c7f3677bc87451a87381f60eec00e80fc2bdf33c6be4ebe8c1530e6b086a38eBYAPR11MB33975C4236D66FF2F2DEE3FB81B39@BYAPR11MB3397.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 3 Mar 2023 09:18:55 +0100
Message-ID: <CANNYZj_iBwixpsE26p5S6k4fyOe=oUqBxFe_9+OLT+T0iBuMXw@mail.gmail.com>
Subject: Re: [OE-core] harfbuzz version difference on kirkstone
To: Soumya <soumya.sambu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177979

I suppose there is no plan.

I do hold the opinion that the 'industry standard' of backporting CVEs
is the wrong approach altogether, and stable branches must get actual
version updates instead. The project policy is that versions must stay
the same, security fixes must happen via backports, and if backports
are difficult or impossible, then the security fixes either don't
happen, or happen via a version upgrade in a downstream users' private
layers.

Alex

On Fri, 3 Mar 2023 at 06:42, Soumya <soumya.sambu@windriver.com> wrote:
>
> Hi team,
>
> I am working on CVE-2023-25193 for kirkstone branch. CVE patch has been f=
ixed on 7.0.1(latest version) but kirkstone has 4.0.1 version. I am trying =
to backport the patch to 4.0.1 but since there are lot of code changes and =
newly added files, I couldn't backport the patch.
>
> Below is the error log:
> NOTE: Executing Tasks
> ERROR: harfbuzz-4.0.1-r0 do_patch: Applying patch 'CVE-2023-25193.patch' =
on target directory '/buildarea/eng6/lts22_3268_13feb/build/tmp-glibc/work/=
core2-64-wrs-linux/harfbuzz/4.0.1-r0/harfbuzz-4.0.1'
> CmdError('quilt --quiltrc /buildarea/eng6/lts22_3268_13feb/build/tmp-glib=
c/work/core2-64-wrs-linux/harfbuzz/4.0.1-r0/recipe-sysroot-native/etc/quilt=
rc push', 0, "stdout: Applying patch CVE-2023-25193.patch
> can't find file to patch at input line 13
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |commit 8708b9e081192786c027bb7f5f23d76dbe5c19e8
> |Author: Behdad Esfahbod <behdad@behdad.org>
> |Date:   Mon Feb 6 14:51:25 2023 -0700
> |
> |    [GPOS] Avoid O(n^2) behavior in mark-attachment
> |
> |    Better implementation; avoids arbitrary limit on look-back.
> |
> |diff --git a/src/OT/Layout/GPOS/MarkBasePosFormat1.hh b/src/OT/Layout/GP=
OS/MarkBasePosFormat1.hh
> |index ebb8c31c6..73839a4c8 100644
> |--- a/src/OT/Layout/GPOS/MarkBasePosFormat1.hh
> |+++ b/src/OT/Layout/GPOS/MarkBasePosFormat1.hh
> --------------------------
> No file to patch.  Skipping patch.
> 2 out of 2 hunks ignored
> can't find file to patch at input line 120
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |diff --git a/src/OT/Layout/GPOS/MarkLigPosFormat1.hh b/src/OT/Layout/GPO=
S/MarkLigPosFormat1.hh
> |index 1a8021237..447187102 100644
> |--- a/src/OT/Layout/GPOS/MarkLigPosFormat1.hh
> |+++ b/src/OT/Layout/GPOS/MarkLigPosFormat1.hh
> --------------------------
> No file to patch.  Skipping patch.
> 1 out of 1 hunk ignored
> patching file src/hb-ot-layout-gsubgpos.hh
> Hunk #1 succeeded at 641 with fuzz 2 (offset -71 lines).
> Hunk #2 succeeded at 676 with fuzz 1 (offset -77 lines).
> Patch CVE-2023-25193.patch does not apply (enforce with -f)
>
> stderr: ")
> ERROR: Logfile of failure stored in: /buildarea/eng6/lts22_3268_13feb/bui=
ld/tmp-glibc/work/core2-64-wrs-linux/harfbuzz/4.0.1-r0/temp/log.do_patch.38=
4214
> ERROR: Task (/buildarea/eng6/lts22_3268_13feb/layers/oe-core/meta/recipes=
-graphics/harfbuzz/harfbuzz_4.0.1.bb:do_patch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1131 tasks of which 1123 didn't need to be=
 rerun and 1 failed.
>
> Hence could you suggest how I can proceed further on this or is there any=
 plan to fix this CVE on kirkstone ?
>
> Thanks,
> Soumya
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177974): https://lists.openembedded.org/g/openembedde=
d-core/message/177974
> Mute This Topic: https://lists.openembedded.org/mt/97356618/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

