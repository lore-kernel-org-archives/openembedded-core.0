Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03AB10F92F2
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 19:35:21 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2373.1774985712902173464
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 12:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=n4x8aV+u;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-67f921159c0so217384eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 12:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774985712; cv=none;
        d=google.com; s=arc-20240605;
        b=XmKIIJGP2r4Y845PfipbLaI9cKa7TDiJpds7rRzrclH5x2Jy00FjPEHKYioIe9UQ1k
         4ShuoST15yjO25I3NeZsW94QcwI2vEa1/IcQP5jNbR2yo9wmaQquztAQpYXj3yTm+6mQ
         PDPYzHCBSw61RqkEObPykYFf52k6CfZeBNXI+gx6qfEhdZ4ZeGIMGj74K2nAGntKsJy2
         NPmeHUkHD+N/vOkAB47nL7CDBrfoJv5hoN5cNgMWujHfqNVLAsW56f/yc5nNp7UOcy07
         9UZ4Cw5ill6KrDbPGjvZHpa0kYHgQJqhGfdx4gju3d3UZVNgKzrAQpDiDNdsdqys7sFr
         YPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gqDU686MG0xfiVHVVUeFjimLxIW8MV0ZIfciswGsyVY=;
        fh=PaMvUCPcy4ANzS+qPkaiLf6E9s11gkAeh6A8J5hl1x4=;
        b=Twc1x8BjQagmgT5c81exFqlRAVLw0U44j9F7k/m4GkWotk534xwD3BfFAvW+qDpnu7
         KyB3uHYlcq5Q9bkljiIwbEhOQRC/e7GMTXylE11Pjeo/ez6u1ML03Hwgkh3+76LmzuLW
         qAyegsud07yz2cwZmxS51PH7CjE2+Vt/d26INaZaG75GSBUn86rr8ewtn8u7xMNXINCS
         HQXhbZO63NEC3KmeBveU7IXc0Xv9g1NKjvOJV5T/ovRYlSmzg5Qrew8pUwUDXXq8YOcI
         h1+M/jQiBBpLGN5ttgWIcg/tl1700OmXmuAsswljtggnAkVoVvEWmHG9wJLtycQt+GrY
         SGsA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985712; x=1775590512; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqDU686MG0xfiVHVVUeFjimLxIW8MV0ZIfciswGsyVY=;
        b=n4x8aV+uJrrz7sZ9RsSV6SzqNZpHXS67nVvPfUY+lqKYyXGsYsDo1183RVmjIEYTf6
         Gosb2qracuuKXXlwDwaIXy4mkPXPFbTbTnlqeVaxJh17CecdEq0iSgdpGP83Gfjf+/8B
         vFHC1jh/vhCT3dII61gjGBUznPZLQFcuB2dJTbb/okhpZOUh3WLrqR0LKETo3KAiz8Qy
         PFprbymoyPFf5TnMadXpGnItYfUgzgXlTF9X7BKZaHWhE/odgRAmMDQU8AI8P9rEXkTy
         cGuEiODgLiBCRxbPOChuxiBTKlcg51iwU7JieRJ9dIO8+li/p7I6F2tty88a2mXMwK1o
         dM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985712; x=1775590512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gqDU686MG0xfiVHVVUeFjimLxIW8MV0ZIfciswGsyVY=;
        b=rcnuznTF5e9cSP4uZiRK87V7Lb23Hyds1o1MWyQWRc0518kZpy5fh+dLks9zuXgl/e
         DAno+DYn+Yq5H2B0g3KyIGZ8mj+GZAcZkUc+xxD0uDPFYYs34v+a1PQAdqoqOXihoCoo
         pa/JK7eow/WALAxnk9l6EZF6cWikd/8YYxI/iY8XtUOdS0vS6w7hyNOvL3EKLoaU9pHe
         4+PWa/1V4qJxXOHHgF9OMCLC+ay7XixliGwz61Ij8EfvlfCDh00ChAPo+7jap3P7YsKr
         Z2S7YPohRT3fo/36p1/sm+n5jyCLSi3vKN5LOsNrYWJuo6yIaTjweLjV7uvvhSJIka5Q
         2srg==
X-Gm-Message-State: AOJu0Ywhs1RFuYtatQNWjTx3nsXPN2EIWMwgqSU/e8kR0w/AJSioiKLm
	CjV8BNOV4jnOJyQQxgvG66rs6FI0OWE5Sm1w3A4+35GxK7KqmfN1pIYyjEcKhja/ft5q8I+OMUw
	E52SqYkkOSRK+/pCFMOId1DZzT0XBXac=
X-Gm-Gg: ATEYQzw7vK8OGuMDQJNFVkwp549mQvmzo0BZyFwNC2sSGogNLIcghA20NIWuXquaYIn
	PojSWDXxbXzHvVJi9akPCWdDoBGcyjQZWMP6E2YWKZuhBEA0KecdSP0HJAWZwa88MRIMXlPgUIk
	MvPUFE1USwZjqwjtrrDX0zaRI+PtoT7MkZjMMBYbGk5T07WZhO3pJIN0y9beOY/dRC6q+wjoPxM
	ovraica6WsaPw8SaglPmuQAwmiZ7iwKATAgjYhvkYUI+zo/voyIzencTXhescW7dHEL8EkqSZuu
	L9jjE+wv
X-Received: by 2002:a05:6820:1744:b0:67c:2fe3:7edf with SMTP id
 006d021491bc7-67fabcf888cmr287828eaf.52.1774985712034; Tue, 31 Mar 2026
 12:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=RgxG+NY7sLTBMNEhPmX-O5dNC+AHmSSUQCDREgV6VToQ@mail.gmail.com>
