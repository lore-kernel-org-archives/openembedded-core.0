Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id F151E7CED7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 11:43:01 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f22so16413436wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 04:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=croYSKiVNgE9XVxEc/Og0s/7EOnv9fDuYAM2X/K+nnM=;
	b=AKybLAPIMxUuP414ocq0cbN0TSEb5zfbjuwp+FT7y9P5s/y5geCIqdZVP+L9a9zzLx
	rQAzYqKyEnCUDlUeR2bohr46dhEt5WVtCrRYfdhX9HKxaXiUR/HzLvQkGWu595GwqQsV
	jkS0As/h/OsDuzsTqBV9c+7MzVZEvGmEThxuvf+nZ65HvY0lSpj6cK+ryAVzXLBGcR4K
	ISHdA2lxmEPIeoq5u1Ae+bTwyAVdEpzoCIKVqjONhPK6TWwmI32nbuobJhFNxLExGqM7
	UXotWFzoD9F3dLELCsNhPyfs1n5TqU2svsWey/0yAiULRXAN+cBs4ltxp9+55rkGAwJP
	PP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=croYSKiVNgE9XVxEc/Og0s/7EOnv9fDuYAM2X/K+nnM=;
	b=tDYHIihO+P+G4JICJTGv2dF6YQxV6tSpDNnDwwpJsfhUSPlsmxeilPBvAw3jZi9ro+
	qZIh8InsryZ6+oS56Q94r9BTbXoksCY/tmjcT5RsLw0uTgLfuQpNTNwZhmOu93A+SCYk
	zDnzjyO7kKNxb4HP4J7JtxVDvu7acBi8qFbHdOpEplwtOUa4X7++a0aivAHCT9NgCPoT
	t8LFkL9M/9qfMIOww6ATluHjnX5Z2DL955UEbeyMskYHXzsuZ0QoDVz9Zfy1FowH6Czl
	m6Cpg0QQOviydLBn8lx9INhtYP8kXm491yFmy7YRiI1wxOWbgdmT5luxHtACjCxUHsJh
	Zu3w==
X-Gm-Message-State: APjAAAV8iVoW/cquALhI5VVbCZGBd4xKM7hYoO1OD16WibG6Ud9SEVtW
	UcKNZkm9higCGrm3+BYI7T9Wb8NAwKc=
X-Google-Smtp-Source: APXvYqxmT/Lt4O6ZotiJwp4mRyQliOZRYGrm+P4+Z/GB2D6JKARrXYhmMwnRVm4F27LK2c2rWdewSg==
X-Received: by 2002:a05:600c:29a:: with SMTP id
	26mr15593903wmk.127.1571053382128; 
	Mon, 14 Oct 2019 04:43:02 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	59sm40068296wrc.23.2019.10.14.04.43.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 04:43:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2019 12:42:57 +0100
Message-Id: <20191014114258.28653-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] sanity: check the format of SDK_VENDOR
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
X-List-Received-Date: Mon, 14 Oct 2019 11:43:02 -0000
Content-Transfer-Encoding: 8bit

If SDK_VENDOR isn't formatted as -foosdk and is instead for example -foo-sdk
then the triple that are constructed are not in fact triples, which results in
mysterious compile errors.

Check in sanity.bbclass so this failure is detected early.

[ YOCTO #13573 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 2d3f49eb1a7..705062bc864 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -798,6 +798,11 @@ def check_sanity_everybuild(status, d):
         elif d.getVar('SDK_ARCH', False) == "${BUILD_ARCH}":
             status.addresult('SDKMACHINE is set, but SDK_ARCH has not been changed as a result - SDKMACHINE may have been set too late (e.g. in the distro configuration)\n')
 
+    # If SDK_VENDOR looks like "-my-sdk" then the triples are badly formed so fail early
+    sdkvendor = d.getVar("SDK_VENDOR")
+    if not (sdkvendor.startswith("-") and sdkvendor.count("-") == 1):
+        status.addresult("SDK_VENDOR should be of the form '-foosdk' with a single dash\n")
+
     check_supported_distro(d)
 
     omask = os.umask(0o022)
-- 
2.20.1


