Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0F1A660797
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 08:34:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u068Ywcr001077
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jan 2016 00:34:58 -0800 (PST)
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 6 Jan 2016 00:34:58 -0800
Message-ID: <568CD1B2.5040005@windriver.com>
Date: Wed, 6 Jan 2016 16:34:58 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1452068455-13075-1-git-send-email-Qi.Chen@windriver.com>
In-Reply-To: <1452068455-13075-1-git-send-email-Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.246]
Subject: Re: [PATCH] bitbake: clean up stamp-base related codes
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
X-List-Received-Date: Wed, 06 Jan 2016 08:34:59 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this one.
I've separated this patch into two and send them to the correct list.

// Qi


On 01/06/2016 04:20 PM, Chen Qi wrote:
> The 'stamp-base' related codes are no longer useful, clean them up.
>
> [YOCTO #8468]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   bitbake/lib/bb/build.py | 4 ++--
>   bitbake/lib/bb/cache.py | 3 ---
>   meta/conf/bitbake.conf  | 2 +-
>   3 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/bitbake/lib/bb/build.py b/bitbake/lib/bb/build.py
> index 22428a6..b84338b 100644
> --- a/bitbake/lib/bb/build.py
> +++ b/bitbake/lib/bb/build.py
> @@ -582,10 +582,10 @@ def stamp_internal(taskname, d, file_name, baseonly=False):
>           taskflagname = taskname.replace("_setscene", "")
>   
>       if file_name:
> -        stamp = d.stamp_base[file_name].get(taskflagname) or d.stamp[file_name]
> +        stamp = d.stamp[file_name]
>           extrainfo = d.stamp_extrainfo[file_name].get(taskflagname) or ""
>       else:
> -        stamp = d.getVarFlag(taskflagname, 'stamp-base', True) or d.getVar('STAMP', True)
> +        stamp = d.getVar('STAMP', True)
>           file_name = d.getVar('BB_FILENAME', True)
>           extrainfo = d.getVarFlag(taskflagname, 'stamp-extra-info', True) or ""
>   
> diff --git a/bitbake/lib/bb/cache.py b/bitbake/lib/bb/cache.py
> index 521f758..0ec4057 100644
> --- a/bitbake/lib/bb/cache.py
> +++ b/bitbake/lib/bb/cache.py
> @@ -129,7 +129,6 @@ class CoreRecipeInfo(RecipeInfoCommon):
>           self.not_world = self.getvar('EXCLUDE_FROM_WORLD', metadata)
>           self.stamp = self.getvar('STAMP', metadata)
>           self.stampclean = self.getvar('STAMPCLEAN', metadata)
> -        self.stamp_base = self.flaglist('stamp-base', self.tasks, metadata)
>           self.stamp_base_clean = self.flaglist('stamp-base-clean', self.tasks, metadata)
>           self.stamp_extrainfo = self.flaglist('stamp-extra-info', self.tasks, metadata)
>           self.file_checksums = self.flaglist('file-checksums', self.tasks, metadata, True)
> @@ -158,7 +157,6 @@ class CoreRecipeInfo(RecipeInfoCommon):
>   
>           cachedata.stamp = {}
>           cachedata.stampclean = {}
> -        cachedata.stamp_base = {}
>           cachedata.stamp_base_clean = {}
>           cachedata.stamp_extrainfo = {}
>           cachedata.file_checksums = {}
> @@ -192,7 +190,6 @@ class CoreRecipeInfo(RecipeInfoCommon):
>           cachedata.pkg_dp[fn] = self.defaultpref
>           cachedata.stamp[fn] = self.stamp
>           cachedata.stampclean[fn] = self.stampclean
> -        cachedata.stamp_base[fn] = self.stamp_base
>           cachedata.stamp_base_clean[fn] = self.stamp_base_clean
>           cachedata.stamp_extrainfo[fn] = self.stamp_extrainfo
>           cachedata.file_checksums[fn] = self.file_checksums
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 371af31..51885af 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -801,7 +801,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
>       lockfiles type vardepsexclude vardeps vardepvalue vardepvalueexclude \
>       file-checksums python func task export unexport noexec nostamp dirs cleandirs \
>       sstate-lockfile-shared prefuncs postfuncs export_func deptask rdeptask \
> -    recrdeptask nodeprrecs stamp-base stamp-extra-info sstate-outputdirs filename lineno"
> +    recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename lineno"
>   
>   MLPREFIX ??= ""
>   MULTILIB_VARIANTS ??= ""


