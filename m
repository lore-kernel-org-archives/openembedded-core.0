Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7901960130
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 13:04:37 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5IDAW6a022576; Tue, 18 Jun 2013 14:10:32 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gCnUhTLjrRRf; Tue, 18 Jun 2013 14:10:32 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5IDAQPj022573
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 18 Jun 2013 14:10:28 +0100
Message-ID: <1371560653.20823.113.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zhenhua Luo <zhenhua.luo@freescale.com>, Randy MacLeod
	<Randy.MacLeod@windriver.com>
Date: Tue, 18 Jun 2013 14:04:13 +0100
In-Reply-To: <1371560890-26412-1-git-send-email-zhenhua.luo@freescale.com>
References: <1371560890-26412-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: b40527@freescale.com, openembedded-core@lists.openembedded.org
Subject: Re: [patch v2] sanity.bbclass: correct the gcc_arch check logic
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
X-List-Received-Date: Tue, 18 Jun 2013 13:04:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-06-18 at 21:08 +0800, Zhenhua Luo wrote:
> The gcc arch check result is incorrect when gcc version is older than 4.5.
> Sanity checker requests user to add "-march=native" into BUILD_CFLAGS even if
> the flag is not supported by host gcc.
> 
> The status is 0 when -march=native is supported by host gcc, so set result to
> True, otherwise set result to False.
> 
> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> ---
>  meta/classes/sanity.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 3b9934b..ee09679 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -325,7 +325,7 @@ def check_gcc_march(sanity_data):
>          if status != 0:
>              # Check if GCC could work with march
>              status,result = oe.utils.getstatusoutput("${BUILD_PREFIX}gcc -march=native gcc_test.c -o gcc_test")
> -            if status != 0: 
> +            if status == 0: 
>                  result = True
>              else:
>                  result = False

Can you and Randy please sort out what the correct value is here please.
This appears to directly revert
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=ad276d7d89190c57a152867d7278ee18f784ff2c

Cheers,

Richard



