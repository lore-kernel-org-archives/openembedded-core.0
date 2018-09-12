Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1D4E0796E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 09:40:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8C9eJDm008150
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 02:40:19 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 12 Sep 2018 02:40:18 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1536745043-80175-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <54ddd9ff-5d1c-35be-984d-994ba6a06a8a@windriver.com>
Date: Wed, 12 Sep 2018 17:40:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1536745043-80175-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] apr-util: fix ptest fail problem
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
X-List-Received-Date: Wed, 12 Sep 2018 09:40:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Please ignore this patch,  This is same as V1,  I  make a mistake, sorry.


On 09/12/2018 05:37 PM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> test_dbm test suite failed since upgrade of gdbm,
> from gdbm 13.1, return value changed for some function.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../apr-util/0001-apr-util-fix-ptest-fail.patch    | 44 ++++++++++++++++++++++
>   meta/recipes-support/apr/apr-util_1.6.1.bb         |  1 +
>   2 files changed, 45 insertions(+)
>   create mode 100644 meta/recipes-support/apr/apr-util/0001-apr-util-fix-ptest-fail.patch
>
> diff --git a/meta/recipes-support/apr/apr-util/0001-apr-util-fix-ptest-fail.patch b/meta/recipes-support/apr/apr-util/0001-apr-util-fix-ptest-fail.patch
> new file mode 100644
> index 0000000..316d54c
> --- /dev/null
> +++ b/meta/recipes-support/apr/apr-util/0001-apr-util-fix-ptest-fail.patch
> @@ -0,0 +1,44 @@
> +From 665ac3c36247218da7b61b977b3aeede5d6ec9a2 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 12 Sep 2018 15:30:41 +0800
> +Subject: [PATCH] apr-util: fix ptest fail
> +
> +Test suite test_dbm failed when gdbm is tested. From gdbm 13.1, have below
> +change:
> +
> +  * gdbm_fetch, gdbm_firstkey, and gdbm_nextkey behavior
> +
> +  If the requested key was not found, these functions return datum with
> +  dptr pointing to NULL and set gdbm_errno to GDBM_ITEM_NOT_FOUND (in
> +  prior releases, gdbm_errno was set to GDBM_NO_ERROR)
> +
> +in this place, we don't take GDBM_ITEM_NOT_FOUND as error, still should
> +return success, so make this patch.
> +
> +Upstream-Status: Inappropriate
> +- This patch is not appropriate for upstream, checked 1.6.x development
> +  branch, this part have changed to take dbm_said directly. so after apr-util
> +  is upgraded in the future, maybe this patch need to dropped.
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + dbm/apr_dbm_gdbm.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/dbm/apr_dbm_gdbm.c b/dbm/apr_dbm_gdbm.c
> +index 749447a..94e3a86 100644
> +--- a/dbm/apr_dbm_gdbm.c
> ++++ b/dbm/apr_dbm_gdbm.c
> +@@ -57,7 +57,8 @@ static apr_status_t set_error(apr_dbm_t *dbm, apr_status_t dbm_said)
> +
> +     /* ### ignore whatever the DBM said (dbm_said); ask it explicitly */
> +
> +-    if ((dbm->errcode = gdbm_errno) == GDBM_NO_ERROR) {
> ++    dbm->errcode = gdbm_errno;
> ++    if (dbm->errcode == GDBM_NO_ERROR || dbm->errcode == GDBM_ITEM_NOT_FOUND) {
> +         dbm->errmsg = NULL;
> +     }
> +     else {
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
> index 88b4300..98f9db6 100644
> --- a/meta/recipes-support/apr/apr-util_1.6.1.bb
> +++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
> @@ -13,6 +13,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
>              file://configfix.patch \
>              file://configure_fixes.patch \
>              file://run-ptest \
> +           file://0001-apr-util-fix-ptest-fail.patch \
>   "
>   
>   SRC_URI[md5sum] = "bd502b9a8670a8012c4d90c31a84955f"

-- 
BRs

Sandy(Li Changqing)
Wind River Linux


