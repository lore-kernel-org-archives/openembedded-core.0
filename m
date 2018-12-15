Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0F15C7BE0E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 12:59:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j2so7953949wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 04:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Jgpx771pMopwyATDL3YjMAdTTGo8N+rYFBX4SIMzLzQ=;
	b=O+pcNmCdGe9JkXyoQL2kRXNRd38KHSiTnLpGnntwoPcVc+QB+DWLx/riEyM/4IEGs0
	owT06u7GEJa14syRmYcgEW1MuBw/7TAuFIs6iKULm8XzY+VLomAZGGmDLObawx6M9dc3
	QM2Dn7P/fM1vVM8kMMTjZWemOz/fxj2yqiiYEkoHNVfqx/j7cmAfHO+yyeVFeI4SRRIv
	QJDVj6TCQH7IZdG/AW3ZeOWYjV5vqqS12M8QQzvvPvt7do3GNLukKmmzjjngtbyOAWNa
	j2zMQYFhZRnQZG0FSCLm4OphBtTdpq7KTkCUa8mUMBJCGBkZ0xLtwlgnMq14xxDY8uaU
	fYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=Jgpx771pMopwyATDL3YjMAdTTGo8N+rYFBX4SIMzLzQ=;
	b=hqMq6hftA0gmHXaKg3yl+3hm5srx3zlDrVB+yPPCW1APDs0L4zixKWSNP+tU7wiufw
	qFd3ExiNQr044xQyDNwprf8RFBViDFJ9Gq2ku/Xb3KYa96fVIN9nzEpM/WugPtWsjFnY
	MyZf9zoCGqc6KjfvK0eBV1o2d16TbbSvHvqr1ZCHge+xvXU6W6n/pClrQtEcN4BHGsfp
	fqO47W+aG3znvP35B7LFhQKGZJsdHk4WyJw2wThe5NatCR0o6WU9WYB6i6+94mePum3p
	ax9WQgTPCFR89GmVI/Lhid/R4LbuV2KLoesqzgJSHh6UbtE0Y7937xPWmute5pqVkWzV
	NjiA==
X-Gm-Message-State: AA+aEWZxUB/hMOkShw+Ksl2CrH9lmJgo2PmbRJoW5ahI8kYEmF6ZXp6F
	QcJ9pm7HVe1Y/jxCJm/jWUVmQko3
X-Google-Smtp-Source: AFSGD/XYggN45MJELqncCc9tGIuEj0k4aLc5vfeszAgQor9gGIC5w1Wck0iKxV/d6s7AciZpliuYMA==
X-Received: by 2002:adf:c7cc:: with SMTP id y12mr5704662wrg.52.1544878772411; 
	Sat, 15 Dec 2018 04:59:32 -0800 (PST)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	y185sm5636414wmg.34.2018.12.15.04.59.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Dec 2018 04:59:31 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2018 13:59:26 +0100
Message-Id: <20181215125926.12227-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH] package_deb.bbclass: report error during creation
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
X-List-Received-Date: Sat, 15 Dec 2018 12:59:32 -0000

Default error message -- when .deb creation fails -- is just the command
and error code. With this piece, the error message is known, too.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/package_deb.bbclass | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 6f81591653..21b55e3cc9 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -269,9 +269,17 @@ def deb_write_pkg(pkg, d):
             conffiles.close()
 
         os.chdir(basedir)
-        subprocess.check_output("PATH=\"%s\" dpkg-deb -b %s %s" % (localdata.getVar("PATH"), root, pkgoutdir),
-                                stderr=subprocess.STDOUT,
-                                shell=True)
+        try:
+            subprocess.check_output("PATH=\"%s\" dpkg-deb -b %s %s" % (localdata.getVar("PATH"), root, pkgoutdir),
+                                    stderr=subprocess.STDOUT,
+                                    shell=True)
+        except subprocess.CalledProcessError as cpe:
+            bb.note("%s" % cpe)
+            bb.note("%s" % cpe.stdout)
+            bb.note("%s" % cpe.stderr)
+            raise
+        except:
+            raise
 
     finally:
         cleanupcontrol(root)
-- 
2.17.1


