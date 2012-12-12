Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TibY7-0000aQ-AB
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 02:55:51 +0100
Received: by mail-pb0-f48.google.com with SMTP id rq13so86544pbb.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 17:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=WxqyN0FcAeHgT3n+2NOeQpwP0KWPp5JlLW9sudZYQ3w=;
	b=Wg5HjJyfhQ4bA8NrLXICSMhTA3Y94QCX9g+rFNfFHS29VB/yGfDjR5TIGIuSD5mJ2M
	a+PrfDnql8kq6vZ4bfKKsie3LS8rtlWE88VZ7Y2t0TJpulT/9q4S7qkMrK45HiuQ/5Ru
	LfsdP2n4oRfA/jzoiw98eNPHW7qdteSspSRSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=WxqyN0FcAeHgT3n+2NOeQpwP0KWPp5JlLW9sudZYQ3w=;
	b=B4vxckiFAYQ1Ud12v/2Kq9nFIsGwTVGWRSokvLciUXhcQSA7ZYNOf5H4ZwxmVNVzi6
	9s49vkih3Xb9Im7KClYN0NOzGUVxpeFU4UKaSfHKjDMQ23Y4uvVlw6g1GLVPx8S/7Z8Z
	aY8CE/32XlixU5oBDvBxNSQuJP3ix10+KC7RfGSIshYLWQKhzL3+IZow3x8Mpz4+gg/T
	WGp7L9UNbb1Tv3A5Lsbh3vDkNUf1lyUbWPmeNS/fVjUnVapv4R7EJf4h5SmJ3xI05I6p
	kX844xMU8IpUH29UedijCtAeFEPUX+o1yszFH6J6JFWTI1wAGhDNMfIXkhUzZ2/nMMSh
	qXdg==
Received: by 10.68.235.40 with SMTP id uj8mr282984pbc.98.1355276477609;
	Tue, 11 Dec 2012 17:41:17 -0800 (PST)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id v2sm9213000paz.36.2012.12.11.17.41.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Dec 2012 17:41:16 -0800 (PST)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2012 17:40:57 -0800
Message-Id: <1355276457-12473-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQnYq7P7tVI9FwPMYm/ZIL1wlayVTipFY6jLzisKPZ4a2EPk4wiYwMLNbhuez1AA9Bu596vX
Subject: [PATCH] chrpath: normalize the paths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2012 01:55:51 -0000

By normalizing the paths the path comparing code works correct
to generate the right RPATH even when there is a A/../A in TMPDIR

[YOCTO #3408]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/chrpath.bbclass |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 4a6e697..82329d1 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -6,8 +6,8 @@ def process_dir (directory, d):
     import stat
 
     cmd = d.expand('${CHRPATH_BIN}')
-    tmpdir = d.getVar('TMPDIR')
-    basedir = d.expand('${base_prefix}')
+    tmpdir = os.path.normpath(d.getVar('TMPDIR'))
+    basedir = os.path.normpath(d.expand('${base_prefix}'))
 
     #bb.debug("Checking %s for binaries to process" % directory)
     if not os.path.exists(directory):
@@ -49,6 +49,7 @@ def process_dir (directory, d):
             new_rpaths = []
             for rpath in rpaths:
                 # If rpath is already dynamic copy it to new_rpath and continue
+                rpath =  os.path.normpath(rpath)
                 if rpath.find("$ORIGIN") != -1:
                     new_rpaths.append(rpath.strip())
                     continue
-- 
1.7.9.5



