Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FD1C6FD18
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 18:14:40 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.3911.1680027270357699451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 11:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PwlGSKDs;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id y35so10999663ljq.4
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 11:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680027268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvsH0J1k/3XkIxEkTOoD1nVdKCWfIjMgPw/tPR+4zHo=;
        b=PwlGSKDsWbv/ilw4d5HIpeQTnVKaau2+xybid/kQ4t+wO5LzmGXDFZVG1gUjvGW7fR
         AtCJIZApjG/PYUvJoBEAXjLySeGFFO8WojwnqGhSeiUGZWPt6nor8QJCHEr8EQUPCsYg
         zrIZFOChwT+WT7UpMLhXzFTg+82nEs8uTkzf9LLWfDzWsglzsNsZPJ7FXwpAqC5JvZWH
         fHkt8b2gMsxrKWysGbOGr+RyvHfYw9mT5F6lK3ji2ftbgGtoiWudRtZvsb2QtAVyagzO
         MNIXRusyyX7DPZUzXPXEfnKh/RT/jEMb11irAKICmKeKEDlS1ZsGaQkfvbrPoWhVJXvY
         e48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680027268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvsH0J1k/3XkIxEkTOoD1nVdKCWfIjMgPw/tPR+4zHo=;
        b=WNS60hco+063EgINu9mIpkZ0g5NAwnVZpCweDa7zgsusG7wj/1Gb3Ksryy7Bxef5TK
         1C8JkZvsPHUggjUyTvd1pkTD5uw7TehPLtSQVxiHqPAJnBcry8tFp5Z/XUcVnYV3HYMK
         /Nguwo3DbVNCcISgjGDWR8LliRi7azvNWWEEurUaqL17NH35aehcBhkBIljyetmR5iPs
         aLn5yjCtY6xu2ij//vBzLq7bCauBEpissKEAwWFIBmvIfyOTevQDKcJJxebph4XKC7jW
         xX/simCPzIQoNU7lyzO3KivyktDT/sONtFRxZoEXfmoKqyy4JT4kwD5ia7VFGTtMpUxa
         ustQ==
X-Gm-Message-State: AAQBX9e8LfKNiiHg0Lp24yM7knqajYLy9OySXthjwYjLz3UkUSnjKn3W
	rkBZOdKN6aHEAHi4aYFsgFPHNlw3J9jE0p8qSn4=
X-Google-Smtp-Source: AKy350YgtXOjBQmM1azUpAcdb9yXX969W9PjjvR+Vhp4eDSoWhCALem+qRDK02hNl0qeerKgYYn/WcUcxem202CCkfg=
X-Received: by 2002:a2e:910d:0:b0:2a3:5c1c:ec20 with SMTP id
 m13-20020a2e910d000000b002a35c1cec20mr4822445ljg.7.1680027268420; Tue, 28 Mar
 2023 11:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqygZo7JXaaatanuNUaq2tpP7jfa8ZgFZ3pj7WgCuN_=w@mail.gmail.com>
 <CANNYZj_gMBkeMPO=zG+OFx84kJj=+DFqQUdULOQ_jR5wGApfjQ@mail.gmail.com>
 <53196741237572435b0a5965aa77a72b021d6fed.camel@linuxfoundation.org>
 <CA+cAkeo_CnnQDLrrmcDE1PP_65qoxkAXU20Ho8r_N-BwqqbObw@mail.gmail.com>
 <72921856ae24cb434edf3698ea51614d7a73a4fb.camel@linuxfoundation.org>
 <CA+cAkerVECW3BPi8nE4SspKVd1BV9ro0j5d3fHT86CAYGahUwQ@mail.gmail.com> <CA+cAkep8OAdKUg_nPrGbokXnbF_FshQXeCwGq2ZX-YTJ=wEU7g@mail.gmail.com>
In-Reply-To: <CA+cAkep8OAdKUg_nPrGbokXnbF_FshQXeCwGq2ZX-YTJ=wEU7g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Mar 2023 20:14:16 +0200
Message-ID: <CANNYZj9EFDucT7f0TQ72aF7xiGKNrhhoQU_Pn5AK_Rji=QcaYg@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest for devtool failed
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 18:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179243

Would you be able to read the failing test, and replicate the steps it
does by hand? If we can narrow down the precise point where it fails,
that would already help.

Alex

