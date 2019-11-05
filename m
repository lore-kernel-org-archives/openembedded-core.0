Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6976C7F8A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:44:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47739L3CFBzHq
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:44:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572990294;
	bh=TDGOvceTFBTAiDIBVlH3oriIDFpUl8/od1J2r5JQE/M=;
	h=From:To:Subject:Date:From;
	b=PWKAXNcX5XlT4VcaDufrQmljULB3M40Vf/L/8CJWFvsWu4KVVYQeOzq18wsHUZlJi
	aGp/sA69pld+QStvoOpAAEhy+HRCcEdFD0t0bNUx+twLdhqe6f6lv4MD+laoOSsKUy
	PZNvZh5yVJTvxLkEHckC8yLd8ALLlF5tcDxd+nYaiBQgxXFab+XNZJS2wVIRn9kXcR
	EpjD+F+9JeBMk2TTZn+J+uvc608O9bRsKL2GQtM1Jwa477X0J1q6/cdlI6ZhzTXjan
	n7nvsOyjFcXq4Ym7BFWu6dvU0cLd71gJ/WHPzf8ACjvKnU70uNDpjrUgrtfxn4O6+s
	zMK1BpeZ0WReJpWlxr7F0qru4szbs81+SOMWhRLn46AFsivvL30twXt3K7A4XyEHqb
	CH8AGC1//RjTemjDKuhXvV+2vnNQbLRt/QB82ccIvMQ92db1ruw/79gFEETkh9lIip
	XZ1BYPWdSThROj12vNkxzlHOL65+ReFbs7h5MrWrWJz2JRB/Xh2Fxlg28DUDfODpvw
	+xl5Aobp0Cijqx8p43xY6PbiV7ZDNqDr13O5YJkt3sOwDHdIakvzNpJ2mX3BsjGmUO
	6Z8TiRA7nxxYgvE9b+Jc9L5MxM3T3B7sc4zvqmVZ8kdkSPaoP7FjZCuux2c5QTvgpL
	nQ4yXdjCJyczR8SL4K2jhokg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:44:48 +0200
Message-Id: <20191105214448.2511-12-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] procps: whitelist CVE-2018-1121
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
X-List-Received-Date: Tue, 05 Nov 2019 21:44:53 -0000

From: Ross Burton <ross.burton@intel.com>

This CVE is about race conditions in 'ps' which make it unsuitable for security
audits.  As these race conditions are unavoidable ps shouldn't be used for
security auditing, so this isn't a valid CVE.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-extended/procps/procps_3.3.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/procps/procps_3.3.15.bb b/meta/recipes-extended/procps/procps_3.3.15.bb
index 9756db0e7b..a20917b223 100644
--- a/meta/recipes-extended/procps/procps_3.3.15.bb
+++ b/meta/recipes-extended/procps/procps_3.3.15.bb
@@ -64,3 +64,6 @@ python __anonymous() {
         d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir'), prog))
 }
 
+# 'ps' isn't suitable for use as a security tool so whitelist this CVE.
+# https://bugzilla.redhat.com/show_bug.cgi?id=1575473#c3
+CVE_CHECK_WHITELIST += "CVE-2018-1121"
-- 
2.17.1


