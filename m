Return-Path: <dominic.sacre@gmx.de>
X-Greylist: delayed 307 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Feb 2017 10:50:32 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by mail.openembedded.org (Postfix) with ESMTP id 03DF173195
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 10:50:32 +0000 (UTC)
Received: from dastp.fritz.box ([80.147.195.117]) by mail.gmx.com (mrgmx002
	[212.227.17.190]) with ESMTPSA (Nemesis) id 0M1VlJ-1cP2fV3dU1-00tV5Y;
	Wed, 15 Feb 2017 11:45:24 +0100
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 11:44:49 +0100
Message-Id: <20170215104449.6186-1-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Provags-ID: V03:K0:mOGkNybcaTd4dEO6BC5LnE7rZvGij6p8yiWJChtX3f/8aKRiT2Q
	0HHrCu1z8jPJU4NpWruZg/z4h8CGTmnOcz32myypzojxrlShCQMzQvN7qxUVFXWjhdPFg1M
	/Gq3k/CW0NFjFqld/fU+FtbGPVyToVhNyNW9AIbFpDQ4I8WxVtvARMxh+fnxi718Nfbx/C8
	21kbSetSPKifr1L9M+iHQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:SUjmAqrXV6U=:fYBauI/zePsCmJfDeBcWB2
	xZyR0ITEsfme0CbANeqv8m8B+KqkjMIhtQtQ59MHkcuY8BdAZ7Vx+0j6HwrxUfCo0Z5PyH/Lj
	jwh0eapCOhmmzeaZHx9hMWE3mReQKI/nBIMZpNnWPfqUXBaJrr/h7V09Acwhi1403tVWrM9NF
	HlayTv/AE5uNPvZDW7vm22eRI34aSvKMOjWBjC3jcE0BH/HOX9NixaN7epjyz1EriR8zqjiCl
	D/crnxEHtAC2ffnjtAGGua78GE5D+awKxwUnTudQhRWMdhrIFehB7NcwE/sdUhIY4seOq/CoV
	p80USsSmDZ0Ltebw0F5kYKBMSh/cPIaX7yt/l6qyA26DS0ngocLPAxbH303NZJrdH5SHmpjuA
	IsSFxI8qJCNOIB2aZQaWOoL2bIp/2kY5rBGJi1ZuHOhD0v79WppBqmhYSO6hT7wIWfxW/UoQR
	NsMI3EIjdNE6285SOjB81ITL5mh+kpNw8AbyhWbX9m0THiejmXvjWsamiXuvy9PrCrxEkudZb
	biTDQkgYiWSfe5wseg/gGEVDc/YGsVjLAGTBIYIRIiFQ2XPOTrOabHV8spNrrinhM9BrFKujH
	HxU1Lv/Wx0xMYnuZpmrvUa6PuX7rvTpYk8pOblMcXobtthZxZQNCWy5NL8RCteL1s3R4qSPTg
	vfX8mDj8Vs4sVRG3xCaNEcuA/OmCiyyiLgAgj2wnl5VF2yIREqGIllJ8XvZVMRp2lRhKZaJJk
	bAwKIlUkpIbyuifQtztzJEYYPiryJjtZFyXVWrL1wtSpHh4h1ajHz8bvGsNXdkLlGKYy2G/QN
	MtMX4sF
Subject: [PATCH] lib/oe/patch: Support xz-compressed patches
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
X-List-Received-Date: Wed, 15 Feb 2017 10:50:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add .xz to the list of extensions recognized by patch_path(), so that
compressed patches ending in .patch.xz or .diff.xz are automatically
applied.

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 95674b3706..aaa2d3aabd 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -776,7 +776,7 @@ def patch_path(url, fetch, workdir, expand=True):
 
     local = fetch.localpath(url)
     base, ext = os.path.splitext(os.path.basename(local))
-    if ext in ('.gz', '.bz2', '.Z'):
+    if ext in ('.gz', '.bz2', '.xz', '.Z'):
         if expand:
             local = os.path.join(workdir, base)
         ext = os.path.splitext(base)[1]
-- 
2.11.0


