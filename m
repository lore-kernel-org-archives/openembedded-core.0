Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Michel.Thebeau@windriver.com>) id 1UIoqN-0004x6-UY
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 00:24:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2LL78pS019695
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 14:07:09 -0700 (PDT)
Received: from [128.224.146.59] (128.224.146.59) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 21 Mar 2013 14:07:07 -0700
Message-ID: <514B767B.7040501@windriver.com>
Date: Thu, 21 Mar 2013 17:07:07 -0400
From: Michel Thebeau <michel.thebeau@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: <michel.thebeau@windriver.com>, <Bruce.Ashfield@windriver.com>
References: <1363793436-3350-1-git-send-email-michel.thebeau@windriver.com>
	<1363793436-3350-2-git-send-email-michel.thebeau@windriver.com>
In-Reply-To: <1363793436-3350-2-git-send-email-michel.thebeau@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] kernel.bbclass: do_sizecheck: update path to build image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2013 23:24:52 -0000
X-List-Received-Date: Thu, 21 Mar 2013 23:24:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit



On 13-03-20 11:30 AM, michel.thebeau@windriver.com wrote:
> From: Michel Thebeau <michel.thebeau@windriver.com>
> 
> KERNEL_OUTPUT is a path relative to ${B}, and resolves to a soft
> link to ${B}/${KERNEL_IMAGETYPE}.  When do_sizecheck runs it
> does not find the file, and does not fail.
> 
> So check the size of ${B}/${KERNEL_IMAGETYPE}.
> 
> Alternative approaches to resolve this could be:
>  - check ${B}/${KERNEL_OUTPUT}, with ls -L to resolve the link
>  - check ${B}/${KERNEL_OUTPUT}.bin
> 


As I have moved on to bug #3515, which is to find out where the code
went for creating the stripped binary, I just realized that I misread
the size of vmlinux.bin in arch/mips/boot/.  The source code supports
that this is the stripped vmlinux the defect was looking for.

8337264 2013-03-21 16:36 vmlinux.bin

So I expect you'll want to ignore this patch while I rethink it.

M

> This is related to, but does not resolve:
> [YOCTO #3514]
> 
> Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/classes/kernel.bbclass |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index d57d1f5..dbb571a 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -293,9 +293,9 @@ python split_kernel_packages () {
>  # with a fixed length or there is a limit in transferring the kernel to memory
>  do_sizecheck() {
>  	if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
> -		size=`ls -l ${KERNEL_OUTPUT} | awk '{ print $5}'`
> +		size=`ls -l ${B}/${KERNEL_IMAGETYPE} | awk '{ print $5}'`
>  		if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
> -			rm ${KERNEL_OUTPUT}
> +			rm ${B}/${KERNEL_IMAGETYPE}
>  			die "This kernel (size=$size > ${KERNEL_IMAGE_MAXSIZE}) is too big for your device. Please reduce the size of the kernel by making more of it modular."
>  		fi
>  	fi
> 


