Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 92C426AC95
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 05:37:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0R5bNnj014652
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 21:37:23 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 26 Jan 2015 21:37:23 -0800
Message-ID: <54C72417.3010705@windriver.com>
Date: Tue, 27 Jan 2015 13:37:27 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1422336953-26386-1-git-send-email-Qi.Chen@windriver.com>
In-Reply-To: <1422336953-26386-1-git-send-email-Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.226]
Subject: Re: [PATCH] cmake-native: disable check for acl.h
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
X-List-Received-Date: Tue, 27 Jan 2015 05:37:22 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this one.
Stupid command mistake.

//Chen Qi

On 01/27/2015 01:35 PM, Chen Qi wrote:
> We build cmake-native without acl support. However, the acl.h header
> is still being checked which would sometimes cause the following error
> during do_compile:
>
>       archive_read_disk_entry_from_file.c:38:21: fatal error: sys/acl.h: No such file or directory
>       |  #include <sys/acl.h>
>       |                      ^
>       | compilation terminated.
>
> This happens when the sysroot parts of acl-native is removed between
> do_configure and do_compile tasks of cmake-native.
>
> To reproduce the problem manually, execute the following command:
>
> bitbake cmake-native -c cleansstate && bitbake acl-native -c cleansstate && \
> bitbake	acl-native && bitbake cmake-native -c configure	&& \
> bitbake acl-native -c cleansstate && bitbake cmake-native -c compile
>
> This patch fixes the above problem by explicitly disable the checking for
> acl.h header file.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
> index cd6b1d8..e40dfdd 100644
> --- a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
> +++ b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
> @@ -15,4 +15,5 @@ SRC_URI[sha256sum] = "8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37fccf067eb1a44a
>   CMAKE_EXTRACONF = "\
>       -DBUILD_CursesDialog=0 \
>       -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
> +    -DHAVE_SYS_ACL_H=0 \
>   "


