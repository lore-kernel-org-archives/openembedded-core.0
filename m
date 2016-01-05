Return-Path: <dl9pf@gmx.de>
X-Greylist: delayed 306 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Jan 2016 20:22:34 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by mail.openembedded.org (Postfix) with ESMTP id D94DE600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 20:22:34 +0000 (UTC)
Received: from elrond.auenland.lan ([95.90.4.156]) by mail.gmx.com (mrgmx002)
	with ESMTPSA (Nemesis) id 0LkgEO-1ZgNoW2eSi-00aSRg;
	Tue, 05 Jan 2016 21:17:32 +0100
From: dl9pf@gmx.de
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jan 2016 21:17:25 +0100
Message-Id: <1452025045-32026-2-git-send-email-dl9pf@gmx.de>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1452025045-32026-1-git-send-email-dl9pf@gmx.de>
References: <1452025045-32026-1-git-send-email-dl9pf@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K0:VMSmQIvioiGd47RN3t55N7oINwgyHlr0CTyoEqMetkiDOIX4fK3
	nRItF7Sp0l1F7FRrVXP0tFQf8zX2Cuo0wbUF+s0W9CXSrQ405N+kCry4FyuD/znW8PsxIyD
	xD/ckR+wZE7u6zZOY7x54j1u5Sp/YfD4MSdwYm9gaoKdDKxlgg0G6APanuQIUxX04AQIbYJ
	IkhW9dmBBtCFyQ+rOQ30w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:6XsctIHuqT8=:5ajtSD5mOfzDAQjhYvX6Xg
	ghdkX+9idtx8UwZLhlRFq2wOSkjoMsw+Aad3WuLou+ptE9mEAAXHc2Qe3ieIsIsa0b7aT49+2
	bQcBXDUUPl+UqKalzofx93as+FT1IX1eZuG4WZQ6xzVpbv1vjh2zHP+NztY1nz9KrShUNhjj+
	hDlBszR30qMD1Rx+consvDGGTs8TSuXICV9CL5rhgnx5KG4sWNy2X+CaQY0dmEGaK+g01Om5K
	egIiPWoEEVT2n7fAKxVPJ41hvtk5qlahQVACA03RUwH+HLmt1JO/3Os7j/d/j17YSl32pLG56
	tLuZqQkW8pdnkiBSMnr4Ux1BO+mQn/A3jjH/fgr/ShqOgmvXCiTUEJ3L+aN0pTXbCQDSqmJpb
	rTXNhXR6/SIbwYsmA5eBm3t+ZO3vz0Ungd6071PrAFQsgWNFUV92RT3aFcnEMUL10TeymfUfn
	RyZjQlrI+7YbRn90vIqGLItb5EAlEKiYs44xOOuC5ZpK8WQqWSUgXvnmuU9CiFoD3zDZ7bGIw
	OCmxBdc+pQG8ldTO2cU/FjaTF3sMdAD1txXC2Jyk5H8RPl1o+NXAtkI9Vrnjcxx2do8/UCwej
	Thouup0YKLHfcJDNOawu3tGV5K5SqJeh58DCFsoSiwHVjn5DVfoO6ClYFaf61bRCXjU8Bzn55
	NdNLN7cFhL/kjbEYPwK0sAWuodTHvSODdXpSDmxeALu6W5aznLT0uC5ViiUbvbBrVcXU0xbNK
	VmRj5ucpFv1N2bC1+q3cs+K6Z/yfKykk/MmzV2LQYh+ns0H4tPSTG68V8X/K0jxNJxC5HcY91
	iM9SdRM
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
X-List-Received-Date: Tue, 05 Jan 2016 20:22:36 -0000
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


