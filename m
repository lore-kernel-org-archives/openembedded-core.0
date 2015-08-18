Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1190E767D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 16:40:51 +0000 (UTC)
Received: by wijp15 with SMTP id p15so105423023wij.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 09:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ASBLgmq6RmUgNrVj9swsv0tEnOU7gsK70n5Ytbqulyk=;
	b=Ppv8GgswG3og6Rxyuc3Efuf3K4kodsgeW8BSShmjJ299rkZwwO5Sn+TGmpXP7ubAu7
	mxfyTs2/KCV9D28KkUE6Wb1psAaPeRTU+4w1lAJ1IZ/x7lq8YnaYZdhPDobvok7vpKlO
	iD0nzaBT1Mc/kjAVo0QSxxaHk9w+Krqfhukbbu+xg3mVM/VcsZDvwDuFXMiW9IT08EgZ
	SOYKDgw0iSeS9kK+GnPMgf3YGXUvQrPZh9j8LCC22TKaEu00qEewMhy6U9Kin6/xR53W
	2cUfKec5nDW2fpyeaZtDwrOkiWsokNPRQ8dZXZgFgMN1QnrRtVQYkIVNHCMCOeigYWbU
	ndng==
X-Gm-Message-State: ALoCoQmsNZoAJ3wqtUSPKH3z/gMrRQYqifwYghSJTlMEJjYXsxHoXQV9vI12bJutD4Vf9dy5Jzvj
X-Received: by 10.181.12.111 with SMTP id ep15mr44725532wid.15.1439916051767; 
	Tue, 18 Aug 2015 09:40:51 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o9sm27222017wja.29.2015.08.18.09.40.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Aug 2015 09:40:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Aug 2015 17:34:33 +0100
Message-Id: <1439915673-25115-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] binconfig-disabled: write an message to stderr to help confused developers
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
X-List-Received-Date: Tue, 18 Aug 2015 16:40:56 -0000

Often configure scripts or Makefiles that use the stub scripts written by
binconfig-disabled fail mysteriously with no obvious problem.  Attempt to solve
this by writing an error to stderr which hopefully makes it to the logs.

[ YOCTO #8169 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/binconfig-disabled.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/binconfig-disabled.bbclass b/meta/classes/binconfig-disabled.bbclass
index 595cd09..602a669 100644
--- a/meta/classes/binconfig-disabled.bbclass
+++ b/meta/classes/binconfig-disabled.bbclass
@@ -9,9 +9,10 @@ FILES_${PN}-dev += "${bindir}/*-config"
 
 do_install_append () {
 	for x in ${BINCONFIG}; do
-		echo "#!/bin/sh" > ${D}$x
 		# Make the disabled script emit invalid parameters for those configure
 		# scripts which call it without checking the return code.
+		echo "#!/bin/sh" > ${D}$x
+		echo "echo 'ERROR: $x should not be used, use an alternative such as pkg-config' >&2" >> ${D}$x
 		echo "echo '--should-not-have-used-$x'" >> ${D}$x
 		echo "exit 1" >> ${D}$x
 	done
-- 
2.1.4


