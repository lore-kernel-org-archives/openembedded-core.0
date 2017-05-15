Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id AC35060079
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 08:32:34 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id o12so69021246iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 01:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=OHZbAuav4A0Xjlw7MJQFVTxQrVhp42gARcig3W44VaI=;
	b=kgJTFF/TOCtHgT/YWLNweMu8lV+qYYG1XNimGloonqGU1F/lgAzgzc5JX/Egpun4Ga
	qZXn2YOISu3FbVNkrQ65EX8j4DHx2m2TJQzPIHSshXCnITXibLZG3XhnOiXssrha+eEZ
	oGUBE9VmUHHxHwLchw/sesSu1+0vWj3eNOOcjMsa3u/+DvfVqNpT/fM4JZoxeZ2oDcqE
	AQ4StNUA4wKrbI9CzGtsSnI1BALqU3tOSBV0UWX3fG9awnpi3yGk2/wjk7pcAzHBAYYq
	8EksCWdBogQQy45XdMBcAEXAHcp5yYt7UvgUER4qBwggPe2qrbt5SYUPx194/Pz5KBU/
	Qvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OHZbAuav4A0Xjlw7MJQFVTxQrVhp42gARcig3W44VaI=;
	b=Ryo2CPoJgC5KlQuXCj6TS2K5dnMhVGSP6/jxwWn0fuVo++hRLbhDTmbjokt8uhH0uv
	UvMVS00Hr4N+pZhY+IQdpyflCTUly0xhWqgsoPnHFU+rqV+hurdDq/APrWTUTfZVWUBB
	Mm5IKBwlZ9uWMj6ABjEu9JgcYipqMdEhZ02ny0RVL9WmjEH9eh0fQpqieGqYkv2sBnZs
	heFmpR+feAH/eQBXeS5Pjl/vtn95Mrk1Iwfb/S7cf9oxidQXik/p1c9eNao4cn0OsH4O
	rlP/yaRhP6ndwCl0305vd3ZvRSHZDXnKKZHZ/IlW7pt+IfG66J8wXhHxscE1xuUdSy3l
	c/IQ==
X-Gm-Message-State: AODbwcBtbbol5XwxXWQwW/EQx1Ald3w3bi/wtuL2isb3D80QqIdhcY7G
	wb4RH+oMXdHps7tj
X-Received: by 10.107.188.132 with SMTP id m126mr814471iof.148.1494837155418; 
	Mon, 15 May 2017 01:32:35 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8F79A.dip0.t-ipconnect.de.
	[93.232.247.154]) by smtp.gmail.com with ESMTPSA id
	r79sm4828732ioe.53.2017.05.15.01.32.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 May 2017 01:32:34 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 10:32:29 +0200
Message-Id: <9f9ebf2e1ba6eda48fb5e3f20d4ca5bbabe3dad4.1494837087.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] manpages.bbclass: avoid QA warning when "manpages" feature not supported
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
X-List-Received-Date: Mon, 15 May 2017 08:32:34 -0000

Activating API documentation with:
  INHERIT += "manpages"
  DISTRO_FEATURES_append = " api-documentation"
triggers QA warnings for each recipe which doesn't have a "manpages"
PACKAGECONFIG. Example:
  WARNING: base-files-3.0.14-r89 do_configure: QA Issue: base-files: invalid PACKAGECONFIG: manpages [invalid-packageconfig]

We need to be more selective when adding the "manpages" feature and check
whether it's supported first.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/manpages.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/manpages.bbclass b/meta/classes/manpages.bbclass
index d16237b..5aa1d1a 100644
--- a/meta/classes/manpages.bbclass
+++ b/meta/classes/manpages.bbclass
@@ -2,4 +2,5 @@
 # depending on whether 'api-documentation' is in DISTRO_FEATURES. Such building
 # tends to pull in the entire XML stack and other tools, so it's not enabled
 # by default.
-PACKAGECONFIG_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'manpages', '', d)}"
+PACKAGECONFIG_append_class-target = "${@ '' if 'manpages' not in d.getVarFlags('PACKAGECONFIG') else \
+    bb.utils.contains('DISTRO_FEATURES', 'api-documentation', ' manpages', '', d)}"

base-commit: c59fa3bd71b42410bf032846ee8fdb6e6eb1b95c
-- 
git-series 0.9.1

