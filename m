Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7AFA96FC05
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 15:48:06 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id f8so1235176wiw.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jun 2014 08:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eeubXaNAQYAfVqPaemp3Rpyyruntl6IQJhHAhIdzCxk=;
	b=UQWtdbQBRdPls1j5FWWTE4tgO4SUF3MoChHAO5MK90ppXU+14v81uIseUV4yCb13/W
	5VmWW7FJE+uk9cXlRTS5kF1IZBk7oO84ZKxX2fie0cpbhT2mR8wChUo/1yaKbOu2KqIy
	fwfIayEkvrCPD5nx547LTSbNaJSDrC0JtNDS21v06wuiXGQW8Ffq5zzNQXO+cm6fIU1F
	HhljqMqicKdb9bfurafy7MMYAPfmfHFrsvVhPWu7Hylp44UXffDSgMz0tYdtM01tAKoh
	JCn/IseEGi3vFl+ix86+78LDa+uIV8/+3xsUuOuQXiA0bC2wQOjv3cN8rh5kzjWKk4zg
	z/aQ==
X-Gm-Message-State: ALoCoQm3usF2wppquIj8tyYR6IyTUwlFXHh7KHcJbEodOOswIkZDEqhc2TfONB1tAIeZ/xoJxZaB
X-Received: by 10.194.120.68 with SMTP id la4mr8314930wjb.40.1402069687821;
	Fri, 06 Jun 2014 08:48:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	kp5sm12790897wjb.30.2014.06.06.08.48.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jun 2014 08:48:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jun 2014 16:48:01 +0100
Message-Id: <1402069681-17929-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402069681-17929-1-git-send-email-ross.burton@intel.com>
References: <1402069681-17929-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] gawk: remove dgawk and pgawk packages, merge gawk-common into gawk
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
X-List-Received-Date: Fri, 06 Jun 2014 15:48:18 -0000

The dgawk and pgawk commands no longer exist in gawk 4.1 onwards, replaced by
options to gawk.

Remove the dgawk and pgawk binary packages, and merge gawk-common into gawk as
it is needless splitting.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/gawk/gawk_4.1.1.bb |   10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_4.1.1.bb b/meta/recipes-extended/gawk/gawk_4.1.1.bb
index b990ce9..a81be31 100644
--- a/meta/recipes-extended/gawk/gawk_4.1.1.bb
+++ b/meta/recipes-extended/gawk/gawk_4.1.1.bb
@@ -13,9 +13,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS += "readline"
 
-RDEPENDS_gawk += "gawk-common"
-RDEPENDS_pgawk += "gawk-common"
-
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
 "
@@ -25,14 +22,9 @@ SRC_URI[sha256sum] = "556464bd2e4bc5a0fad4526b59623e4be40b4c2f4c663dfaaf246af6e2
 
 inherit autotools gettext texinfo update-alternatives
 
-PACKAGES += "gawk-common pgawk dgawk"
-
-FILES_${PN} = "${bindir}/gawk* ${bindir}/igawk"
-FILES_gawk-common += "${datadir}/awk/* ${libexecdir}/awk/* ${libdir}/${BPN}/*.so"
-FILES_pgawk = "${bindir}/pgawk*"
+FILES_${PN} += "${datadir}/awk"
 FILES_${PN}-dev += "${libdir}/${BPN}/*.la"
 FILES_${PN}-dbg += "${libexecdir}/awk/.debug"
-FILES_dgawk = "${bindir}/dgawk*"
 
 ALTERNATIVE_${PN} = "awk"
 ALTERNATIVE_TARGET[awk] = "${bindir}/gawk"
-- 
1.7.10.4


