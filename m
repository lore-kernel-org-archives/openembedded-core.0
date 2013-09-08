Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 220C06110C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Sep 2013 14:59:48 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id k11so2635180eaj.14
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Sep 2013 07:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vI+8f07hIndyKC/lNp85TEk1j0L1SS5geEiYPdbLX7M=;
	b=1Di6z5Clzguvdo97xy7wO5rDvYTVV4nTuAoDOlChOv3cSgLBto/fLLjiwNMAs/STiz
	FAROvtdLFYCeYmQn9qjtiRZ2+kEJMTm3NSZoO5LZ4jA05/llKQMZppRcAkIlL2P0CamU
	QXV6n4lx2rWxo1I/M7UM4LcFZS1xNOUgIrZIcmEXQar+pCNWjXVGYjzu/A/oPzJtPxW9
	X6j6/oWbvrg2PJwBrxl84lK3/TfMHIQcgjOxVm6tQRC+c3iwl7H6VXMm9xPGYU8K8Fhh
	AF7upgX59o6+SzplYl1kIZmhiBfk/BpUMISwGKCBKCKaZ5fRegrdjyPNlAWWhdN8Rjba
	/Hyw==
X-Received: by 10.14.113.137 with SMTP id a9mr22081268eeh.3.1378652390511;
	Sun, 08 Sep 2013 07:59:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm14185424eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 08 Sep 2013 07:59:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Sep 2013 17:01:11 +0200
Message-Id: <1378652471-27278-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] package.bbclass: Call os.chmod after os.mkdir
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
X-List-Received-Date: Sun, 08 Sep 2013 14:59:50 -0000

* in 556dee0c4d6d8a87c0cddbd2f60fe5917d009f18 os.chmod was replaced by 2nd param
  to os.mkdir:
  -      bb.utils.mkdirhier(dest)
  -      fstat = os.stat(src)
  -      os.chmod(dest, fstat.st_mode)
  +      fstat = cpath.stat(src)
  +      os.mkdir(dest, fstat.st_mode)

  but fstat in os.mkdir, doesn't work the same as good old os.chmod:
  >>> p='test-p'
  >>> os.mkdir(p, 041777)
  >>> oct(os.stat(p).st_mode)
  '041775'
  >>> os.chmod(p, 041777)
  >>> oct(os.stat(p).st_mode)
  '041777'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index bdac2bd..c96acd2 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -988,8 +988,9 @@ python populate_packages () {
             def mkdir(src, dest, p):
                 src = os.path.join(src, p)
                 dest = os.path.join(dest, p)
+                bb.utils.mkdirhier(dest)
                 fstat = cpath.stat(src)
-                os.mkdir(dest, fstat.st_mode)
+                os.chmod(dest, fstat.st_mode)
                 os.chown(dest, fstat.st_uid, fstat.st_gid)
                 if p not in seen:
                     seen.append(p)
-- 
1.8.3.2


