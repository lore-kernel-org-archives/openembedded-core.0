Return-Path: <ross.burton@intel.com>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id CCCF277C9E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 13:34:12 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id x137so26677293lff.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 06:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=zKCQkoSMTESctLLQMMk7GVFOq5p7sLJCzrJjovaaQa8=;
	b=frDdSWAyGRE0pjgsZh/lVv0XLoBa+mOzYASe6mmXBR2QL0mT5N750sWceaXmTSJg/i
	iWbp1URBIqwkLZTnrXHAq1a5+Zb77Evwbw9ee8+vLhDcAS7TRSJ3sJ03merxcwEKM9ie
	N7CENLBOYqg3Grpos0fYAhfxPzQ81cPNojyckXmh80bOl9zFWlrXK8hJmdgxf6X3Q17B
	u8dFlQlEvr7Xkvu8FWIiaNbLAnhQchv6IkUcBFxH/NG2RED7z6WxYlOJfP8/KPCGm0r/
	SZ7zUh/8wO2dD4N9IXtUyxZ58WVljZ5OgSI1h23gDlxisZMQA2eiIBa4ezLScsFbXY74
	jlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=zKCQkoSMTESctLLQMMk7GVFOq5p7sLJCzrJjovaaQa8=;
	b=fOQMHy2LKV4dRmb2GyX2k7fPdh8iISavW+qpGiDaquiNMIsO0ZqLVYORyfzUA/3+yX
	HLHFQMK3ANG4izIu0kLqHPBOCFQUXLXs3xWMuXpV5uj2nMj2vFtYfCK1QAAI0VZU2kRv
	1BI+RB/5c8HycpbRQrKz4idlADXCEZsp2lj3ulL1Z7FFrlZ4uLX23WRaHHKw4g0sKkCJ
	+9qORv5CvT8r8cEvaWpZ5nbe/QBJApFEr3qRiTDZBB7oWEu4/0oE4cJJv0J6MTJ27wJN
	iJsUw3TZZbgqTD2MQIi65MKgxLel0Z15+FrpzYl7MuK8+Bc5Q9Drt9zxN/Q20sTN/iDc
	84pA==
X-Gm-Message-State: AFeK/H09VUYpelsE6TgQ6e4O/QTEsnBVIkR2D3Cxh1A+OGT29JQVz0lUewYwS/PoEPlFayon
X-Received: by 10.28.139.195 with SMTP id n186mr414292wmd.139.1490880853164;
	Thu, 30 Mar 2017 06:34:13 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	x103sm1925718wrb.5.2017.03.30.06.34.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Mar 2017 06:34:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 14:34:10 +0100
Message-Id: <1490880850-30814-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] base.bbclass: ensure HOSTTOOLS links point to executables
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
X-List-Received-Date: Thu, 30 Mar 2017 13:34:14 -0000

Use the new executable argument to bb.utils.which() to ensure that the symlinks
point to executable files and not for example directories with the right name
which happened to be on $PATH.

[ YOCTO #11256 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index cf8748a..e29821f 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -128,9 +128,9 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
     for tool in tools:
         desttool = os.path.join(dest, tool)
         if not os.path.exists(desttool):
-            srctool = bb.utils.which(path, tool)
+            srctool = bb.utils.which(path, tool, executable=True)
             if "ccache" in srctool:
-                srctool = bb.utils.which(path, tool, direction=1)
+                srctool = bb.utils.which(path, tool, executable=True, direction=1)
             if srctool:
                 os.symlink(srctool, desttool)
             else:
-- 
2.8.1


