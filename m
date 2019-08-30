Return-Path: <zhangzl2013@126.com>
Received: from m15-111.126.com (m15-111.126.com [220.181.15.111])
	by mail.openembedded.org (Postfix) with ESMTP id 8A1277F3D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 02:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=OLVkN+4i8SEiPtpcDI
	p2BH+VPTjWIhSozR1mqhczt18=; b=l3R3d8HHTjXoPYuNidFgDVHlLBoUECF1te
	KmcnsOPVxotPchqhmYN/r/PFRifh0j0+bH9lFNN399ySM3J3FHT7CHQgTAhH/52I
	J5u3a3dXl19okmluv7DGTjpruoSIZWz/0TyoJ48zKMhDRx/gb18X7TAMfyEWQZTl
	kIgbgSjuA=
Received: from pek-zhang3-d1.corp.ad.wrs.com (unknown [60.247.85.82])
	by smtp1 (Coremail) with SMTP id C8mowAAXH4MVjWhdHpDOAw--.42596S2;
	Fri, 30 Aug 2019 10:42:34 +0800 (CST)
From: Zhaolong Zhang <zhangzl2013@126.com>
To: bruce.ashfield@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 10:39:23 +0800
Message-Id: <1567132763-12581-1-git-send-email-zhangzl2013@126.com>
X-Mailer: git-send-email 1.9.1
X-CM-TRANSID: C8mowAAXH4MVjWhdHpDOAw--.42596S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrur1fuFWUZryxAFWxuFWDCFg_yoW8Jry7pF
	48Gwnxtas5Jr4I934Syrnav34Skws7X343KrWSg34UC3srAF1rZFWIkF1ftFW2vF4FgFs2
	vFZ2gryYvFnrZ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jedgAUUUUU=
X-Originating-IP: [60.247.85.82]
X-CM-SenderInfo: x2kd0wt2osiiat6rjloofrz/1tbitBshz1pD+HJN4QAAs+
Subject: [PATCH] spp: optimize strip_common_prefix function
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
X-List-Received-Date: Fri, 30 Aug 2019 02:42:36 -0000

strip_common_prefix() is the hot path that executes on every input file.
This patch sorts and uniqs the $include_paths by length descreasingly.
And with the sorted $include_paths, the for-loop inside strip_common_prefix
can break earlier, thus kernel_metadata task can be sped up by multiple times.

Signed-off-by: Zhaolong Zhang <zhangzl2013@126.com>
---
 tools/spp | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/spp b/tools/spp
index 1150ff3..cba52bb 100755
--- a/tools/spp
+++ b/tools/spp
@@ -125,6 +125,7 @@ strip_common_prefix()
 	if [ $this_len -lt $out_len ]; then
 	    relocated_name=$t
 	    out_len=$this_len
+	    break
 	fi
 	# add a trailing slash to get corner cases where one may
 	# have been added or not dropped
@@ -133,6 +134,7 @@ strip_common_prefix()
 	if [ $this_len -lt $out_len ]; then
 	    relocated_name=$t
 	    out_len=$this_len
+	    break
 	fi
     done
 
@@ -297,6 +299,16 @@ infiles=$@
 
 processed_files=""
 
+# this function also removes duplicated lines by `sort -u`
+sort_by_len_dec()
+{
+        for i in $@; do
+                echo $i
+        done | sort -u | awk '{ print length($0) " " $0; }' | sort -nr | cut -d ' ' -f 2-
+}
+
+include_paths=$(sort_by_len_dec $include_paths)
+
 ##
 ## create variables for use in scripts
 ##
-- 
1.9.1


