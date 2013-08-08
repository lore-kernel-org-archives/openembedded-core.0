Return-Path: <ross.burton@intel.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id D51BF608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 14:14:36 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so1461527eak.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 07:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XgoIldnPhrIDGWZNhbHugB5HtE4NOuA3p/8o+zanBng=;
	b=CvJOB5D+CLnPgoHc5jPkpoKG6I1Kq5TePjsUZg1JWprA65+SMQp/1jjbjtwaDS8Oom
	7HjrOfsLrq6pt7Vha0mFWnjQdejvdeNc8LL23LTnCgI+LVIlHfptX3aNEq4q+0ImaYvd
	qHbC7sMi/k6CpgahcI0uPb4eWc5UvuDCnx3qPXRhN7FW6zRniTnPa0yz8AEPfA6UPz4O
	mi6VGyubv6MVc0umCeOPrU2oMZ2tNsrgDnMku4ljPuxz9A6jolP1pb79JifOwuoHO/qX
	azxsXBiuBtj2ZcOFRcSWxx/nXFSIYPV+5kWhvv8hf/vMHJr/j7lCaAv1/5Lj12YL1NKQ
	cWGA==
X-Gm-Message-State: ALoCoQlSM2llFTM7SuIscx32POLCzmW7qsHQNA2YNxdj2nrMSS+oh07fFjs+4p7qQARyvZF3aQSY
X-Received: by 10.14.7.71 with SMTP id 47mr8591473eeo.21.1375971276732;
	Thu, 08 Aug 2013 07:14:36 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id c3sm19542383eev.3.2013.08.08.07.14.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Aug 2013 07:14:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 15:14:29 +0100
Message-Id: <1375971269-9758-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] oe-setup-builddir: substitute ##OEROOT## when using templates
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
X-List-Received-Date: Thu, 08 Aug 2013 14:14:37 -0000

oe-setup-builddir substitutes ##COREBASE## which seems like it should have the
same value as the variable ${COREBASE}.  In reality it doesn't as ##COREBASE##
is substituted with the value of $OEROOT (the location of the oe-init-build-env
script), whereas ${COREBASE} is set by oe-core to the parent directory of meta/.
If oe-core's meta/ isn't a top-level directory then ##COREBASE## and ${COREBASE}
have different values, which can lead to confusion.

To resolve this, deprecate (but still substitute) ##COREBASE## and substitute

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/oe-setup-builddir |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index d5d8d98..d5bd581 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -101,7 +101,10 @@ EOM
 
     # Put the abosolute path to the layers in bblayers.conf so we can run
     # bitbake without the init script after the first run
-    sed "s|##COREBASE##|$OEROOT|g" $OECORELAYERCONF > $BUILDDIR/conf/bblayers.conf
+    sed "s|##OEROOT##|$OEROOT|g" $OECORELAYERCONF > $BUILDDIR/conf/bblayers.conf
+    # ##COREBASE## is deprecated as it's meaning was inconsistent, but continue
+    # ##to replace it for compatibility.
+    sed -i -e "s|##COREBASE##|$OEROOT|g" $BUILDDIR/conf/bblayers.conf
 fi
 
 # Prevent disturbing a new GIT clone in same console
-- 
1.7.10.4


