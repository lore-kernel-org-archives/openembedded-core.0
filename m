Return-Path: <matt@madison.systems>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 34639601A5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Dec 2015 16:54:03 +0000 (UTC)
Received: by pfu207 with SMTP id 207so51719762pfu.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Dec 2015 08:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ONN+pqr5OJGva6w4uzfWrZmPKvXChvwkda1RTIcWzus=;
	b=Ud/qtKrQvQ0Y8EijQWEEMyBqMEijfqZ2o7UCXu7ohHEgfYeNiRAg/SPN3uqgBp/rNh
	kKJaHz54x/9sp5EsPVdyjQaj6p7Q/HK5s0lskHUP28WgKDPQ1vhfkG6LenFAszRfd4OC
	D15O/IUme5MGp8ZDky7PaEBPyYgVrMijG4LtzN4OMOvPnRjO2P/WywVN2kUDwYY2ovwT
	MWNRvCbqFWqauAqQGBLMapnOCYUxDVffygIXagT3abo89jZI2Mb8/8H9rlcetVyizDV5
	IITgO/eBpsmQhyW/SBRjpg23B3SyA0hSZQaV73TjewrvuPGFltI4aUUtH1v++b90eXqu
	TaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ONN+pqr5OJGva6w4uzfWrZmPKvXChvwkda1RTIcWzus=;
	b=YE8KTH+dcUM8sGrFN5vYH6VUSupFrk1D9RvjSCv+Eu+P9l0N67Cei/MNAu7kn56NMs
	t5gj4vS46pgvGY3bmuzPJmbcaZZ8qPimSb2tKjhAnc3SCnEvKzX5yh3lMBwQ1GA05AbU
	bBJ5Ehgtx6KXSP6SbAHOtY8Bt1gh6UkpRH4UMBoSTVJUVBpRRwaghFZFvy/2Y51BZnRY
	6XOIZiN20+YlXl6Wc2Un5zqdVNq2RmiD7SneUzahPSkDZMSxwXfs43SeA75wmVL8PdnW
	uvwvgMdIZ4SgYY7xf/aQDmZuWoN7ql22/l75d8kvWckZmcS9I9lMeBQOIP/BV90r9KSL
	5pHA==
X-Gm-Message-State: ALoCoQm3EcyeZr/hm2C4ThDDcZuL+02E0NRFBb0iB7SF3ROhD+sK7bB3hk5w6iEvJFtylqmc44BD
X-Received: by 10.98.16.133 with SMTP id 5mr36590993pfq.150.1449420844082;
	Sun, 06 Dec 2015 08:54:04 -0800 (PST)
Received: from workhorse.madison.systems
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93]) by smtp.gmail.com with ESMTPSA id
	tb8sm29278366pab.22.2015.12.06.08.54.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 Dec 2015 08:54:02 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Dec 2015 08:53:22 -0800
Message-Id: <1449420803-12282-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] wic: insert local Python paths at front
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
X-List-Received-Date: Sun, 06 Dec 2015 16:54:06 -0000

This follows how bitbake performs path insertion, and fixes a
failure to start wic on Ubuntu 15.10 with the distribution's
version of python-ply installed.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 scripts/wic | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index 7ad2b19..2286f20 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -41,12 +41,12 @@ from distutils import spawn
 # External modules
 scripts_path = os.path.abspath(os.path.dirname(__file__))
 lib_path = scripts_path + '/lib'
-sys.path.append(lib_path)
+sys.path.insert(0, lib_path)
 
 bitbake_exe = spawn.find_executable('bitbake')
 if bitbake_exe:
     bitbake_path = os.path.join(os.path.dirname(bitbake_exe), '../lib')
-    sys.path.append(bitbake_path)
+    sys.path.insert(0, bitbake_path)
     from bb import cookerdata
     from bb.main import bitbake_main, BitBakeConfigParameters
 else:
-- 
2.5.0


