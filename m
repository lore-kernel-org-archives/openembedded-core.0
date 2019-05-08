Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 991357DDC2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 10:59:57 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f7so16291902wrq.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 03:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=yZb44e2qVfpjS/H9qKP5QYKTvToR6i2bucMBJW2TeAc=;
	b=NfFMgkZUgL+kYvQk/WV5O38iy/Y+Bt3kBmoZLuESMM5I/VlkyZz16XlXs73lYnO76Q
	PdMRE/MAsdXz+op26OMzikUSOZg9FGsjPBb0IpIQjTPQIWqP15QakbblrTAEeVMduo+5
	Wf6I5Pn5KcmMYZvtcqsmAEs9VxSYw1bCabcCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yZb44e2qVfpjS/H9qKP5QYKTvToR6i2bucMBJW2TeAc=;
	b=ZD8mtZXXwNaz+6d2nSCSJSMkZSy8ju3mSiPw6sYXAj61IifKIRbn6pgWb7rubjaj9p
	NfiEVS65guEvcw9oZavhQmPxKLN5jqXCICfXY21ypr/8whQPA0NA9kmpHfhMwdjlj3Zx
	/9nJ+DprqQ7WRSDHtCvQ2GSXUkw0EAIDhpLCCIaFqwx2ktSIZTa1SzFPUvsu7T57XXHX
	avM/XojwI0nHTi1KhGzU1LR/s9UXtW+bZO7/Rk8POqhjGP9HPbHKLk13sI8LcW6kbRUj
	iYYd1V9OmCDrvejf9xN51NY7g1Ztqz7BbtOOYGBz60jpUEd3/SFJ4CBG51s2wsl+OQhL
	BuVw==
X-Gm-Message-State: APjAAAXfDfYde05CsUQU6KlhkgZeFneMNSA5FDZzvMr+qNEZ+Uay2tjo
	5f/nnheHZ2oHzgJpf9mZAJMmn64/a8s=
X-Google-Smtp-Source: APXvYqxjIeo4MoBfRCFs8L7SvQMqaZzqbpx02QSoUNhGtuezepKhLpu6WYrQ6a1zRNRiAwzjGozxOg==
X-Received: by 2002:adf:8122:: with SMTP id 31mr16545201wrm.112.1557313198188; 
	Wed, 08 May 2019 03:59:58 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p13sm2911053wmb.0.2019.05.08.03.59.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 03:59:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 11:59:49 +0100
Message-Id: <20190508105949.24942-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508105949.24942-1-richard.purdie@linuxfoundation.org>
References: <20190508105949.24942-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/4] scripts/pybootchart/draw: Fix some bounding problems
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2019 10:59:58 -0000
Content-Transfer-Encoding: 8bit

The chart size extents were being incorrectly reported, not accounting for the
width of the legend. Set a minimum width to account for that (its fixed size).

Also stop printing the chart background off the bottom of the chart extents.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index b3184411cbc..add5c538821 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -342,6 +342,10 @@ def extents(options, xscale, trace):
         if trace.mem_stats:
             h += meminfo_bar_h
 
+    # Allow for width of process legend and offset
+    if w < (720 + off_x):
+        w = 720 + off_x
+
     return (w, h)
 
 def clip_visible(clip, rect):
@@ -490,7 +494,7 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
     return curr_y
 
 def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
-    chart_rect = [off_x, curr_y+header_h, w, h - 2 * off_y - header_h - leg_s + proc_h]
+    chart_rect = [off_x, curr_y+header_h, w, h - curr_y - 1 * off_y - header_h  ]
 
     draw_legend_box (ctx, "Configure", \
              TASK_COLOR_CONFIGURE, off_x  , curr_y + 45, leg_s)
-- 
2.20.1


