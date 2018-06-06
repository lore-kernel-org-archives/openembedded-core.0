Return-Path: <danismostlikely@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1D0E9754ED
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 15:24:44 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id d8-v6so6757217wro.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 08:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=vQkXlYJC6w55Kbivmviz5nZWS3KDM3yGm1AR4nh2oEo=;
	b=I6IJ9eUMbeYBk4pmhd6pO9GwgaMVJUDPYSCC1Yir2BZVWTO1BmEH7OIWBiuD7IhOGt
	Su+yGr1J6um/T5sKOGi1zslXv71LPbfiIDJIvA4iwALv6Qz9eJ3Gd42UE3m71ccmJ6fU
	pVC68yvmw5WPlbup9Orl8ex/kQ1ZhDMtyEwADnRJ88vLi9oXEr4tG8RXVMOhxYMOyjzU
	D/sJH0K4WwF5H+natOUTu6fLhnkmB4LEPH3RN7FS6RL9YzSzTZ3y9NZB1OfHlVs0BRai
	G1bLnMblCaN9a1zmw9v1BFW2sAOuBt7Rq0syYTyTAT8JMSOlmdHzw/VplT8CHimlu9MF
	789A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vQkXlYJC6w55Kbivmviz5nZWS3KDM3yGm1AR4nh2oEo=;
	b=C1b0QSD+XhBo3bO2gpEqFGR2lPt+HllbgUhlKyEoJE9Y6goc1WtJ6EC5Kmd/Af+B2v
	vSUpqaBUOvpJo2BTIwbypsYBGaj5bw51xaDlbSZyycyUlO4FwaqGLoh4wGQvmIDlxLZV
	JNm7kXTNVaCIYDu/ng3KKVG+oenPLNHYj/e3nfdeb6H1pZgohqW0o+8P0LTf7XnF/0R7
	7exK/BsZBNiYJ4pllhhaWhNu2d8YpxG2H/QiPYDFlMm81ab+zH5O62nBhMSU/yY3JShr
	0W5wwibmMq99Wg25JQ48klRhdqhKToT++gTL09kAYhVvf17b9r0WL1Aez0OUF3j/hoE4
	9TKw==
X-Gm-Message-State: APt69E0j7DUzBuj9/OyElc7M1a2YvE+sprmR4BUdUPZgz4piBWCFsR1K
	w57OCSImOY6eIoegzDOP7wcR0pW0
X-Google-Smtp-Source: ADUXVKLwJkQhzVOhkddB6aBzieSVZbjzZ/iMWVPwk86fwb4UpcB7YGM/CoSoNnx8EvHys9z+0HoDRQ==
X-Received: by 2002:adf:94e3:: with SMTP id
	90-v6mr2656142wrr.110.1528298685376; 
	Wed, 06 Jun 2018 08:24:45 -0700 (PDT)
Received: from mediabox.local ([2001:470:30f3:1:922b:34ff:fe5d:d4b3])
	by smtp.gmail.com with ESMTPSA id
	c131-v6sm4565993wma.41.2018.06.06.08.24.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Jun 2018 08:24:44 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 09:21:19 -0600
Message-Id: <20180606152119.2651-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.18.0-dev
Subject: [PATCH] systemd: allow setting time-epoch to epoch
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
X-List-Received-Date: Wed, 06 Jun 2018 15:24:45 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

systemd by default sets the system time at boot to the date of its NEWS
file. It provides the option to change that at build time, and some
projects need to come up at a particular date if no RTC is present.

Provide the option to set the time at boot to the epoch instead of the
date of the NEWS file.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/systemd/systemd_237.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index 2e6558ded13..a7b9595bb47 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -155,6 +155,7 @@ PACKAGECONFIG[seccomp] = "-Dseccomp=true,-Dseccomp=false,libseccomp"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,initscripts-sushell"
 PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
 PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
+PACKAGECONFIG[time-epoch] = "-Dtime-epoch=0,,"
 PACKAGECONFIG[timedated] = "-Dtimedated=true,-Dtimedated=false"
 PACKAGECONFIG[timesyncd] = "-Dtimesyncd=true,-Dtimesyncd=false"
 PACKAGECONFIG[usrmerge] = "-Dsplit-usr=false,-Dsplit-usr=true"
-- 
2.18.0-dev


