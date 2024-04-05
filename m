Return-Path: <omatiush@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E344CD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 10:14:56 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web10.7682.1712312087733942620
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Apr 2024 03:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=fhyBqIf1;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: omatiush@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=797; q=dns/txt; s=iport;
  t=1712312087; x=1713521687;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QRCAifOYUXGtDmRqU1ye/1ywTc/hVM1R/BPAifO6kFo=;
  b=fhyBqIf15GzDgsaDtz7z4l3S4E1eKrdu4POf6EYrPEzC8ZbUT4p2NYeS
   F9g5GNGy7abhZNvfaOvab1dW5PYIH313otT11I5VxLUUNkyyV9UBEaoVR
   nZBVMJbSNu2Nd7osUZS/j83WjB7iFu8j3GNtzExQW/uZzPGcSCjZM2FgA
   Y=;
X-CSE-ConnectionGUID: lQ6JSZ2oQVaP2fz+XZfuOg==
X-CSE-MsgGUID: Pnh+d1TwR2abO9rgX/ESKA==
X-IPAS-Result: =?us-ascii?q?A0CKAQCTzg9mmIMNJK1agliDQFZBSJQajhWSF4ElA1YPA?=
 =?us-ascii?q?QEBDzETBAEBjRcCJjUIDgECBAEBAQEDAgMBAQEBAQEBAQYBAQUBAQECAQcFF?=
 =?us-ascii?q?AEBAQEBAQEBHhkFDhAnhXqHEgEYAYF9gwABgl8CAa9WgiyBAYMmAYFR2TaBa?=
 =?us-ascii?q?oFIjHuFYScbgUlEhAd2hAqBBoV2BJkAhkpKgSMDWSERAVUVMhkYCTwPDBoCG?=
 =?us-ascii?q?xQNJCMCLD4DCQoQAhYDHRQEMBEJCyYDKgY2AhIMBgYGWyAWCQQjAwgEA1ADI?=
 =?us-ascii?q?HARAwQaBAsHdoM9BBNEAxCBMooWgz+CIIERgyNOgz8DCQMHBUlAAwsYDUgRL?=
 =?us-ascii?q?DUUGwYiH28Hm3gBgnOBDoFHYkDFc4QdjA6VHRozqjOYYqQihGOBZgI2gVtNI?=
 =?us-ascii?q?xWDIglJGQ+OOZ0bQzUCOQIHCwEBAwmIboF6AQE?=
IronPort-Data: A9a23:PrbCGKDFaSUh9RVW/ybjw5YqxClBgxIJ4kV8jS/XYbTApD4h0mEDz
 jAbXGGBPKmKYWGkctxwYY21oE0O78OEzYJkOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4SGdIZsCCaE+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357hXGthh
 fuo+5eDYAP9hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxMUlaENQ4ZW7
 86apF2I1juxEyUFU7tJoZ6nGqE+eYM+CCDV4pZgtwdOtTAZzsA6+v5T2PPx8i67gR3R9zx64
 I0lWZBd1W7FM4WU8NnxXSW0HAl6BPNkw42dJkGBuPTJwV+FQ0ni3tJhWRRe0Y0woo6bAElH8
 fgebTsKdB3G3qS9wamwTa9ngcFLwMvDZdxE/Co+i2iCS699GPgvQI2SjTNc9DA1j9xPAO3eT
 8EYcjFoKh/HZnWjP39NVMxnxbzw1iiXnztwkFSV5qZu33fplgV79+n3P+qSV+epbJAA9qqfj
 jmbpzuiWE5y2Mak4T2d/3Shg+XCkS/2VMcZE6e13vprm0GIgGsLBRsbUFG2rfW0hgi5Qd03F
 qAP0iMqqa53/0uxQ5ykGRa5u3WD+BUbXrK8DtHW9imJ8/T22DTDAVE6RwYbZs5lhP04WBslg
 wrhc8zSORRjt7icSHS4/7iSrC+vNSV9EYPkTXFdJefiy4e6yLzfni7yosBf/LlZZ+AZ9Bn5x
 zSM6SM5nbhW1IgA1r6w+hbMhDfESnn1ouwduFi/soGNt18RiGuZi2qAsgGzARFod9nxc7V5l
 CJY8/VyFchXZX13qASDQf8WAJai7OufPTvXjDZHRsZ4rW7wpiL8Jt0PvlmSwXuF1O5ZKVcFh
 2eO6GtsCGN7bRNGkIcuOt3hVZ52pUQePY21C6y8giVyjmhZL1Lfo3o0OiZ8LkjmkVMnlukkK
 IyHfMO3RXccAuIP8dZFb7l17FPf/QhnnTm7bcmil3yPiOPCDFbLEu1tGAXVMYgEAFas/V+9H
 yB3bZXakn2ykYTWP0HqzGLkBQlXfShkWcup9JQ/myzqClMOJVzNwsT5mdsJE7GJVYwM/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:xngi1Kg0A075IaNwTF9fCslYXHBQXskji2hC6mlwRA09TyX+rb
 HMoB1173DJYVoqMk3I+urhBED/ex3hHPdOiOF7AV7IZmXbUQWTQb2KlbGC/9UlcBeOk9K0Es
 xbAspDNOE=
X-Talos-CUID: =?us-ascii?q?9a23=3AGGEg2mjkSW+bIBB0QnKs5dU+gDJudkSD7kzieUi?=
 =?us-ascii?q?BN29RErOHCm+i9r5DnJ87?=
X-Talos-MUID: 9a23:7Xk9BwQnlc63eHeyRXTUgjEhOJ5U/J70AUoqwI8Ji46pDg9ZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.07,181,1708387200"; 
   d="scan'208";a="246113089"
Received: from alln-core-1.cisco.com ([173.36.13.131])
  by alln-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 10:14:47 +0000
Received: from sjc-ads-4348.cisco.com (sjc-ads-4348.cisco.com [171.70.55.119])
	by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 435AEkYg014119
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Apr 2024 10:14:46 GMT
From: Oleh Matiusha <omatiush@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] gmp: improve reproducibility
Date: Fri,  5 Apr 2024 10:14:46 +0000
Message-Id: <20240405101446.3293318-1-omatiush@cisco.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.55.119, sjc-ads-4348.cisco.com
X-Outbound-Node: alln-core-1.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 10:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197980

nativesdk-gmp package contains host references in output packages.
remove them.

Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
---
v2
 - moved common code to separate function 
v3
 - absolute path cleanup for all classes
---
---
 meta/recipes-support/gmp/gmp_6.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gmp/gmp_6.3.0.bb b/meta/recipes-support/gmp/gmp_6.3.0.bb
index 3dbcd68b5c..94346745fd 100644
--- a/meta/recipes-support/gmp/gmp_6.3.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.3.0.bb
@@ -29,7 +29,7 @@ do_install:append() {
 	oe_multilib_header gmp.h
 }
 
-do_install:prepend:class-target() {
+do_install:prepend() {
         sed -i \
         -e "s|--sysroot=${STAGING_DIR_HOST}||g" \
         -e "s|${DEBUG_PREFIX_MAP}||g" \
-- 
2.33.0


