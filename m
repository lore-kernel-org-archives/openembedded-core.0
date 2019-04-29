Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4CFDC7DBCA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 14:43:40 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id l2so783123wrb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5X5zuiBSjmAQQKyGIh89LEnQR3l/D6PynGsHnhXnAPc=;
	b=SawKq+hsVcgMYamOPv3JticoCHYSfinHm17iERQwmRK5dGRZhBXug93XmwOvn3W3W+
	mnhq7UD2NniTDPCb/GPCB6o7lsmjsmk4kxTvjQiaU9VSXScfJY5EzoLoA5qYyB/ZtO3q
	Oyfp+xCxuwk8OPD4bUG2p853ZSC5DRozx/SxBDjGqYrYm/BSCiMjk24laDlcZcMS7rEj
	N9XVLt/0qJK9s7HCjSYkHrvZZ1Qbm1JfMWJ4qDZtP7zxswEXNMXXKehaCcs2DFsdCh2n
	yOXJK/n+J9Are5NM9ZNZWAPINy1QmCJHYtlgXqkHrahHvGQe+axJ/N4k4uwjiu+1HIpq
	9FOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5X5zuiBSjmAQQKyGIh89LEnQR3l/D6PynGsHnhXnAPc=;
	b=YHtZJcxjHZzpEGJh9T/hn2ui9zZrCSs1VgAg23+U3n+iAmX0wffLhGgkTz+chLV+V0
	2CjJ2LRhuShNHIfPEQj3LICcCAyIbcQHZOArLOcpewWmBvn7ody8vePE9QwksVL6xtz6
	E2xQzgR+qOBhG+2X77GMBRV0Ennqm4G/eZIsIo4lu3b88N526H022qO1e9PlqQgpxFpm
	K9wDR6bya86qHTf7aftyG+yAr2g2xwR0KIjSvSFGECR42mz2abINuBoX4oIsOjnwlq2i
	Gu+BYZ8IUXBq3yc7o/gAqnvYhH/tjS+PjJkDta9LKvGmXzD+WENaLlNetTxGW321dl0R
	vc9A==
X-Gm-Message-State: APjAAAXBMOxLYgKAiKVhOvk7i5MoUn0VlL0dyOvlU2pM/86pD205L1eZ
	w1Sb44PYvdleyR+/h1dXNyg1bX67CNc=
X-Google-Smtp-Source: APXvYqySSQxPrBH9/nh9QAGiMEz4a4v1HkV4jhBpiw+K8wRh4P76RFUgmQRaY4FfjW/owvb0+WhcRA==
X-Received: by 2002:adf:f88f:: with SMTP id u15mr21155091wrp.155.1556549020799;
	Mon, 29 Apr 2019 07:43:40 -0700 (PDT)
Received: from localhost.localdomain ([89.197.133.108])
	by smtp.gmail.com with ESMTPSA id y70sm9452860wmc.8.2019.04.29.07.43.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 07:43:40 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 15:43:20 +0100
Message-Id: <20190429144325.63744-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429144325.63744-1-alex.kiernan@gmail.com>
References: <20190429144325.63744-1-alex.kiernan@gmail.com>
Subject: [PATCH v5 1/6] systemd: don't build firstboot by default
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
X-List-Received-Date: Mon, 29 Apr 2019 14:43:40 -0000

From: Jonas Bonn <jonas@norrbonn.se>

The firstboot service prompts the user for information about the host at
first boot.  Systemd determines whether or not a boot is a "first boot"
by the existence of the file /etc/machine-id.  Since oe-core always
includes this file (it is part of the systemd package), the firstboot
service never runs so this service is being built but never run.

A follow-up patch to this one will remove the machine-id from the
systemd build and allow it to be created automatically by systemd at
"first boot".  With that patch, we don't want the firstboot service to
suddenly start being invoked and presenting a prompt to the user.

With this patch, the firstboot service becomes a PACKAGECONFIG option
that the user must actively select.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v5:
- rebased for systemd 242

 meta/recipes-core/systemd/systemd_242.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 33d3e0b000d9..9f194f2b6ca1 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -66,7 +66,6 @@ PACKAGECONFIG ??= " \
     acl \
     backlight \
     binfmt \
-    firstboot \
     gshadow \
     hibernate \
     hostnamed \
-- 
2.17.1


