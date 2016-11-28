Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 605EC71AB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 15:33:34 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id c21so228978792ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 07:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=igo2ZzA2JIxA58IUph6tUOQD0vWM6ulxdBkXK/eBVl0=;
	b=L3PuiXwz8oK9vtr1FYQLGIXk7kkYF291b0gr7u6hieluw4jiuG61Gx/OoPAFkeIZEQ
	hjW38o8b8vcQGMBfoE4PG/pfBdRCB1VPdrGvbgEzNcnmvktbiqlewiCgsHJZarNttm4E
	U6xdfdDpTAjd7rvfsflUdsXdYu4LM9+co1aN/fXt2+S+pgYVXTto0QBamlWPzlsHSWAU
	xX4lNmXDtNgjyLvv1ka/Yq4S415T79Pg2235L2WoX1CFd6q0n64krlY/1/6HbW0Gaq7R
	MvKfmkNXIIFX/a7auemL3Tc5+zSrbcjH3C4js3VAXbVvbooKijgpstYBM5iH3f5aSbff
	E9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=igo2ZzA2JIxA58IUph6tUOQD0vWM6ulxdBkXK/eBVl0=;
	b=TJZLn+YxJ3TA+Y+aQqe1aEX8aa04ZIwYOR8hpvurEzlosqiK1+YidtMDk9iBtuNTIu
	e4/BEhs/tPe1vCK7YqVBxm3VUjrdkF6Yy4UsJmW8UJ3vlNKnPOyBof6EcXzHUhqcqSyt
	naI9flI3s7/vWa+6rTEprKP1GAUycQXI5JqpEblvu0lG5GdK/+Rm1/rbXVwFjM4HE39v
	lk2yejhr821oYRGFQUs35LOUbqiZLPzUnHDfGpYY0BFaIKkKahi72/uPr16p3udtqlP5
	Ug4VIP2bLZQssqjc2eC/G1A/DpkYGYwGVAg8tE6S8uUB1vvnnzoVmBpkNU2YXmnfLiOR
	17rQ==
X-Gm-Message-State: AKaTC03nFKCW5RwuSUt5kou6GlQtAMWZwhdICJGw1fCCrM6+RT5mj5kELQMxREc2+2ZelsOw
X-Received: by 10.107.136.24 with SMTP id k24mr17156502iod.217.1480347213582; 
	Mon, 28 Nov 2016 07:33:33 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8C83A.dip0.t-ipconnect.de.
	[93.232.200.58]) by smtp.gmail.com with ESMTPSA id
	m83sm5332339ioi.11.2016.11.28.07.33.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 07:33:32 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 16:33:08 +0100
Message-Id: <a9a3a13d0da17cbd58c4e5c940617d04507ee53a.1480346284.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
References: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1480346284.git.patrick.ohly@intel.com>
References: <cover.1480346284.git.patrick.ohly@intel.com>
Subject: [PATCH 07/11] pybootchartgui/parsing.py: fix error handling in meminfo parser
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
X-List-Received-Date: Mon, 28 Nov 2016 15:33:35 -0000

When matching fails, m.group(0) is invalid and can't be used in the
error message.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/pybootchartgui/pybootchartgui/parsing.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index af68435..48eb048 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -498,7 +498,7 @@ def _parse_proc_meminfo_log(file):
         for line in lines:
             match = meminfo_re.match(line)
             if not match:
-                raise ParseError("Invalid meminfo line \"%s\"" % match.groups(0))
+                raise ParseError("Invalid meminfo line \"%s\"" % line)
             sample.add_value(match.group(1), int(match.group(2)))
 
         if sample.valid():
-- 
2.1.4


