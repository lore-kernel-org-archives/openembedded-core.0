Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA29C369D3
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:50:56 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.41935.1745333451021478941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WZQNh6PN;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0ad744811so34528866d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745333450; x=1745938250; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tvf+KbBVgKi/w2JsreQnv9sebmsL9gQVl1fmx/2F13M=;
        b=WZQNh6PNeRKmO7+CZS4bkOjjsmuzX6JEvdgtCDI5YYuboetIo9/RP8agy3FFkafnLq
         IqcV+MiiahWvWFupeA1JCyH5zTm3E6hee8Li6IvycsrUxO5v1VxTIj5VmT3sVlj5evhC
         /3aPgQGt/2rRfL0AjQiWe6+K6hdDozTsZNWgEGA4jEy5S4YnshOTOHhxTso38gf61sgf
         Ae/3RjNg8J4g3vpLryhdHhimU3k3zlaX+Cu6saSeuQzXhtQG5FPrJ8JH7zI9X3ZkgMPp
         7R6l/QptOzz+Jjr6IDzH3DLxtxRnropUGSTeHdDus2YAansjvJ4W0lz3zF78fym8DhUp
         HJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745333450; x=1745938250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tvf+KbBVgKi/w2JsreQnv9sebmsL9gQVl1fmx/2F13M=;
        b=gpWMtXzUGdWU7GPRUUXFz69t1nLCmge1wZH6S2RWIjz7oXUz4JhBUw1+FuYsZ0ut38
         x3sVKggmtD7uVfZhRN5nkE1TC4TKWay5Uy+Hb2CnRwdGT8Lug41y88AXwa05vNsC1c7l
         l2b2kQb9dazdh+WPgziYiAqRZeHRLSlbaOFAuTPnuz1Vmbj3ZlNEWSvhcgTLWiBxBG1H
         jEPRKuMxQJ7vj62U34wNolmQcqHIhvtugAlyWWtGkcaRNbKUpfMU2gW2pleL+IHYFPhe
         8gQZDnHQVIsil38gKZHp5KPDvhGLci0WRUA1nHIlqAmJlDeuKucdn4Oayr1TzI/3ECzy
         3Fwg==
X-Gm-Message-State: AOJu0YwFzTlxfT8aARkvr1UBJis2zyT4S3izgzo5ze/P4e16yx6AANbL
	Ls1eOXtwbgMEoMFVelqxQoosgNTETyl1TP5h2ExbY2oX4lZUEmDzEIVdSHyesF/2bAyFbkC7G9v
	yz9Gfj5e4OYd+x85qntXrOMuR9p4=
X-Gm-Gg: ASbGncuGoleViO+MVDWu90PpMmFgeS0oVryKydvVWBNgSsptcinp8zqZmiR0GZVYJGo
	/iiarQcF6DdKQa5ZFanRByRGX3AaDAfeoh1f166PviZ3YzuofaWvyhP4MvWcMa5bynoP0mvxx+e
	ipPHo7jXl6wFhL+Kw7OQXp1/kjqZ9iycPGWKIEoofFdAgbs2YvBXfo+ll+
X-Google-Smtp-Source: AGHT+IG44Qn0wV1YJzQ4k0z+MmyMr/2en+iHuswtJGjRtCJQTPp5Cw0OU2PO/BBPNd8B61vhcw1RE4jKwjmJM4faUak=
X-Received: by 2002:a05:6214:c47:b0:6e2:43d1:5fd0 with SMTP id
 6a1803df08f44-6f2c4644801mr312080816d6.31.1745333449965; Tue, 22 Apr 2025
 07:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250415163527.15924-1-denisova.olga.k@yandex.ru>
In-Reply-To: <20250415163527.15924-1-denisova.olga.k@yandex.ru>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Apr 2025 16:50:38 +0200
X-Gm-Features: ATxdqUFl6sarG40uCdi--Dj57SpLg1U5KQBEg_ZupMniwAFv8yfpJ7IO7NWnq6c
Message-ID: <CANNYZj9+wcnLE7TkKHNLytR58mkAAmyRbFhp_jm6e6wW8OXRmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pybootchartgui: visualize /proc/net/dev network
 stats in graphs
To: denisova.olga.k@yandex.ru
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:50:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215228

Also here it would be good to see a demo, perhaps you can publish an
image somewhere and link to it?

