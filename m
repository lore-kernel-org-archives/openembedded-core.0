Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C8708719F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 10:46:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a20so2271410wme.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 02:46:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nwlISydWxHtt88vZrvjgn7G5vNRPGhnNEShMMcICiek=;
	b=l3EdEbSw/fP6vyFm1FnshuDMqlMV/2GOk/bEViVrvjioxu+fR5c/+722JI2BUy1JCO
	fBk3SxGPCC4R2KyuogMiI4F/5HKAXEWtRPB+wWgEKy7V6mGwdM3Sb51x5JMXkUXEhdw6
	5RJ4PBZ4HUaDLEAdcVksd4FGct2BwFlnuPIRWvI1HPJ/JBL3FSl1Kg5/qT5yO7uulPfi
	rBnaJvEXq4HobpCBZFWAwEoaTR6A89MMGE/DLW8twMFDTE8TnYYubHYCTCHDhbYcc8Wb
	XBCSCHP+tYjyrY+cgV9u9d9CP9QBP/Yz1mzFW0ni/8nfQrSiF2op4pQ5pFX7kdrOWfTU
	r7xw==
X-Gm-Message-State: ABUngvdVcMkjbR6/t/HEmWPHf2kvvyzum5yLh5JJ3GBjZaCdGhk9WHaIbnxDeJwil9Gb/Q==
X-Received: by 10.28.25.134 with SMTP id 128mr23830302wmz.99.1478774781429;
	Thu, 10 Nov 2016 02:46:21 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	p13sm5447299wmd.20.2016.11.10.02.46.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 02:46:20 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 10:46:19 +0000
Message-Id: <20161110104619.22964-1-git@andred.net>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] opkg-utils: clear update-alternatives database on uninstall
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
X-List-Received-Date: Thu, 10 Nov 2016 10:46:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

When uninstalling update-alternatives, it doesn't seem to
make much sense to keep the update-alternatives database
around.
In particular when removing packaging data, e.g. due to
read-only rootfs, update-alternatives is removed from
the target file system. Leaving its database around
serves no purpose in that case as there is no way to
use it afterwards anyway.

This frees close to 700KB of (uncompressed) space in
a busybox based environment.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index a7aec45..19a852e 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -43,4 +43,9 @@ RPROVIDES_update-alternatives-opkg = "update-alternatives update-alternatives-cw
 RREPLACES_update-alternatives-opkg = "update-alternatives-cworth"
 RCONFLICTS_update-alternatives-opkg = "update-alternatives-cworth"
 
+pkg_postrm_update-alternatives-opkg() {
+	rm -rf $OPKG_OFFLINE_ROOT${nonarch_libdir}/opkg/alternatives
+	rmdir --ignore-fail-on-non-empty $OPKG_OFFLINE_ROOT${nonarch_libdir}/opkg
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.10.2


