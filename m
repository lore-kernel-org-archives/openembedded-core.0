Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3E63E719BE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 06:11:13 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id i88so45415157pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 23:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Jct3CrnYjujlmfq/jm75djVhYal4gK78jq/a1QbFCmc=;
	b=Eu6M8eap9u9XOQPEB8JsACH1jFlLOUAp9ENWs7OH7q5GL5QhJX96w/nouFyySZEqiz
	zNu8vzbV2TF/rPvbou+ZlcQOQq6WaCNgeKCd+hRoGTTpWiPBPuumm3wK4FKPau42wulv
	4cODw2Az8UreV/44x03bj/xcyl28GM7QVW59E7SRTRyVNyjcNIkvIAWakyV5V+Nzic1m
	jyo/rLstWCyNOgrAFfJFyjyc4LdUCQ56stS0Oc9p3IEmRSo/jg2Z2UevMJq7MXM55SPP
	YwyuQQH1k+BUeDKPG4iqAA7EMcY4EhGl3QyvckUgjjuzM3BWNm1nSQZ+1Q8PyY/0YLkX
	E7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Jct3CrnYjujlmfq/jm75djVhYal4gK78jq/a1QbFCmc=;
	b=Bat5xZhsE9jkG++dMu/19KPzPyRZ0zxhR8r0xb7nqNvZ4sywr4FsIp4X7Sc9iVixam
	4aAfkNCc4QtCFMoQU+aLR5EOHqBJzMZ+Xy0O+MNvNGw7vK2VSm5vsUtT+DeBiPu+tXrm
	3r5VGQfHjYk+6e1Mm8lo/od7oEbuJCMFrNiH5S4vPJw/Q91lYni7Sfs77P+jC0lmwgna
	I04jCVYvCoXhLyq5cROuulYRvauftNEPLdxOi6Jrl3ndBZvyqUm53MCaw6Yo27WqFF06
	TjZuWGNN07CRrqUhO58b6ISuwIIeajQkYX8gApKZreuvLKTRmxMrP8tG5/ms4jr8q/bT
	HWMw==
X-Gm-Message-State: ABUngvel1R+3uUqf1sQlIk527dh6Vt/uDo/ypo31o4aYt37v5p7VJgNt/5zM965xTT8KOr4X
X-Received: by 10.98.129.195 with SMTP id t186mr17863278pfd.64.1478239875383; 
	Thu, 03 Nov 2016 23:11:15 -0700 (PDT)
Received: from localhost.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	cp2sm17060350pad.3.2016.11.03.23.11.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 23:11:14 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2016 11:41:06 +0530
Message-Id: <1478239866-6158-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][morty][PATCH v2] bitbake.conf: skip file-rdeps check for license packages
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
X-List-Received-Date: Fri, 04 Nov 2016 06:11:14 -0000

The license files containing hashbash, print out below
warning messages; if the explicit RDEPENDS is not
specified on bash package. Adding "file-rdeps" to INSANE_SKIP
in global config file, silence these warnings occuring in
other recipes. Moreover the RDEPENDS package will be automatically
pulled in during creation of rootfs image, even explicit RDEPENDS
is missing.

-- snip --
WARNING: hdparm-9.48-r0 do_package_qa: QA Issue: /usr/share/licenses/hdparm/wiper.sh contained in package hdparm-lic requires /bin/bash, but no providers found in RDEPENDS_hdparm-lic? [file-rdeps]
WARNING: ltp-20160126-r0 do_package_qa: QA Issue: /opt/ltp/share/licenses/ltp/run_freezer.sh contained in package ltp-lic requires /bin/bash, but no providers found in RDEPENDS_ltp-lic? [file-rdeps]
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta/conf/bitbake.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 54a587f..5ccaafa 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -830,3 +830,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
+
+# Add file-rdeps to INSANE_SKIP, to solve QA WARNING as some of the 
+# license files contain hashbang.
+INSANE_SKIP_${PN}-lic = "file-rdeps"
-- 
2.7.4


