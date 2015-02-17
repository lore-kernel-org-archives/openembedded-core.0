Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3A29671F05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 13:42:14 +0000 (UTC)
Received: by iebtr6 with SMTP id tr6so30318872ieb.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 05:42:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lRcKLWfYteCTSap/Q0vJq0HwRBJtzY7+4pSYVsi8ogc=;
	b=EXreCkiZIhDnE3YT5mEQtDkKWvt5v2CQ3a3zc3HBSkad+DOS8x2Bcb05GdLkeFTASn
	Mb1dSoMB+phH/iAHADH4YfHXMHhsYIK+2n/vzejfdFlDJiUjnaPE171rTtTsg5BRF+Mk
	oTix9+4GeK4hKn9EXn2Daxo7xcUmPBMBhel0Wp5NV/P7HCGCkZu3uAgN5MD01DT/Fw5h
	R8FU2KXlBwwdPcwCESEqr3feqmndIrWktpRLuOE1X89WcISlW2//Cn/iiTDAW1TEyKlp
	MKrJwBkbAoo2OmBsApnyvlWHkWGxcYPMn6ZXTyxEDNS3OsPCusFIuMVU4NLR0x1xQO66
	lJvg==
X-Gm-Message-State: ALoCoQlOE5bQi+mb4pXmEbdxKw1ULYnGF8ieyGIztMqocSKDV77LWR41T1+CRoukmi6IELrgo0PI
X-Received: by 10.42.138.199 with SMTP id d7mr34684734icu.3.1424180535452;
	Tue, 17 Feb 2015 05:42:15 -0800 (PST)
Received: from syncev.vlan14.01.org (p57A56D2C.dip0.t-ipconnect.de.
	[87.165.109.44]) by mx.google.com with ESMTPSA id
	qr1sm10089217igb.18.2015.02.17.05.42.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Feb 2015 05:42:14 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Feb 2015 05:42:05 -0800
Message-Id: <1424180525-4138-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] package_rpm.bbclass: support packaging of symlinks to directories
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
X-List-Received-Date: Tue, 17 Feb 2015 13:42:16 -0000

os.walk() returns symlinks to directories in the "dirs" lists,
but then never enters them by default. As a result, the old
code applied neither the directory handling (because that
is active once a directory gets entered) nor the file handling,
and thus never packaged such symlinks.

The fix is simple: find such special directory entries and move
them to the "files" list.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/package_rpm.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 92ddf7a..6483e96 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -197,6 +197,13 @@ python write_specfile () {
             if path.endswith("DEBIAN") or path.endswith("CONTROL"):
                 continue
 
+            # Treat all symlinks to directories as normal files.
+            # os.walk() lists them as directories.
+            for i, entry in enumerate(dirs):
+                if os.path.islink(os.path.join(rootpath, entry)):
+                    del dirs[i]
+                    files.append(entry)
+
             # Directory handling can happen in two ways, either DIRFILES is not set at all
             # in which case we fall back to the older behaviour of packages owning all their
             # directories
-- 
1.8.4.5


