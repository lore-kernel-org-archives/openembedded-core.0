Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id ABB7477CC2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 23:35:54 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u48so2014215wrf.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 16:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QQgUQqY0tOAGvTWKM511k3BvkQOy3FgMXkvyAOeIv8g=;
	b=YghV0jQzRaq207bOK4WSSXv96GyxT70uiw16s+ev2AFmgs719LKn+JuUnCyE/0dCR4
	eYmuUKnHSqF97KXvIgOSSJwI5U7EE0c6f9vrymMeh8rwpZRYREHGD+uq/eay5aWmw5q9
	lBm3SAPGoktmhlaM/YacLI/MLttaHq/zekzRA4ejXo/Pqa1+OrbFwBeiPY0awG6598+h
	5kZEpm+1uvUPG9xXKJNEgiTu1WoH039YzRcnlhTrgjfuSlb9HeHERZjotEP7Fw2uqqsC
	L9tyJHmN857qEPfq+ZejT2mUoQqvG3LWkXmAQmz4CoNoqLKNNdOrgljwMy8YVHidIMgY
	i+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QQgUQqY0tOAGvTWKM511k3BvkQOy3FgMXkvyAOeIv8g=;
	b=bpUYNnRf2c6+zAX4Ris5N3r+T5GdbwJdsdOV7W2l8Othjo7yfHt037vt33qPCoeeU9
	9j0sgIWijQ3ZW1BacUBHLWfZQQafb2HkEAw+Rvi2eBuBxMJsx/PJJzzQV+mAe3kXxbYJ
	a141q9sq5tcAhiizp1ydGEIsBWb6BD0pHGf1xGfJWfkBaQkFN7upQpnE9KDSLjRXF+Kk
	hBjZdndgapN7tS+8iQCTZUE1rPPakk8SdPMrUWxdgVG9G5KVu7FhqWEmylZuFdhkE3C5
	rfkbX6qtpWmnjWJvynV3zDaZYNTSwONgqsGSFbtYNh17ariFPJy5bCLSXdshu6vS6q2x
	WBiA==
X-Gm-Message-State: AHPjjUgZ5BdFNiFMC9fNmqyscRx5Z1W+H+1NMcbBWFkWgCi+IXlWWGQk
	HwSe8x92NBKuEKrJ
X-Google-Smtp-Source: AOwi7QDeKe0DE6f+2aKbeB9RWGPLeyxpnXuE9VItnD9578WIP5rrBPZOYGaXJGrDV1ME3DfcfLbK8g==
X-Received: by 10.223.174.194 with SMTP id y60mr11303051wrc.105.1505518555012; 
	Fri, 15 Sep 2017 16:35:55 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host224-10-dynamic.249-95-r.retail.telecomitalia.it.
	[95.249.10.224]) by smtp.gmail.com with ESMTPSA id
	y84sm1340368wmg.43.2017.09.15.16.35.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Sep 2017 16:35:54 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Sep 2017 01:35:48 +0200
Message-Id: <1505518550-13471-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] sysvinit-inittab: start_getty fixes
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
X-List-Received-Date: Fri, 15 Sep 2017 23:35:54 -0000

The tty driver name can contain spaces: the script fails the match and ttyS0
is "respawning too fast: disabled for 5 minutes."

This happened with 'PXA serial'.

First patch extends commit ac0e9541fe93e866e42914f65a0516b993f0cffe
"start_getty: Over added SERIAL_CONSOLE cause error in userspace log"

While there clean up the messages and fix some typos with the second patch.

Andrea Adami (2):
  sysvinit-inittab: start_getty: consider whitespaces in tty driver name
  sysvinit-inittab: start_getty: Cleanup comments.

 .../sysvinit/sysvinit-inittab/start_getty          | 40 +++++++++++++---------
 1 file changed, 24 insertions(+), 16 deletions(-)

-- 
2.7.4


