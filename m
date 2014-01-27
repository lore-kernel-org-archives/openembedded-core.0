Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F2FFA6AE14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 21:52:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0RLqlZT014513
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Jan 2014 13:52:48 -0800 (PST)
Received: from [147.11.118.101] (147.11.118.101) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 27 Jan 2014 13:52:46 -0800
Message-ID: <52E6D52D.4070908@windriver.com>
Date: Mon, 27 Jan 2014 16:52:45 -0500
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
References: <1390479065-24299-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1390479065-24299-1-git-send-email-otavio@ossystems.com.br>
X-Originating-IP: [147.11.118.101]
Subject: Re: [PATCH] buildhistory.bbclass: Improve robustness in image file listing
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
X-List-Received-Date: Mon, 27 Jan 2014 21:52:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-01-23 07:11 AM, Otavio Salvador wrote:
> The filenames sometimes may have strange names. With the 'awk' script
> it handled a limited number of spaces in the filename and a package
> installing a file named "test file with spaces" would have its name
> truncated.
>
> This patch uses the find's printf formating to simplify the code and
> proper handle this case. From a testing image, the only diff produced
s/proper/properly/
   Yes, I'm with the grammar police; we're here to be helpful.
> is:
>
> ,----[ files-in-image.txt diff ]
> | --rwxr-xr-x root       root                0 ./usr/bin/test\ file\ with\
> | +-rwxr-xr-x root       root                0 ./usr/bin/test file with spaces
> `----
>
> The options used are available since findutils 4.2.5, released in 19
> Nov 2004, making it available in all supported host distributions.

Acked-by: Randy MacLeod <Randy.MacLeod@windriver.com>

Works for me, even on CentOS/RHEL-5.9/10 which does indeed have
findutils > 4.2.5:

$ rpm -qf `which find`
findutils-4.2.27-6.el5

and the find command seems to work as intended:

  $ find jj -printf "%M %-10u %-10g %10s %p -> %l\n"  | cut -c 44-
  jj ->
  jj/usr ->
  jj/usr/bin ->
  jj/usr/bin/test file with spaces ->

../Randy

>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   meta/classes/buildhistory.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index e9a9c3b..545a42f 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -385,7 +385,7 @@ buildhistory_get_sdk_installed() {
>   buildhistory_list_files() {
>   	# List the files in the specified directory, but exclude date/time etc.
>   	# This awk script is somewhat messy, but handles where the size is not printed for device files under pseudo
> -	( cd $1 && find . -ls | awk '{ if ( $7 ~ /[0-9]/ ) printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, $7, $11, $12, $13 ; else printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, 0, $10, $11, $12 }' | sort -k5 | sed 's/ *$//' > $2 )
> +	( cd $1 && find . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 )
>   }
>
>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

