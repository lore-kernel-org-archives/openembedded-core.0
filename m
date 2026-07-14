Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DA0C43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 13:22:53 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9368.1784035371470459556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 06:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LHDCMPX5;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8ee88fce572so13242186d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 06:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035370; cv=none;
        d=google.com; s=arc-20260327;
        b=nRhF8DOAqaSALhAuwD/LHt4Vjsz8yrkKhU0qJF2c9DLL+v1Ya2biov0TWTdbw7lsHv
         MeSmcVWM7wEpvi4EMa/Hijf7W7TZA13v3BQtA7xD1AVt42bnVSVv54E6/0njt24Cv/kw
         AGyZ9tyLQv3mBfWRHcJSdaJp6zBe6JbfRaS8YARkgAZzgCfAA0pKYmX2mcsiikX50N0a
         a/m3vmwaHcKOdExWtLkUJ0tFIAaMNbI9OKXnivREFal8LIW5QswPkPr0GoXr7WrKcqja
         jhAqEKxpgdqs47h6bi2gXvxXERlphQ0tDJNOkTrgSHR3hBwsZ2pxty42p+1xfbGpGUg+
         q5cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PBUoO2LRCD2/Z+GvBvJB4dytwjaJhdPDhVwogHT7qg0=;
        fh=kBRKN7kC4mpkge2i2CKgDOCGU6M1x53xUWupSWl7I14=;
        b=j87YhgcBfJuOP1LWJjkmonWE+V00CNFQl9Ro2cvo1hSNFcFYp6bcA2GcKEHDcpSPbk
         QAWAE1jjPT7moSJgzn2APsFrHFxV/wePmbKpUOHQ1XKtP8UQMPHB1bjQIhK84QSu+UFl
         FoLw1QEv2vvTi+L6D8/Z0WuSmIu7FlIlukJz7Q0eJY4TcwJDt1hXW+SMy5je9/mNmwGN
         eU5aJPvDumvS8tHTdeRElk+ImZ7Zuu1NxYcWN+6RHSdO0doLv6nKlSo8Y0Pd2Uf1am+2
         IPD66608cC76ESXvLsQHLChBfFfflxc3VAARhAjtQxzXFWtTS9/5BbRqf/55slyXzyft
         Isew==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035370; x=1784640170; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBUoO2LRCD2/Z+GvBvJB4dytwjaJhdPDhVwogHT7qg0=;
        b=LHDCMPX5+kj+TNk3Jeh8oM8ojw9ehiLSP43JhkL64tJ+bpOFaAw7xqG/v7Q3907Izz
         Ngtxz10vNQAJQG65yxBsVH+briIQ0XavZKeNF216mX3hdFKgxLr5jjOcFFivlhb/0L8/
         B4nhBLw3vDhQ6yxk7M14GnW3cD82qwPdR4BsqgbaAXVBsLJd6i+M815Y13CMQmQ/SMbz
         ZaYC133IkItakzQeEx85pzI0uZIqYaEwDFddOR+fTqe2dpCpOkkbCMDWh9m34p8DeLmG
         jkkd4oJA8Cf8ONX4VOFNdNH9WeSsMWczf0V6l+rkkz2uDzNgnZ1AXyrVHSWadH1ZSZPu
         an1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035370; x=1784640170;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PBUoO2LRCD2/Z+GvBvJB4dytwjaJhdPDhVwogHT7qg0=;
        b=nxJODqXcjYP8o49ZC3Xo9aUrcvVHpwMDFZfUARmsn2v5UGNPDo4Xx7EqnRPA8PxbjQ
         /2diYO6gBoGKF4LKvGjB8vm9KADkUHho0g14/6czigqTuzMF/fyEZuW0Lr0WJALTLePw
         NWXX9uQWRPjBPVaal9dPUbKIW4zy+BZgvqgf7CCEsmdNEv5B9cvElqX+lubBd6JD0405
         XtJ0gjDsbR0g1GJPBmVyD0NkOyAFji8lgPwdpok1OY6yh8muYu9TuWNmwNQdgmfihH01
         i0I23CMW9Te/FllpjxcvCW3RLhcLRbStHDqX4sDtIe4YVHrQF34lQauXuViZatsKHcF+
         uadw==
