Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75390C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 13:45:26 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.11059.1743255916180236939
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 06:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U+AnNC7f;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-399744f74e9so2097169f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 06:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743255914; x=1743860714; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FB0CbfiRFhlmB7MYR75U7sW6s9u1C8koH6slNGJEqag=;
        b=U+AnNC7f9Ph5bbfyErmSXllLQTsiJmgQ+sQw5lf4PE+fTVjS8g355tEZwMuXMXJO94
         /hnx3p3EFjUznX8B7Scypo84SD+amQ5XmPbqaFbgGAyzMBosC6mTIxRnDGmjBEqCZj5z
         FBorqsOzybmcdUJGSI1Fy9H9oPdSrmaJuA9ALYh2bxwGWrlYaUClU3KqpB8gf0IpegcP
         iMUGPlwu6b9dX/CNM6wzt3qm029zV4H7gaKa6PokjfmK8NI6dkiSfiv2L2A/lSJZ0ulA
         uHd7ItNCCPN+1iUjVLu0dMvp0xLGlB/F875PC2tGn0wio9ONgwBr+09IjElgc4JE8mP3
         mf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743255914; x=1743860714;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FB0CbfiRFhlmB7MYR75U7sW6s9u1C8koH6slNGJEqag=;
        b=EqGi+FpT02wFJbLoHQwc+Pvh9zyUUnRicwgkq4gQsE5UZy6pL1Lq8/4tqdfNEf0RhE
         3Mzr99N02I0J8PvhxupJPuI8A7FcJJl2dTBQisOOXvnIuP2R+KTAarq2ryt/EEBfLr7j
         lhmibxeMIyNpOPgGnEe0bW/Bsw8AiT4/ua43388Yp1zPcdrQbMZotgFbD+OEjnk6i2yL
         E2wYCGHpJ3i7q22TLlUC78o8rIxcwLahVyQB7ppgMuMIHEo0v18Y+ZtwFx3gJd5qec+2
         N75D9XUBN9F7UsZ7uo4A7Ei9vfGE6LbcdrnzsQZeW9iInGfxD7FDIrHEtKRqdymmY19C
         V2RA==
X-Forwarded-Encrypted: i=1; AJvYcCVDTVLzWBxRa69kb6UtPnaKCxalwvTbXLqnOxfh1qAIdX4Qt+y7kwgYnG9SA8zWBJ08iqi3b+piWBOZQaGmyAWDug==@lists.openembedded.org
X-Gm-Message-State: AOJu0YykFEF28UJTS7zrYwcMiKyBNvS4Ls3kLVknS28J+xdj0gOpdUi+
	zOW5f6tCY58JmNXTEM/AGUkQMWtxU0Z8FSBxFK7q2zZiXlSMhbXw
X-Gm-Gg: ASbGnctbrz42r9qyD4zTBuwwmulWWXemEKCwv0P8DjX+2SE+vrNONDIHijF9FKhsVmj
	VyU00aAWx+vTj0TLc8vOQ/LiRzF33NBbODmoXKBLP3GumEhbnjCk/OhUf8ude9OFAYVj7pLoqrD
	hS0PV3DDVo4oUBZ/x4JW5enVgmZcTDUdldOW7aSSKx735uhfVPBypgAJcnRCAGPoHhnIX5zuGOI
	mjHobKAJiKrQJvEzwpe4uWg2ZzRp5VEceMOvuSpz2WLk2CHgWcgyZlOqdYJ4n5CxAOwZt7qSFt+
	VvrjTCWSE5p1hUwYR8dG0pWJ2ytufEUuf1m3QU9j5Rpc63ktLadRnWCK3eti6hOBtAgKGVEuG1A
	B1+IAym2hgChp+tiYn36d5bcWT6ho
X-Google-Smtp-Source: AGHT+IF1g+h32L3JqKo54st6FYooCJt4pzfyDOvtezK9lpAhEug+EES0CgEoTOcFnvyIGB0znFEm7w==
X-Received: by 2002:a05:6000:2910:b0:391:4889:503e with SMTP id ffacd0b85a97d-39c120f5923mr2067076f8f.33.1743255914332;
        Sat, 29 Mar 2025 06:45:14 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66ad1esm5855656f8f.52.2025.03.29.06.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 06:45:13 -0700 (PDT)
Message-ID: <19c7cc6289d7aab486e74ac50bdbf17a22e86363.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] initramfs-framework: remove hard dependency
 with busybox
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: gavrosc@yahoo.com, openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>, Randy MacLeod
	 <randy.macleod@windriver.com>, Ross Burton <ross.burton@arm.com>, jbk
	 <jbk@mm-software.com>
Date: Sat, 29 Mar 2025 14:45:13 +0100
In-Reply-To: <20250328180456.90413-1-gavrosc@yahoo.com>
References: <20250328180456.90413-1-gavrosc.ref@yahoo.com>
	 <20250328180456.90413-1-gavrosc@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 13:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213877

Hi Christos

Since the -c has been around for a very long time, I assume that there
are many users who use it with busybox. Using it with core-utils will
probably remain the special use case.
The proposed fix raises the question of why the -c was introduced at
some point. If your fix also works for busybox, was the -c always
redundant? Or has something changed in the meantime?

Please also address the busybox users' point of view in the commit
message and summarize how this was tested with busybox in particular.

Thank you.
Adrian


On Fri, 2025-03-28 at 19:04 +0100, Christos Gavros via
lists.openembedded.org wrote:
> In 'finish'script the Switch_root command with option -c is busybox
> specific.
> When package-core-base-utils is selected the boot is breaking.
> Remove -c option to make it compatible with both providers
> Fixes [YOCTO #15716]
>=20
> CC: Yoann Congal <yoann.congal@smile.fr>
> CC: Randy MacLeod <randy.macleod@windriver.com>
> CC: Ross Burton <ross.burton@arm.com>
> CC: jbk <jbk@mm-software.com>
> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> ---
> =C2=A0meta/recipes-core/initrdscripts/initramfs-framework/finish | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/initrdscripts/initramfs-
> framework/finish b/meta/recipes-core/initrdscripts/initramfs-
> framework/finish
> index ac0de9f996..716c2f44af 100755
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
> @@ -41,7 +41,7 @@ finish_run() {
> =C2=A0		mount --move /sys $ROOTFS_DIR/sys
> =C2=A0
> =C2=A0		cd $ROOTFS_DIR
> -		exec switch_root -c /dev/console $ROOTFS_DIR
> ${bootparam_init:-/sbin/init}
> +		exec switch_root $ROOTFS_DIR ${bootparam_init:-
> /sbin/init}
> =C2=A0	else
> =C2=A0		debug "No rootfs has been set"
> =C2=A0	fi
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213861):
> https://lists.openembedded.org/g/openembedded-core/message/213861
> Mute This Topic: https://lists.openembedded.org/mt/111959232/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


