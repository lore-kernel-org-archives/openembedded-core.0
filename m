Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E546B605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 22:17:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 22 Apr 2015 15:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,626,1422950400"; d="scan'208";a="717723618"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.16.55])
	([10.219.16.55])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2015 15:17:02 -0700
Message-ID: <55381DE2.8070503@linux.intel.com>
Date: Wed, 22 Apr 2015 17:17:06 -0500
From: Mariano Lopez <mariano.lopez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity.bbclass: Increased verbosity for connectivity check
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
X-List-Received-Date: Wed, 22 Apr 2015 22:17:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The connectivity sanity error doesn't tell you which URL failed to fetch 
nor how it failed.

This provides the URL that failed and why it failed using 
BBFetchException messages during the connectivity check.

[YOCTO #7592]

Signed-off-by: mlopezva <mariano.lopez@linux.intel.com>
---
  meta/classes/sanity.bbclass | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index cca39c9..f7e8212 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -278,12 +278,12 @@ def check_connectivity(d):
          try:
              fetcher = bb.fetch2.Fetch(test_uris, data)
              fetcher.checkstatus()
-        except Exception:
+        except Exception as err:
              # Allow the message to be configured so that users can be
              # pointed to a support mechanism.
              msg = data.getVar('CONNECTIVITY_CHECK_MSG', True) or ""
              if len(msg) == 0:
-                msg = "Failed to fetch test data from the network. 
Please ensure your network is configured correctly.\n"
+                msg = '%s. Please ensure your network is configured 
correctly.\n' % err
              retval = msg

      return retval
-- 
1.8.4.5