X-Forwarded-Encrypted: i=1; AHgh+Ro98agAA5qA3QrhTwdF/aA/pcrJ+5Tbhip7yKGaRGsGTkUSdueCR/uGmXrzk+viJpGflVLDLvpvE+l54Yes4r5xYw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxx6a5xmdvrLzEsnfTeYrnPhRXLy4H0A9nTEf7+G2bM0dD0DNlO
	HkNXjBBdoz0cX7tFhxXKem1PWo+UZDibzbGdbLOm5B0IwhFomThm+0G3ZcQs//lmPFOHqUiJ82e
	5+IVVWU33QX/XeS7T/TXH6lAela0vRhE=
X-Gm-Gg: AfdE7cmAhopkbbMH3tQcPo/URwE9DLciXJS50j0RMe23/ybck38U6vpX4uhWVOovTpR
	TzMatDBIf9bYI/cs/DLUlbqIhmDvMOoeWOnZZrggPJUxMpS5XtSNGPglE2wgrRiROY11gQf7A/C
	1u0mSrwUPUHHIepvW+9jFYI+1DygTSthIR+9i+ck0xmEyuaQbZAd7Ud7sWvOZLj2jLmjnMl2bNb
	hF1NUywzYKvDBnn/vQwuZ1Os0CVAfSvmt2b3RNmFE6QLH0QsUUka7lYPxj19Gu2MopDFAPgkJoB
	5CkgLfbV3rqz/djUoJULqbYSUEUxyL0=
X-Received: by 2002:a05:6214:3016:b0:8e9:f5de:d61f with SMTP id
 6a1803df08f44-90403a59eb6mr144839796d6.46.1784035370343; Tue, 14 Jul 2026
 06:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260708092252.1211669-1-HimaniRamesh.Barde@windriver.com>
 <20260708092252.1211669-3-HimaniRamesh.Barde@windriver.com>
 <DJT3J5GX38YG.338OF4LLBVU92@bootlin.com> <CH3PR11MB8774FCDCE3E2497D8793893B8FFF2@CH3PR11MB8774.namprd11.prod.outlook.com>
 <CH3PR11MB8774C007D411DA9C4E26E9858FFF2@CH3PR11MB8774.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8774C007D411DA9C4E26E9858FFF2@CH3PR11MB8774.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Jul 2026 15:22:39 +0200
X-Gm-Features: AUfX_mxU0VjCj6s38ZuyWrisraZ8Towf3wqc8rM0gtZY47U7xB8HHu0VrPfAS8A
Message-ID: <CANNYZj9DOhHjoT=LZCk+Q+JDVQo-SeViwRmKkSo1UcX1dsQmZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-setuptools-scm: upgrade 10.0.5 -> 10.1.2
To: HimaniRamesh.Barde@windriver.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"tgamblin@baylibre.com" <tgamblin@baylibre.com>, "MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	"Komati, Shiva" <Shiva.Komati@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 13:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240886

On Tue, 14 Jul 2026 at 14:21, Barde, Himani Ramesh via
lists.openembedded.org
<HimaniRamesh.Barde=windriver.com@lists.openembedded.org> wrote:
> The error occurs when building python3-setuptools-scm >= 10.1.2.
>
> This was reported by the AUH on June 23 (subject: "[OE-core] [AUH] python3-setuptools-scm: upgrading to 10.1.2 FAILED"):
>
> File ".../setuptools_scm-10.1.2/src/setuptools_scm/_get_version.py", line 55, in get_version
>     from vcs_versioning._environment import VcsEnvironment
> ModuleNotFoundError: No module named 'vcs_versioning._environment'
>
> ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
>
> setuptools-scm's build backend calls get_version() during get_requires_for_build_wheel, which tries to import vcs_versioning._environment (a vcs-versioning 2.x API). The sysroot has vcs-versioning 1.1.1, which lacks that module.
>
> SETUPTOOLS_SCM_PRETEND_VERSION is setuptools-scm's own documented mechanism for this situation. But if you prefer a different approach (e.g., upgrading vcs-versioning to 2.x), happy to defer.

Thanks! The issue is that newer setuptools-scm needs newer
vcs-versioning as well -  but this was not clear from the commit with
the 'pretend_version' fix or your comment to Mathieu. The point I
wanted to make for the future is:

- it's better to include any error you see into the commit with the
fix, so the error is documented together with the fix and can be seen
by reviewers

- if there's a choice between a workaround, and version update for a
dependency, it's better to update the versions in lockstep.
Workarounds tend to be forgotten, they linger around long after the
issue is otherwise fixed, and it becomes difficult to understand why
they are there and test whether they're still needed.

In any case, both updates have already landed in master, so nothing
needs to be done.

Alex

