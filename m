Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99A84609C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 07:13:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5P7DBXd027608
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:13:11 -0700 (PDT)
Received: from [128.224.163.186] (128.224.163.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Wed, 25 Jun 2014 00:13:11 -0700
Message-ID: <53AA7684.7070105@windriver.com>
Date: Wed, 25 Jun 2014 15:13:08 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1403661432-26466-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1403661432-26466-1-git-send-email-ming.liu@windriver.com>
X-Originating-IP: [128.224.163.186]
Subject: Re: [PATCH V2] kernel.bbclass: add task dependency between bundle_initramfs and package
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
X-List-Received-Date: Wed, 25 Jun 2014 07:13:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this V2 too, I found a drawback that if the kernel-module* 
are added to the initramfs image, then it will lead us to a circular 
dependency risk, maybe we should not add this dependency at all.

//Ming Liu

On 06/25/2014 09:57 AM, Ming Liu wrote:
> To ensure the bundled image to be packaged into kernel-image, otherwise, If
> bundle_initramfs runs after do_package, the bundled kernel and initramfs
> will not be part of the kernel-image package. This can result in boot
> failures and other issues when the kernel-image is deployed.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>   meta/classes/kernel.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 6ed1cb7..764a9ec 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -146,7 +146,7 @@ python do_devshell_prepend () {
>       os.environ["LDFLAGS"] = ''
>   }
>   
> -addtask bundle_initramfs after do_install before do_deploy
> +addtask bundle_initramfs after do_install before do_deploy do_package
>   
>   kernel_do_compile() {
>   	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE


