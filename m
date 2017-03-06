Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8269073094
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 22:34:11 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id 25so71157164pgy.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 14:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=L8pQ907h9DyMxgPUO00Ao7taxoqlDeyH1w0DjBZsnzY=;
	b=gBtrgMY+bL5J9GJW7+YmyVl6eA86bpVsb1nldJoCJHI1jgy9PnBRFRgPbKbeesahbt
	yF+bAx8i491VJA2PNif5NE9J940KsRRFfeh3NmY38+xJB0B13h7u0HMxOig5ax+0Y9/x
	1CylNWbJlW26fJqxoEjfis93QEhhFqA2zgt/th0KFyi5+RVmeXm+Rc5MKUpqD1tpSDGe
	Rd8KTWaUPeL1Slm+1nAIdg0E6QFLqhDH7QaS2DkQh4vIq3kEKW3I2yWGdTVpUzn3nMm8
	daFGVRQFVzequtfbjzJQB3vskok0ZSO2ZHnLj0WlXZurY2h/E8JYD30tUlbUhyQ+qjvl
	Cl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L8pQ907h9DyMxgPUO00Ao7taxoqlDeyH1w0DjBZsnzY=;
	b=rBSYe7vUVD0yRuhRbRf/lFtbIsYUKRfUrb99R16BNvrhGvaHg859K3cwcydnM9wkzY
	SjJbhWB/kb1bUAR8cVFf94/cycn1N8xekmOBFN4n9M9q+Lv+Wmzp440nYN8vlXsMTAhp
	/461CbpiuZhwKRbHGi+7B/1kCg7VB+KOp2labtLK1vnuoGbSn8/rtgVQLTuNSMJmmVOx
	LzCpx5jKjxHissax5bmDPGSVFq6tqYWgAp/rVJLlTRh3CsKis1yTg9joV4LKcXyVcJ/+
	PYx+Yn3ll+/m82Svz2sl8ME1jHj1qvgXVBOi11nP0bRS3ymfJspaY8RtiXx9iXnh8qld
	1Ypw==
X-Gm-Message-State: AMke39nLtwbePK2dNCPSiSyQ6LQY1vUzaOfBuKkvVB+Dzz1S8XHBBGBWYbTZMZuL66t7ZQ==
X-Received: by 10.84.254.75 with SMTP id a11mr29988228pln.57.1488839652658;
	Mon, 06 Mar 2017 14:34:12 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	v143sm41698533pgb.47.2017.03.06.14.34.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 14:34:11 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 14:34:06 -0800
Message-Id: <1488839646-19178-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] sanity.bbclass: allow s3 protocol when sanity checking MIRRORS, etc
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
X-List-Received-Date: Mon, 06 Mar 2017 22:34:11 -0000

Bitbake now supports an Amazon AWS S3 fetcher:

  http://git.openembedded.org/bitbake/commit/?id=6fe07ed25457dd7952b60f4b2153d56b15d5eea6

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 1fe172f..b5f4756 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -874,7 +874,7 @@ def check_sanity_everybuild(status, d):
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
     protocols = ['http', 'ftp', 'file', 'https', \
                  'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
-                 'bzr', 'cvs', 'npm', 'sftp', 'ssh']
+                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3' ]
     for mirror_var in mirror_vars:
         mirrors = (d.getVar(mirror_var) or '').replace('\\n', ' ').split()
 
-- 
1.9.1


