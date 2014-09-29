Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 72DE76017E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 14:40:16 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id x48so1963711wes.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 07:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=A8qKI4tYVV1ctVxoM2nSXgLWFRKwZrJ3D4YUjbp9q1U=;
	b=Od1XVoVaL9u9b5Z7+5IZDQZWx+S6t6fKiC3+B0IRknKRmkPKxu8ZZQ2HgNHnolmXwW
	zVuMKMuVMDfhYmpGdPGxGilews5BLkc1pbK6s2EygfBWt/PVVtfJb+t4QMrTvYNhRJYw
	3keby+4LJi0TYUGDF3QSlpQNRy6UIj/376ATQtJjsYnHwDp52p9xFs/F77SWhlmtO7Aa
	cjURrKyVL5DqBeKTaVcGIoHCNhSFPWlesE/twteaqVDvG1fMlk4eXy9cvUena+ECP9RY
	NbecIJTe4KVdPmjUo9KncQjENE0IQvdlBP+bJaRBkpH/CQjf0F1oSFYrnf7xBhY0lThI
	lENA==
X-Gm-Message-State: ALoCoQkFC13bEOzSqQotS1IPAjdj+0wcyQsyYCjpx8HKJw5ha4AcDhuwDl1GndYpM0bXCmCmjhDU
X-Received: by 10.180.100.202 with SMTP id fa10mr67298569wib.32.1412001617266; 
	Mon, 29 Sep 2014 07:40:17 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id nf2sm11912198wic.1.2014.09.29.07.40.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Sep 2014 07:40:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Sep 2014 15:40:14 +0100
Message-Id: <1412001614-15126-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] base.bbclass: add SRCREV to do_fetch() hash
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
X-List-Received-Date: Mon, 29 Sep 2014 14:40:22 -0000

Without this changing just the SRCREV won't re-fetch unless you embed the SRCREV
into PV.

The downside here is that every hash changes, so this causes a full rebuild.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index c0d61fe..ff8c633 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -97,6 +97,7 @@ PATH_prepend = "${@extra_path_elements(d)}"
 addtask fetch
 do_fetch[dirs] = "${DL_DIR}"
 do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
+do_fetch[vardeps] += "SRCREV"
 python base_do_fetch() {
 
     src_uri = (d.getVar('SRC_URI', True) or "").split()
-- 
1.7.10.4


