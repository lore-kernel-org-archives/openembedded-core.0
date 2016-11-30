Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id A104371A8B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:50:18 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id m5so201444838ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 01:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c9C4CyCc2KZTyk8Wcj/fBwmoHR2T/TT4bV1v6c1NvNM=;
	b=MTO9bDoYo3XEqi57lMy+9uVlfs2wo3J0t/uBKceUea58ul9lh6wiJOk8yMz3vm8SSX
	nLWJW7LKf9r1xO6czVWpMMbDtDJcq0ofaVo32kP1sGV+1/3c67fMktm7IwN2pyUABI+g
	SStNKbvaCvJPUWPZozBDOV8HZ4Tpi9ycRw4sg06vhvsLTHjTGswQO/fV3tr/+plZjx2Y
	/pTf+u1FClkA5ozGG/UuUKYFqDORRyOFqfemYeEws7cQTGBsVejqdZKy5I/zdyqIF5/6
	byy0GZIIKYe8F93XhoLE71kYO800Li/j93mlni3d7cxH2O04niHH2GR8HOgEQ/8fWwEj
	RYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c9C4CyCc2KZTyk8Wcj/fBwmoHR2T/TT4bV1v6c1NvNM=;
	b=MtR1KlpVGYe4kzlwd6buiBBdP0cco4TX9c/VKyju3l0Imd1ujkCrXJ4Zk4QL5y7nRz
	qROrjjSp3TQixXT42Cxx1qaYS29uhuBD6BY5/KDbVaC0r75Wy1T5tc+bsKKJDYKG3XvZ
	ndPM7MkuVFsMW816lkGSfUMCApCzNfh0ybo0m4tmjo0qv7vm12HAmwt8m6OFMV6PMJDW
	aJ7JusRcDIiMexdzbgmPO2RS4F/imZp4NAYUkj/pktQscF+/k7qKLQ8xhUIWi4oix/7k
	ZYPSwXunY//Uzayd2dO4gG0TL00iGm2oHdKcGM6hPYx9mML9COCfx1RvhMI23eCwqqbG
	h4+A==
X-Gm-Message-State: AKaTC00HgaG6/Iq9GfOBl/SKZLWzUZTv697DbNyVLVJtGLWYNbrbvwaAPvk9JOHmTTP1itlB
X-Received: by 10.36.14.21 with SMTP id 21mr27571877ite.79.1480499419615;
	Wed, 30 Nov 2016 01:50:19 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8E1B8.dip0.t-ipconnect.de.
	[93.232.225.184]) by smtp.gmail.com with ESMTPSA id
	k128sm8496953iok.23.2016.11.30.01.50.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 01:50:18 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 10:50:02 +0100
Message-Id: <c63dc6ea022943dd0544b228efec4e8672d682c3.1480499133.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1480499133.git.patrick.ohly@intel.com>
References: <cover.1480499133.git.patrick.ohly@intel.com>
Subject: [PATCH V2 02/11] pybootchartgui/draw.py: allow moving process chart up and down
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
X-List-Received-Date: Wed, 30 Nov 2016 09:50:18 -0000

Substracting curr_y when determining the hight of the process chart is
wrong because the height is independent of the position where the
chart is about to be drawn. It happens to work at the moment because
curr_y is always 10 when render_processes_chart() gets called. But it
leads to a negative height when other charts are drawn above it, and
then the grid gets drawn on top of those other charts.

Substracting some constant is relevant because otherwise the box is
slightly larger than the process bars. Not sure exactly where that
comes from (text height?); leg_s seems a suitable constant and happens
to be 10, so everything still gets rendered exactly as before.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 8c574be..2b5907b 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -415,7 +415,7 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
 	return curr_y
 
 def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
-        chart_rect = [off_x, curr_y+header_h, w, h - 2 * off_y - (curr_y+header_h) + proc_h]
+        chart_rect = [off_x, curr_y+header_h, w, h - 2 * off_y - header_h - leg_s + proc_h]
 
 	draw_legend_box (ctx, "Configure", \
 			 TASK_COLOR_CONFIGURE, off_x  , curr_y + 45, leg_s)
-- 
2.1.4


