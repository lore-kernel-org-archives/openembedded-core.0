Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 485E9601F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 20:04:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2EK4m7q002203
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Mar 2019 13:04:48 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 14 Mar 2019 13:04:47 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 14 Mar 2019 16:04:14 -0400
Message-ID: <1552593854-14059-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552593854-14059-1-git-send-email-mark.asselstine@windriver.com>
References: <1552593854-14059-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [v2][PATCH 2/2] goarch.bbclass: set TARGET_GOARM as '7' for valid cortexa* targets
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
X-List-Received-Date: Thu, 14 Mar 2019 20:04:48 -0000
Content-Type: text/plain

Per https://github.com/golang/go/wiki/GoArm we need to set GOARM when
building for ARMv5, ARMv6 and ARMv7. The current code in go_map_arm()
does not account for the Cortex* TUNINGs and as such misses several
Cortex variants which implement ARMv7. Here we add an additional check
that will include Cortex-A5 through Cortex-A17 as ARMv7 variants
(ie. GOARM='7'). The Cortex-R and Cortex-M variants are also captured
even though there are no tunings for these currently (lack MMU support
so not supported).

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

V2
* Cover all ARMv7 Cortex* variants


 meta/classes/goarch.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 39fea5e..84977a5 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -74,6 +74,10 @@ def go_map_arch(a, d):
 def go_map_arm(a, f, d):
     import re
     if re.match('arm.*', a):
+        for el in f.split():
+            m = re.match("cortex[arm](\d.*)", el)
+            if m and int(m.group(1)) < 32:
+               return '7'
         if 'armv7' in f:
             return '7'
         elif 'armv6' in f:
-- 
2.7.4


