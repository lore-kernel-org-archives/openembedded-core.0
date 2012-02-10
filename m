Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rvsiy-00055Z-Fh
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 16:49:24 +0100
Received: by eekd41 with SMTP id d41so826758eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 07:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=p4kdVDCPB1I/BjVzoXl/yCPMFtC2JLnriVufV3BqC9g=;
	b=JLhNkkWKYpVfeBkFTAK3HZhkbNZpBvEwmm0wSsKPUYAGyfC+qn8ybMOIgx7rq8pLla
	t+nzhE4n8HV7NNIHKMx3UKlIcUinoyBHI25zP7du/JhSAWFhSjZHvvrffGstKKCmFUxY
	9Mr1qh54sWVxuk6tz72UyMzqLbAWAGxo9IIkE=
Received: by 10.14.132.203 with SMTP id o51mr2140565eei.76.1328888476631;
	Fri, 10 Feb 2012 07:41:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm23390742eei.0.2012.02.10.07.41.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 07:41:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 16:41:07 +0100
Message-Id: <1328888467-31364-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [RFC] zlib: export LDCONFIG = true to disable runnig host's ldconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Feb 2012 15:49:24 -0000

* it's called from install-libs target and when /etc/ld.so.cache is writeable by user running bitbake
  then it creates invalid cache (in my case libstdc++.so cannot be found after building zlib(-native)
  and I have to call touch */libstdc++.so && /sbin/ldconfig to fix it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/zlib/zlib_1.2.6.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.6.bb b/meta/recipes-core/zlib/zlib_1.2.6.bb
index a220773..dcdc16f 100644
--- a/meta/recipes-core/zlib/zlib_1.2.6.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.6.bb
@@ -11,6 +11,9 @@ SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "dc2cfa0d2313ca77224b4d932b2911e9"
 SRC_URI[sha256sum] = "fa3e3e4881fa5810b8903f2c7e0dcd5a0a673535f0438021c4bbb5db1b918c8e"
 
+# disable calling ldconfig on host, it breaks /etc/ld.so.cache if it's writeable by user running bitbake
+export LDCONFIG = "true"
+
 do_configure (){
 	./configure --prefix=${prefix} --shared --libdir=${libdir}
 }
-- 
1.7.8.4



