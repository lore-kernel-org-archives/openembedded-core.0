Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id DFDDA60E68
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 10:34:14 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so4857666eek.20
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 03:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=oXzO2n1d57/ySmbnRa6qlzEns1djGdNmz9ZNZjaY35s=;
	b=uIjPnswkeFMYEjpfqrZj8VxmFOANYk+je0a2IzC9PjX3vPvi+BFd8TfGG1C2PwfSM2
	vV9P1bHCp72F86d2qkt/n/AayHgz49SRyb3uMna3V6TmkbZ4y8AZHtjkuy1GZg9X+R9r
	yb/yUOZkSMO3rigjVSO8BILRV24dMGlZiSLhmhR+l5xPkvRLb5B8QM0F+3quV9+sLssC
	ZP21XfEFDu1SWyCVcHcHlPtx6RQN3u8e5UHXfDSOLUQ2DOK+SYsOSDpW1a0YHY/QKw5M
	HD48Mobr/6oSaZrlZnfh5tK5oJieTQKX9cGXDE/qFHBbje7jdOvTXtQGWhsOZgUJyu7d
	AuOQ==
X-Received: by 10.15.10.135 with SMTP id g7mr445755eet.72.1396089254593;
	Sat, 29 Mar 2014 03:34:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t4sm17813599eeb.29.2014.03.29.03.34.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Mar 2014 03:34:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Mar 2014 11:34:10 +0100
Message-Id: <316f6098a5ca4fe82293874b16e52eaf913e5538.1396089115.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1396089115.git.Martin.Jansa@gmail.com>
References: <cover.1396089115.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1396089115.git.Martin.Jansa@gmail.com>
References: <cover.1396089115.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/4] sstate-cache-management: rm_by_stamps - include signatures of .sigdata. files
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
X-List-Received-Date: Sat, 29 Mar 2014 10:34:15 -0000

* there are .siginfo files in sstate-cache, but STAMPS_DIR calls them
  .sigdata, make sure that such signatures are kept, because some tasks
  like do_package, don't have _setscene or main task entry and are
  removed:

  stamps:
  tmp-eglibc/stamps/i586-oe-linux/busybox/1.22.1-r0.do_package.sigdata.cd6f625471ef1b20a9379e90519db6f1
  tmp-eglibc/stamps/i586-oe-linux/busybox/1.22.1-r0.do_package_write_ipk.f20fe66285219f23373fc64d5de1d412
  tmp-eglibc/stamps/i586-oe-linux/busybox/1.22.1-r0.do_package_write_ipk.sigdata.f20fe66285219f23373fc64d5de1d412
  tmp-eglibc/stamps/i586-oe-linux/busybox/1.22.1-r0.do_packagedata.sigdata.c55a3dbe90010c15aa3294753fbd402e
  tmp-eglibc/stamps/i586-oe-linux/busybox/1.22.1-r0.do_packagedata_setscene.c55a3dbe90010c15aa3294753fbd402e.qemux86
  sstate (we want to keep all in this case):
  sstate-cache/c5/sstate:busybox:i586-oe-linux:1.22.1:r0:i586:3:c55a3dbe90010c15aa3294753fbd402e_packagedata.tgz
  sstate-cache/c5/sstate:busybox:i586-oe-linux:1.22.1:r0:i586:3:c55a3dbe90010c15aa3294753fbd402e_packagedata.tgz.siginfo
  sstate-cache/cd/sstate:busybox:i586-oe-linux:1.22.1:r0:i586:3:cd6f625471ef1b20a9379e90519db6f1_package.tgz
  sstate-cache/cd/sstate:busybox:i586-oe-linux:1.22.1:r0:i586:3:cd6f625471ef1b20a9379e90519db6f1_package.tgz.siginfo
  sstate-cache/f2/sstate:busybox:i586-oe-linux:1.22.1:r0:i586:3:f20fe66285219f23373fc64d5de1d412_package_write_ipk.tgz
  sstate-cache/f2/sstate:busybox:i586-oe-linux:1.22.1:r0:i586:3:f20fe66285219f23373fc64d5de1d412_package_write_ipk.tgz.siginfo

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index d741ec9..34bde01 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -330,11 +330,11 @@ rm_by_stamps (){
   # Figure out all the md5sums in the stamps dir.
   echo "Figuring out all the md5sums in stamps dir ... "
   for i in $suffixes; do
-      # There is no "\.siginfo" but "_setcene" when it is mirrored
+      # There is no "\.sigdata" but "_setcene" when it is mirrored
       # from the SSTATE_MIRRORS, use them to figure out the sum.
       sums=`find $stamps -maxdepth 3 -name "*.do_$i.*" \
         -o -name "*.do_${i}_setscene.*" | \
-        sed -ne 's#.*_setscene\.##p' -e 's#.*\.siginfo\.##p' | \
+        sed -ne 's#.*_setscene\.##p' -e 's#.*\.sigdata\.##p' | \
         sed -e 's#\..*##' | sort -u`
       all_sums="$all_sums $sums"
   done
-- 
1.9.1


