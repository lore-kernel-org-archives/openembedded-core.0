Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBAEC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:48:47 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.41878.1745333316819460598
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hRDP9dwr;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e8f6970326so49100896d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745333316; x=1745938116; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h8xwHK+BHd3fuzvIpY3rP9gh2RpmmEF1xr2yxSm4MpE=;
        b=hRDP9dwrSmqH1B9oNcWpabYMGXjW1B1pWVRoN3Poq4nUpLfCnA5eMtHGekkIfR29M2
         COirBY0H8qntsKNmaTrfg55kuw6mau0ggC0aiatNiBAlP1kZnlvoJFIw7bDzdJUVwmlO
         5qrDpVxtgIK8NGG5HGzctwMsQtGPV1mEfD5w4keTAtBIs/IbE85JbxQdgXpOlpCi/O84
         p6anEWcjBrhM4MUAuweE+fykqsYsdtKOEJsQXFx95gaXW0yZI2gPMxW7c07gpmexh9/D
         KGHCYm40TgFXJYOZRKCTF+J3hlVKmDkMb3OqmzUy1+rLDVHoM8CDxngWDuozAHlRSZuu
         PiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745333316; x=1745938116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8xwHK+BHd3fuzvIpY3rP9gh2RpmmEF1xr2yxSm4MpE=;
        b=RWCpqWUx1FOLNx3HJ/a3JbXXU+4Qd1Lg2gxLEBQUOPQ4PY9k41PORKAvTiHOAoC2Jw
         Wn5BZjMDZO1Nm+2NsfWFKCZqi2KDYnBIrEbeuEK4r037n7L99dtqMRgOyHM9+H+yujpj
         9xrw56jhf9KecmNfgyhh3EjilNfdy5CZNlvcv/odmkKm2R6YIMYbiNyeviAEzZheWQ1U
         3h1aM9K9VzhUhXautDfpQGsKzH/R40SUAXyLLdRiBsQRM+twlxCElc43GrENht2f9z5R
         EwgcN2lvjJ10hJxxA8/646kwH3D1v8gE9jaFVmPgIumc9oHX7+qf5xHr06gk/39WMUdH
         VmcA==
X-Gm-Message-State: AOJu0YwfPML2Kwt5CZHzb98msYoyhPcXQAGfV6VWXX46RzcQkLp+oqIW
	MjeKhJ7JQFTnCF/uolGRgZlA/Y+l5xvL/kPI7muMrZVAw0oZpWH00vftk78iUYhBHktdfYyVLXF
	J/w/CXyZwULbleWHlblyhm9+PU3Y=
X-Gm-Gg: ASbGncvmtqTVj3pawN4gpMOncZ8/EVJIiMpeJtOKdgUd84IBqEKCol7kqGcitvztCIQ
	FxihIwx9IRTXOgeZz7TXgtQeuDWiYtEx8piVUS5deSsC0+PN4bm8UUAyhH2bcUpTULU8o5Jz0nf
	Lgl4Bp0eiZRf6e3oysJPn6G6YT/WtO4XJYO5llrM5vkDpnaqnsF57QtIAJELfRLoLpveE=
X-Google-Smtp-Source: AGHT+IHumXHP1SQjYXNdN0iIi0VBuFQo0KFYVxFXz7zCLEbAhtizy9GIpYeJs/YKwTdScJfEX/l8Hr6UR36Lh6RULEM=
X-Received: by 2002:a05:6214:ccd:b0:6f2:b14e:46e6 with SMTP id
 6a1803df08f44-6f2c454281emr225787106d6.17.1745333315838; Tue, 22 Apr 2025
 07:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250415161615.14743-1-denisova.olga.k@yandex.ru>
In-Reply-To: <20250415161615.14743-1-denisova.olga.k@yandex.ru>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Apr 2025 16:48:24 +0200
X-Gm-Features: ATxdqUGFAEW34dOHB6qFI_4NzPRRptz9byH4qtDENYOVnDXui1CD4cl9G_yenwU
Message-ID: <CANNYZj_SNEvMSZdoApSyPL=gtHkHVuvqz4SrEecQPNpHtJiQYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildstats.py: Add tracking of network I/O per interface
To: denisova.olga.k@yandex.ru
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215227

Can you include sample output for this into the commit message,
especially if it showcases a network bottleneck?

Alex

