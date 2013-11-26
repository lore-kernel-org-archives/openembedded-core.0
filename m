Return-Path: <Yanjun.Zhu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C52D36D815
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 08:39:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAQ8d5jJ029986
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 00:39:05 -0800 (PST)
Received: from [128.224.162.216] (128.224.162.216) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 26 Nov 2013 00:39:05 -0800
Message-ID: <52945E2D.2000106@windriver.com>
Date: Tue, 26 Nov 2013 16:39:09 +0800
From: yzhu1 <Yanjun.Zhu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1385454283-25126-1-git-send-email-yanjun.zhu@windriver.com>
In-Reply-To: <1385454283-25126-1-git-send-email-yanjun.zhu@windriver.com>
X-Originating-IP: [128.224.162.216]
Subject: Re: [PATCH] populate_sdk: verify executable or dynamically linked library
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
X-List-Received-Date: Tue, 26 Nov 2013 08:39:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this mail since there is something wrong in the patch.

On 11/26/2013 04:24 PM, yzhu1 wrote:
> When toolchain directory is changed to execute mode, some non-executable
> files or empty files are sorted. This will result in some errors. Thus when
> sorting executable files or dynamically linked library, additional conditions
> are to exclude non-executable files or empty files.
> ---
>   meta/classes/populate_sdk_base.bbclass |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index b7ea851..6b3535d 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -253,7 +253,7 @@ if [ "$dl_path" = "" ] ; then
>   	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
>   	exit 1
>   fi
> -executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111)
> +executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm +111 -exec file '{}' \;| grep "\(executable\|dynamically linked\)" | cut -f 1 -d ':')
>   
>   tdir=`mktemp -d`
>   if [ x$tdir = x ] ; then


