Received: from mailrelay1-2.pub.mailoutpod1-cph3.one.com (mailrelay1-2.pub.mailoutpod1-cph3.one.com [46.30.212.0])
 by mx.groups.io with SMTP id smtpd.web12.7408.1611913856592056324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 01:50:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=bTnuGs0K;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.0, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=3RJ7i1F46oFRpI3vGzmwHHJ915PuLUBDDL1PExEJhqg=;
	b=bTnuGs0KpCJYkjp8zlKqog9tx3tSRrqoC4scXjEN9MvtcKRlhYYrXU/x6RN3LHC8EAGavBJkZmo+8
	 J2m6VC+bny5Rq3G6b5Wrt7/Ejmj5D9mq+KsWb3Q77/9i28IpcM1SCoO3r/RRTwl9a2Ye+FHCM96NMb
	 AwNqspFqDJZicVTKIR13ptmkY4klYqkUf8GcVgRX/3+zZRW1/IbOG4C/+hcbx1okVslZV3DzKLqKj9
	 n/TKmBebASsKdfWeKLTYO8ykFSOLapIHllYfVmdA7ctUD6QRL2K8uie7lMQJ0zBnIEYoapf3UmsiUP
	 TEI3LY6y9t5qaH3mZtssYoxamXAorqw==
X-HalOne-Cookie: 289e86e8bcbbed1dd90915f1cbd3612044aa20b8
X-HalOne-ID: 77f170d6-6217-11eb-9242-d0431ea8a283
Received: from localhost.localdomain (h-79-136-99-68.na.cust.bahnhof.se [79.136.99.68])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 77f170d6-6217-11eb-9242-d0431ea8a283;
	Fri, 29 Jan 2021 09:50:53 +0000 (UTC)
From: "Peter Bergin" <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH] buildhistory.bbclass: avoid exception for empty BUILDHISTORY_FEATURES variable
Date: Fri, 29 Jan 2021 10:50:54 +0100
Message-Id: <20210129095054.2064421-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An exception is fired when a BuildStarted event is sent to buildhistory bbclass
and the variable BUILDHISTORY_FEATURES is not set.

    ERROR: Execution of event handler 'buildhistory_eventhandler' failed
    Traceback (most recent call last):
      File "<...>/meta/classes/buildhistory.bbclass", line 862, in buildhistory_eventhandler(e=<bb.event.BuildStarted object at 0x7f94c3810250>):
         python buildhistory_eventhandler() {
        >    if e.data.getVar('BUILDHISTORY_FEATURES').strip():
                 reset = e.data.getVar("BUILDHISTORY_RESET")
    AttributeError: 'NoneType' object has no attribute 'strip'

This can happen in a multiconfig build where the default configuration use the
buildhistory class but not the configuration in mc. It should be a rare case that
this happens and it was found in a missconfigured build.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
This should be a rare configuration but it possible to reproduce on oe-core
with the following setup:

    $ . ./oe-init-build-env build-mc
    $ mkdir conf/multiconfig
    $ echo "INHERIT += 'buildhistory'" >> conf/auto.conf
    $ echo "BBMULTICONFIG = 'altconf'" >> conf/auto.conf
    $ echo "INHERIT_remove += 'buildhistory'" >> conf/multiconfig/altconf.conf
    $ bitbake core-image-base


 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index daae056144..117a44eaf3 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -859,7 +859,7 @@ END
 }
 
 python buildhistory_eventhandler() {
-    if e.data.getVar('BUILDHISTORY_FEATURES').strip():
+    if (e.data.getVar('BUILDHISTORY_FEATURES') or "").strip():
         reset = e.data.getVar("BUILDHISTORY_RESET")
         olddir = e.data.getVar("BUILDHISTORY_OLD_DIR")
         if isinstance(e, bb.event.BuildStarted):
-- 
2.25.1

