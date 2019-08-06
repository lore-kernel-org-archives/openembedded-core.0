Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7427F298
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 10:17:23 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id k2so1448194wrq.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 03:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1Vckd1+wTAYTmtWM/H9adZam9kdwEencI2ocw4K7xh0=;
	b=wk32VyjBu64NrihAzINspO+l7540Yv1PQuMDTQ2ltRjquEaSsF53RJze0hy6i881ug
	xrbQDVBXvMTR4d15bX0wKehJE2iV7a7kDIeaZbURtluqzqqpny3mcJAOOmyYo8f5x0iJ
	vH+z2r0xFzAFR0G6cnXBlbksIPnq2IkzMj7ebQRQq1vaTTz5PcSRsPUmurMMDrqDLGWC
	cXY+y3XGFAIgxGFN1mvDQclKk07bwtrW3ohDeKZFAYyIzjooESrL6Oc0ERtIPxdfJslK
	4QvH8goQ27iXbLsAcl4JYlvP/wubBHmaXMGDgnK4ypiw4ZU64YaQrGD+rfPr7n7yxhw5
	JxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1Vckd1+wTAYTmtWM/H9adZam9kdwEencI2ocw4K7xh0=;
	b=Tf+WPpPw4xGtbWabyGvDfJQSlhDgJGyAgo3nn3xMPLGcj8Zg79kqo3Zga3NsERQgvU
	5c6jDQD/LvBk/5NUYe24TDujClpoPnzGSBHMxEKxtrqTlmb2wndeW/dC8wmJR2Aoe05H
	rPEWHmB8HmFWKCJQK8ppt9K5rl6Nb864+7Kj/6isap8AF73aF5TALl0wAMRItHcPpaK+
	aaHXmyg5Knij53av0LcCS32leOQrYcjJpsYQ492lzyiu2sKuF6VGf+nWOmTWMQZVRwv/
	6Mhkit3Nvo8vdBnyH7drn96i8IyI0St7TtrJ6rYCiU2r94XS8ZLo9CyNON0BDRaRW8un
	Uu8Q==
X-Gm-Message-State: APjAAAVuOIm2SFSWRhAxf8ZmLoWgQgD+r6hl+n2jpCnAkk5QXfqaknJD
	SlKyjmlxntoErD6H5Hg2kSuKJujLkOc=
X-Google-Smtp-Source: APXvYqx+vIabuxZ+zdEZS1pX8pVg/o+ydVtxwDmxUxtybWJSnMRydMZqRacRcjHQXxtyQJdjseK6zw==
X-Received: by 2002:adf:f884:: with SMTP id u4mr3614787wrp.264.1565086644344; 
	Tue, 06 Aug 2019 03:17:24 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e19sm120736817wra.71.2019.08.06.03.17.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 03:17:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2019 11:17:20 +0100
Message-Id: <20190806101720.2721-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] sanity: update for new bb.build.exec_func() behaviour
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
X-List-Received-Date: Tue, 06 Aug 2019 10:17:24 -0000
Content-Transfer-Encoding: 8bit

The pythonexception argument is no more, and passing True is the new behavior.

[ YOCTO #13468 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 9429202dcad..2d3f49eb1a7 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -573,7 +573,7 @@ def sanity_check_conffiles(d):
         if check_conf_exists(conffile, d) and d.getVar(current_version) is not None and \
                 d.getVar(current_version) != d.getVar(required_version):
             try:
-                bb.build.exec_func(func, d, pythonexception=True)
+                bb.build.exec_func(func, d)
             except NotImplementedError as e:
                 bb.fatal(str(e))
             d.setVar("BB_INVALIDCONF", True)
-- 
2.20.1


