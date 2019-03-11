Return-Path: <yann.cardaillac@smile.fr>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id CC2E160721
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 12:08:38 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t6so4791299wrw.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 05:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=smile-fr.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=17uIGR5YHKUdvNno88NwHh4NOPTtdoKg0x2AH5vKZYA=;
	b=SneVeGCNH5xv6AtwZhia/7odMXlxWhC80eii5xjfZqiLJ5UlNei/3P5p88QGhXmnTR
	0FSbzXxXrpD2LFoxt6FXGe06KPvkOnskLTZXKQUf8SfQ2D7RpqCuhh+dt6fTXQPnywVn
	h2nsZ/EC8lJa4jCWN7CNY324CiNAN+o1Bu1CecKWNPAbYDBZ2OCa0juo1EsAfWzH1sFB
	+PZpisF/o9FtaUvSsVhNU61RXpG4EtXmmYet1n12tnJwzKJxFVORoqMaZ8Soxbp4xi7n
	f59dWIk30Pm4bzFzgvDyFz8vThCkR39PFSRcv7nadcwbenOhKdNyCepvO0c/by96Tyln
	a3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=17uIGR5YHKUdvNno88NwHh4NOPTtdoKg0x2AH5vKZYA=;
	b=bMRW2WOn/vee85Unkb21rzpV2YD8GEUwfMR3hvB9akOyjFlKHlo14cCqm89rE/CMYF
	D6B+rifqM/ORkXccMn2V4pJzXamVqQIY8PKc7javpmcBkgMlifN0aWaIRN/uH7iybuKd
	I8rLr2ppVDk01qe6KGAlLhhNQrad6u2H3gaSAs77Uws3n9lKLU8GO7sx7Guv8Y4zMf4n
	J6vNdVtNr6PJjc/wrVN2jS+3R63pKDOGLdD4z7KW3n6CKkL3LAlrEAfV0dZgO4OMCYuQ
	OOn1KCJZ4j0E/Nf5fh18QYoDPc/wUc4c+BeqDmUf+1SGpoG3At61AvKUNc1Wjq98K5nk
	uqOg==
X-Gm-Message-State: APjAAAXb0DKo1d3wmn8UAqnN4avkf3BssUOviimX86D18t/pgGAsS3JQ
	JBIjxhMzT/ZnhT/UaSSurrp/sithmyY=
X-Google-Smtp-Source: APXvYqw3S+khizr6EXfDtGsfg+hF1d+WaM+JmV+XQelleRpqBbhcYZf0/9DS0wiRthc9mC0i4DiGtA==
X-Received: by 2002:a5d:538a:: with SMTP id d10mr19829127wrv.121.1552306119408;
	Mon, 11 Mar 2019 05:08:39 -0700 (PDT)
Received: from P-ASN-Panpan.dhcp.idf.intranet
	(static-css-ccs-204145.business.bouyguestelecom.com.
	[176.157.204.145]) by smtp.gmail.com with ESMTPSA id
	d15sm15966080wrw.36.2019.03.11.05.08.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Mar 2019 05:08:39 -0700 (PDT)
From: Yann CARDAILLAC <yann.cardaillac@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2019 13:08:37 +0100
Message-Id: <1552306117-28437-1-git-send-email-yann.cardaillac@smile.fr>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] correct do_patch for kernel bbappend in sdk
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
X-List-Received-Date: Mon, 11 Mar 2019 12:08:39 -0000

do_patch rule of SDK's workspace/appends/linux-*.bbhappend may fail if script are not written in Python

that was the case with Phytec's BSP, the fix was to replace the do_patch rule with :

do_patch[noexec]="1" when the file was generated in scripts/lib/devtool/standard.py

Signed-off-by: Yann CARDAILLAC <yann.cardaillac@smile.fr>
---
 scripts/lib/devtool/standard.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index beea0d4..810d12f 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -761,9 +761,7 @@ def modify(args, config, basepath, workspace):
             if bb.data.inherits_class('kernel', rd):
                 f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout '
                         'do_fetch do_unpack do_kernel_configme do_kernel_configcheck"\n')
-                f.write('\ndo_patch() {\n'
-                        '    :\n'
-                        '}\n')
+                f.write('\ndo_patch[noexec] = "1"\n')
                 f.write('\ndo_configure_append() {\n'
                         '    cp ${B}/.config ${S}/.config.baseline\n'
                         '    ln -sfT ${B}/.config ${S}/.config.new\n'
-- 
2.7.4


