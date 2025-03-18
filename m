Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243BFC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 09:51:44 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.7799.1742291502153494869
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 02:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L6EEhNPY;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47698757053so65923831cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 02:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742291501; x=1742896301; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YABkDBfBF42CohVB8Tz7G/YRWwqpdajEpxf2RRyESDk=;
        b=L6EEhNPYT/vj1IXKSdxIh8TfFo1PtKvy4bq8T/qWXkvZ6j15YpO0bdg3eUyuuybtCK
         CCNx4QKJJg5pZoy8iFgzyWO5Goz44ZwI00OeUGyE7qKr1xEEQLI5BjFPgqbadKznY9Kv
         b9imRDM3y7DddSxY4mb/bFEKJidVO0mLifZ4REVaPv6TuZO++hiGRpBBHMeExmLqo9QS
         ZKcizcuD2F6re6oPEulCxlVVNYiixzGD1no3C6RZ7cOrWf1E/AE4OgdzLZLY4DgKuG1k
         v1TrCux2M2rzmcWXebvn0vH9x/SHJsiCX8ng7c1P5V0Vljw+dypnW1Re8uU28d1JP5q+
         hZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742291501; x=1742896301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YABkDBfBF42CohVB8Tz7G/YRWwqpdajEpxf2RRyESDk=;
        b=LJEZtdFk3LT3aEisf8vyjVuqj1dsJYKes9iMIfz8zOji+VTahMbnUDRbz5wGQvwpvx
         HmgY4+Gq0dZFYU/5VPFgFeJCk4QO+pfDsWlD+GjX0glhpluSC1kHrPsbIyADSVbijWY7
         VT+WWuO1a+DMHuydegrr/OAuehXv/I2yQ2z1QdzZs0tduD195fcIYGph1u3jEaVf6PMp
         RaG3Hs3ArhfZgb3c0cl2jlzkmkufNbgu4uR750UDN4WbRiGdvROW1/QbOMF4QFDWjFET
         8y3CIldlbCXHyQMrf0C4+oBgrzhxs2SUFy9rbebqwy0le/A6tvcF9MAruLAppO2rXibd
         jQqA==
X-Gm-Message-State: AOJu0YwcHfOU+NtWBHX0IBiWOIFjDgGPz/YfVp/RYjDf0R0rddkXmuic
	r9FVcYFp8EPjJXWGH51XzxMNv93iUy8HrUFGvG2FkICuu3bGG34xF/KqSNT2rSYAQAcIdnAY2Qb
	id3rjk3LfRQHpBCsJKyLXl+oS4woF4FoJ
X-Gm-Gg: ASbGnctWu7/fhSI1icuXAON6O4UDoCayZt2Ey5KnPxBjn6mhj/bIfV/aNUreccS7pAY
	dEZXUocgKVUwFQBGdfxvvB6StuzIPB8AlpApgn1CkfpKIJTR3DJl9jdiPvWtv5+FER5a00b9Hsx
	WBhVXNayYJgEMY/Y4nbWgDqc4k3NGPl7Hews5NfzHgbrvlAA5/L5B3Spy7kZsS
X-Google-Smtp-Source: AGHT+IGv/ObXh1h7p6DcYsS7l/Au3fzEQA+icy/eeExDsPteNc8T1qUq7MGRja8EebhBKsVGQwLjIiHEsJiWLOAbUEE=
X-Received: by 2002:a05:6214:230e:b0:6e6:6a6e:7596 with SMTP id
 6a1803df08f44-6eaeaaf3249mr213934966d6.39.1742291501127; Tue, 18 Mar 2025
 02:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250318043846.2422141-1-raj.khem@gmail.com> <20250318043846.2422141-8-raj.khem@gmail.com>
 <182DDC388EFCF3D4.9747@lists.openembedded.org>
In-Reply-To: <182DDC388EFCF3D4.9747@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Mar 2025 10:51:30 +0100
X-Gm-Features: AQ5f1JoIG1u8FsEgM8d7rZoj4ulgXUHHUlG-SwkE2JFoD68B4mglSUDCpulPBDE
Message-ID: <CANNYZj_zS7j0JseaRLMxDng1S=AdkXbsbxgRLJB=nPqWu6Sc2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/24] readline: Fixed build with GCC-15
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 09:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213193

On Tue, 18 Mar 2025 at 10:39, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Tue, 18 Mar 2025 at 05:39, Khem Raj via lists.openembedded.org
> <raj.khem=gmail.com@lists.openembedded.org> wrote:
> > +Fixes builds with GCC-15
> > +Sourced from Fedora: https://src.fedoraproject.org/rpms/readline/c/c47eb813afb942128253213ad5b8221770557e48?branch=rawhide
> > +
> > +Help getting packages like bluez5 building
> > +
> > +Upstream-Status: Pending
>
> Please no new Pending.

Per https://tiswww.cwru.edu/php/chet/readline/rltop.html the
submissions should go to bug-readline@gnu.org, chet.ramey@case.edu

Alex

