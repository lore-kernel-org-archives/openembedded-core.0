Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 13DF271AB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 15:33:18 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id y198so153976104oia.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 07:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=c9C4CyCc2KZTyk8Wcj/fBwmoHR2T/TT4bV1v6c1NvNM=;
	b=j81ivvatxw9Rhj+f5IAJrqLFVRM0QhiTsnKaMzch613tmZvw3Fbb9NeiPLjBWKqp4n
	PFUX7UMNMs7c2iw87nQnEsr4p1YX4bDKnVWajZ+xuVlmg8uSd3p0XcsE3ev8KQLnA2Zs
	BjKl4lYE4kQR0wWdMsSwC4c6ocMBTer4j43KmVjbwCtKp7vwpvKLagC570sTKvhgnrWi
	ZshK/73YGvo89QueGDXmVVdcNPIdXSOlP3tjHgQrcC6/MumgYjb++6lV5LtceywjXepx
	OhAfiGiAyi5/pSqdG998lMFdBOnlvx+/bNY/VAPqrYzcmCZbGDszdB+mYA7IGJXvKOBb
	7lFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=c9C4CyCc2KZTyk8Wcj/fBwmoHR2T/TT4bV1v6c1NvNM=;
	b=Ta0Y0LvhH1FiJQ6z8UhO7rG7aH4dY6I8kZXaHf3A4Z06PTpEERywaG4Ojdktve2Efp
	Zt+KcwZ8AiAuwg1pn9NmUswWRjTIgNTVRIlrOPVy4oHWMbJHU8OWxCl/j08JYlXqkpP1
	1DjLAE+8YGf5FvlhfzTpDES1acNOuY3qC8Fzc/05T97z8vjMXxec4hrJ85cngAfoLqkg
	h1iyAtl3LyZ1mDtMtDVDTvJalC0F2ehNrCpkvjYgTvh5ImVSwmZsSxbxp1V3lJucuQXD
	XtEZ/BZiK2nS7c2Vr2hKAhzP1U9RJWCAl8IKTl4sNY/7kjEqNkqJ8bJDv5+6T34ixv0E
	NILw==
X-Gm-Message-State: AKaTC003QEG0OPcMx45XuZJsSRXdsPssm8Sqah2X1ab1FGDI5uRU32OumuIBKlMKk1P6gtRZ
X-Received: by 10.36.120.131 with SMTP id p125mr18812139itc.15.1480347199744; 
	Mon, 28 Nov 2016 07:33:19 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8C83A.dip0.t-ipconnect.de.
	[93.232.200.58]) by smtp.gmail.com with ESMTPSA id
	m83sm5332339ioi.11.2016.11.28.07.33.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 07:33:18 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 16:33:03 +0100
Message-Id: <e21db55bfaa4b97647ee46f92946bd9b005e6330.1480346284.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
References: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1480346284.git.patrick.ohly@intel.com>
References: <cover.1480346284.git.patrick.ohly@intel.com>
Subject: [PATCH 02/11] pybootchartgui/draw.py: allow moving process chart up and down
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
X-List-Received-Date: Mon, 28 Nov 2016 15:33:19 -0000

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


