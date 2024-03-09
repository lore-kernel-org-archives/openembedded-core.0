Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84398C54798
	for <webhook@archiver.kernel.org>; Sat,  9 Mar 2024 17:58:47 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.17640.1710007126154453766
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Mar 2024 09:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GUfbTWch;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a4429c556efso226750866b.0
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Mar 2024 09:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710007124; x=1710611924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b7E6CbyxUVhh+wIIiKc9//gldKOD9IRD3p+cuJxpw2Q=;
        b=GUfbTWchKzHbU2gXJgZBNhG2GfQQElh9Ou62o7BlBjk77FQpDpQy0arSI9rcdKoDvS
         2eLCJIjoyoRvW3IzY3Pfkb+l5ehUUFZGW8ZJoonR2Xz98UqWazSx+THYXxTKODApr79H
         XZ+keSeSqtP2k63oq19DQ5QUxR/Ug64adOa0vSGBHu59g84zp5GqM3NevqreYlJaPLPO
         Ht7MF+tHadfR6cehnIStwI1rQRkQ2WPpvITnNzlNsxHg+Vdvtq+pDmf6d/ykS8e31Bbi
         kwZwBV2yZv+a2gcAK6uwBhQpoYijopUR1oaZcbb/NTPfD7ruPqbAdwGe5hxEC9auqw5Z
         QeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710007124; x=1710611924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7E6CbyxUVhh+wIIiKc9//gldKOD9IRD3p+cuJxpw2Q=;
        b=UlU0A10lvHH7H5FPzPu6n1+HW9BaAM13wJe7k5/nJKxqHle58rtYd2O70j5uAol3z0
         CkzwEMXOmPcQyJBi1GDboWZl6Pq/pn8sMebJquq8xU0x64+vUpq5Zh/Rdjeyi4TX1mK8
         2G8HxuPanEy8JMyO1hpdvDXWAN+nKtCfO4JiV6xSNqUR+K8099fgV+pd5Vl85ChZRgRC
         s4siHMF57BCLvBiJdckIqBdbRwLcbdC5uxMkSXfxmrxIhuzzQesZwYZgFvbpEiBh1uji
         7TkM0Nt0c7zNeU9oUy1B6On1BIOfAD7p4fE4RrVXPwry+2B3lropu/gqYJ09MdKSXcD6
         4N1Q==
X-Gm-Message-State: AOJu0YzRcXJZxEGHoU3o3rqftQWaDjC0eRB+8yiYIvSd1V7U2Px3Fxe/
	NeLdf5EqIPWc9R4tVklC9IPZbSpe0rVX9i8yI4FVD+aaZqweGBpSSoxnSxeq
X-Google-Smtp-Source: AGHT+IEggrTiFBQ+KqV0UBizk1/K8kvHSCiIVXMTQ5rf+EoVwu4PQv0YYD+ZtoKRvAlYgVeDfMaQEQ==
X-Received: by 2002:a17:907:d50a:b0:a3e:39f7:52b4 with SMTP id wb10-20020a170907d50a00b00a3e39f752b4mr1499406ejc.49.1710007123719;
        Sat, 09 Mar 2024 09:58:43 -0800 (PST)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id qa20-20020a170907869400b00a45f2fcfa63sm1117550ejc.26.2024.03.09.09.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 09:58:43 -0800 (PST)
From: max.oss.09@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [REGRESSION] linux (git/curl-native) and autorev
Date: Sat,  9 Mar 2024 18:57:50 +0100
Message-ID: <20240309175750.2621579-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Mar 2024 17:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196870

From: Max Krummenacher <max.krummenacher@toradex.com>

Hello

If one builds a kernel using AUTOREV invoking bitbake only works once.
Any subsequent bitbake invocation fails parsing the meta data.

Reproducable with:
- latest poky, b5624ee564
- Kernel with SRCREV =3D "AUTOREV", e.g. in local.conf
  `SRCREV_machine:pn-linux-yocto:forcevariable =3D "${AUTOREV}"`
- bitbake virtual/kernel; bitbake virtual/kernel

On the second invocation parsing fails when the fetcher tries to
evaluate the latest SRCREV:

