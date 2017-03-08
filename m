Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6EF93608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 14:34:37 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id u48so24707660wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 06:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=243NW3/i0HY3DMVhiunsb4dvrayoI7gZ8emkFf0zXcY=;
	b=CpH/3B73/U2RjyPAQxbmm3y2fUvCovQP5Hdy2sTRQeBeHvDIc1vUsAb1RvCrMuF0gh
	UpUbqtwhc7J+QmO+s/8AR+EDp0dpXrp2pyxjV/GcZlBxxhPpsK+rMdhB0HcsRar8hvWS
	RL2ZzUimx4WAnISxtCSW82s5S7+wzCTRb1gliyrXMaYz4w8Oosj3kH/qWTl77o5PdeuG
	TFcM+g91Z7XP7WQQHdClopIPahQIiHU98675rbH5pTvlPnP6bjGHJclZ7aIiqOnqT/ql
	/AC07e8YDvf2DxyCR/BjcLYDsMYTB2B+ez/M0mT3LZX+0EXIyW8qJpUEnofsDFdCe4GV
	3zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=243NW3/i0HY3DMVhiunsb4dvrayoI7gZ8emkFf0zXcY=;
	b=ehY2M7uA8qIgNArK5Q087yZDyqanzCeF0V5EoF0Ab+tOqjBBOJp+nWpjsbq+qs58N+
	TIP406YBgDCwAWlVUOvoYc09KiC5GIK+1S8ftu3DySC5MMG+TDKNT2ypXhTtePDd8Mms
	C3NifzXTObwummNzYCplYZgNvMXUsikvjD7crFqkCB8UxB74ViK1k/bnU6YolN6sB605
	kjuhlyHVca5qTKmcno8RxslYDRFKJsZAaBRZJCf2j135UcGHN1Ks06nYm40PzQTtL2jq
	jcRCtnYpHBFMZDH1VFZlMwoLz4NwzBegcB5Q8niea3G1wDACx7TRYWpyQ/+NEoNNWPeK
	vyOA==
X-Gm-Message-State: AMke39kcjRVKHWtgcZY/jVKKpw6QutjZ0apll2P+8ha5j9cDyp+dR71xPmUpgPAfPrVszOnJ
X-Received: by 10.223.132.37 with SMTP id 34mr5339156wrf.45.1488983677313;
	Wed, 08 Mar 2017 06:34:37 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	j26sm4387585wrb.69.2017.03.08.06.34.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Mar 2017 06:34:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Mar 2017 14:34:34 +0000
Message-Id: <1488983674-13774-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] license: don't assume source files are UTF-8
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
X-List-Received-Date: Wed, 08 Mar 2017 14:34:38 -0000

We can't assume that source files are entirely UTF-8, so when copying the
license blocks open the file as binary instead of text.

[ YOCTO #11135 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/license.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 0ff6560..81458e7 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -386,9 +386,9 @@ def copy_license_files(lic_files_paths, destdir):
                 if begin_idx is None and end_idx is None:
                     shutil.copyfile(src, dst)
                 else:
-                    with open(src, 'r') as src_f:
-                        with open(dst, 'w') as dst_f:
-                            dst_f.write(''.join(src_f.readlines()[begin_idx:end_idx]))
+                    with open(src, 'rb') as src_f:
+                        with open(dst, 'wb') as dst_f:
+                            dst_f.write(b''.join(src_f.readlines()[begin_idx:end_idx]))
 
         except Exception as e:
             bb.warn("Could not copy license file %s to %s: %s" % (src, dst, e))
-- 
2.8.1


