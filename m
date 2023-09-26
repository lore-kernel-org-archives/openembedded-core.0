Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CC0EE020C
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 06:09:59 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.12740.1695708595447163139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 23:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a3pVrwnl;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2bfed7c4e6dso134372121fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 23:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695708593; x=1696313393; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMPc+gpKaOD/hlRTXNFbUbrnpgilIy5dsLZX2xF04VQ=;
        b=a3pVrwnl0aPEByIQpvAFiqseduue30bk3HYm/EWp+qGD5E6OFZKqTFj3yoScJWK+fk
         zV54NgMM9AYnxkIaEgcnq4xUDHHj6ZCNvVe/0Vls7Gv5apyJdxAI7PF92dtK8t5ZrfkL
         VfuoYTx7w8mDVrTWwRG9kzSoNPoe4+2ggsFRWXhZO6soLZl2eYMR9yD4Z9NcslkjMBei
         qd7r1rP7WxHe7lMsnxJhUTJtviNeV4MHPbmnQwyQ2GZP20tj+YCpj9fggS0OjXEOMX97
         Ybhb6ejo4DwRKxwhO5cH5crfbEr0HUZNwd+MV11Xq/4Ar/HuwkrJMZJAzKLWdjMzwsPD
         Hupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695708593; x=1696313393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMPc+gpKaOD/hlRTXNFbUbrnpgilIy5dsLZX2xF04VQ=;
        b=FN7EX82nwLjd9hqPbgQQfERhIVqcmG/vA4OqeHp2lTq7MO5OEwmbxeOER7l0BzWmGA
         vBfKQzPd5O0xUsL3IRHnBCeErM9qO4uyQ/bVVN28VohMGHPHq3wuFsKYfUVYCN68xDZN
         7r/UK9z1Ip+1dOqcDVrzgIi4NHrbkxZOK9Syeveav9+azKDqrNK9IHBhMVzbTSvQuEOE
         8YULnqXa9Tuvepl+7X1Lcr8KuRV5f2s8KPuooFRpAKtZODC2P8nwisRMtEIT0imv8Jai
         dZxuhw8LvuB7BzVv0OOj9IaHxq/PjzhVR6OWa462YOVuh6w6qYjQqPEK+Et8CymFWGRr
         q7jw==
X-Gm-Message-State: AOJu0YzePq0t5ILQ3zgPSdt8OdHGGjyUayhpSAE/JwrSXuUUCK21zk94
	cz4NNHrpqqk4j8sXQAsB+0Spt/WaPFnOsZzlHdM=
X-Google-Smtp-Source: AGHT+IHeZW92Th4jdvQBYI6kaRbEY1zOGR9/h8AGm3pnbAnNj3pRNzuxMOIHg39Ci2arnMhIm8ppf33PffXHlU4xTT0=
X-Received: by 2002:a05:6512:10d6:b0:500:b5db:990c with SMTP id
 k22-20020a05651210d600b00500b5db990cmr8042384lfg.57.1695708593250; Mon, 25
 Sep 2023 23:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-DUDDx6e5F6XGQeqG1XDNN2w+oQWck03pDWV_aWOr0=g@mail.gmail.com>
 <31830.1695691117951827778@lists.openembedded.org>
In-Reply-To: <31830.1695691117951827778@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Sep 2023 08:09:41 +0200
Message-ID: <CANNYZj8M1SioVh=2ry9F1XR7rMNP3Svu8wjaDpsgWFVsjcX++Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5] tar: add ptest support
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 06:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188217

Hello,

contents of tarball at *1 is determined by EXTRA_DIST setting in
https://git.savannah.gnu.org/cgit/tar.git/tree/tests/Makefile.am?id=3D39849=
e9d91f477d3fb839f93cd0815d0cb3273e9#n20
which in turn refers to TESTSUITE_AT.

As of 1.35 release, TESTSUITE_AT was missing exclude17/18.at and the
following later commit adds them, fixing the issue of missing files:
https://git.savannah.gnu.org/cgit/tar.git/commit/?id=3D39849e9d91f477d3fb83=
9f93cd0815d0cb3273e9
Note that the link in the commit message refers specifically to that:
https://lists.gnu.org/r/bug-tar/2023-07/msg00002.html

Commits in *3 and *4 added the files, but forgot to update TESTSUITE_AT.

Tarball in *2 has those files, because it is not actually a release
tarball, it is an archive that git automatically generates from the
git source tree when a new tag is added. That tarball should not be
used.

Rather than modify testsuite.at to exclude the two missing files,
maybe it's better to add the two missing files to the source tree in
that same patch instead? And please do refer to the commit that will
fix the issue upstream when they issue a new tarball release.

Alex


On Tue, 26 Sept 2023 at 03:18, qiutt@fujitsu.com <qiutt@fujitsu.com> wrote:
>
> Hi=EF=BC=8CAlex
>
> In this case, there's a fix, so please add the link to this patch:
> https://git.savannah.gnu.org/cgit/tar.git/commit/?id=3D39849e9d91f477d3fb=
839f93cd0815d0cb3273e9
>
> The bug: There is no exclude17.at or exclude18.at file in src dir, so tes=
tsuite can not be compiled.
>
> | /bin/bash '/Yocto/oe-core-test/build/tmp-glibc/work/core2-64-oe-linux/t=
ar/1.35/tar-1.35/build-aux/missing' autom4te --language=3Dautotest -I ../..=
/tar-1.35/tests testsuite.at -o ../../tar-1.35/tests/testsuite.tmp | m4:../=
../tar-1.35/tests/testsuite.at:315: cannot open `exclude17.at': No such fil=
e or directory | m4:../../tar-1.35/tests/testsuite.at:316: cannot open `exc=
lude18.at': No such file or directory | autom4te: error: m4 failed with exi=
t status: 1
> Up patch only added exclude17.at and exclude18.at into Makefile, but coul=
d not fix none file problem.
> So, I think it is not the fix patch.
>
> The key is that used tarball(*1) does not contain exclude17.at(*3) and ex=
clude18.at(*4).
> But another tarball(*2) contains the two files.
> I am not sure why the same version has diffrenent tarballs.
> For *1, testsuite is exist in src without compiling, so there is no probl=
em. Of course there is not any ticket or fix patch.
> In oe ptest, for adding --am-fmt, recompiling testsuite is neccessary, so=
 the problem appeared.
>
> *1: https://ftp.gnu.org/gnu/tar/tar-1.35.tar.bz2
> *2: https://git.savannah.gnu.org/cgit/tar.git/snapshot/tar-1.35.tar.gz
> *3: The following patch add exclude17.at.
> https://git.savannah.gnu.org/cgit/tar.git/commit/?id=3D0f0722df45ec520d0d=
ac7c9ad7e69165e9140931
> *4: The following patch add exclude18.at. (src/names.c is changed)
> https://git.savannah.gnu.org/cgit/tar.git/commit/?id=3D4f814e0e4c673f86dc=
65a557f7e55f6b5efd1529
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188213): https://lists.openembedded.org/g/openembedde=
d-core/message/188213
> Mute This Topic: https://lists.openembedded.org/mt/101569333/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