| ERROR: ExpansionError during parsing meta/recipes-kernel/linux/linux-yoct=
o_6.6.bb
| Traceback (most recent call last):
|   File "bitbake/lib/bb/fetch2/__init__.py", line 1245, in srcrev_internal=
_helper(ud=3D<bb.fetch2.FetchData object at 0x7f8e26f5f290>, d=3D<bb.data_s=
mart.DataSmart object at 0x7f8e26195890>, name=3D'machine'):
|              d.setVar("__BBAUTOREV_ACTED_UPON", True)
|     >        srcrev =3D ud.method.latest_revision(ud, d, name)
|=20=20=20=20=20=20
|   File "bitbake/lib/bb/fetch2/__init__.py", line 1667, in Git.latest_revi=
sion(ud=3D<bb.fetch2.FetchData object at 0x7f8e26f5f290>, d=3D<bb.data_smar=
t.DataSmart object at 0x7f8e26195890>, name=3D'machine'):
|              except KeyError:
|     >            revs[key] =3D rev =3D self._latest_revision(ud, d, name)
|                  return rev
|   File "bitbake/lib/bb/fetch2/git.py", line 850, in Git._latest_revision(=
ud=3D<bb.fetch2.FetchData object at 0x7f8e26f5f290>, d=3D<bb.data_smart.Dat=
aSmart object at 0x7f8e26195890>, name=3D'machine'):
|=20=20=20=20=20=20
|     >        output =3D self._lsremote(ud, d, "")
|              # Tags of the form ^{} may not work, need to fallback to oth=
er form
|   File "bitbake/lib/bb/fetch2/git.py", line 833, in Git._lsremote(ud=3D<b=
b.fetch2.FetchData object at 0x7f8e26f5f290>, d=3D<bb.data_smart.DataSmart =
object at 0x7f8e26195890>, search=3D''):
|                      bb.fetch2.check_network_access(d, cmd, repourl)
|     >            output =3D runfetchcmd(cmd, d, True)
|                  if not output:
|   File "bitbake/lib/bb/fetch2/__init__.py", line 957, in runfetchcmd(cmd=
=3D'export PSEUDO_DISABLED=3D1; export DBUS_SESSION_BUS_ADDRESS=3D"unix:pat=
h=3D/run/user/1003/bus"; export PATH=3D"build/tmp/sysroots-uninative/x86_64=
-linux/usr/bin:scripts:build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.6=
.20+git/recipe-sysroot-native/usr/bin/x86_64-poky-linux:build/tmp/work/qemu=
x86_64-poky-linux/linux-yocto/6.6.20+git/recipe-sysroot/usr/bin/crossscript=
s:build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-sysroo=
t-native/usr/sbin:build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.6.20+g=
it/recipe-sysroot-native/usr/bin:build/tmp/work/qemux86_64-poky-linux/linux=
-yocto/6.6.20+git/recipe-sysroot-native/sbin:build/tmp/work/qemux86_64-poky=
-linux/linux-yocto/6.6.20+git/recipe-sysroot-native/bin:bitbake/bin:build/t=
mp/hosttools"; export HOME=3D"/home/krm"; git -c gc.autoDetach=3Dfalse -c c=
ore.pager=3Dcat -c safe.bareRepository=3Dall ls-remote https://git.yoctopro=
ject.org/linux-yocto.git ', d=3D<bb.data_smart.DataSmart object at 0x7f8e26=
195890>, quiet=3DTrue, cleanup=3D[], log=3DNone, workdir=3DNone):
|=20=20=20=20=20=20
|     >        raise FetchError(error_message)
|=20=20=20=20=20=20
| bb.data_smart.ExpansionError: Failure expanding variable fetcher_hashes_d=
ummyfunc[vardepvalue], expression was ${@bb.fetch.get_hashvalue(d)} which t=
riggered exception FetchError: Fetcher failure: Fetch command export PSEUDO=
_DISABLED=3D1; export DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/100=
3/bus"; export PATH=3D"build/tmp/sysroots-uninative/x86_64-linux/usr/bin:sc=
ripts:/var/home/krm/build/poky/build/tmp/work/qemux86_64-poky-linux/linux-y=
octo/6.6.20+git/recipe-sysroot-native/usr/bin/x86_64-poky-linux:build/tmp/w=
ork/qemux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-sysroot/usr/bin/cro=
ssscripts:build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.6.20+git/recip=
e-sysroot-native/usr/sbin:build/tmp/work/qemux86_64-poky-linux/linux-yocto/=
6.6.20+git/recipe-sysroot-native/usr/bin:build/tmp/work/qemux86_64-poky-lin=
ux/linux-yocto/6.6.20+git/recipe-sysroot-native/sbin:build/tmp/work/qemux86=
_64-poky-linux/linux-yocto/6.6.20+git/recipe-sysroot-native/bin:bitbake/bin=
:build/tmp/hosttools"; export HOME=3D"/home/krm"; git -c gc.autoDetach=3Dfa=
lse -c core.pager=3Dcat -c safe.bareRepository=3Dall ls-remote https://git.=
yoctoproject.org/linux-yocto.git  failed with exit code 128, output:
| fatal: unable to access 'https://git.yoctoproject.org/linux-yocto.git/': =
error setting certificate file: build/tmp/work/x86_64-linux/curl-native/8.6=
.0/recipe-sysroot-native/etc/ssl/certs/ca-certificates.crt
|=20
| The variable dependency chain for the failure is: fetcher_hashes_dummyfun=
c[vardepvalue]

Note:
One gets out of that parser error by deleting the git binary in the
kernel's work recipe-sysroot-native
`rm tmp/work/qemux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-sysroot-na=
tive/usr/bin/git`

Bisecting poky leads to commit
f7fa98cca8 ("kern-tools: depend on git-replacement-native")
Reverting it on top of b5624ee564 makes the parsing pass.

I assume that `git-replacement-native` does not work with https, the
fetch error also goes away if changing in SRC_URI from https to git.

Any comments?

Cheers
Max

