Return-Path: <andrei@gherzan.ro>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 091847D217
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 14:30:50 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 15so3110760wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 07:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=tS/B++LhLoIAtjnVykRq/z28XLWmPvZu2LqRLt+hea8=;
	b=I8Q9U7W+cixJWpph27Gk6smlQlKYVSJbbsojsHuoPR3z2x36bHpc89AWYEZWFrsihd
	F4q70RExFlTAXfFmxMAoXqf/jYB51lA83e5byLc7HNHm97VBhWdu+aFJ89cX5vzpRdlR
	fHmd9RLBdaepmICyXdx4Kb5KF4M3DLhHqz4mFsawZvw5CQnw/7coyz1Q0dKVcx+uCw0s
	1tOc783K9OTM9iVeswHy5W24iPAOK8fT0yp87yb1QYvcW5q8sbND7/Dwxgo5/DTzoGZt
	uK2xww8und09KDAv3RUkX7GmSn33slBy+PW+0E8syV3Dw6AayLoZDOTW/qHul7KBfSuu
	4KCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tS/B++LhLoIAtjnVykRq/z28XLWmPvZu2LqRLt+hea8=;
	b=tBE67IGy1xJEdDY18mW7AdXSq1rKwylXaUCyTF2kyVNwYtlxK1/2PSOtMwxKuAbJcM
	oAAGNRsRYHBCfhBCVE8Ofp4R99W4qP8G94mWAHfYmhfF8Ztfgqh0LIHYYBrbu16kiJiw
	Jn0rJbvGmKq+2iJ5DWUEiVRJvTxvXsaOLrC1+CiZorBi32cKhuPyq/mDQgVb8q5v/otE
	AtFcG0ToeI81BJcdIz03Ubw/XgIXfkFcSuidxzCBSKfH4A93fmUJ7B9dpNqCLXu9agI+
	qIubGxaUG2aLdyOAhxvpNdQw4h/kzzwO9OTkajT06WnWahhmdtQvZqCaaiCErDXpAG0R
	mAOQ==
X-Gm-Message-State: APjAAAWd9EuQu11zh58acjO47XEm1jA0bPL1OrRQmnyysQn8tIGMjkS/
	H6cwRsqAWCkgXbSlJ5KWNQk+3A9djZ8=
X-Google-Smtp-Source: APXvYqwY6WfvXBSiW0in6Tc6WkfdjjTrCgrMNfKUoBWv9NlLsPvQudzqDYCzqrfGRQNLwQfrSvBPeQ==
X-Received: by 2002:a1c:a807:: with SMTP id r7mr1257588wme.137.1559053851309; 
	Tue, 28 May 2019 07:30:51 -0700 (PDT)
Received: from localhost.localdomain (host90-152-4-101.ipv4.regusnet.com.
	[90.152.4.101]) by smtp.gmail.com with ESMTPSA id
	k125sm5264606wmb.34.2019.05.28.07.30.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 07:30:50 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 May 2019 15:30:30 +0100
Message-Id: <20190528143030.2205-1-andrei@gherzan.ro>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] ca-certificates: Fix openssl runtime dependency
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
X-List-Received-Date: Tue, 28 May 2019 14:30:51 -0000

Since yocto thud, and more specifically since poky switched to
openssl 1.1 line, the openssl binary is provided by 'openssl-bin'.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../recipes-support/ca-certificates/ca-certificates_20190110.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
index 4c0425302f..bc69c55daa 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
@@ -82,6 +82,6 @@ do_install_append_class-native () {
     SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-certificates
 }
 
-RDEPENDS_${PN} += "openssl"
+RDEPENDS_${PN} += "openssl-bin"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