On Tue, 28 Mar 2023 at 20:01, Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> I rebuilt a poky master from scratch on another machine (Ubuntu 22.04 , 1=
6 Xeon, 124 Gb RAM), it took
>  2h30mn to finish (note that rust-llvm-native and llvm-native both took a=
round 1h each to be built).
>
> I have two questions for my curiosity:
>    - why rust things (cargo-native, librsvg)  are the last artifacts buil=
t on core-image-sato ? it seems strange at first look
> (but may be explained by packages embedded by this image, I didn't look o=
n what are the dependencies of this image)
>    - my pristine BDIR took around 90 GB , maybe the page https://docs.yoc=
toproject.org/dev/brief-yoctoprojectqs/index.html stating
> that we need 50 GB of free space needs to be reviewed (unless it was writ=
ten with another image than core-image-sato in mind) ?
>
> Apart from that,  I have the exact same error on test_devtool_modify_git =
that I had on the other machine under /var build dir:
>
> NOTE: Running setscene task 210 of 213 (virtual:native:/tmp/devtoolqacvbs=
fqx2/core-copy/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_popula=
te_sysroot_setscene)
> NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63acb96f92-r0: task do=
_populate_sysroot_setscene: Started
> NOTE: recipe gnu-config-native-20230216+gitAUTOINC+63acb96f92-r0: task do=
_populate_sysroot_setscene: Succeeded
> NOTE: Running task 896 of 918 (/tmp/devtoolqacvbsfqx2/core-copy/meta/reci=
pes-core/psplash/psplash_git.bb:do_prepare_recipe_sysroot)
> NOTE: recipe psplash-0.1+git999-r0: task do_prepare_recipe_sysroot: Start=
ed
> NOTE: recipe psplash-0.1+git999-r0: task do_prepare_recipe_sysroot: Succe=
eded
> NOTE: Running task 910 of 918 (/tmp/devtoolqacvbsfqx2/core-copy/meta/reci=
pes-core/psplash/psplash_git.bb:do_configure)
> NOTE: recipe psplash-0.1+git999-r0: task do_configure: Started
> ERROR: psplash-0.1+git999-r0 do_configure: no configure script found at .=
./../../../../../../../../../../tmp/devtoolqamf2smwsy/configure
> ERROR: psplash-0.1+git999-r0 do_configure: ExecutionError('/home/jenkins/=
yocto-poky-master/poky/build-st/tmp/work/core2-64-poky-linux/psplash/0.1+gi=
t999-r0/temp/run.do_configure.1967375', 1, None, None)
> ERROR: Logfile of failure stored in: /home/jenkins/yocto-poky-master/poky=
/build-st/tmp/work/core2-64-poky-linux/psplash/0.1+git999-r0/temp/log.do_co=
nfigure.1967375
> NOTE: recipe psplash-0.1+git999-r0: task do_configure: Failed
> ERROR: Task (/tmp/devtoolqacvbsfqx2/core-copy/meta/recipes-core/psplash/p=
splash_git.bb:do_configure) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 910 tasks of which 904 didn't need to be r=
erun and 1 failed.
>
> Full test log joined (I would like to join also the log of do_configure s=
tep but it seems that the test do a cleanall of the recipe during its tear =
down method)
>
> I'm kind of stuck here since I cannot develop more oe-selftest tests if I=
 didn't even manage to make the existing ones succeed.
> Can someone give me the setup of this autobuilder where Alexander talked =
about ?
>
> I could try to get as close as possible to the autobuilder setup if the o=
e-selftest is ok there.
>
> On Tue, 28 Mar 2023 at 17:36, Fr=C3=A9d=C3=A9ric Martinsons <frederic.mar=
tinsons@gmail.com> wrote:
>>
>> Note that I managed to build libtirpc-native and shadow-native with bitb=
ake (and the same setup).
>>
>> I currently try the build on another machine and under /home.
>>
>> I'll tell you the results soon
>>
>> Le mar. 28 mars 2023, 15:13, Richard Purdie <richard.purdie@linuxfoundat=
ion.org> a =C3=A9crit :
>>>
>>> On Tue, 2023-03-28 at 14:40 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
>>> > I just finished a pristine build of core-image-sato on poky master,
>>> > and set up SSTATE_DIR in my local.conf.
>>> > Tests are now ok, I can start to write some now.
>>> >
>>> > If anyone is interested , please find attached the full log of the
>>> > two first failures.
>>>
>>> Having the errors helps, thanks.
>>>
>>> The short summary is these two lines:
>>>
>>> libtirpc-native
>>> | chown: changing ownership of '/var/lib/jenkins/YOCTO_POKY_MASTER_TEST=
/poky/build-st/tmp/work/x86_64-linux/libtirpc-native/1.3.3-r0/image/var/lib=
/jenkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-linux/libtirp=
c-native/1.3.3-r0/recipe-sysroot-native/etc/netconfig': Invalid argument
>>>
>>> shadow-native
>>> | chown: changing ownership of '/var/lib/jenkins/YOCTO_POKY_MASTER_TEST=
/poky/build-st/tmp/work/x86_64-linux/shadow-native/4.13-r0/image/var/lib/je=
nkins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-linux/shadow-nat=
ive/4.13-r0/recipe-sysroot-native/var/spool/mail': Invalid argument
>>>
>>>
>>> I'm wondering if the fact the build is under /var might be triggering
>>> something somehow...
>>>
>>> Cheers,
>>>
>>> Richard

