Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDEBC3600E
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 11:48:39 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.48147.1743076113629209205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 04:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BB53RS/F;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-476964b2c1dso17056961cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 04:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743076112; x=1743680912; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQ51/6De/WL5Pf4Lq1Gs9AAGAXt2WT3Pa1+Ug0bi5sA=;
        b=BB53RS/FDqvFOlbSUL5zIiunGkopU1v+hj8Rb1trNC+DLhtTpap/E2GutHEv2l7Fp/
         cYqTQ8/jbdDOeUJv2vaRMuXnmMGEl+ejEZfAHciC/YaYgymy3/Kv/stx1L9Gv/J//wMf
         BuJP9f7JsGgNBwqyI52xfvQZWd4Jrn6fyvlt2dNjUHW3h3z7xpYeuVl+Zsq+gtyl37Qs
         BYHUgK574l6l0TYO5KQdFMeyPJzhCDu3XOps1ZlocdVH0nD7Es9L1Fr05Y6UIk1FDNaL
         zkr1FN7EFMkDp9Rs2LEsn7APp+tsC4xnIHXAVJXHdvscagX78fmW6INHuXrq2PQ01PqO
         tIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743076112; x=1743680912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQ51/6De/WL5Pf4Lq1Gs9AAGAXt2WT3Pa1+Ug0bi5sA=;
        b=jV1zVjcEmEpbdCK+4RXeXouu9HkwqkjqhIjAKVyqhTCJ7dDP/DtKifRahnQYOniu8F
         92jh0XlqrS+LkwrkbyiiipbwlJXknlKl74qAjgwCpjSFGqPXh4d8JiBb8AgLKWZaODiR
         77mLahn33UipUJy1wDKxaauLdPpDomMhgJRVg/D2L0nlsMHqV5csstzM7SiEquCrKtii
         yA3ZTc1ZX20+hTihcGslrMyL17M9fVY5QabCclUKWaMR1fiNpv9SkcKDy01x5zRKP1CM
         QYXTrm6O/1qBvcD2k0QtLH8MLCTZKtWkgUK+Fo4E7QXaydXEpdQJnOalqAk5q7a7tlLb
         4nRA==
X-Forwarded-Encrypted: i=1; AJvYcCXx4I+yYxadNgl6100HncnqW7lRxgyJToHGEusZNDjV3NyWz9QLW4fLY840EIMyH8kpYhyBOwXSAEOSFNCxO6g0Nw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy5TnGA9OOObGVYnGgrfYEp80tmyIk9666fatNg6BXiPkPrymcG
	lf+MPHWiVeGHGBONM1hZn1n0iUdwondmH85Z0HHIWEge2EXC++fbNltj1SfENCbxb6KBhaesRPJ
	uuQuAzSZ0FmHGSjGntVb+EF6eqCs6jA==
X-Gm-Gg: ASbGncs5IPqZP97xe/TlXmnhrXv79LCOosVQc+/OMBpKNIyqPmMcUcqQyXKgK/28d+g
	JbezV64O2vplSuQjI/W0oTH/bUJX7VBWtK2BARYuBwCV8gb8xCrYvIeXvAahv6gNiYOFXUHuezX
	f4i4PuqC3FiYmuDuRbtprVblEwIJevFQNpmt7eT/pEL2N/vksktBuA28CnQoio
X-Google-Smtp-Source: AGHT+IH1N+vadAiOp3Vj6mkekxdCdS9Gl6OTtV6efnVh3qaC4++A0NFzuSWX5lN0IR8sl/pV/PC8XXzfhe6MF9jv/Ig=
X-Received: by 2002:a05:6214:b6d:b0:6d4:1ea3:981d with SMTP id
 6a1803df08f44-6ed239559b0mr35723036d6.43.1743076112527; Thu, 27 Mar 2025
 04:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250327060855.428041-1-rajendra.desai@emerson.com>
 <CANNYZj8ko8LF8m32CoM2fWTCryTWW_Nwya62K_dpBZqdU_WZZg@mail.gmail.com>
 <DS0PR10MB79549ADC3C849A2D68F00BDB89A12@DS0PR10MB7954.namprd10.prod.outlook.com>
 <1830A652FEC6E4D0.25981@lists.openembedded.org>
In-Reply-To: <1830A652FEC6E4D0.25981@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Mar 2025 12:48:20 +0100
X-Gm-Features: AQ5f1JqAgs-VuzgZ5JNLrX94JNoifEQSyUywMffuKxSTbM5bNCiBbLeFnerq5rw
Message-ID: <CANNYZj_xbcvc1VgXe96zYhRj7AvOpou6x4oEHUE+M_Kvhu+8SQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perl-ptest: copy xconfig data from perl source directory
To: alex.kanavin@gmail.com
Cc: "Desai, Rajendra" <rajendra.desai@emerson.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 11:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213727

Oh, one more detail, and it's important: which image are you using?
The correct one is core-image-ptest-perl.

Alex

On Thu, 27 Mar 2025 at 12:45, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> I just run perl's run ptest on poky master to observe what is happening, =
and:
>
> - the tests are not actually erroring out, some of them pass, some of
> them are skipped
> - the reported problem is not a missing header, but a missing gcc
> compiler (which is hardcoded somewhere to oe-core's build environment,
> not the target environment).
>
> Can't exec "x86_64-poky-linux-gcc": No such file or directory at
> /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Bas=
e.pm
> line 362.
> PASS: dist/ExtUtils-ParseXS/t/001-basic
> Can't exec "x86_64-poky-linux-gcc": No such file or directory at
> /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Bas=
e.pm
> line 362.
> PASS: dist/ExtUtils-ParseXS/t/002-more
> Can't exec "x86_64-poky-linux-gcc": No such file or directory at
> /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Bas=
e.pm
> line 362.
> PASS: dist/ExtUtils-ParseXS/t/003-usage
>
> - additionally:
> SKIP: cpan/ExtUtils-Constant/t/Constant
> SKIP: cpan/ExtUtils-MakeMaker/t/02-xsdynamic
>
> I'm not sure why you are seeing something different (are you using
> plain poky with no other layers?), but any fixes must first address
> the issues observed on the standard ptest build performed in yocto CI,
> which is the one above. Then we can get to the issue of missing
> header, if it's uncovered.
>
> Alex
> On Thu, 27 Mar 2025 at 11:51, Desai, Rajendra
> <rajendra.desai@emerson.com> wrote:
> > Ran the ptests (run-ptest) on the built qemux86-64 image
> > 5 of the mentioned tests failed with =E2=80=9CNo such file or directory=
=E2=80=9D error
> > (for which, I have explained the details in the patch)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213726): https://lists.openembedded.org/g/openembedde=
d-core/message/213726
> Mute This Topic: https://lists.openembedded.org/mt/111899754/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

