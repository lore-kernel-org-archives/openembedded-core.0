Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1863660290
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 11:06:35 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id c7so9716797itd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 03:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=iq+AcQgrJrO645S8sfczIZm7MV91H6dfqn9Z8QRWOf8=;
	b=aeNbQET4FNiGc+tgMHP+DpQIhKSRZ+O/X+xgV3fRBsrebbArNp1OhhI02rlQIinIC6
	H+pUQCqE7u9k1gu6eVdZnBSVAZZe2tp5SWpyAfJey0y7WX7R4vZpceDFhaadiH4VxgOn
	NodX1F6zYHcRQ5vU8YnC1vMT/TTsoEXKLIgHUnas7rJ85xe1me3qTmpT96Kh/03hb6s7
	8kY8efu5/rSHVNdpQ4JSKsf5XYqyc70Bsqlq490agmUopJweyyD0PAnIhflTyAzreCtk
	Imd04f5rCq1FN1Q6RnZtyoSuvfISTqTerpQV/eB9WJKgBEuDCZ9fjwtJfsk2+1au/Ogm
	C89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iq+AcQgrJrO645S8sfczIZm7MV91H6dfqn9Z8QRWOf8=;
	b=bzBLzlWfJb+vvT9LUChZAjgt7BcjUxSHooYDUpq2LcUSWeEGGCjF5qofsSnsFWw6Xs
	OTDkkKrEJvzCu9I7FnNtOk1PsOqkcr1mbvtr3b4aYlYBDUcvZjFuyQ5GY29sNkuMrXvB
	QSw+p/CfL9wmo02Q6iHgnDQRJRGJwImS1S0xxB83yLBygps6zqkp59XwIhlvL5A3BIMG
	XMs/xroJSRkEHOIiUTrshRg8z2fLWHhjTuUQJfP0CRyC0J4lBlvMr36+VSipYoNCpnZ4
	gYd4U+8SNEOfdCy/x1AuyugNQ1/o0EjoTO2RM1hzk4qL4Q3MKKPxR1RQk1CS9W8U4t5D
	HFKg==
X-Gm-Message-State: AIkVDXKcFQ4g7MVqoX2N8qMlHTj3RlGaGTdZMDW4iH9n7d3b/P3IL0tihrC4WDdbrRJNOaaF
X-Received: by 10.36.2.1 with SMTP id 1mr23176007itu.10.1485342395526;
	Wed, 25 Jan 2017 03:06:35 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A5635F.dip0.t-ipconnect.de.
	[87.165.99.95])
	by smtp.gmail.com with ESMTPSA id r85sm8407itc.13.2017.01.25.03.06.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 03:06:33 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 12:06:25 +0100
Message-Id: <20170125110625.19909-1-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] image_types.bbclass: rebuild .wks file when .wks.in changes
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
X-List-Received-Date: Wed, 25 Jan 2017 11:06:40 -0000

WKS_FILE(S) can refer to .wks.in files which get expanded during the
build by do_write_wks_template. The actual content of the .wks.in file
gets added to the recipe meta data during parsing, and thus we need to
ensure that the recipe gets re-parsed when the file changes.

This fixes two related problems:
- editing the .wks.in file and rebuilding an image did not recreate
  the image unless something else changed or "bitbake -c clean" was
  used explicitly
- when forcing a rebuild, the cached meta data and the actual one
  do not match, leading to "ERROR: Taskhash mismatch ... for ....bb.do_write_wks_template"

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image_types.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 5b1746a68ce..9bc1996cdb0 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -265,6 +265,10 @@ python () {
             d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
             d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
 
+            # We need to re-parse each time the file changes, and bitbake
+            # needs to be told about that explicitly.
+            # bb.parse.mark_dependency(d, wks_file)
+
             try:
                 with open(wks_file, 'r') as f:
                     body = f.read()
-- 
2.11.0


