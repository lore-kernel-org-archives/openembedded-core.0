Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0FB979CCC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 01:49:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA81nIH7018056
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Nov 2018 17:49:29 -0800
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 7 Nov 2018 17:49:18 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1540457968-325221-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <6d020f03-225c-883b-ee7e-80da52209fc2@windriver.com>
Date: Thu, 8 Nov 2018 09:49:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1540457968-325221-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] python-native: fix one do_populate_sysroot warning
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
X-List-Received-Date: Thu, 08 Nov 2018 01:49:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ping

On 10/25/18 4:59 PM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Fix below warning:
> WARNING: Skipping RPATH /usr/lib64 as is a standard search path for
> work/x86_64-linux/python-native/2.7.15-r1.1/recipe-sysroot-native/
> usr/lib/python2.7/lib-dynload/_bsddb.so
>
> setup.py will check db.h under include_dirs, for native build,
> /usr/lib64 will be insert to postion 0 of include_dirs, so
> it's priority is higher then our sysroot, cause db.h sysroot
> is ignored, and rpath set to /usr/lib64. and this cause warning
> when do_populate_sysroot. use append to fix it.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   ...ative-fix-one-do_populate_sysroot-warning.patch | 39 ++++++++++++++++++++++
>   .../python/python-native_2.7.15.bb                 |  1 +
>   2 files changed, 40 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python-native/0001-python-native-fix-one-do_populate_sysroot-warning.patch
>
> diff --git a/meta/recipes-devtools/python/python-native/0001-python-native-fix-one-do_populate_sysroot-warning.patch b/meta/recipes-devtools/python/python-native/0001-python-native-fix-one-do_populate_sysroot-warning.patch
> new file mode 100644
> index 0000000..9898189
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-native/0001-python-native-fix-one-do_populate_sysroot-warning.patch
> @@ -0,0 +1,39 @@
> +From 12292444e1b3662b994bc223d92b8338fb0895ff Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 25 Oct 2018 07:32:14 +0000
> +Subject: [PATCH] python-native: fix one do_populate_sysroot warning
> +
> +Fix below warning:
> +WARNING: Skipping RPATH /usr/lib64 as is a standard search path for
> +work/x86_64-linux/python-native/2.7.15-r1.1/recipe-sysroot-native/
> +usr/lib/python2.7/lib-dynload/_bsddb.so
> +
> +setup.py will check db.h under include_dirs, for native build,
> +/usr/lib64 will be insert to postion 0 of include_dirs, so
> +it's priority is higher then our sysroot, cause db.h sysroot
> +is ignored, and rpath set to /usr/lib64. and this cause warning
> +when do_populate_sysroot. use append to fix it.
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + setup.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 7bf13ed..6c0f29b 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -40,7 +40,7 @@ def add_dir_to_list(dirlist, dir):
> +     1) 'dir' is not already in 'dirlist'
> +     2) 'dir' actually exists, and is a directory."""
> +     if dir is not None and os.path.isdir(dir) and dir not in dirlist:
> +-        dirlist.insert(0, dir)
> ++        dirlist.append(dir)
> +
> + def macosx_sdk_root():
> +     """
> +--
> +2.18.0
> +
> diff --git a/meta/recipes-devtools/python/python-native_2.7.15.bb b/meta/recipes-devtools/python/python-native_2.7.15.bb
> index 7c491fa..f9a9a5d 100644
> --- a/meta/recipes-devtools/python/python-native_2.7.15.bb
> +++ b/meta/recipes-devtools/python/python-native_2.7.15.bb
> @@ -16,6 +16,7 @@ SRC_URI += "\
>               file://builddir.patch \
>               file://parallel-makeinst-create-bindir.patch \
>               file://revert_use_of_sysconfigdata.patch \
> +            file://0001-python-native-fix-one-do_populate_sysroot-warning.patch \
>              "
>   
>   S = "${WORKDIR}/Python-${PV}"

-- 
BRs

Sandy(Li Changqing)


