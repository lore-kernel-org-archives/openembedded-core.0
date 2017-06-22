Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE9277805
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 20:04:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jun 2017 13:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,374,1493708400"; d="scan'208";a="1143912555"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga001.jf.intel.com with ESMTP; 22 Jun 2017 13:04:20 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jun 2017 13:04:18 -0700
Message-Id: <1498161858-21494-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1498161858-21494-1-git-send-email-juro.bystricky@intel.com>
References: <1498161858-21494-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/1] buildhistory.bbclass: buildhistory_list_files: remove folder size
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
X-List-Received-Date: Thu, 22 Jun 2017 20:04:21 -0000

"buildhistory_list_files" generates text files containing list of files
that go into various packages/images. The file list contains file sizes as
well. However, the listed "file size" of a directory entry depends
on the file system of the build host. So, for example, building on EXT4 the
folder size is always listed as 4096 bytes. The same folder is listed with different
size when building on tmpfs. This can make direct comparison of two build histories
difficult.
Considering that the listed folder size is meaningless anyway (it has no relation to
the size of the package/image), this patch addresses the problem by removing
the directory entry sizes entirely from the generated text files.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/buildhistory.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 601b29f..1cc7c44 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -508,9 +508,11 @@ buildhistory_list_files() {
 	# List the files in the specified directory, but exclude date/time etc.
 	# This awk script is somewhat messy, but handles where the size is not printed for device files under pseudo
 	if [ "$3" = "fakeroot" ] ; then
-		( cd $1 && ${FAKEROOTENV} ${FAKEROOTCMD} find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 )
+		( cd $1 && ${FAKEROOTENV} ${FAKEROOTCMD} find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' | \
+		awk '{if (substr($0,1,1) =="d"){split($0,a," ",b); print b[0]a[1]b[1]a[2]b[2]a[3]"                 "b[4]a[5]}else print}' > $2 )
 	else
-		( cd $1 && find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 )
+		( cd $1 && find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' | \
+		awk '{if (substr($0,1,1) =="d"){split($0,a," ",b); print b[0]a[1]b[1]a[2]b[2]a[3]"                 "b[4]a[5]}else print}' > $2)
 	fi
 }
 
-- 
2.7.4


