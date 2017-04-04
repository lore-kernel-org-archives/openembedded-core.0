Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9361560616
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 16:14:10 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t189so32529692wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Apr 2017 09:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=fXnQip7KIFYuZSDPMAMVhBdX83XdQb5TWOhs5k8dHeY=;
	b=wOQsYLiXUUdfomMiLpG5GTkppHKGGCG2fYiCIlWB2Ne1fKoQ32+k3+ARLFciflHMBY
	AZ+g5sTeGRBHStlb0xJuCr1t5xgyPAeKpA0F8aoywj6Y5B1E6mgpPwuVYHl0FvLg9iPB
	IsjeKhXyRJ7JoOuC0CcrL2/2yK9LETUFKjYx+pkzEY3vpDva41vA4fVqroSNUG67LNgC
	vLCmDDg7WFRyAE/rFZpSRWbfLCWbtj5+NRf7so+jxEc18CRyExPCFuYnVWBHjHVkgV6r
	I+7EGyp07J707AU7K9BoNYoUnnmN6BmbL2qTkBVJGsi7Rz93pTR+WAumzZKIYD6PRgPs
	l09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fXnQip7KIFYuZSDPMAMVhBdX83XdQb5TWOhs5k8dHeY=;
	b=a4hv0kxCeXQZ8fSacLKZ5P+qRHtT/9+rdc4WvR0JI0IGiO2xWBB65a7RBj0uQdnnHc
	92bMEOC20USTSICR/1y3huKYnGhH83z8G+eaggG4NWl+lvCixGFH/lCbNXOkVdq0nckA
	7dSFGCRFJ2zWpAwHciVFbDwUYt8rtxRYdT/0PB8Yv27xt7+uGgLwtIlBnZKbYBtgQ32n
	C9Ja5oGgEzchFSfBGd8xLtrJMRVHGelKkCcwhPzFH4IlxdY9wbE+FiZRPaHBBqYRjvDm
	UOzxqGHgiKAFsmF/h2SOT0PCYSKkZxIrHUZ8zbcdErXcyTbV0eQs2FzbXC/88+U4umLM
	i3/w==
X-Gm-Message-State: AFeK/H3ukfb1xdsQOLcuWOdQZ9eWAe1zN7TyivftEJvVu3ZosG63phDW
	WNZy3j6n/yVgBk7rGV8=
X-Received: by 10.28.199.129 with SMTP id x123mr15447248wmf.7.1491322450853;
	Tue, 04 Apr 2017 09:14:10 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	v29sm22801014wrv.66.2017.04.04.09.14.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Apr 2017 09:14:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 17:14:06 +0100
Message-Id: <1491322446-18058-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH V2] sanity: explain where TMPDIR is if we're telling the user to delete it
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
X-List-Received-Date: Tue, 04 Apr 2017 16:14:10 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 94c78b5..e8064ac 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -589,7 +589,7 @@ def sanity_handle_abichanges(status, d):
             with open(abifile, "w") as f:
                 f.write(current_abi)
         elif int(abi) <= 11 and current_abi == "12":
-            status.addresult("The layout of TMPDIR changed for Recipe Specific Sysroots.\nConversion doesn't make sense and this change will rebuild everything so please start with a clean TMPDIR.\n")
+            status.addresult("The layout of TMPDIR changed for Recipe Specific Sysroots.\nConversion doesn't make sense and this change will rebuild everything so please delete TMPDIR (%s).\n" % d.getVar("TMPDIR"))
         elif (abi != current_abi):
             # Code to convert from one ABI to another could go here if possible.
             status.addresult("Error, TMPDIR has changed its layout version number (%s to %s) and you need to either rebuild, revert or adjust it at your own risk.\n" % (abi, current_abi))
-- 
2.8.1


