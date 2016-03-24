Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id C9579608B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 15:43:54 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id p65so71781461wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 08:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KSiOlI67tW4MvHJ9gU0YoWdcESnwwTjpa8vGTLjtUJQ=;
	b=P94GNKLoFz0ZOO4Z2pRVFB/5+KMPbeDd9PuIn6WPGVcam2/CZu2MFOIbHSEhnLg8mF
	ufNY538Mbz4+1dioFpYV5RMeE+KfCSbIXOXrahWtKKSwQqIK1zd4aH65O5XUenF2wO7X
	VMQZgJfakSJ2KYWui9JW9wEXFOpVkVdU4EsIryd311kWBIFIUmnFk8Gy8BFGS4QIeGtD
	Adk1yY8KTkHN5I3AYW/fy+2AeL8jj5crGy61nmotl5Y9GSoDYXvHIA4DYRg7HG57qbrv
	XzivFRveztdnd6mIlcDMXmc05GMGIkgAFAcK3syESlhYwuHC2RKcZCQd0ZX6F6GU4oRA
	NBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KSiOlI67tW4MvHJ9gU0YoWdcESnwwTjpa8vGTLjtUJQ=;
	b=ikMt6Lz1PZWopqnj0ddyJoEtsisrsiqrkPdgTzB3Vp8IBAZ4mp3G41pH38Qkbo96cI
	5qZIhezmkquB7NpFSNj0oDJDoYHwNGmdmhlcOcSR0auFhVzMJzk1EkmmvTElDlB66Nw4
	cWIuu9SK1rGmJavMo9dp5KxOxYjLabOH4IqOPLZPI95ahgqZGbQ8Sqngv0HVzKR6QwYM
	Z2CCLwgVij66yUgYr4GHtuXpviGFlskyl+RYGOpZXqRYuMyvobLhi6av5H7UpGR4IYpd
	yY9pY3loMeqZmu4cSSYCywfzhz3WnhcDg39GBbt9mosmH40hiqq4Hes3H5Oho4IPFbwD
	6E6g==
X-Gm-Message-State: AD7BkJI2GZtnF0vHbGy5Q/X2WckIZsMvgQKayH0Ms8JvdYbo379C60E7pinb5KKs4pP9Om5o
X-Received: by 10.194.157.65 with SMTP id wk1mr11233319wjb.83.1458834235073;
	Thu, 24 Mar 2016 08:43:55 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id v2sm8300568wmd.24.2016.03.24.08.43.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Mar 2016 08:43:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Mar 2016 15:43:48 +0000
Message-Id: <1458834228-23233-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1458834228-23233-1-git-send-email-ross.burton@intel.com>
References: <1458834228-23233-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] uninative: don't try to relocate static binaries
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
X-List-Received-Date: Thu, 24 Mar 2016 15:43:56 -0000

patchelf will understandably error out if there isn't a .interp section to
relocate, so don't try to relocate static binaries.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/uninative.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index b045a28..0798717 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -127,6 +127,8 @@ python uninative_changeinterp () {
                 elf.open()
             except oe.qa.NotELFFileError:
                 continue
+            if not elf.isDynamic():
+                continue
 
             try:
                 subprocess.check_output(("patchelf-uninative", "--set-interpreter",
-- 
2.7.0