In-Reply-To: <CAApg2=RgxG+NY7sLTBMNEhPmX-O5dNC+AHmSSUQCDREgV6VToQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 1 Apr 2026 08:34:59 +1300
X-Gm-Features: AQROBzA2UWqBDViHoa5eyOwFD9MzRxTpecF1gtH2KkmLuxC9cWSm_5DfSLZQBnE
Message-ID: <CADySD0HH=KMgU7kXKXeNEOG38ZtVZjjb3mZ5dLpQw9XewfuV+w@mail.gmail.com>
Subject: Re: [OE-core] Runqemu error on core-image-minimal
To: rybczynska@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 19:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234312

On Wed, Apr 1, 2026 at 4:30=E2=80=AFAM Marta Rybczynska via
lists.openembedded.org <rybczynska=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hello all,
> As mentioned on the call today, I have an issue in a configuration with b=
itbake-setup, oe-core-master fragments and runqemu:
>
> $ runqemu qemux86-64
> runqemu - INFO - Running MACHINE=3Dqemux86-64 bitbake -e  ...
> runqemu - WARNING - Couldn't run 'MACHINE=3Dqemux86-64 bitbake -e  ' to g=
ather environment information, maybe the target wasn't an image name, will =
retry with virtual/kernel as a target:
> ERROR: A builtin fragment 'machine/qemux86-64' is used while MACHINE has =
already got an assignment.
> Please either disable the fragment or remove the value assignment.

drop "qemux86-64" argument, it is not needed since the machine config
fragment is set.
"runqemu core-image-minimal" should succeed.

cheers
Ankur

> To disable the fragment, use 'bitbake-config-build disable-fragment machi=
ne/qemux86-64'.
> ERROR: Unable to parse /home/ubuntu/my-first-bitbake-setup-project/bitbak=
e-builds/oe-nodistro-master/layers/bitbake/lib/bb/__init__.py
> Traceback (most recent call last):
>  File "/home/ubuntu/my-first-bitbake-setup-project/bitbake-builds/oe-nodi=
stro-master/layers/bitbake/lib/bb/__init__.py", line 262, in fatal
>    raise BBHandledException()
> bb.BBHandledException
>
>
> Traceback (most recent call last):
>  File "/home/ubuntu/my-first-bitbake-setup-project/bitbake-builds/oe-nodi=
stro-master/layers/openembedded-core/scripts/runqemu", line 1726, in run_bi=
tbake_env
>    return subprocess.check_output(cmd, shell=3DTrue).decode('utf-8')
>           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  File "/usr/lib/python3.12/subprocess.py", line 466, in check_output
>    return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTrue,
>           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  File "/usr/lib/python3.12/subprocess.py", line 571, in run
>    raise CalledProcessError(retcode, process.args,
> subprocess.CalledProcessError: Command 'MACHINE=3Dqemux86-64 bitbake -e  =
' returned non-zero exit status 1.
>
> During handling of the above exception, another exception occurred:
>
> Traceback (most recent call last):
>  File "/home/ubuntu/my-first-bitbake-setup-project/bitbake-builds/oe-nodi=
stro-master/layers/openembedded-core/scripts/runqemu", line 1792, in main
>    config.check_args()
>  File "/home/ubuntu/my-first-bitbake-setup-project/bitbake-builds/oe-nodi=
stro-master/layers/openembedded-core/scripts/runqemu", line 620, in check_a=
rgs
>    self.check_arg_machine(unknown_arg)
>  File "/home/ubuntu/my-first-bitbake-setup-project/bitbake-builds/oe-nodi=
stro-master/layers/openembedded-core/scripts/runqemu", line 493, in check_a=
rg_machine
>    self.bitbake_e =3D self.run_bitbake_env(arg)
>                     ^^^^^^^^^^^^^^^^^^^^^^^^^
>  File "/home/ubuntu/my-first-bitbake-setup-project/bitbake-builds/oe-nodi=
stro-master/layers/openembedded-core/scripts/runqemu", line 1735, in run_bi=
tbake_env
>    return subprocess.check_output(cmd, shell=3DTrue).decode('utf-8')
>           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  File "/usr/lib/python3.12/subprocess.py", line 466, in check_output
>    return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTrue,
>           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  File "/usr/lib/python3.12/subprocess.py", line 571, in run
>    raise CalledProcessError(retcode, process.args,
> subprocess.CalledProcessError: Command 'MACHINE=3Dqemux86-64 bitbake -e  =
virtual/kernel' returned non-zero exit status 1.
> runqemu - INFO - Cleaning up
> runqemu - INFO - Host uptime: 17047514.08
>
> Anyone has seen something like that?
>
> Build commands (bitbake hash  7cf11787ee7942a00ba7e8fa2c590a2563070c38)
> mkdir my-first-bitbake-setup-project
> cd my-first-bitbake-setup-project/
> git clone https://git.openembedded.org/bitbake
> ./bitbake/bin/bitbake-setup init
> . /home/ubuntu/my-first-bitbake-setup-project/bitbake-builds/oe-nodistro-=
master/build/init-build-env
> bitbake-config-build list-fragments
> bitbake-config-build enable-fragment core/yocto/sstate-mirror-cdn
> bitbake-config-build enable-fragment core/yocto/root-login-with-empty-pas=
sword
> bitbake core-image-minimal
>
> Kind regards,
> Marta
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234302): https://lists.openembedded.org/g/openembedde=
d-core/message/234302
> Mute This Topic: https://lists.openembedded.org/mt/118598283/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

