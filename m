Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 503C57282D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 07:47:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t067lLWo021550
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Jan 2015 23:47:22 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 5 Jan 2015 23:47:21 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Jan 2015 15:47:38 +0800
Message-ID: <a6dc870be391940e782eae4a86b0002e764a163a.1420530290.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1420530290.git.Qi.Chen@windriver.com>
References: <cover.1420530290.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sstatesig.py: fix logic in find_siginfo
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
X-List-Received-Date: Tue, 06 Jan 2015 07:47:25 -0000
Content-Type: text/plain

For now, `bitbake-diffsig -t <recipe> <task>' doesn't work. This is
caused by a small logic mistake in find_siginfo in sstatesig.py.

The logic should be 'and' instead of 'or', otherwise, we will have
both siginfo and sigdata files in filedates which have the same checksum.
e.g.
/buildarea2/chenqi/sstate-cache/fc/sstate:sysstat:armv5te-poky-linux-gnueabi:10.2.1:r0:armv5te:3:fc861bf371c1b843b2843a3415eb5ff3_install.tgz.siginfo
/buildarea2/chenqi/poky/build-systemd/tmp/stamps/armv5te-poky-linux-gnueabi/sysstat/10.2.1-r0.do_install.sigdata.fc861bf371c1b843b2843a3415eb5ff3

So `bitbake-diffsig -t sysstat install' will output nothing even we actually
have changed something in do_install task.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index af7617e..c6c85b9 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -234,7 +234,7 @@ def find_siginfo(pn, taskname, taskhashlist, d):
             except OSError:
                 continue
 
-    if not taskhashlist or (len(filedates) < 2 and not foundall):
+    if not taskhashlist and (len(filedates) < 2 and not foundall):
         # That didn't work, look in sstate-cache
         hashes = taskhashlist or ['*']
         localdata = bb.data.createCopy(d)
-- 
1.9.1


