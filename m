Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.6294.1620479522786512606
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 May 2021 06:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=aheF3oAE;
 spf=pass (domain: qtec.com, ip: 209.85.167.42, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f42.google.com with SMTP id j10so16645827lfb.12
        for <openembedded-core@lists.openembedded.org>; Sat, 08 May 2021 06:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=1tfg2UPRm6/nGH0O5kpKb4dJQ9VNkstbi0jY28nK/NY=;
        b=aheF3oAE2JIm9LcX4ogU4WDPWJm6xKbZ9NamAR8JUHu/Qhng0F/x7pcSYTXvmPrIL0
         a6OBo6KJM5dox2yOKdZVuClBjdFyuWLFPJxam4MZohH1dcaLBEnRyIM0pYTvyGrwGq12
         FYYBPK38B5JQ31hf96QpAHnVP+FvyH8AGXAbph4lh2+R/KUUKwMECRSSRhRk0BECQ2tC
         zZl5P16wPPRpzLBrZes6r0EwPGhiYrlNdr0KQfgUeDGkuj1WdI70POlkivHZg3c4f4l3
         PxfBCEREUlvnLPfh1Kn/gH4AOBeksuaq9hxUIrZzHDPdTT59kmElSHQSt4DZCGt4dugk
         xmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=1tfg2UPRm6/nGH0O5kpKb4dJQ9VNkstbi0jY28nK/NY=;
        b=q4LBII6ECYCu/S/5BI4J3uT5cskw9EwMMeqtjLVfEmBY0QYI1mM1FBrgfom+78cJmN
         lGpTWM9SP6XsDuTeYv/BxTpKXhkYUWGjaH2yNuE0S8fiuk9Icm7DgZcI03DAJf4yXGJn
         m8GlzGOgcwtTYG2h2YaVFg6cFF1kx2AVbh25K7JyOtgchgUt6ADUWu2V+72YDBX77vj8
         LPOKiXGI12U7sh9GXnoMpg5AvtobzqcWz/sJbakFs7+M0vY5rlVOEU6Qji32NE3VvvUu
         ZfjjRKowA+mg/odzxjC4d6BvIYKX+CKawsivmQZMJQ3NeRoS2O6g8TdBjECndU6faGbV
         12xQ==
X-Gm-Message-State: AOAM5304VQdRKGRvh/VZxrGhkjNn0dXM9CckcbN1lvSAC5iWkLD3Oi/3
	aKU3lITNMUIB4NON/VwKgSaNzjhOZ/TNHGUnBkutsPYbZrafsw==
X-Google-Smtp-Source: ABdhPJzntwuRqOUJTthu7hZzAKqAkjn9LXZGFByiW9gkNYUrYjfTw8fXwNhTayOSpjhs5HVy9vGInEBLXx7/BbusQ5k=
X-Received: by 2002:a05:6512:13a0:: with SMTP id p32mr9953886lfa.621.1620479520584;
 Sat, 08 May 2021 06:12:00 -0700 (PDT)
MIME-Version: 1.0
From: "Daniel Gomez" <daniel@qtec.com>
Date: Sat, 8 May 2021 15:11:50 +0200
Message-ID: <CAH1Ww+Q+ydRk_z1uZgeUXK1ECYxfyj-bYsBYr8TejryrCYE5-w@mail.gmail.com>
Subject: alsa-state: pkg_postinst fails
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Hi,

When upgrading our system, alsa-state package fails (exit code 99) due
to the following:

root@qt5222:~# /usr/sbin/alsactl -g -f /var/lib/alsa/asound.state restore
No state is present for card Generic
Found hardware: "HDA-Intel" "ATI R6xx HDMI"
"HDA:1002aa01,00aa0100,00100700" "0x1002" "0x15de"
Hardware is initialized using a generic method
No state is present for card Generic
root@qt5222:~# echo $?
99

Adding -I (don't initialize even if restore fails) to the script
solves/workarounds the problem:
/usr/sbin/alsactl -g -I -f /var/lib/alsa/asound.state restore

I was wondering if that's the proper solution or I'm actually missing
some configuration to make alsactl restore command to work properly.

System logs, when booting also shows the same issue:
May 07 10:07:47 qt5222 systemd-udevd[202]: controlC0: Process
'/usr/sbin/alsactl restore 0' failed with exit code 99.

Hardware info:

root@qt5222:~# journalctl -b | grep alsa
May 07 10:07:47 qt5222 systemd-udevd[202]: controlC0: Process
'/usr/sbin/alsactl restore 0' failed with exit code 99.

root@qt5222:~# lspci -knn | grep -iA2 audio
05:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI]
Raven/Raven2/Fenghuang HDMI/DP Audio Controller [1002:15de]
        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI]
Raven/Raven2/Fenghuang HDMI/DP Audio Controller [1002:15de]
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel
--
05:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc.
[AMD] Raven/Raven2/FireFlight/Renoir Audio Processor [1022:15e2]
        Subsystem: Advanced Micro Devices, Inc. [AMD]
Raven/Raven2/FireFlight/Renoir Audio Processor [1022:15e2]
06:00.0 SATA controller [0106]: Advanced Micro Devices, Inc. [AMD] FCH
SATA Controller [AHCI mode] [1022:7901] (rev 61)
        Subsystem: Advanced Micro Devices, Inc. [AMD] FCH SATA
Controller [AHCI mode] [1022:7901]

root@qt5222:~# cat /proc/asound/cards
 0 [Generic        ]: HDA-Intel - HD-Audio Generic
                      HD-Audio Generic at 0xd04c0000 irq 69

Any hint? Or should I just add -I option?

Thanks in advance!

Daniel
