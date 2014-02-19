Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0B18F6E760
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 15:19:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1JFJtFO014566
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Feb 2014 07:19:55 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Wed, 19 Feb 2014 07:19:54 -0800
Message-ID: <5304CB9A.2030400@windriver.com>
Date: Wed, 19 Feb 2014 09:19:54 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>,
	<openembedded-core@lists.openembedded.org>
References: <1392822917-23688-1-git-send-email-paul@paulbarker.me.uk>
In-Reply-To: <1392822917-23688-1-git-send-email-paul@paulbarker.me.uk>
Cc: Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH v2] opkg: Fix add-exclude.patch
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
X-List-Received-Date: Wed, 19 Feb 2014 15:19:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/19/14, 9:15 AM, Paul Barker wrote:
> The case statement for ARGS_OPT_ADD_EXCLUDE added to the argument handling
> switch statement in opkg was missing a "break;" at the end, so it was falling
> through into the handler for ARGS_OPT_NOACTION. Thus when "--add-exclude" was
> specified on the command line it was as if "--noaction" was also being
> specified. This appears to be the root cause of YP bug 5311.
>
> Tested using the case described by Alexandru Georgescu in YP bug 5311:
>
>      MACHINE ??= "qemux86"
>      IMAGE_INSTALL_append = " man"
>      PACKAGE_EXCLUDE = "man"
>      PACKAGE_CLASSES ?= "package_ipk"
>
> Built image and boot tested on qemu, ensured that man was not installed but the
> rest of the system was installed correctly.
>
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> Cc: Mark Hatle <mark.hatle@windriver.com>

Acked-by: Mark Hatle <mark.hatle@windriver.com>

> Cc: Saul Wold <saul.wold@intel.com>
> Cc: Alexandru Georgescu <alexandru.c.georgescu@intel.com>
> ---
> Changes:
>
> V2: Used 'editdiff' to ensure the patch offsets were updated.
>
>   meta/recipes-devtools/opkg/opkg/add-exclude.patch | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/opkg/opkg/add-exclude.patch b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
> index 8489058..8d328d5 100644
> --- a/meta/recipes-devtools/opkg/opkg/add-exclude.patch
> +++ b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
> @@ -84,7 +84,7 @@ Index: trunk/src/opkg-cl.c
>    	{"test", 0, 0, ARGS_OPT_NOACTION},
>    	{"tmp-dir", 1, 0, 't'},
>    	{"tmp_dir", 1, 0, 't'},
> -@@ -198,6 +200,17 @@ args_parse(int argc, char *argv[])
> +@@ -198,6 +200,18 @@ args_parse(int argc, char *argv[])
>    			}
>    			free(tuple);
>    			break;
> @@ -99,10 +99,11 @@ Index: trunk/src/opkg-cl.c
>   +				conf->exclude_list = realloc(conf->exclude_list, sizeof(char *) * conf->exclude_count);
>   +				conf->exclude_list[conf->exclude_count - 1] = tuple;
>   +			}
> ++			break;
>    		case ARGS_OPT_NOACTION:
>    			conf->noaction = 1;
>    			break;
> -@@ -282,6 +295,7 @@ usage()
> +@@ -282,6 +296,7 @@ usage()
>    	printf("\t--offline-root <dir>	offline installation of packages.\n");
>    	printf("\t--add-arch <arch>:<prio>	Register architecture with given priority\n");
>    	printf("\t--add-dest <name>:<path>	Register destination with given path\n");
>


