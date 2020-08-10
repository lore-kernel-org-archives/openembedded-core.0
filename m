Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.46517.1597071175909435602
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2020 07:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: TqiNkqPNA7aBZNnyujcC5h/yOCIsV5Vnv0+4H5ggbIAtpmPweIS+uCgTmDwYELHO3faqIstGq2
 rXZ9pZwcLiIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9708"; a="238376817"
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="238376817"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 07:52:56 -0700
IronPort-SDR: bqdqSW8zdvZxFH6PlxUVQZittv8x/bu6YoWbk6ZUE7soKgGokQG33zajPScwuNxjhIEKNhA/dG
 L4BSMw7GFtZQ==
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="494819257"
Received: from sshettyx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.64.39])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 07:52:54 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 1/4] pypi.bbclass: mind package suffix on version check
Date: Mon, 10 Aug 2020 22:52:44 +0800
Message-Id: <13b145b9551884534f1dd2446eccfc55abc25f38.1597071024.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597071024.git.anuj.mittal@intel.com>
References: <cover.1597071024.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Weihmann <kweihmann@outlook.com>

Some pypi packages do have suffixes like dev, or a0 or b1.
When doing a version check on these, the version will get falsely
identified as major release versions.
Add a terminating slash to rule out those false positives

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 0603f6d9f2abfa67b99b1bc39228f6aa16a0370d)
[Yocto bug #13990]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index e5d7ab3ce1..ffa8aa3ff4 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -23,4 +23,4 @@ SRC_URI += "${PYPI_SRC_URI}"
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
 UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
-UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
+UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.26.2

