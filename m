Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97758F8E4AD
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 06:16:53 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36578.1776406608285714010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 23:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q6ePiHu0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so1611265e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 23:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776406606; x=1777011406; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2H7CBErde+0yvMqAzqxP7Yx385KxQCi14fJP0CB2pq0=;
        b=Q6ePiHu0PL6atHiNduyX1om1GafiQnzeemc5UgMioXs2ra7s4z9ZtqEOn0uOZZktx9
         WotyrbIOLEf61yrpLOVsL89cAQkHyE7BAWiq5IfiJHDlHlCt6L5EK3vAQwy3jYmQrN3q
         db4hN7+zVc88ld9ch9PNdgfYFsIIisxWRRO70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776406606; x=1777011406;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2H7CBErde+0yvMqAzqxP7Yx385KxQCi14fJP0CB2pq0=;
        b=BEb7y3bVRPLzFEUT0rgQopqMnM2sYBXdR56ONcHnX0r4y0/LlD9fEHS+1W0hU0ppJX
         Z8qD5c4oYftJzaotR0aVopHzjpY9QFeZ5sQEEOaFoHZkY3T3f1QuOzTefg6vIsaxcnW+
         s6Q7XfEiHfKZGz4jlDU2uH0ZDMrbCM4S5aG7ptCMrKGDpdZ9FAOpxWqLK9vtGUZcIBCr
         zmge9+2QPCfZp9TRFmH728WGxbrB1viiUHplCQYzieKMvRK7+lTKcJvw2kjwNEIJr1G/
         e8YamJLrtjnRPIXz6EOHxiY50msmJeys8xJbGg1vCD7tSmLRJwcJ/Qte634+ffkoewNs
         VNtw==
X-Gm-Message-State: AOJu0YzY7vCM6reIK2DvI5OTAI+gdZNDgOlDptRdqdvJZBpNLKoBQ0oM
	sC9ZCcjsH2/T7V88nzseTNwlfhGFXFF4EKRMbQRkzwSn5835hXlB/ICCwnwZwv5MRswwBgugOFW
	6I+sTsqA=
X-Gm-Gg: AeBDietuvjOMQiJd30bD6PXtmRdgA/gHYWIvoNxWJVCNLpEB9yTYKMmjt0DAmcZSlhF
	hVVOBBqJ8eWWBiULP79tehGvwjntMnnjNkvYsZkBjU6o1DSuTfvMyLEtIE182td9Mfk5Ai4FA2+
	R1+P7/k2h8+Hhf9RBYiZ4axVSE7ZiQWGfbpUa/vS7tAEEHZJImQrffsPervur+CSYNB5Rb06I4N
	RV12RSgEl2YnYZjabsW87S4DFHS0y92Mz0o6nos3QrszqfVw7nAUDEKOSR9lgJM3ZQmzUIzspAf
	unJN8ans4exi/7ypUMFd1a4sja0flpJDlrrf8oilgdgG61sEWO2xA6MNYwDA2IpnhHixgCUqdvr
	jUBdTC2GCJ1t2kwgGun9aa9isY2ZMyZda/kfvyoTkSqF4dcphZj0Y1OTbH2J9Rz9IEpoFAPPfXd
	PgiLXFOXB/ePH1+btMPCHnoYVChEEeF7LjePynHHsY90BBMAZtptS2skdzcmpxbcMHa9JRldMYg
	kfcIf3l2PlPCvIWFOvXspe2NS0=
X-Received: by 2002:a05:600c:8115:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-488fb77e27cmr17407055e9.22.1776406605913;
        Thu, 16 Apr 2026 23:16:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d1f3:409a:3cf5:1213? ([2001:8b0:aba:5f3c:d1f3:409a:3cf5:1213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1001bdsm32267145e9.6.2026.04.16.23.16.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:16:45 -0700 (PDT)
Message-ID: <a22f7cad3e614532f051d01001cbd2f76e684a84.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] useradd: Switch from --root to --prefix option
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Apr 2026 07:16:44 +0100
In-Reply-To: <18A6D73A494B779A.1570320@lists.openembedded.org>
References: <18A6D73A494B779A.1570320@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 06:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235483

On Thu, 2026-04-16 at 13:49 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> Whilst assessing where we use chroot (which requires superuser privileges=
),
> I realised that shadow's utilities we use have the option of specifing
> a prefix for files. This provides the same outcome but avoids the chroot
> call. Whist we can emulate that under pseudo, it is probably nicer to avo=
id
> doing that and use the prefix option instead.
>=20
> Therefore switch --root -> --prefix
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> =C2=A0meta/classes/useradd.bbclass | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index 9d857a4555d..d7ed6cb9315 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -26,7 +26,7 @@ SYSROOT=3D""
> =C2=A0if test "x$D" !=3D "x"; then
> =C2=A0	# Installing into a sysroot
> =C2=A0	SYSROOT=3D"$D"
> -	OPT=3D"--root $D"
> +	OPT=3D"--prefix $D"
> =C2=A0
> =C2=A0	# Make sure login.defs is there, this is to make debian package ba=
ckend work
> =C2=A0	# correctly while doing rootfs.
> @@ -37,7 +37,7 @@ if test "x$D" !=3D "x"; then
> =C2=A0	=C2=A0=C2=A0=C2=A0 cp $D${sysconfdir}/login.defs.dpkg-new $D${sysc=
onfdir}/login.defs
> =C2=A0	fi
> =C2=A0
> -	# user/group lookups should match useradd/groupadd --root
> +	# user/group lookups should match useradd/groupadd --prefix
> =C2=A0	export PSEUDO_PASSWD=3D"$SYSROOT"
> =C2=A0fi

Without the chroot, it is finding /sbin/pam_tally2 on the host and calling =
it:

ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: [log_check] core-image-sato-sd=
k: found 6 error messages in the logfile:
[log_check] b'/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemu=
x86-poky-linux/core-image-sato-sdk/1.0/recipe-sysroot-native/usr/sbin/usera=
dd\n/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-l=
inux/core-image-sato-sdk/1.0/recipe-sysroot-native/usr/sbin/useradd\nRunnin=
g useradd commands...\nNOTE: ptest-runner: Performing useradd with [--prefi=
x /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-lin=
ux/core-image-sato-sdk/1.0/recipe-sysroot --system --no-create-home --home =
/ --user-group ptest]\npam_tally2: Error opening /var/log/tallylog for upda=
te: Permission denied\npam_tally2: Authentication error\nuseradd: failed to=
 reset the tallylog entry of user "ptest"\n/srv/pokybuild/yocto-worker/qemu=
x86/build/build/tmp/work/qemux86-poky-linux/core-image-sato-sdk/1.0/recipe-=
sysroot-native/usr/sbin/useradd\n'
[log_check] pam_tally2: Error opening /var/log/tallylog for update: Permiss=
ion denied
[log_check] pam_tally2: Error opening /var/log/tallylog for update: Permiss=
ion denied
[log_check] pam_tally2: Error opening /var/log/tallylog for update: Permiss=
ion denied
[log_check] pam_tally2: Error opening /var/log/tallylog for update: Permiss=
ion denied
[log_check] pam_tally2: Error opening /var/log/tallylog for update: Permiss=
ion denied

https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3587
https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/3607

This is likely an issue even within the chroot if the binary were
present but of the wrong arch so we'll need to fix this regardless.

The call is from useradd.c:tallylog_reset() in shadow-native.

Cheers,

Richard