Alex

On Tue, 15 Apr 2025 at 20:37, denisova.olga.k via
lists.openembedded.org
<denisova.olga.k=yandex.ru@lists.openembedded.org> wrote:
>
> From: Olga Denisova <denisova.olga.k@yandex.ru>
>
> This patch adds support for parsing and visualizing network interface statistics from /proc/net/dev in pybootchartgui. It introduces a new NetSample class to hold per-interface metrics, including received/transmitted bytes and their deltas over time.
>
> The data is drawn using line and box charts in draw.py and helps to monitor
> network usage during the boot process for each interface individually.
>
> Signed-off-by: denisova-ok <denisova.olga.k@yandex.ru>
> ---
>  pybootchartgui/pybootchartgui/draw.py    | 48 ++++++++++++++++++++++++
>  pybootchartgui/pybootchartgui/parsing.py | 18 +++++++++
>  pybootchartgui/pybootchartgui/samples.py | 10 +++++
>  3 files changed, 76 insertions(+)
>
> diff --git a/pybootchartgui/pybootchartgui/draw.py b/pybootchartgui/pybootchartgui/draw.py
> index c6e67833ab..16739a0fa1 100644
> --- a/pybootchartgui/pybootchartgui/draw.py
> +++ b/pybootchartgui/pybootchartgui/draw.py
> @@ -69,6 +69,11 @@ CPU_COLOR = (0.40, 0.55, 0.70, 1.0)
>  IO_COLOR = (0.76, 0.48, 0.48, 0.5)
>  # Disk throughput color.
>  DISK_TPUT_COLOR = (0.20, 0.71, 0.20, 1.0)
> +
> +BYTES_RECEIVED_COLOR = (0.0, 0.0, 1.0, 1.0)
> +BYTES_TRANSMITTED_COLOR = (1.0, 0.0, 0.0, 1.0)
> +BYTES_RECEIVE_DIFF_COLOR = (0.0, 0.0, 1.0, 0.3)
> +BYTES_TRANSMIT_DIFF_COLOR = (1.0, 0.0, 0.0, 0.3)
>  # CPU load chart color.
>  FILE_OPEN_COLOR = (0.20, 0.71, 0.71, 1.0)
>  # Mem cached color
> @@ -437,6 +442,49 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
>
>          curr_y = curr_y + 30 + bar_h
>
> +    if trace.net_stats:
> +        for iface, samples in trace.net_stats.items():
> +            max_received_sample = max(samples, key=lambda s: s.received_bytes)
> +            max_transmitted_sample = max(samples, key=lambda s: s.transmitted_bytes)
> +            max_receive_diff_sample = max(samples, key=lambda s: s.receive_diff)
> +            max_transmit_diff_sample = max(samples, key=lambda s: s.transmit_diff)
> +
> +            draw_text(ctx, "Iface: %s" % (iface), TEXT_COLOR, off_x, curr_y+20)
> +            draw_legend_line(ctx, "Bytes received (max %d)" % (max_received_sample.received_bytes),
> +                             BYTES_RECEIVED_COLOR, off_x+150, curr_y+20, leg_s)
> +            draw_legend_line(ctx, "Bytes transmitted (max %d)" % (max_transmitted_sample.transmitted_bytes),
> +                             BYTES_TRANSMITTED_COLOR, off_x+400, curr_y+20, leg_s)
> +            draw_legend_box(ctx, "Bytes receive diff (max %d)" % (max_receive_diff_sample.receive_diff),
> +                             BYTES_RECEIVE_DIFF_COLOR, off_x+650, curr_y+20, leg_s)
> +            draw_legend_box(ctx, "Bytes transmit diff (max %d)" % (max_transmit_diff_sample.transmit_diff),
> +                             BYTES_TRANSMIT_DIFF_COLOR, off_x+900, curr_y+20, leg_s)
> +
> +
> +            chart_rect = (off_x, curr_y + 30, w, bar_h)
> +            if clip_visible(clip, chart_rect):
> +                draw_box_ticks(ctx, chart_rect, sec_w)
> +                draw_annotations(ctx, proc_tree, trace.times, chart_rect)
> +
> +            if clip_visible (clip, chart_rect):
> +                draw_chart (ctx, BYTES_RECEIVED_COLOR, False, chart_rect, \
> +                        [(sample.time, sample.received_bytes) for sample in samples], \
> +                        proc_tree, None)
> +
> +                draw_chart (ctx, BYTES_TRANSMITTED_COLOR, False, chart_rect, \
> +                        [(sample.time, sample.transmitted_bytes) for sample in samples], \
> +                        proc_tree, None)
> +
> +            if clip_visible (clip, chart_rect):
> +                draw_chart (ctx, BYTES_RECEIVE_DIFF_COLOR, True, chart_rect, \
> +                        [(sample.time, sample.receive_diff) for sample in samples], \
> +                        proc_tree, None)
> +
> +                draw_chart (ctx, BYTES_TRANSMIT_DIFF_COLOR, True, chart_rect, \
> +                        [(sample.time, sample.transmit_diff) for sample in samples], \
> +                        proc_tree, None)
> +
> +            curr_y = curr_y + 30 + bar_h
> +
>      # render CPU pressure chart
>      if trace.cpu_pressure:
>          max_sample_avg = max (trace.cpu_pressure, key = lambda s: s.avg10)
> diff --git a/pybootchartgui/pybootchartgui/parsing.py b/pybootchartgui/pybootchartgui/parsing.py
> index 144a16c723..72a54c6ba5 100644
> --- a/pybootchartgui/pybootchartgui/parsing.py
> +++ b/pybootchartgui/pybootchartgui/parsing.py
> @@ -48,6 +48,7 @@ class Trace:
>          self.filename = None
>          self.parent_map = None
>          self.mem_stats = []
> +        self.net_stats = []
>          self.monitor_disk = None
>          self.cpu_pressure = []
>          self.io_pressure = []
> @@ -557,6 +558,21 @@ def _parse_monitor_disk_log(file):
>
>      return disk_stats
>
> +
> +def _parse_reduced_net_log(file):
> +    net_stats = {}
> +    for time, lines in _parse_timed_blocks(file):
> +
> +        for line in lines:
> +            parts = line.split()
> +            iface = parts[0][:-1]
> +            if iface not in net_stats:
> +                net_stats[iface] = [NetSample(time, iface, int(parts[1]), int(parts[2]), int(parts[3]), int(parts[4]))]
> +            else:
> +                net_stats[iface].append(NetSample(time, iface, int(parts[1]), int(parts[2]), int(parts[3]), int(parts[4])))
> +    return net_stats
> +
> +
>  def _parse_pressure_logs(file, filename):
>      """
>      Parse file for "some" pressure with 'avg10', 'avg60' 'avg300' and delta total values
> @@ -767,6 +783,8 @@ def _do_parse(writer, state, filename, file):
>          state.cmdline = _parse_cmdline_log(writer, file)
>      elif name == "monitor_disk.log":
>          state.monitor_disk = _parse_monitor_disk_log(file)
> +    elif name == "reduced_proc_net.log":
> +        state.net_stats = _parse_reduced_net_log(file)
>      #pressure logs are in a subdirectory
>      elif name == "cpu.log":
>          state.cpu_pressure = _parse_pressure_logs(file, name)
> diff --git a/pybootchartgui/pybootchartgui/samples.py b/pybootchartgui/pybootchartgui/samples.py
> index a70d8a5a28..7c92d2ce6a 100644
> --- a/pybootchartgui/pybootchartgui/samples.py
> +++ b/pybootchartgui/pybootchartgui/samples.py
> @@ -37,6 +37,16 @@ class CPUSample:
>          return str(self.time) + "\t" + str(self.user) + "\t" + \
>                 str(self.sys) + "\t" + str(self.io) + "\t" + str (self.swap)
>
> +
> +class NetSample:
> +    def __init__(self, time, iface, received_bytes, transmitted_bytes, receive_diff, transmit_diff):
> +        self.time = time
> +        self.iface = iface
> +        self.received_bytes = received_bytes
> +        self.transmitted_bytes = transmitted_bytes
> +        self.receive_diff = receive_diff
> +        self.transmit_diff = transmit_diff
> +
>  class CPUPressureSample:
>      def __init__(self, time, avg10, avg60, avg300, deltaTotal):
>          self.time = time
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214962): https://lists.openembedded.org/g/openembedded-core/message/214962
> Mute This Topic: https://lists.openembedded.org/mt/112282219/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

