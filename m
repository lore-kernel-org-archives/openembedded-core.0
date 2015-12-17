Return-Path: <dl9pf@gmx.de>
X-Greylist: delayed 302 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Dec 2015 21:39:24 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by mail.openembedded.org (Postfix) with ESMTP id 0B73A6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 21:39:24 +0000 (UTC)
Received: from elrond.auenland.lan ([95.90.4.156]) by mail.gmx.com (mrgmx102)
	with ESMTPSA (Nemesis) id 0Lfppu-1aXRDw0IEE-00pKRO;
	Thu, 17 Dec 2015 22:34:22 +0100
From: dl9pf@gmx.de
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 22:34:19 +0100
Message-Id: <1450388059-21254-1-git-send-email-dl9pf@gmx.de>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Provags-ID: V03:K0:A8fIVvwauLg8Ru2qVOkzjV73Sq0TVGMHk8eqgSv8o5NSeIhH9gL
	o+iADC2EzOs7SDRqCCli+/cTROd+zOQE/ZOGZWEYNQtfTNSjIq0NNOzCSwLU2OnZyka2xSj
	M3+xCJ4IWd2yJgHiIGVrf8WVzBUUREtemV3xyjz7Txe8Mid8qhcS5GyD9FiCKPedLyckC3H
	BEmXR/mUj04GH7QxouhuA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Y8UfE5yc9Io=:m6Oyeav8IU26XU1dTZlmNs
	d+33EulP1tdTmIByzlTCz/7gCGgkmIAsyDlc5IuoFK+FYdGu2aTR6uwIYWeJ1snCkX1xuZE80
	VA4qUWQZ5Q+0ZG8ercR7tGrgsJgCp04GDEWUpJC1wPXNt/0YX1lqFN4CS8/IMRFu8FXluEdq4
	6/xWmsJMReLIn7eoeqeHp/6bqzCtypkBEJWouorKVoDfX2T6MpniHS9WKgEWEH/r/IBHyF3dj
	YG8vQc118B8YQLVtZ1LilZs2jWBzFLobeM+srVml01dJ5oEPf+sVF3wmB8n133dcMFfO3hOMM
	qsInhvp7arcdLqQEsaNl4gp3V0m8qWNln498Med9wXGPMFwq69gemCXBnt7oWtVWVSdszKBu9
	2ucTy6Zdf0swyNKro4ffIw3jgE95FUEZ985yNrGMCpFTl/0efK7K4NUyEVdq7IDq7tosEiVA6
	LbE1eaNdzXtgAdlvjFlK0sENhMD54pFU1EC7Q/P4Eu6IRBoJmRU7x07t5FQQypW54zTweb9Ld
	U7xHh4nGngvR/fzLy26+7tz1waveQYw+i5bGSSebifRGzN6mit2LiT8QTW4FLQGyS9V9OgGQu
	ekB40FFhPQtu0AJBtl1Lsjy1chDA0jDxPgHDV+p1Cnl7n8Turms1msWXDTLH/8t2wKrU5GhtW
	e5kPaRpHj2GsJR0z52CpqYxQ6o5LzcYjyRFQWqM6LkDM61n2zVpSn1NIHGCVE6TRVWYAH1Wb0
	rag2uvVPj1iVyJUxK14D3f8828qIZ8iOWMzyejTco92sOoLSROkYezOC70RFG/6dtSP0RisuW
	ecdrS8g
Subject: [PATCH] Fix connectivity check for BB_FETCH_PREMIRRORONLY case
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
X-List-Received-Date: Thu, 17 Dec 2015 21:39:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jan-Simon Möller <dl9pf@gmx.de>

BB_FETCH_PREMIRRORONLY sets BB_NO_NETWORK (implicitly in the fetcher).
To avoid the sanity check to fail in an offline environment,
use the same override mechanism as in the fetcher.

Signed-off-by: Jan-Simon Möller <dl9pf@gmx.de>
---
 meta/classes/sanity.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index ad9dda8..62dce92 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -271,6 +271,9 @@ def check_connectivity(d):
     test_uris = (d.getVar('CONNECTIVITY_CHECK_URIS', True) or "").split()
     retval = ""
 
+    # Check for BB_FETCH_PREMIRRORONLY and adapt BB_NO_NETWORK
+    if bb.data.getVar("BB_FETCH_PREMIRRORONLY", self.d, True) is not None:
+        bb.data.setVar("BB_NO_NETWORK", "1", self.d)
     # Only check connectivity if network enabled and the
     # CONNECTIVITY_CHECK_URIS are set
     network_enabled = not d.getVar('BB_NO_NETWORK', True)
-- 
2.6.2


