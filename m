Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF23C83F34
	for <webhook@archiver.kernel.org>; Sat, 19 Jul 2025 13:20:56 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.10785.1752931250607487643
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Jul 2025 06:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JrEAWYhy;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e8d96ff2dfaso117716276.2
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Jul 2025 06:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752931249; x=1753536049; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ru7uTbWHbpqBaNKlpgjMqjPC3o8lGozkxOkaGMx0LOE=;
        b=JrEAWYhyBclAtPCxp5Z/Efswva+/hvv9VOlTrt+GPDP+He/NgQjbUSNReD2Q7cfFJA
         kiy6ydhcnoW3wWl1ikuSVe+M/22zN2GJOq164g6E4Oame+JGoqJlojIBmX+aaPRx+kdv
         6b3vqIlEXfZ2bzqoyJ1qBXe0MeJ3CU99z7mMeYPk6nh09bGWi5CTBCIMi3KSsptALAwo
         7Z8EBLFc6hQFT8+kANnW/Pdl/8xJh1tOoLnnnYsHi78/PudaR0/hx5dykJ8TehzTZIPC
         aiCek+ZMeRYzTh3U2RCRF4v7ImQio/DWszxIklFgoqoMK107U0d37OOQfoOYpABs9mrh
         fqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752931249; x=1753536049;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ru7uTbWHbpqBaNKlpgjMqjPC3o8lGozkxOkaGMx0LOE=;
        b=XUu14CEpzsmpQiTs1qsDQWiwI1lgoXeAaUDwkKFeitgH2UX1THmZoSmI5DsrFe4CcD
         SU/ZDKhSKrFKTjZIWT5Ao/ivlkuPD4GLCBIINxrLeRefRjXultA7GvnOFzfCwqPEXqNC
         MDYomfUCbRxOaCZCVPC1OzyntVF18gz86tm0MKr7caCNH6F5JXU2cP6etC3ZJtweHJtx
         biBUZ28p/9B/OE+ByvlU1EnxL9BY747fwD+EboZpXplvCDDpeIXr1z7xbLnT7qHniJ87
         oAed5ozSoCQtwZsOyi15nzptuNQFbrgjzdTL1W/K8zf/Bhd9F8IZ+DHsfTltRrynrtRU
         x+jQ==
X-Gm-Message-State: AOJu0YzulZzmAONOmGTF7QXgK6eOrWOljidgCDYHHh6AoBn/h1UGwuEV
	Oeg3oUzh2iDN895361bEjQrWCoeDAmR7ezlf1/Z0Skq4lENiMkI9CVQ6C0cokoIRBlxbpTgTA0x
	XQUmr+wMV314c6nvu+RIVbZKkxAfm6W+32zcC
X-Gm-Gg: ASbGncsfiPWRVG9tnvyuGCDiHOzcC3ORI2Op8dsqSfApfXETDGwIVrN53AW9BOLm5V4
	YsYZuu5bjTDqa8+vTkA6/J0ks5UsqBeN2s7lQmqiAJ+UypoBhnxz0f6zs0ARZhhfhgPaTqc/gjJ
	cTXxsej6qsKQhmqeUQqUUBJgYA6tVSiHxRRyc9UlUaQTyz+3+Mc978eKOFa10fM+HCcQLfCTVh+
	0AfqEWVuNH22SuLjRHohsneskglJaQoDUABCMsM
X-Google-Smtp-Source: AGHT+IELs8OWcv/2uy7WYJeznFv+hIT7XkMOFCgIQW1EE8HINGTdbQfe8rjuoVER3FQdlio1nmUvMLKhwmkXI/zzPDs=
X-Received: by 2002:a05:690c:46ca:b0:70e:73ce:80de with SMTP id
 00721157ae682-71835185a29mr183267237b3.25.1752931249406; Sat, 19 Jul 2025
 06:20:49 -0700 (PDT)
MIME-Version: 1.0
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sat, 19 Jul 2025 15:20:38 +0200
X-Gm-Features: Ac12FXxNjFNDrenckDNI0eplW4Uyt5X0_U9Sqvh2k3xOqnuA9bXShZ9PJpJ1Pqk
Message-ID: <CABF_=ygRGfAPf5KdA_FrH7-Hr+wBh0KjpzH4CfPwG3PzJTJwiA@mail.gmail.com>
Subject: spirv-llvm-translator_20.1.4: do_unpack error
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Jul 2025 13:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220610

Is this a known issue at master?

ERROR: spirv-llvm-translator-native-20.1.4-r0 do_unpack: Bitbake
Fetcher Error: FetchError('Fetch command export PSEUDO_DISABLED=3D1;
export SSH_AUTH_SOCK=3D"/run/user/1000/keyring/ssh"; export
PATH=3D"/home/jan/projects/meta-ros/layers/openembedded-core/scripts/native=
-intercept:/home/jan/projects/meta-ros/build/tmp/work/x86_64-linux/spirv-ll=
vm-translator-native/20.1.4/recipe-sysroot-native/usr/bin/python3-native:/h=
ome/jan/projects/meta-ros/layers/openembedded-core/scripts:/home/jan/projec=
ts/meta-ros/build/tmp/work/x86_64-linux/spirv-llvm-translator-native/20.1.4=
/recipe-sysroot-native/usr/bin/x86_64-linux:/home/jan/projects/meta-ros/bui=
ld/tmp/work/x86_64-linux/spirv-llvm-translator-native/20.1.4/recipe-sysroot=
-native/usr/bin:/home/jan/projects/meta-ros/build/tmp/work/x86_64-linux/spi=
rv-llvm-translator-native/20.1.4/recipe-sysroot-native/usr/sbin:/home/jan/p=
rojects/meta-ros/build/tmp/work/x86_64-linux/spirv-llvm-translator-native/2=
0.1.4/recipe-sysroot-native/usr/bin:/home/jan/projects/meta-ros/build/tmp/w=
ork/x86_64-linux/spirv-llvm-translator-native/20.1.4/recipe-sysroot-native/=
sbin:/home/jan/projects/meta-ros/build/tmp/work/x86_64-linux/spirv-llvm-tra=
nslator-native/20.1.4/recipe-sysroot-native/bin:/home/jan/projects/meta-ros=
/layers/bitbake/bin:/home/jan/projects/meta-ros/build/tmp/hosttools";
export HOME=3D"/tmp/tmpqpar2wwv"; git -c gc.autoDetach=3Dfalse -c
core.pager=3Dcat -c safe.bareRepository=3Dall -c
clone.defaultRemoteName=3Dorigin rev-list -n 1 v20.1.4 failed with exit
code 128, output:\nfatal: ambiguous argument \'v20.1.4\': unknown
revision or path not in the working tree.\nUse \'--\' to separate
paths from revisions, like this:\n\'git <command> [<revision>...] --
[<file>...]\'\n', None)


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

