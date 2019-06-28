Return-Path: <jean-tiare.le-bigot@easymile.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 431937E99E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 10:14:01 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p11so5667815wre.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 03:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=easymile.com; s=easymile;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XFq3/T3xgj4Ac9Qvs7m83YqXni/vlP+gQ2uPnzKwkp8=;
	b=K16Q7pVOIyHW5ccjrABS7NcDHYBJvCquywn4M0LHkn0Szr5tNQkaqB0BW0qYK3cHuG
	geMaYr6BvE1IVDKCvbH8R6cU6GYtGBNwzhcInPGpAbsurnAXaZcIw0tZ8vjab3Ziy+7V
	+P2rrvpa75D1S2S4FMJ9E3HR4apb+1Kdwbf3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XFq3/T3xgj4Ac9Qvs7m83YqXni/vlP+gQ2uPnzKwkp8=;
	b=nNXMds/ttcU3Yu9ht3l+YaInTBGrj02QDatGnng6hAtKoBuqW5c9OAQWSnEtBiUKPv
	S5EXhMrVmNkjXqCXAawSmYstc3D4nX23HHZ+ucQAmwe1IihuXcInNsJWFtKvMk1RvD/I
	0g29wCZHZlyzbrnRmJ8w5uXt7yxq3VzBkbTdA3i+bK6svCxBO6ZJIKmbSzwS0H4XA83o
	6Z5jjMGO1a6qJRx7FzQu6jiMqoo65zRnwfG7QAyIWAH85RRnt0zef7VY35XrmA5L1aiu
	ZeFQz7/ZV9opQcDyxlg0vYJ627O3cT4yxe5Pt5ELKeNL/w43yKohUptmw9pkoT5V0wiG
	z7EQ==
X-Gm-Message-State: APjAAAU4d2lfH1CVbHvcUgxzznwd4pnHP/mEh9bSnVR1tUtzkx6Tvjtz
	rllMEnOh8evnSKh8kl+8lcAtgIoVajIXcA8K8sRdzRxJgb94SMZ/F0DIpJTWhEtVmzjJRBvUBoc
	HzbM7M915Rm5+zr8th5L7r0inZd1A1WL2Ag09wu+2Uqcon9gaPz/JJuFRS+C3RG7mRYM46RlDSx
	3UgEHcyLsSpwGnrnFCO/XU49bGB+b6Tnj+
X-Google-Smtp-Source: APXvYqzNepQz+9285LqHFFDhL0/x47WbtYT8mQtl2wy9W3jbqvYbZwMevCNKi1eLjHHdv2qzFx6Deg==
X-Received: by 2002:adf:b605:: with SMTP id f5mr7703819wre.305.1561716841824; 
	Fri, 28 Jun 2019 03:14:01 -0700 (PDT)
Received: from localhost.localdomain ([185.116.129.142])
	by smtp.gmail.com with ESMTPSA id y6sm1720059wmd.16.2019.06.28.03.14.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 28 Jun 2019 03:14:01 -0700 (PDT)
From: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2019 12:13:53 +0200
Message-Id: <20190628101353.11933-1-jean-tiare.le-bigot@easymile.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Jo=C3=ABl=20Esponde?= <joel.esponde@easymile.com>
Subject: [PATCH] package.bbclass: fix directories setuid and setgid bits
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
X-List-Received-Date: Fri, 28 Jun 2019 10:14:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joël Esponde <joel.esponde@easymile.com>

populate_packages relies on ``mkdir`` to both create a directory and set
its permissions. However, ``mkdir`` honors the ``umask`` value.
Therefore, some bits may be lost in the operation. In our case, the
setgid bit on the directories were lost.

This commit fixes this by having a distinct call to create the directory
and to set the permissions.

Signed-off-by: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
---
 meta/classes/package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 20d72bba79..cd223a121e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1216,7 +1216,8 @@ python populate_packages () {
                 src = os.path.join(src, p)
                 dest = os.path.join(dest, p)
                 fstat = cpath.stat(src)
-                os.mkdir(dest, fstat.st_mode)
+                os.mkdir(dest)
+                os.chmod(dest, fstat.st_mode)
                 os.chown(dest, fstat.st_uid, fstat.st_gid)
                 if p not in seen:
                     seen.append(p)
-- 
2.19.1


