Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F0AD76FF56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 07:34:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9G7Yv2o029126
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Oct 2018 00:34:57 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 16 Oct 2018 00:34:56 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Tue, 16 Oct 2018 00:34:56 -0700
Message-ID: <20181016073456.31407-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] gobject-introspection.bbclass: fix gir installed but not shipped in any package while multilib enabled
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
X-List-Received-Date: Tue, 16 Oct 2018 07:34:58 -0000
Content-Type: text/plain

Since commit [9524330 gobject-introspection: fix multilib install
file conflicts] applied in oe-core, while multilib enabled, gir
files will be installed to `${libdir}'.

Refer above commit, modify gobject-introspection.bbclass to
split gir to package correctly.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/gobject-introspection.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index b6160b8..a323c1f 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -40,4 +40,4 @@ FILES_${PN}_append = " ${libdir}/girepository-*/*.typelib"
     
 # .gir files go to dev package, as they're needed for developing (but not for
 # running) things that depends on introspection.
-FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir"
+FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir ${libdir}/gir-*/*.gir"
-- 
2.10.2


