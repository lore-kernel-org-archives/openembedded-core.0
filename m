Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6D5AF7C132
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 16:17:58 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t27so18343100wra.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 08:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q8qxImKZyK/0kpXkVSJnmg2CYdjYDLhWyFaLG1905kI=;
	b=hW36oli+/pIcTZZG8PRt8J/RSecvQqgJXUM6yzssD1P2wStVnJGCdGlyD3NVcyGbHY
	gJesvpTFqbv6eQ1MOvz7wNhTtXup2Yx4qfojyaWNZiMyTPnJILD2OIQGhbK+c7aorj9u
	ws9H5rI1I2oY9K9k0FtBJbcj6MKnobDrZc4G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q8qxImKZyK/0kpXkVSJnmg2CYdjYDLhWyFaLG1905kI=;
	b=jhpx8S5Jm1Zqzhm+ZtamwPWUd0X8Ra25U+sGwZIBW5gdWizLC4H2e6I7vwhUIObyQ3
	WyTRI2N2CAD9UDEzYcPscBxiSv6lXOvYJ0SOcthoTPfoaQM3vCC5sYFh/3Pz8egnycod
	2g38uhgg7kJDbmVpIH71MJdmtTik0cAr4YXxCfG1xNyKuVFvdRtmtrvxzwRR859i1m9+
	1IfTXYP+KzKCDq+MRyhWEqdOJFsOKT+mb4Cd55f4dhqMkn0ArjB8Wmwltkh+id1vOLHC
	ggzRKkbOHo9AKbI+li/tg5F0PORbg9Edu8AwcWIzmA+72TJSwbNHz3EuZDc8c8twmbPd
	HXQw==
X-Gm-Message-State: AJcUukd0WhP0eyve+L1bYkr1n4oa1AInlFjE/ZAGO2kS1CMVxH4B0kbF
	7MMMkwD+fBHP1zWL/IRWQ4tbflvp1Vg=
X-Google-Smtp-Source: ALg8bN764zZQ0rOskvur/hl4FDXyYHrbYySWpWnCo51QCeEU7OeCT2R8cfZpBkXod1sk4ov9n+EeKw==
X-Received: by 2002:a05:6000:14f:: with SMTP id
	r15mr18919740wrx.53.1547309878557; 
	Sat, 12 Jan 2019 08:17:58 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g67sm40755099wmd.38.2019.01.12.08.17.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 08:17:57 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Jan 2019 16:17:56 +0000
Message-Id: <20190112161756.11462-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] lib/sstatesig: Update to longer sha256 hash length
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
X-List-Received-Date: Sat, 12 Jan 2019 16:17:58 -0000
Content-Transfer-Encoding: 8bit

Update the code to match the recent switch to sha256 hashes

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 059e165c7ab..e0eb87e29f0 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -494,7 +494,7 @@ def find_siginfo(pn, taskname, taskhashlist, d):
 
     if not taskhashlist or (len(filedates) < 2 and not foundall):
         # That didn't work, look in sstate-cache
-        hashes = taskhashlist or ['?' * 32]
+        hashes = taskhashlist or ['?' * 64]
         localdata = bb.data.createCopy(d)
         for hashval in hashes:
             localdata.setVar('PACKAGE_ARCH', '*')
-- 
2.19.1


