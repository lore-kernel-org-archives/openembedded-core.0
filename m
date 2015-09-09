Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 87AE174197
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 12:09:54 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so113774075wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 05:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BtGvktbqSYFwnSlOlzzw4Md0Kfdk9MGGYlTZZc21YSo=;
	b=WMXV1GLUzYqv6q9qmNm4cyZnMLg2fDCpCNeUbmDS2RgJ7HvI5HuA4NkK9n+SP56roL
	Bwwcbc2pPLiOrfJ5ClLkuP+TbsrjGBQsLV12UVQ39OweGhfyOW1WngrxuApzSg7mPVMb
	W/DmJIJK72Oizi/83PXZKqiBKv/QmmU70nNNLi5C/5wJZ7PZ/aPQkyhuTo+zPIEZW3l1
	1O9o5Fv8fJrUz7T67aFeoyOoUGc+W6HHnHG/pznK8Bl1ewWB9nb3BLMnGbWmVSZJTwJY
	NhQVHuNWqX91WNCCr1KRZRxSVU7Ky9cjauXqtBMFDpeNRb1C4akTujoYsdsTJnG7XnmA
	NBgQ==
X-Gm-Message-State: ALoCoQnYALQ1SjKbDWmmJxba88J3eapir+imwsTMF8GhFToswYBjEZSwTyaMOiqOMT5vN6mQLDgS
X-Received: by 10.194.103.103 with SMTP id fv7mr55099824wjb.152.1441800594121; 
	Wed, 09 Sep 2015 05:09:54 -0700 (PDT)
Received: from Blackadder.home
	(host81-153-67-238.range81-153.btcentralplus.com. [81.153.67.238])
	by smtp.gmail.com with ESMTPSA id m4sm9920920wjb.37.2015.09.09.05.09.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Sep 2015 05:09:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Sep 2015 13:09:48 +0100
Message-Id: <1441800588-25217-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.3.2 (Apple Git-55)
Subject: [PATCH] ptest: fix file ownerships in ${PTEST_PATH}
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
X-List-Received-Date: Wed, 09 Sep 2015 12:09:54 -0000

As most upstreams don't have installable test suites it's fairly common to copy
files directly out of a source tree for ptests, but this results in files in the
recipe being owned by the user running bitbake:

  WARNING: QA Issue: .../sed/4.2.2-r0/packages-split/sed-ptest/usr/lib64/
  sed/ptest/testsuite/bug-regex21 is owned by uid 1000, which is the same
  as the user running bitbake. This may be due to host contamination
  [host-user-contaminated]

Instead of needing to fix this in every recipe that has this problem simply
chown the files to root:root in do_install_ptest_base.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/ptest.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 2ac9143..b5f470f 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -43,6 +43,7 @@ do_install_ptest_base() {
             oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
         fi
         do_install_ptest
+        chown -R root:root ${D}${PTEST_PATH}
     fi
 }
 
-- 
2.3.2 (Apple Git-55)


