Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 90CCE71306
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 09:04:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8394WuQ024471
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Sep 2014 02:04:33 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 3 Sep 2014 02:04:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 02:04:30 -0700
Message-ID: <27aa87dd02dc9dbe963b2d2ab4e476a5b306d968.1409727368.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409727368.git.liezhi.yang@windriver.com>
References: <cover.1409727368.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rpmresolve: ignore null requires
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
X-List-Received-Date: Wed, 03 Sep 2014 09:04:35 -0000
Content-Type: text/plain

It is not a problem if a package requires nothing (similar to RDEPENDS
is null), for example, these packages depends on nothing:

[snip]
alsa-conf-base
base-files
eglibc-binary-localedata-en-us
xserver-xf86-config
[snip]

The rpmresolve-native's algorithm is:
===fake code
for pkg in pkg1, pkg2, pkg3:
    rc = get_req(pkg)
return rc
===fake code

Suppose of the 3 pkgs requires null:
- We are lukcy if pkg1 or pkg2 is null, nothing happend.
- We are *not* lukcy if pkg3 is null, and will get the error when "INHERIT +=
  'buildhistory'":
  ERROR: Cannot get the package dependencies. Command
  '/path/to/x86_64-linux/usr/bin/rpmresolve -t /path/to/var/lib/rpm' returned 1:

This patch fixes the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c b/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
index 4e9d055..7f4caf9 100644
--- a/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
+++ b/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
@@ -275,7 +275,13 @@ int printDepList(rpmts *ts, int tscount)
                 char *name = strdup((char *)he->p.ptr);
                 /* Get its requires */
                 he->tag = RPMTAG_REQUIRENAME;
-                rc = (headerGet(h, he, 0) != 1);
+                if (rc = (headerGet(h, he, 0) != 1)) {
+                    if (debugmode) {
+                        printf("DEBUG: %s requires null\n", name);
+                    }
+                    rc = 0;
+                    continue;
+                }
                 ARGV_t reqs = (ARGV_t)he->p.ptr;
                 /* Get its requireflags */
                 he->tag = RPMTAG_REQUIREFLAGS;
-- 
1.7.9.5


