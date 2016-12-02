Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 18EC471B01
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 14:01:07 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id l20so27541423qta.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2016 06:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=CnzllhFV5uRxTYGMHJSJdILMYb7FuwEmJqk+ldfX+FY=;
	b=v9nvE7lRnv7yflEhvzyecFkKVCCNb+fR4NlQJhrK82J1bVVjpMtWUh6s8lhDZZ0pLT
	+rLuOypMefJo2dOvemEfHiqiT0JHcinHxAqiz4lyAz4IBPxxEw2KQaIMN3JdcOySd1Ht
	M5YWVhq+Rn+ojL62KqIkKSs8bhbEV/+bHo8msTeYBkGw56D2m1wT+hhFLvOwFa+RKa7/
	Jz8ECI4ggNdoeiRQxNOf/okGjkYA9JcWl1sXrLjjOFGHTdHPb8FB8hBQ5u6X3VA7qVH6
	y6hTel6UdqGgaJ5WkgIovWV+Xlx6ViP5k1irnYEV4vEuOfcw0R5MsuTPvwkojzvcOfso
	L/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=CnzllhFV5uRxTYGMHJSJdILMYb7FuwEmJqk+ldfX+FY=;
	b=eXNkd/96v+iKpQ033oRP5bcXZu1oKWRiXxtcXDpmlge4arTFQIEZ0ZhHQ1cYB27Ncl
	WERAFulGBcRr1List5psIpCi3DyWWYcwtC6zhYxWekMzTXtvXlW8KSkeBWPNJBmVtGc9
	cYJxAOmb/lQjJ9Khvv+CoIn3gzJKpHHEuyekNWOOIYFNMsVqsHL5qpKtxsgMH0RFK2e3
	DcqDCjPNyhblc8OtXZ6M+G/Mz7A+ZLatqQVAyAbCHx0sIGYGuXLAOlkMRs18HU+d3taF
	5FrmoLFSGmCJvenphaeOh2a1UCLdUZ8EqGF3KOfudgp+cO/MkxD89uAScXoOqqAFt61o
	mlUw==
X-Gm-Message-State: AKaTC00Y0i/tD9ZXbKVY57QtTmT/qg17u7DcSbfEGXEmRL5/aiEqIFzqB4NVsz/CgiJtuQ==
X-Received: by 10.237.59.119 with SMTP id q52mr38163055qte.225.1480687269103; 
	Fri, 02 Dec 2016 06:01:09 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id 53sm2639333qtm.5.2016.12.02.06.01.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Dec 2016 06:01:07 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2016 11:59:52 -0200
Message-Id: <1480687192-4813-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] u-boot: Add RPROVIDES bootloader
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
X-List-Received-Date: Fri, 02 Dec 2016 14:01:08 -0000

This change allow to install u-boot in /boot partition using
MACHINE_ESSENTIAL_EXTRA_RDEPENDS variable e.g.:

MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "bootloader"

This is usefull when system has only one partition and u-boot,
kernel and device tree need to be installed in /boot.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index afe3fe9..3676158 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -1,5 +1,6 @@
 SUMMARY = "Universal Boot Loader for embedded devices"
 PROVIDES = "virtual/bootloader"
+RPROVIDES_${PN} += "bootloader"
 
 B = "${WORKDIR}/build"
 
-- 
2.1.4


