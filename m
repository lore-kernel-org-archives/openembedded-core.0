Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6Rna-0001GK-7i
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 20:45:34 +0200
Received: by bke11 with SMTP id 11so2123691bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=/PSz5E7ExBVUPju+VGcTpxS7U2njB9QYaKvTezj0nPc=;
	b=WPu53ozdB+6DZDC97dB/WGYtLCe23nhvnxnnVDBXsyT+I8V58CTRDamR34RN7CENUa
	XkWp02kJ08fXhtjI21IscE3YzECpSnP+FBqi1TpRZf7/oIFWPwcD3D+kPukyM17WBHx2
	2rG/TMTffD7abKxqKmnQoKvVq9tOCQBEOzQAI=
Received: by 10.204.142.144 with SMTP id q16mr827200bku.267.1316630415711;
	Wed, 21 Sep 2011 11:40:15 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t16sm5806554bkv.11.2011.09.21.11.40.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 11:40:15 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:39:49 +0400
Message-Id: <1316630404-10336-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 02/17] icecc.bbclass: fix handling of nativesdk and cross-canadian packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Sep 2011 18:45:34 -0000

icecc.bbclass assumed that nativesdk and cross-canadian packages should
use local icecc version. Instead those packages should use target-like
scheme for toolchain tarball generation.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/icecc.bbclass |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 710d798..f8e9d88 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -113,9 +113,7 @@ def icc_is_kernel(bb, d):
 def icc_is_native(bb, d):
     return \
         bb.data.inherits_class("cross", d) or \
-        bb.data.inherits_class("cross-canadian", d) or \
-        bb.data.inherits_class("native", d) or \
-        bb.data.inherits_class("nativesdk", d);
+        bb.data.inherits_class("native", d);
 
 def icc_version(bb, d):
     if use_icc(bb, d) == "no":
-- 
1.7.2.5



