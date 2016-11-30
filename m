Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 17E8371A98
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:50:19 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id j65so339549942iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 01:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qBANyFlEYkraWlwBgQG2WohJxo9CaRSp6efwg7u5BA8=;
	b=oxxLEg7M2su5Unz3V6jy9SwouXP08m++D8R6Djdtylhs4UZyYUFVeheivpW/zcMeQ2
	NuTf/HdgAnxRl1W/7ATfrtVrbrifXtXNMA5tS99hSnIXqFswQiRdGT0fTh1pFHk/aJlB
	Mg1KsqOQx4aNlWQyh6vZW3W5Cpjy/zR+3voitbt3NCk/B9KShZUUL6GbmH9hCOJjVwNA
	QS9VTd/08f5UFa4zS0swwZ313378W9T/pMk7TxMCxgAxaa2wUefgXz7uX4DlSdd/7wji
	QxjBdnb2rY3664U87VLilgu/sPGXRjbaTO0SL4njcD9Fudl4wZTJwks6f4iQOY8YZopF
	bhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qBANyFlEYkraWlwBgQG2WohJxo9CaRSp6efwg7u5BA8=;
	b=EpYmSxUuS7B8r6WR1Ovw4U+MRYmeenylI9GpIXDUBIZzPDK0BQTGguq3q7bb3XFu3v
	kGFakt2A1cTELyaAm8UEcFi1SLucEtAqZprJASNfnXNh+tBmM1evifFwKRu0DtSYEKXX
	spVhGdjjv8TmBkLRy/MzktaEWh/8Da0OGv4AnLPohOk7kbANqNJanapc+jP02kqlFmpO
	eoiaoDBK9L+fDh7ihNIM4GLSdpSjG0gkyN0I/YdYg5UAcAYZ2QPCYwZcB9mGrK2P04Ni
	uE5lae9YhBD4x0dRBaHyAJXWcomspg5kCMRYZaV1n16G6hP8T1Pk8JWzqzt5rKlXy0VN
	/MrQ==
X-Gm-Message-State: AKaTC03NPPcUTNwGc8a8p5AqLbOzYOUjsDew+aiN3ugwelLGPR80XvaAYhiJuZG14sdkV5hV
X-Received: by 10.36.159.193 with SMTP id c184mr28156895ite.72.1480499421335; 
	Wed, 30 Nov 2016 01:50:21 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8E1B8.dip0.t-ipconnect.de.
	[93.232.225.184]) by smtp.gmail.com with ESMTPSA id
	k128sm8496953iok.23.2016.11.30.01.50.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 01:50:20 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 10:50:03 +0100
Message-Id: <a6d2c9b60698e00a44a535fa7f0e7c4d0485661e.1480499133.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1480499133.git.patrick.ohly@intel.com>
References: <cover.1480499133.git.patrick.ohly@intel.com>
Subject: [PATCH V2 03/11] pybootchartgui/draw.py: fix drawing of samples not starting at zero
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
X-List-Received-Date: Wed, 30 Nov 2016 09:50:20 -0000

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


