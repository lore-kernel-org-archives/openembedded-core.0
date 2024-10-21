Return-Path: <gael.portay@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D7FD0E6C5
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 17:02:15 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.483.1729530133293608169
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 10:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m8G47eU0;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: gael.portay@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d5231f71cso392508f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 10:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729530131; x=1730134931; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cb5dT1SmE+LMfAa0vsz32XVgb6zHAwQ+WtYOewBtkrU=;
        b=m8G47eU0ytRUH8qX/fBTEgkG2seyelr2UIzIqtM7KX32NF283FhiaU8MIQoHDnMQWa
         dqntrL23iTM/C80hF9ZDALOtV89KDro6f2EXtkEQsBtrNMpyphb9wWm5b/I+CcvAUjoj
         NciPN0d5s0NraUHDfHU0c8Vps35mSRBzTu/lXc97BrDVNL81SHkFAbGwGei/zZ8GuV/u
         xDUV4XRY2oLKZT5JbIfFq2JJMlFx7ytRwzPNw7VQXBhwiG37CDVj7/+nZKYcgp3vfT+B
         oMI0G0uQkbtcYEvIGN0HqShkHCn/KfaK5fkp/IdclFLXgTUuBKl2HRNWDNvDu6W3icJ0
         IwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729530131; x=1730134931;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cb5dT1SmE+LMfAa0vsz32XVgb6zHAwQ+WtYOewBtkrU=;
        b=YZ3O2IxRZvGrouo4uJFJElP6OlU7nF8voOSm87YEB6ADCDooIWxRV2psgcaNLjYc+X
         gCYXbvehQZivytV3UTv8Ow0cELsal7KyJUbWFQe3uoiFsu+5cxxxk7H93fzsMDys9le0
         OsKnfNIse39E+v78JDFueNPOMe5KY9vCW8YuN6Wl/Gqa3DO9r4ByRZcUIjE++MSNAJEy
         4B1nxs5hLTUndgwEJ/rY5K1ijc6vy9XqnfM+Q1X4vCxHnaG3hQxkVSFUah41a2s+bcHt
         jXqWq9wSbYsZvU5u/A2FPED/VmUv8BD9McuoANFXhthSF8AHLo2tRRErAbSgTcder57L
         jUcw==
X-Gm-Message-State: AOJu0YzqiyGz1FuZZj1V2z/PvRVJjfP6l2qLLsf1rAbKhLG+MwTPB9EB
	kmPUZPpiMW12zJsfCjaAZiK/LTYOFqWv7BuRqsFriSYayKWfCoO6esKWcGNK
X-Google-Smtp-Source: AGHT+IGrlAKHCqTwBsLvWk1+JEw1lpxmOw1C1IbY2TAamXtgq6gxK9gbEUpO+diXaHMSXr4ycig4rg==
X-Received: by 2002:adf:f0c8:0:b0:37e:d92e:818b with SMTP id ffacd0b85a97d-37ed92e821amr1774001f8f.14.1729530131092;
        Mon, 21 Oct 2024 10:02:11 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:3a7c:76ff:fe01:6f05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a365e5sm4783004f8f.21.2024.10.21.10.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 10:02:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Oct 2024 19:02:09 +0200
Message-Id: <D51N9GUUD7NN.KLL01VZA4V8U@gmail.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] classes: rootfs-postcommands: set better sane
 time to systemd
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>,
 <gael.portay+rtone@gmail.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241019021935.2105739-1-gael.portay+rtone@gmail.com>
 <CANNYZj-bdtFmFHnK2ppSMY+iXRDX-J5GwWaQjYMwX_t66SnJoQ@mail.gmail.com>
In-Reply-To: <CANNYZj-bdtFmFHnK2ppSMY+iXRDX-J5GwWaQjYMwX_t66SnJoQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 17:02:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206127

Hello Alex,

On Mon Oct 21, 2024 at 12:25 PM CEST, Alexander Kanavin wrote:
> Can this be done from systemd recipe itself? Items in
> rootfs-postprocess list should not be recipe-specific.
>

Sure it could be done in the recipe itself ;) but...

The recipe harcodes already a sane value at configure time thanks to the
meson option -Dtime-epoch and the environment variable $SOURCE_DATE_EPOC
(or the date the creation of the latest git-tag or the modification time
of the NEWS file). systemd sets the date somewhere in 2022 (kirkstone).

I have created a rootfs-postcommand to be able to set a better time **at
image creation** to keep the systemd package untouched (not rebuilt) by
updateing the variable $REPRODUCIBLE_TIMESTAMP_ROOTFS.

That variable is suffixed by _ROOTFS; and I guess that variable **SHOULD
NOT** be used by package recipes.

The rootfs_systemd_timestamp() is based on rootfs_update_timestamp(); it
touches the file and it leaves the file empty.

Also, to decrease the systemd-specific thing, I wonder if this is
acceptable:

	rootfs_update_timestamp () {
	        if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" !=3D "" ]; then
	                # Convert UTC into %4Y%2m%2d%2H%2M%2S
	                sformatted=3D`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS}=
 +%4Y%2m%2d%2H%2M%2S`
	        else
	                sformatted=3D`date -u +%4Y%2m%2d%2H%2M%2S`
	        fi
	        echo $sformatted > ${IMAGE_ROOTFS}/etc/timestamp
	        bbnote "rootfs_update_timestamp: set /etc/timestamp to $sformatted=
"
	+
	+       if [ -x /lib/systemd/systemd ]; then
	+           if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" !=3D "" ]; then
	+                   # Convert UTC into %4Y%2m%2d%2H%2M.%2S
	+                   sformatted=3D`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROO=
TFS} +%4Y%2m%2d%2H%2M.%2S`
	+           else
	+                   sformatted=3D`date -u +%4Y%2m%2d%2H%2M.%2S`
	+           fi
	+           touch -m -t "$sformatted" ${IMAGE_ROOTFS}/usr/lib/clock-epoch
	+           bbnote "rootfs_systemd_timestamp: set /usr/lib/clock-epoch mti=
me to $sformatted"
	+       }
	}

Or, linking the file instead:

	rootfs_update_timestamp () {
	        if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" !=3D "" ]; then
	                # Convert UTC into %4Y%2m%2d%2H%2M%2S
	                sformatted=3D`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS}=
 +%4Y%2m%2d%2H%2M%2S`
	        else
	                sformatted=3D`date -u +%4Y%2m%2d%2H%2M%2S`
	        fi
	        echo $sformatted > ${IMAGE_ROOTFS}/etc/timestamp
	        bbnote "rootfs_update_timestamp: set /etc/timestamp to $sformatted=
"
	+
	+       if [ -x /lib/systemd/systemd ]; then
	+           ln -sf /etc/timestamp /usr/lib/clock-epoch
	+       }
	}

Does it look better for you?

> Alex
>

Regards,
Ga=C3=ABl

