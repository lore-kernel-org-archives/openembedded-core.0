Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1CDC871A60
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:50:27 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id m5so201450804ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 01:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=igo2ZzA2JIxA58IUph6tUOQD0vWM6ulxdBkXK/eBVl0=;
	b=F7w0QQPjDd/OI+rLoxt2SN9bfIelvVqEIrJebCGSphdtHAWdKL3+hAIvz0oC+ozAM6
	YHUVJBh52dU5hwLTU9xkyr2iFgKHaaw1rGpa5lrdTSJxwid5RBPtAtX/SzahyGV6lIqB
	SAhZqlS8XOdmZEL5aDZ1zaXHB+pDzLZBmMHuSBpKNuLah7/Vz4sEPiyvgbNe2Hg0RhWJ
	GJls0B0vXxqWp0HK1K6d+Akkp4f39SMLpk9lOQwaL7f0+MW2FMXEA2ZgmoSnm+XqFyOT
	z1sz2asMjRMNVM2Dplt3zdRwLosqfZY/THtXav3k5Fvj3XKYePOPNQ//GWwEt8jepfsl
	buQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=igo2ZzA2JIxA58IUph6tUOQD0vWM6ulxdBkXK/eBVl0=;
	b=dmx/YKUyO1tGtdM9fh6mLdZmPp8tLJ/xRrfYpi+Eo9IEHnGNaM40KOaTik+NJ3g3Rv
	T5gGkEMnJ2a2IsdYCRqPKTQm5NjYwMQpkLQ7Cbe5MEEfW219+3Q4UfeJjudYEaDuiP/a
	qSvLaTBK4cr+yt1xDDDnqm1Tkb7dFHb/edzwpf3V0OYPtVpocozxUkdD6gJhtXKlnywz
	oJaMEUtxlDC9qaI2b+4N6zHmHRD/uLrbvxe0E6RYp0ew8OJAHwyUSilRisAyd8B4IaL8
	HA17iq3NU9SVDj1z+fSu4Np29B2m8e3F+9Eh/x/4JMtvC7MmUed+yRsFwLYGZWdo6k0V
	p6fg==
X-Gm-Message-State: AKaTC028SEphXP7jfqQhMoJoAvTV0qEKIH2Ck3/iKNdoWiqi/JdFNLsHZs39YLX6vZM7/MQD
X-Received: by 10.107.175.94 with SMTP id y91mr26635642ioe.86.1480499428735;
	Wed, 30 Nov 2016 01:50:28 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8E1B8.dip0.t-ipconnect.de.
	[93.232.225.184]) by smtp.gmail.com with ESMTPSA id
	k128sm8496953iok.23.2016.11.30.01.50.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 01:50:27 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 10:50:07 +0100
Message-Id: <5d235b54236bbce9f33bfb36aa832301df6315bd.1480499133.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1480499133.git.patrick.ohly@intel.com>
References: <cover.1480499133.git.patrick.ohly@intel.com>
Subject: [PATCH V2 07/11] pybootchartgui/parsing.py: fix error handling in meminfo parser
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
X-List-Received-Date: Wed, 30 Nov 2016 09:50:28 -0000

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