On Tue, 15 Apr 2025 at 18:20, denisova.olga.k via
lists.openembedded.org
<denisova.olga.k=yandex.ru@lists.openembedded.org> wrote:
>
> From: Olga Denisova <denisova.olga.k@yandex.ru>
>
> This patch extends SystemStats to collect and store data from /proc/net/dev.
> It extracts per-interface received and transmitted bytes, calculates deltas
> between samples, and stores them for further analysis.
>
> Useful for identifying network bottlenecks during long-running builds.
>
> Signed-off-by: denisova-ok <denisova.olga.k@yandex.ru>
> ---
>  lib/oe/buildstats.py | 43 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 2 deletions(-)
>
> diff --git a/lib/oe/buildstats.py b/lib/oe/buildstats.py
> index 1ffe679801..6f5dad953c 100644
> --- a/lib/oe/buildstats.py
> +++ b/lib/oe/buildstats.py
> @@ -10,6 +10,7 @@
>  import time
>  import re
>  import bb.event
> +from collections import deque
>
>  class SystemStats:
>      def __init__(self, d):
> @@ -18,7 +19,8 @@ class SystemStats:
>          bb.utils.mkdirhier(bsdir)
>          file_handlers =  [('diskstats', self._reduce_diskstats),
>                              ('meminfo', self._reduce_meminfo),
> -                            ('stat', self._reduce_stat)]
> +                            ('stat', self._reduce_stat),
> +                            ('net/dev', self._reduce_net)]
>
>          # Some hosts like openSUSE have readable /proc/pressure files
>          # but throw errors when these files are opened. Catch these error
> @@ -47,7 +49,10 @@ class SystemStats:
>                  # not strictly necessary, but using it makes the class
>                  # more robust should two processes ever write
>                  # concurrently.
> -                destfile = os.path.join(bsdir, '%sproc_%s.log' % ('reduced_' if handler else '', filename))
> +                if filename == 'net/dev':
> +                    destfile = os.path.join(bsdir, 'reduced_proc_net.log')
> +                else:
> +                    destfile = os.path.join(bsdir, '%sproc_%s.log' % ('reduced_' if handler else '', filename))
>                  self.proc_files.append((filename, open(destfile, 'ab'), handler))
>          self.monitor_disk = open(os.path.join(bsdir, 'monitor_disk.log'), 'ab')
>          # Last time that we sampled /proc data resp. recorded disk monitoring data.
> @@ -72,6 +77,7 @@ class SystemStats:
>          self.stat_ltimes = None
>          # Last time we sampled /proc/pressure. All resources stored in a single dict with the key as filename
>          self.last_pressure = {"pressure/cpu": None, "pressure/io": None, "pressure/memory": None}
> +        self.net_stats = {}
>
>      def close(self):
>          self.monitor_disk.close()
> @@ -93,6 +99,39 @@ class SystemStats:
>                      b' '.join([values[x] for x in
>                                 (b'MemTotal', b'MemFree', b'Buffers', b'Cached', b'SwapTotal', b'SwapFree')]) + b'\n')
>
> +    def _reduce_net(self, time, data, filename):
> +        data = data.split(b'\n')
> +        for line in data[2:]:
> +            if b":" not in line:
> +                continue
> +            try:
> +                parts = line.split()
> +                iface = (parts[0].strip(b':')).decode('ascii')
> +                receive_bytes = int(parts[1])
> +                transmit_bytes = int(parts[9])
> +            except Exception:
> +                continue
> +
> +            if iface not in self.net_stats:
> +                self.net_stats[iface] = deque(maxlen=2)
> +                self.net_stats[iface].append((receive_bytes, transmit_bytes, 0, 0))
> +            prev = self.net_stats[iface][-1] if self.net_stats[iface] else (0, 0, 0, 0)
> +            receive_diff = receive_bytes - prev[0]
> +            transmit_diff = transmit_bytes - prev[1]
> +            self.net_stats[iface].append((
> +                receive_bytes,
> +                transmit_bytes,
> +                receive_diff,
> +                transmit_diff
> +            ))
> +
> +        result_str = "\n".join(
> +            f"{iface}: {net_data[-1][0]} {net_data[-1][1]} {net_data[-1][2]} {net_data[-1][3]}"
> +            for iface, net_data in self.net_stats.items()
> +        ) + "\n"
> +
> +        return time, result_str.encode('ascii')
> +
>      def _diskstats_is_relevant_line(self, linetokens):
>          if len(linetokens) != 14:
>              return False
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214955): https://lists.openembedded.org/g/openembedded-core/message/214955
> Mute This Topic: https://lists.openembedded.org/mt/112279424/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

