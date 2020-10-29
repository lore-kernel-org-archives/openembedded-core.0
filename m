Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.web09.7377.1603971654431656517
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 04:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=MWRiLP7B;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1056; q=dns/txt; s=iport;
  t=1603971654; x=1605181254;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fKeJtwYN1OFKFeXx2fiHm/CDprv/KIFP2NeX2aZUIl8=;
  b=MWRiLP7BWKicjKDTeqcBBZj4eydwaahgW/K7mf+jYkl9NoHZ0JIlwmuz
   CsUirMg386nMmFHzTCCXbYeS456DJbakZHEwCOKQSCRrBzAFyBtuHrF1H
   477feh+vH2aVH6plM7TcKyVdhE6msI/uoX8M+UOKUCyUhv6CFymCFcv5b
   w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DUEAA7qZpf/5NdJa1iHAEBATwBAQQ?=
 =?us-ascii?q?EAQECAQEHAQGBZAKCKHBVATItsXgLAQEBDQEBHxAEAQGGUgIlNwYOAgMBAQs?=
 =?us-ascii?q?BAQUBAQECAQYEbYVhDIYrAYFTRIMmAYJ8rhWCKIVXg1OBQoE4AYg5hQAbgUE?=
 =?us-ascii?q?/giWCOoUKhSkEnQObEoJ2iQiRaw8ioWQBtAACBAYFAhWBaiSBVzMaCBsVgyQ?=
 =?us-ascii?q?JRxkNkGuMHSEDMDgCBgoBAQMJjkgBAQ?=
X-IronPort-AV: E=Sophos;i="5.77,429,1596499200"; 
   d="scan'208";a="575474408"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 29 Oct 2020 11:40:53 +0000
Received: from sjc-ads-9103.cisco.com (sjc-ads-9103.cisco.com [10.30.208.113])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 09TBeqOU019384
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 11:40:53 GMT
Received: by sjc-ads-9103.cisco.com (Postfix, from userid 487941)
	id 61B34CC1251; Thu, 29 Oct 2020 04:40:52 -0700 (PDT)
From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-devsrc: improve reproducibility for arm64
Date: Thu, 29 Oct 2020 04:40:52 -0700
Message-Id: <20201029114052.23141-1-dzagorui@cisco.com>
X-Mailer: git-send-email 2.19.0.dirty
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.208.113, sjc-ads-9103.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com
Content-Transfer-Encoding: 8bit

.vdso-offsets.h.cmd contains command that was used to produce vdso-offsets.h.
It breaks reproducibility because it has an absolute path in it. There is no
any value to package such files so it can be dropped.

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index aa8e162f4f..f8c750beaa 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -113,6 +113,10 @@ do_install() {
 	# but without this file, we get a forced syncconfig run in v5.8+, which prompts and
 	# breaks workflows.
 	cp -a --parents include/generated/autoconf.h $kerneldir/build 2>/dev/null || :
+
+	if [ -e $kerneldir/include/generated/.vdso-offsets.h.cmd ]; then
+	    rm $kerneldir/include/generated/.vdso-offsets.h.cmd
+	fi
     )
 
     # now grab the chunks from the source tree that we need
-- 
2.19.0.dirty

