Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DAC576DAAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 08:39:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAQ8dGm4029659
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 00:39:16 -0800 (PST)
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 26 Nov 2013 00:39:15 -0800
Message-ID: <52945E32.2000403@windriver.com>
Date: Tue, 26 Nov 2013 16:39:14 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: yzhu1 <yanjun.zhu@windriver.com>
References: <1385454283-25126-1-git-send-email-yanjun.zhu@windriver.com>
In-Reply-To: <1385454283-25126-1-git-send-email-yanjun.zhu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 26 Nov 2013 08:39:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/26/2013 4:24 PM, yzhu1 wrote:
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

You should not change the -perm option back to use +mode, please refer to:

commit 21b079e01873e2fb4d8674541e8c5818ba73554e
Author: Stefan Stanacar <stefanx.stanacar@intel.com>
Date:   Tue Jul 16 14:42:35 2013 +0300

     populate_sdk_base.bbclass: use new perm option for find

     Old way find -perm +mode is no longer supported in newer
     versions of find (Fedora 19). Man page says:
     -perm +mode
            This  is  no  longer  supported  (and  has been deprecated since
            2005).  Use -perm /mode instead.

     [YOCTO #4853]

     Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
     Signed-off-by: Saul Wold <sgw@linux.intel.com>

Thanks,
Jackie

>
>   tdir=`mktemp -d`
>   if [ x$tdir = x ] ; then
>



