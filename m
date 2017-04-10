Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BAE7F77BE8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 20:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491857980; x=1523393980;
	h=from:to:cc:subject:date:message-id;
	bh=tvRN2dmumUTlkMZrAPKaJd2YWfz2dtz+mS8Xu7KOTLk=;
	b=wbQTiucX4FJwNgZYK/p8CmWRsTIuLHcbBLO6OLHbmfDTl/wlXwIoYmpD
	7OTcx3/zGfvKSgv/wdnqP0t9YU0YUQ==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2017 13:59:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,183,1488873600"; d="scan'208";a="72231701"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2017 13:59:39 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 13:59:36 -0700
Message-Id: <1491857976-4353-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] classutils.py: deterministic sorting
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
X-List-Received-Date: Mon, 10 Apr 2017 20:59:38 -0000

The method "prioritized" returns a list sorted by the value
of the "priority" field, in descending order. However, if several
list items have the same priority, the ordering of those items
within the priority-sorted list becomes random. As a consequence,
we may end up with a non-deterministic oe-terminal spawning, as several
terminals have the same priority. So running commands such as

$ bitbake xxx -cdevshell
$ bitbake yyy -cmenuconfig

may spawn a different terminal each time, for example sometimes Gnome
and sometimes Konsole as hey have the same priority.
Rather than modifying the priorities so they all differ, we sub-sort
the list based on (terminal) names.
This way we achieve a deterministic outcome.

[YOCTO#10938]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/lib/oe/classutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/classutils.py b/meta/lib/oe/classutils.py
index e7856c8..45cd524 100644
--- a/meta/lib/oe/classutils.py
+++ b/meta/lib/oe/classutils.py
@@ -36,7 +36,7 @@ abstract base classes out of the registry)."""
     @classmethod
     def prioritized(tcls):
         return sorted(list(tcls.registry.values()),
-                      key=lambda v: v.priority, reverse=True)
+                      key=lambda v: (v.priority, v.name), reverse=True)
 
     def unregister(cls):
         for key in cls.registry.keys():
-- 
2.7.4


