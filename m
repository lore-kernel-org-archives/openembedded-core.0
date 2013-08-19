Return-Path: <mark.hatle@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 2860469686
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 18:33:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7JIWxf7017561
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Aug 2013 14:33:00 -0400 (EDT)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 19 Aug 2013 11:32:59 -0700
Message-ID: <521264DA.8010404@windriver.com>
Date: Mon, 19 Aug 2013 13:32:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
	<1376512209-11622-9-git-send-email-mark.hatle@windriver.com>
	<52125F35.10305@linux.intel.com>
In-Reply-To: <52125F35.10305@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 08/11] opkg: Add --no-install-recommends option.
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
X-List-Received-Date: Mon, 19 Aug 2013 18:33:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/13 1:08 PM, Saul Wold wrote:
> On 08/14/2013 01:30 PM, Mark Hatle wrote:
>> The new --no-install-recommends option is similar to the behavior of
>> apt-get's --no-install-recommedns.  Only required packages will be
>> installed.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>    .../opkg/opkg/no-install-recommends.patch          | 78 ++++++++++++++++++++++
>>    meta/recipes-devtools/opkg/opkg_svn.bb             |  4 +-
>>    2 files changed, 81 insertions(+), 1 deletion(-)
>>    create mode 100644 meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
>>
>> diff --git a/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch b/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
>> new file mode 100644
>> index 0000000..f71b027
>> --- /dev/null
>> +++ b/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
>> @@ -0,0 +1,78 @@
>> +Add the ability to not install ANY recommended packages.
>> +
>> +Upstream-status: Pending
>
> Upstream-Status: here, in add-exclude.patch and
> smart-config-ignore-all-recommends.patch

I've updated these three and pushed to poky-contrib mhatle/oe-core-remove 
(note, there are a few patches there that are NOT part of this set.  So be sure 
to take only the top 11.)

--Mark

> Thanks
> 	Sau!
>
>> +
>> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> +
>> +Index: trunk/libopkg/opkg_conf.h
>> +===================================================================
>> +--- trunk.orig/libopkg/opkg_conf.h
>> ++++ trunk/libopkg/opkg_conf.h
>> +@@ -80,6 +80,7 @@ struct opkg_conf
>> +      int prefer_arch_to_version;
>> +      int check_signature;
>> +      int nodeps; /* do not follow dependencies */
>> ++     int noinstall_recommends;
>> +      char *offline_root;
>> +      char *overlay_root;
>> +      int query_all;
>> +Index: trunk/libopkg/pkg_depends.c
>> +===================================================================
>> +--- trunk.orig/libopkg/pkg_depends.c
>> ++++ trunk/libopkg/pkg_depends.c
>> +@@ -19,6 +19,7 @@
>> + #include <ctype.h>
>> +
>> + #include "pkg.h"
>> ++#include "opkg_conf.h"
>> + #include "opkg_utils.h"
>> + #include "pkg_hash.h"
>> + #include "opkg_message.h"
>> +@@ -204,7 +205,7 @@ pkg_hash_fetch_unsatisfied_dependencies(
>> + 		    /* user request overrides package recommendation */
>> + 		    if (satisfying_pkg != NULL
>> + 			&& (compound_depend->type == RECOMMEND || compound_depend->type == SUGGEST)
>> +-			&& (satisfying_pkg->state_want == SW_DEINSTALL || satisfying_pkg->state_want == SW_PURGE)) {
>> ++			&& (satisfying_pkg->state_want == SW_DEINSTALL || satisfying_pkg->state_want == SW_PURGE || conf->noinstall_recommends)) {
>> + 			 opkg_msg(NOTICE, "%s: ignoring recommendation for "
>> + 					"%s at user request\n",
>> + 					pkg->name, satisfying_pkg->name);
>> +Index: trunk/src/opkg-cl.c
>> +===================================================================
>> +--- trunk.orig/src/opkg-cl.c
>> ++++ trunk/src/opkg-cl.c
>> +@@ -50,6 +50,7 @@ enum {
>> + 	ARGS_OPT_NODEPS,
>> + 	ARGS_OPT_AUTOREMOVE,
>> + 	ARGS_OPT_CACHE,
>> ++	ARGS_OPT_NOINSTALL_RECOMMENDS,
>> + };
>> +
>> + static struct option long_options[] = {
>> +@@ -89,6 +90,7 @@ static struct option long_options[] = {
>> + 	{"noaction", 0, 0, ARGS_OPT_NOACTION},
>> + 	{"download-only", 0, 0, ARGS_OPT_DOWNLOAD_ONLY},
>> + 	{"nodeps", 0, 0, ARGS_OPT_NODEPS},
>> ++	{"no-install-recommends", 0, 0, ARGS_OPT_NOINSTALL_RECOMMENDS},
>> + 	{"offline", 1, 0, 'o'},
>> + 	{"offline-root", 1, 0, 'o'},
>> + 	{"add-arch", 1, 0, ARGS_OPT_ADD_ARCH},
>> +@@ -199,6 +201,9 @@ args_parse(int argc, char *argv[])
>> + 		case ARGS_OPT_NOACTION:
>> + 			conf->noaction = 1;
>> + 			break;
>> ++		case ARGS_OPT_NOINSTALL_RECOMMENDS:
>> ++			conf->noinstall_recommends = 1;
>> ++			break;
>> +         case ARGS_OPT_DOWNLOAD_ONLY:
>> + 			conf->download_only = 1;
>> + 			break;
>> +@@ -293,6 +298,8 @@ usage()
>> + 	printf("\t--noaction		No action -- test only\n");
>> + 	printf("\t--download-only	No action -- download only\n");
>> + 	printf("\t--nodeps		Do not follow dependencies\n");
>> ++	printf("\t--no-install-recommends\n");
>> ++	printf("\t                      Do not install any recommended packages\n");
>> + 	printf("\t--force-removal-of-dependent-packages\n");
>> + 	printf("\t			Remove package and all dependencies\n");
>> + 	printf("\t--autoremove		Remove packages that were installed\n");
>> diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
>> index 032578d..dbfca0f 100644
>> --- a/meta/recipes-devtools/opkg/opkg_svn.bb
>> +++ b/meta/recipes-devtools/opkg/opkg_svn.bb
>> @@ -1,6 +1,8 @@
>>    require opkg.inc
>>
>> -SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http"
>> +SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
>> +           file://no-install-recommends.patch \
>> +"
>>
>>    S = "${WORKDIR}/trunk"
>>
>>


