Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8749C61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 10:39:18 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.36937.1700563153610987923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 02:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fL+C3xjm;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c5b7764016so65343591fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 02:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700563152; x=1701167952; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwlK7dMZNZjXKnzqPYcB8g/DKNHpPIzsRVG0WfP4HaQ=;
        b=fL+C3xjmmjlJ78291DlHLsQi8IRg+qVNWHVyqSLc8CsPOOqNiNaCEZNcTpGO4f31T4
         I+SFIEHnASqURzHToBfUvkdDP74ZvSdaiAL5X11H3TNLe9W+oh6rM+ukNYT/GEjsKejy
         FiztDg+XmDd80GOfbCTSoJZZBOy7wGUg5m4f2yJ4MhijQzb5+2BMq7bXSG3Tfl6H65qO
         1QpfBOXGYq6YGk2TPJrdIf0OGl6zELzKxT2uoiU1tQKxc8DaNYZ55yznLU8mligNq8Ee
         BIsWctjQcrq/DESuwRAVzZE29DHW+PQk+blHjLXhY5HvWq9qD+O4PFFOqX+wXqU4BN3h
         G0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700563152; x=1701167952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwlK7dMZNZjXKnzqPYcB8g/DKNHpPIzsRVG0WfP4HaQ=;
        b=jaybMSYD77KqhXzcl5R4+DRitXjEl9dFC+mRaoWKii9anStdYNxmrAWE9MnVFTZ7h0
         gwICe8zyTAzdijeiSKZE3b9QsJrRrtjTXfpntF0Koe04p55rN4Qc/f2Z/kQuNVRKhAPQ
         VctB4d64TH04XYttc50LqQG5tcVFYoFTH1oBw6gGupmyjvzgIi/IvwDVTx1SdfxYCiRu
         AFAxrpW0WqCG80Ea2zlrtfsyVisv/s+GwD71PeWI9jDaawVhFODWq6EUPBT0xMzIohIQ
         /6rq7fX7cyRXtBioPXn2j9pS3/E342X5ED5XGzz8qxyT20b9GjnHsYg7slYkS7rOvmJr
         ZO9A==
X-Gm-Message-State: AOJu0YzZde09AojKfWz+XUQV5dMJY3S0AOavmSPOZKNczuibmGWb/UW6
	P0F1qawE7UhBL2ERsH9+f8Da03mGBoK+sqQ34Qg=
X-Google-Smtp-Source: AGHT+IGJVUHogYndnpgAh96I3mT5+xt6c3UsuWpkkgi80aKeCcJyYUpZfiUxERaXsOTG8MfjZwPEvbpemSxE25LQx0Q=
X-Received: by 2002:a05:651c:39c:b0:2c5:55a:b6ae with SMTP id
 e28-20020a05651c039c00b002c5055ab6aemr5460978ljp.16.1700563151429; Tue, 21
 Nov 2023 02:39:11 -0800 (PST)
MIME-Version: 1.0
References: <DjZK.1700562195995684156.aksX@lists.openembedded.org>
In-Reply-To: <DjZK.1700562195995684156.aksX@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Nov 2023 11:39:00 +0100
Message-ID: <CANNYZj9AN=Eq0DKPeGS-N-XP2=OitMzW6sOcBpH2MUNzugY1hQ@mail.gmail.com>
Subject: Re: [OE-core] [Kirkstone] joe editor broken with current ncurses
To: tobias.jakobi@compleo-cs.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 10:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190963

I think bumping to 6.4 is the best option. Unfortunately stable branch
policy prevents that going into oe-core.

Note that the various date-versioned patchlevels are all development
snapshots. We used to think they're actual releases and ship them, but
it's finally been corrected in master.

Alex

On Tue, 21 Nov 2023 at 11:23, <tobias.jakobi@compleo-cs.com> wrote:
>
> Hello,
>
> I'm currently facing some problems with seem to originate from version bu=
mp of ncurses done in May this year. The problem manifests itself in applic=
ations using ncurses rendering garbage and "destroying" the terminal. I.e. =
you need to issue a terminal reset afterwards to make it usable again. The =
editor joe is affected, but according to other reports tmux as well.
>
> It seems like this problem is known. E.g. the Gentoo bugtracker has some =
entries that analyse the problem, see here:
> https://bugs.gentoo.org/904247
> https://bugs.gentoo.org/904263
>
> Gentoo currently provides two ncurses version in their repo, 6.4_p2023040=
1 and 6.4_p20230527, where the latter one is masked because of this issue.
>
> It appears that openembedded-core/kirkstone suffers from the same problem=
 (even though only A 6.3 version of ncurses is used). I'm currently using c=
ommit 56503e3e80603de3b69acef2f6d32836bc9e5e5d of the layer (from end of Oc=
tober, so faily recent).
>
> As a test I have reverted the following commits:
> 4d79b1cc4178ba88830bab59a45163bbddf586ce (ncurses: fix CVE-2023-29491)
> 862c1b109cf8f31522a250cc9ff4146fe526450c (ncurses: update to patchlevel 2=
0220423)
>
> This restore functionality of joe, but of course leaves the system vulner=
able to the corresponding CVEs. I'm not sure on how to proceed here. joe is=
 a commonly used editor on our systems and I really don't want to leave it =
in a broken state (as some developers in our team depend on it). At the sam=
e time I don't want to leave known CVEs unpatched.
>
> I'm thinking about bumping ncurses to the (apparently unaffected?) 6.4 ve=
rsion that Gentoo currently ships and put the .bb in our custom layer for t=
he time being. I don't know how well that would work though.
>
> Are there any plans for a version bump in the Kirkstone branch?
>
> With best wishes,
> Tobias
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190962): https://lists.openembedded.org/g/openembedde=
d-core/message/190962
> Mute This Topic: https://lists.openembedded.org/mt/102726054/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

