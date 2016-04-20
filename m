Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id DA5C670149
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 13:39:02 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id v188so204052712wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 06:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=awVN+0oqcmoxNYIkV6nDxqvMQ+/cEpjzJrofJbA3AiM=;
	b=c9mjWy5gZSIlVsvWPv5P3RYp5sBLTsr4nVfLm+DPgL7pd65nZ6EaaDvhnsVhpYjBor
	ad5wO1BMYU1V4MVw6b9ookNCr1tRvJOaGYUjjrXpQ6Hux5VVsGP6LtWYkfj6y8Bmrfwd
	xIBMVrNG8oYoeAejldBscPiDFYd+//eNB/0i8j9yZQmUE/GUUVAJ++VLY/1zY3iMzk0y
	QgEX5SLd1RbjbsDKnCCRgJz1djIOL0ew3L4VIRh6UmXMNlMtYneH7wqE6CXrozvfOiQj
	AfRkwX6QKf6wu9pq8SYBKrECfsfapkZZwnx+5NTe/ZwiHtYj6xnxqLIDWc/2MlaLfEk+
	8Ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=awVN+0oqcmoxNYIkV6nDxqvMQ+/cEpjzJrofJbA3AiM=;
	b=BbOc9NKlSgP5jH9BGblLevP0Mb3sB236gmNBtSKmGJPWv/bbUoxh98fCC+uxneoaYS
	KKP/lKdmVQdRBewbi65HJTkUZNGaBNUeEZnnx2oQCd6YfgN7Zs+fKNDiWxlUN2vSqfJG
	G5aPksGuWCgbTSTYg+A6sHF6ZDWpy/19d28VdVvqJjarT1bUovH4XsGvP5w1/F9HLUeR
	Xw5tYlIdlWM7DWTUCNtXG54QGs68PMaHDncCj+DiB2MVtLwT31t3kodd0IGgmlIfbhQ6
	kspomvr7WwfXowbkIUeYi4eJEqd7EhuDco7aOFq/sn5zm+CtQPFK/tgiFTBEovKuQV3P
	PEgQ==
X-Gm-Message-State: AOPr4FVsxT0FZ5lTPUqtINgI/6Nb+IiReDjBDd2AW4tncX8ls+nr6S/XS3YOcqObzeerBPtx
X-Received: by 10.28.165.10 with SMTP id o10mr31238292wme.50.1461159543268;
	Wed, 20 Apr 2016 06:39:03 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 8sm9737889wms.14.2016.04.20.06.39.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Apr 2016 06:39:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Apr 2016 14:39:01 +0100
Message-Id: <1461159541-23657-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] autotools: warn when running intltoolize if intltool isn't a dependemcy
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
X-List-Received-Date: Wed, 20 Apr 2016 13:39:03 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/autotools.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 6649f5d..22880cc 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -293,6 +293,9 @@ autotools_do_configure() {
 		fi
 		mkdir -p m4
 		if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
+			if ! echo "${DEPENDS}" | grep -q intltool-native; then
+				bbwarn "Missing DEPENDS on intltool-native"
+			fi
 			bbnote Executing intltoolize --copy --force --automake
 			intltoolize --copy --force --automake
 		fi
-- 
2.8.0.rc3


