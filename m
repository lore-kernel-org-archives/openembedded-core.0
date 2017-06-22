Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D99F26059F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 20:04:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jun 2017 13:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,374,1493708400"; d="scan'208";a="1143912554"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga001.jf.intel.com with ESMTP; 22 Jun 2017 13:04:20 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jun 2017 13:04:17 -0700
Message-Id: <1498161858-21494-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/1] buildhistory: files-in-package.txt
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

When comparing two build histories of the same image, but built using
hosts with different filesystems, I noticed that although the images/packages were
binary identical, the build histories differed. This was caused by the
fact that the generated files (i.e. files-in-package.txt) listed different
sizes for the same folder. This depends on the host build filesystem.
For example, on EXT4 we see:
 
drwxr-xr-x root       root             4096 ./etc
 
and on tmpfs (I use ramdisk when I can), I see:
 
drwxr-xr-x root       root              100 ./etc

This makes comparison of the build histories difficult, as virtually all
generated files can show up as different. Also, AFAIK, the "folder size"
is meaningless anyway, as it has no impact on the package/image size.

The attached patch addresses the problem by not printing the folder sizes.
The above example would become:

drwxr-xr-x root       root                  ./etc

This is achieved by piping the lines through awk code. The awk code simply
replaces the size by spaces, while keeping the formatting intact. I admit
the code is not pretty, but it gets the job done. The ugliness is mostly
due to the effort to preserve the original white spaces.

Juro Bystricky (1):
  buildhistory.bbclass: buildhistory_list_files: remove folder size

 meta/classes/buildhistory.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.7.4


