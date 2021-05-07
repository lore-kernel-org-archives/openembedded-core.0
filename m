Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: IYc+ARoVHKHeTgAg5wzGmrUdTRX6zgZ0DADMj76RNjCQTz5rkBS/7foQhQFhch29ngiUsLa0lT
 9WHymR2eFflQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794702"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794702"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:02:59 -0700
IronPort-SDR: IQMxGLvzJifhypRORUhsq4ZFQBM4lRA0BB0GTUUOrASHjhSCyY32qQaAjHFG9Dmso2qFiYKrY3
 KK8qaaR/+lWQ==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331553"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:02:58 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/31] pybootchart/draw: Avoid divide by zero error
Date: Fri,  7 May 2021 15:02:18 +0800
Message-Id: <f9d9f0333bd7c590eb1307c429d43408abffeb00.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When disk stats don't run frequenctly enough, we see divide by zero
errors. The code already has a fallback path so ensure we use it
for this case too.

[YOCTO #14360]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b71d30aef5dc2c360432c0dd4147859dd303ea48)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 53324b9f8b..29eb7505bc 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -271,7 +271,7 @@ def draw_chart(ctx, color, fill, chart_bounds, data, proc_tree, data_range):
     # If data_range is given, scale the chart so that the value range in
     # data_range matches the chart bounds exactly.
     # Otherwise, scale so that the actual data matches the chart bounds.
-    if data_range:
+    if data_range and (data_range[1] - data_range[0]):
         yscale = float(chart_bounds[3]) / (data_range[1] - data_range[0])
         ybase = data_range[0]
     else:
-- 
2.30.2

