Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 71B3465D59
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 08:08:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8H88sev018092
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Sep 2014 01:08:58 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 17 Sep 2014 01:08:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 17 Sep 2014 16:08:32 +0800
Message-ID: <368e48033c11b0943277c187e88ab75320d2bc8a.1410939794.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410939794.git.hongxu.jia@windriver.com>
References: <cover.1410939794.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] sstatesig: fix overrides behaviour to remove SIGGEN_LOCKEDSIGS_i586
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
X-List-Received-Date: Wed, 17 Sep 2014 08:08:58 -0000
Content-Type: text/plain

Require a sig file which SIGGEN_LOCKEDSIGS_i586 is not null, but
the actual SIGGEN_LOCKEDSIGS_i586 is null.
Invoking 'bitbake -e' and we got:
...
 3935 # $SIGGEN_LOCKEDSIGS_i586 [2 operations]
 3936 #   set /path/to/locked-sigs.inc:8576
 3938 #   del data_smart.py:406 [finalize]
 3939 #     ""
...

It was caused by the following commit:
...
(Bitbake rev: 899d45b90061eb3cf3e71029072eee42cd80930c)
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Tue May 31 23:52:50 2011 +0100

    bitbake/data_smart: Change overrides behaviour to remove expanded
      variables from the datastore
...

We add prefix 't-' to type to workaround the overrides behaviour.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 65dbac1..af7617e 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -146,7 +146,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         for k in self.runtaskdeps:
             fn = k.rsplit(".",1)[0]
             t = self.lockedhashfn[fn].split(" ")[1].split(":")[5]
-            t = t.replace('_', '-')
+            t = 't-' + t.replace('_', '-')
             if t not in types:
                 types[t] = []
             types[t].append(k)
-- 
1.9.1


