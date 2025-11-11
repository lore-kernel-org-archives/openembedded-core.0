Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA392CCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 10:23:37 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14403.1762856609871627495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 02:23:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j8V1kr3I;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b28f983333so41931085a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 02:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762856609; x=1763461409; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ/3wbaf8atoIpg63j1m8LRJrApdFCUpEFDRSBEFEK4=;
        b=j8V1kr3IR4OzG1bdMeCPha0XRMVE1n1Z7+D8W635BmtWe72RPG4ECDIvLKGmj5n5cV
         j6BLeFTAa9QKBeEqtyqPs9Zxf1QK+Dw2gbcIYMyCUA8euhoaNwargRAuf0W+tFhciBpF
         KvwQvFvwNy1x2nXn4OMTFMcExMCmRhR4KlBN588Jls4HP5Y274LZi7pTwdZJzxufdSjr
         SzG49BaUzhQb63j7nctTaSZqklzvK8H/2X2jvu/EDuHaB0tDm9RDXWK2or/RyT+C26tk
         gp6qm53GOdn40eId9ppbLFecRaKkAvfofsdYy/Q84J2d/dR5EnSwRu+aXQJaqlewEAf6
         afpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856609; x=1763461409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IQ/3wbaf8atoIpg63j1m8LRJrApdFCUpEFDRSBEFEK4=;
        b=pukfg+0Fl8+vyBeZQIWFemw7y4fo1hhktwXrCzGKV+b1Q0kIQjO3M82YBm7sjLt1f6
         7Opw27BS4DU/ufqcJNXQKnRvSQUOcdEDA7oYYejlSc8XqGghaHvJERzWQQuGqqkrR2A1
         5EKnvwEJh806Gsp/S8rS+KSRhkIxylYeBkeWuKKXyCJK4fjyWHZbGlvWi6SlbyB0tgNn
         FdkOEJt2JQjIVfY4ifMbOt4tdmNIwak69XQlNeJNqvzH6UnsVH8dvzJW2US5FhPnfTyh
         OmOTo6e8V/33F9WBxpctRZnCWd0u34oCiW0Ix978Tp8fpLTm7CAL7IsUi7N8JLAqC0bo
         dNTQ==
X-Gm-Message-State: AOJu0YwHDvoYne6KhJxh9uylFYa8W2rnIORzrVrTCKslA0hqaHE1afcD
	gBR7fDmtb/4I9pXKf94pY8YFzexMVyMnZEPHJhCe9Dmxdvi1uoP7jpnEHKGiTQn1BEoNM19O4g0
	C5YoEAIaLngKbDhsHHStCsRx/+ANEDPw=
X-Gm-Gg: ASbGncu5Rurc6NLgCYQ71G2EM7L65UyQiRE+A3o/YgASDHiBDhgK5puwHJseeWoQbOE
	aN4qiXh0UB0gOT7QbmiKzarcirS2zQQZXKkH5TNNrzpJkUAY2OsmhOzSZxdhX3XN6+cAIswjaSL
	54rxw2vpcKfq+eW1orSo5GGUd0g91GY+905FL2QQmOBjwf6Jiij36rerzuYMkVx7ckQ5/sZza8D
	ehkvWDFU+KNsBS87aJpIAoyW86QKV19XfZ3XU+OYRKF0Mchy5p2iEh0327Oxrx0CyjypKCu1A==
X-Google-Smtp-Source: AGHT+IEzqqoTZF5Ucy12sXQrWH9jxyZmZ2qM2wZ/deS33c0K3c8ztMn3uqpZW2ay68MpAC5KDiPWYhcpCT/QueAfy3M=
X-Received: by 2002:a05:6214:2402:b0:880:4c73:9e3b with SMTP id
 6a1803df08f44-882385be731mr136559676d6.15.1762856608619; Tue, 11 Nov 2025
 02:23:28 -0800 (PST)
MIME-Version: 1.0
References: <2AUI5T.7ZXVDQ11N5KQ@t-online.de>
In-Reply-To: <2AUI5T.7ZXVDQ11N5KQ@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Nov 2025 11:23:16 +0100
X-Gm-Features: AWmQ_bkIKT7hc_OI7xw67BxWfFCt2Znt61WWKr_i3-fMsG5yYlTrCd0kTReVbmQ
Message-ID: <CANNYZj_4H-EmTKQSch-7yB=KFoMezya_q4ZjupVJWfv+TdwXvg@mail.gmail.com>
Subject: Re: bitbake-setup test
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 10:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226153

On Mon, 10 Nov 2025 at 18:37, Markus Volk <f_l_k@t-online.de> wrote:
> I ran some tests with the bitbake-setup tool and noticed a problem that i=
s at least partly related to the long name of the setup directory.
>
> With the default value, compiling intel-media-driver fails with:
> posix_spawn: Argument list too long
>
> It turns out that this is a known issue when the string length reaches MA=
X_ARG_STRLEN.
> https://github.com/ninja-build/ninja/issues/1261
>
> To verify this assumption, I changed the setup directory name to just =C4=
=81 poky,=C4=81 which avoided the problem. This is an annoying issue and no=
t a satisfactory solution, but perhaps it will help as a bug report or if s=
omeone else encounters the same problem.
>
> Perhaps using response files would help?

I'd like to see how you ended up with a directory name that is too
long for intel-media-driver. Can you share the build logs that pass
and those that fail?

Bitbake-setup does not add that much to the build paths, so trying to
make it even shorter will not solve the issue properly.

Alex

