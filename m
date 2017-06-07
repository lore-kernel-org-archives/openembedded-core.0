Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9B92278145
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 15:55:03 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 07 Jun 2017 08:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,311,1493708400"; d="scan'208";a="112050349"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2017 08:55:01 -0700
Message-ID: <1496851429.26945.132.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Peter Marko <peter.marko@siemens.com>
Date: Wed, 07 Jun 2017 11:03:49 -0500
In-Reply-To: <1496815471-23075-5-git-send-email-peter.marko@siemens.com>
References: <1496815471-23075-1-git-send-email-peter.marko@siemens.com>
	<1496815471-23075-5-git-send-email-peter.marko@siemens.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 4/4] cve-check-tool: fix crash on exceptions
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
X-List-Received-Date: Wed, 07 Jun 2017 15:55:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

the commit shortlog does not match what the patch is doing, unless the
new replaced function is the one avoiding exceptions..




On Wed, 2017-06-07 at 08:04 +0200, Peter Marko wrote:
> This fixes cve-check-tool crashes on exceptions.
> 
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../cve-check-tool/cve-check-tool_5.6.4.bb         |  1 +
>  ...01-Fix-freeing-memory-allocated-by-sqlite.patch | 50 ++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch
> 
> diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> index 1f906ee..4829b11 100644
> --- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> +++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> @@ -11,6 +11,7 @@ SRC_URI = "https://github.com/ikeydoherty/${BPN}/releases/download/v${PV}/${BP}.
>             file://0001-print-progress-in-percent-when-downloading-CVE-db.patch \
>             file://0001-curl-allow-overriding-default-CA-certificate-file.patch \
>             file://0001-update-Compare-computed-vs-expected-sha256-digit-str.patch \
> +           file://0001-Fix-freeing-memory-allocated-by-sqlite.patch \
>            "
>  
>  SRC_URI[md5sum] = "c5f4247140fc9be3bf41491d31a34155"
> diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch b/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch
> new file mode 100644
> index 0000000..4a82cf2
> --- /dev/null
> +++ b/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch
> @@ -0,0 +1,50 @@
> +From a3353429652f83bb8b0316500faa88fa2555542d Mon Sep 17 00:00:00 2001
> +From: Peter Marko <peter.marko@siemens.com>
> +Date: Thu, 13 Apr 2017 23:09:52 +0200
> +Subject: [PATCH] Fix freeing memory allocated by sqlite
> +
> +Upstream-Status: Backport
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + src/core.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/core.c b/src/core.c
> +index 6263031..6788f16 100644
> +--- a/src/core.c
> ++++ b/src/core.c
> +@@ -82,7 +82,7 @@ static bool ensure_table(CveDB *self)
> +         rc = sqlite3_exec(self->db, query, NULL, NULL, &err);
> +         if (rc != SQLITE_OK) {
> +                 fprintf(stderr, "ensure_table(): %s\n", err);
> +-                free(err);
> ++                sqlite3_free(err);
> +                 return false;
> +         }
> +         
> +@@ -91,7 +91,7 @@ static bool ensure_table(CveDB *self)
> +         rc = sqlite3_exec(self->db, query, NULL, NULL, &err);
> +         if (rc != SQLITE_OK) {
> +                 fprintf(stderr, "ensure_table(): %s\n", err);
> +-                free(err);
> ++                sqlite3_free(err);
> +                 return false;
> +         }
> + 
> +@@ -99,11 +99,11 @@ static bool ensure_table(CveDB *self)
> +         rc = sqlite3_exec(self->db, query, NULL, NULL, &err);
> +         if (rc != SQLITE_OK) {
> +                 fprintf(stderr, "ensure_table(): %s\n", err);
> +-                free(err);
> ++                sqlite3_free(err);
> +                 return false;
> +         }
> +         if (err) {
> +-                free(err);
> ++                sqlite3_free(err);
> +         }
> + 
> +         return true;
> +-- 
> +2.1.4
> +
> -- 
> 2.1.4
> 



