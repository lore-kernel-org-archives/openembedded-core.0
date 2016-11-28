Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id D09F871AB7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 15:33:20 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id v84so153521722oie.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 07:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=qBANyFlEYkraWlwBgQG2WohJxo9CaRSp6efwg7u5BA8=;
	b=TG3FvvbUy83ykhw3U+yepKPpq09c4lwFMiIAerKibCV8cIkco6HnuoZ9Q7mxxGN7wM
	0eXtZLAdDozSIaxHWxdaHvvBpf0KDW7UvPahPfmYi9kx8X05JuQ+4rV/brPZwTaEb2/Z
	vq2lWMP3NORe5VNti6N96DonZM+SJ/MlBggaZQIZPU0ESLbTM09fRrYWt4R6OITtqTPK
	zA8k/DcWafCeS31IyotmFJkvf/n0yhppnX27DkzH3bXI5ql2C1pqSQLNlK2tMhIouTn6
	GYbdu7eA0G45J0X5bjukTtIoIW1bSiXMW/aJc0rvjV9cBiKdwD115zzmAl/zmu9dNcOd
	lurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=qBANyFlEYkraWlwBgQG2WohJxo9CaRSp6efwg7u5BA8=;
	b=A691GIEOx6aOiApWPa3qxZGR+kQmf5PfS680JqLgL3pf2pBfHpsqhWbZgz2EBZ6Mkf
	QX+zy1Oltu31mSyT7HEQE0FnRSwPuUXqgbmk+lKBQCQBrcHoIFeJNAa2KhwZu2jhlPFF
	Z9Y5YrrucnZmz+HthzstQRuqLz+2SWRNWEV+B+YfTU7KcEKkO4slbc6Jdf2Q1V4nPaPh
	KfPPY+/QxdslZF/TGGWmn2CToCuAnvKG709ANXTRK9sy6uFLE/WmYQrownwDbawFFuC5
	hQhjq3ihjilyOAvjRkDxfgY+HX/ThIXANSzv2FN1shiyrEm3VxmE9cwt7gyn+GEdxX+L
	XLEw==
X-Gm-Message-State: AKaTC00dmhsEs7xIVRVtwu9EKeAspxjaSwRQ84/LI+4fHxwwfSrro8bv6Fg2iPBpuIvHRCos
X-Received: by 10.36.249.203 with SMTP id l194mr18535300ith.19.1480347202458; 
	Mon, 28 Nov 2016 07:33:22 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8C83A.dip0.t-ipconnect.de.
	[93.232.200.58]) by smtp.gmail.com with ESMTPSA id
	m83sm5332339ioi.11.2016.11.28.07.33.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 07:33:21 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 16:33:04 +0100
Message-Id: <c2539311db8ca7987c951199487741f7fb2c2c71.1480346284.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
References: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1480346284.git.patrick.ohly@intel.com>
References: <cover.1480346284.git.patrick.ohly@intel.com>
Subject: [PATCH 03/11] pybootchartgui/draw.py: fix drawing of samples not starting at zero
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
X-List-Received-Date: Mon, 28 Nov 2016 15:33:21 -0000

The code did not handle x scaling correctly when drawing starts at
some time larger than zero, i.e. it worked for normal bootchart data,
but not for the system statistics recorded by buildstats.bbclass.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 2b5907b..925002d 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -256,7 +256,7 @@ def draw_chart(ctx, color, fill, chart_bounds, data, proc_tree, data_range):
 	# avoid divide by zero
 	if max_y == 0:
 		max_y = 1.0
-	xscale = float (chart_bounds[2]) / max_x
+	xscale = float (chart_bounds[2]) / (max_x - x_shift)
 	# If data_range is given, scale the chart so that the value range in
 	# data_range matches the chart bounds exactly.
 	# Otherwise, scale so that the actual data matches the chart bounds.
-- 
2.1.4


