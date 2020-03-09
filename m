Return-Path: <admin1@stacktrust.org>
X-Greylist: delayed 302 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 09 Mar 2020 22:57:45 UTC
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
	by mail.openembedded.org (Postfix) with ESMTP id 8A8446108B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 22:57:45 +0000 (UTC)
Received: from autometa.com ([173.245.215.243]) by mrelay.perfora.net
	(mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id
	1MJmjN-1iwErN2w1p-00K7ZP; Mon, 09 Mar 2020 23:52:44 +0100
Received: by autometa.com (Postfix, from userid 1000)
	id 462FC4A92A2; Mon,  9 Mar 2020 18:45:18 -0400 (EDT)
From: Rich Persaud <rp@stacktrust.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 18:44:57 -0400
Message-Id: <20200309224457.16708-1-rp@stacktrust.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:BC6z36DUjg5+HW/KY2xvKsZKJs0YlMp8FH3nyg+xAJbuLnol7NP
	uFD7eXWDtoz5pSa/Yv9Z8/wxAekfmoca4xTKxwEh8+3xx5w8/u6JXfDLRoY+ny5LmkUg1uZ
	tr765fxmW9CUk62EJJia2qWal3XVJtVMRZ1LX8gNiF4PuXyI12d27Xr0Jmqmj1EekEizxQS
	tSzewZP3UhPqkwUPez3Hg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IWtVhsBs15k=:Pk+3hh7QLdUibbnEKmC8dx
	sMbWnJZUbyFTKHP5pC8ww3qWlzIayAmLXmT4vBSqFhHpqk3lkNAVWA5UNH6IGA5Yw509yEprf
	Kz7UOxCXhuLq8VcbzIj/+WkTpVv3svD2QsiUwnghiFgRvoVIZpdc6aTzPRNA8YwKrW1zorCm2
	VDQKnhRpESHfnzokmTOUsBMyJHRjwR1DmQeK91UY3Vt4Oc4a/ZxmnAVA3C3QUKFXyD0Suo15j
	VnlVNgbOkulx8acH5wEApmsCmqvIPpEB6iUKIaRp9oMRzLBGDjJcRC3Emx7IkKc2aKUIDRmBt
	gP0xjbW/Qs6+ix7j1cI2BVmsot541OpSLjNeBE47v1VkYfXiRif3vp21wSMe5qFhXWIfXaSHO
	CjUpfRVtRZ25YQx7zZsq0uP7OlFGlY/9zqBvum5EoqHgd1YxehXt7hahs2hKComWBsfF3D2MH
	WjSRcZpmS9YHwYphP1UFAKWMBrrqqNL52ybre1EQlgY2wUdHgLc11k7yb0tDgJX2R2coA7Pjl
	bQ0rgJHbhKuk+yb2434pWHndY/m8zSgGKxo6pwGP+oS2tsLv6YcLsLCh+W1pbdR63PXojpVhE
	j02zhN8cYhO5I4GmaNnGxKsqe1FWw4/iIvEyN08gQrhcb15m7EsLOpdzuKJM6hYvMadw9ENu4
	/+tef/xp3+fHiLsN1sRAdiMP93Pig2pjEGqShINhLZhnKxtzB5VM7KkQ75ihz9c9FMl/dm6SO
	1OsPvRLJXq8kYfngDfwJnwrsUOc130vZdAgIMIq3eR8R8TtZ1x+IAvlnqhkzwbAfFj+I02uAQ
	qUev7AYZubrw6YzhgFFp0t2n5CrViMw76VvUipnM363+j06tn6DtKpZeXNYWOqJOdtOmXPX
Cc: Rich Persaud <rp@stacktrust.org>
Subject: [PATCH] grub-efi-cfg: enable per-label APPEND override
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
X-List-Received-Date: Mon, 09 Mar 2020 22:57:45 -0000
Content-Transfer-Encoding: 8bit

For legacy bios boot configurations, syslinux supports multiple
labels with per-label APPEND definitions.  grub-efi-cfg supports
multiple labels, but only a single APPEND definition.

Enable optional per-label APPEND definitions for grub EFI, with
variable names prefixed by "grub_" to isolate grub definitions from
syslinux defintions.

Example use from an ISO image recipe that inherits grub-efi-cfg:

 LABELS_LIVE="foo bar"
 APPEND_grub_foo = "linuxcmdline"

No change in behavior for those using APPEND without overrides.

Signed-off-by: Rich Persaud <rp@stacktrust.org>
---
 meta/classes/grub-efi-cfg.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/grub-efi-cfg.bbclass b/meta/classes/grub-efi-cfg.bbclass
index 8b5ff20c72..3a2cdd698b 100644
--- a/meta/classes/grub-efi-cfg.bbclass
+++ b/meta/classes/grub-efi-cfg.bbclass
@@ -88,6 +88,12 @@ python build_efi_cfg() {
     for label in labels.split():
         localdata = d.createCopy()
 
+        overrides = localdata.getVar('OVERRIDES')
+        if not overrides:
+            bb.fatal('OVERRIDES not defined')
+
+        localdata.setVar('OVERRIDES', 'grub_' + label + ':' + overrides)
+
         for btype in btypes:
             cfgfile.write('\nmenuentry \'%s%s\'{\n' % (label, btype[0]))
             lb = label
-- 
2.20.1


