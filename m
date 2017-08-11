Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE62B77FEC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 15:05:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7BF5qTv018847
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 11 Aug 2017 08:05:52 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 11 Aug 2017 08:05:51 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1502435796-16094-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <a5646b3f-23fb-8567-024f-b48df5abd70a@windriver.com>
Date: Fri, 11 Aug 2017 10:05:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502435796-16094-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] image-prelink: Disable for musl images
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
X-List-Received-Date: Fri, 11 Aug 2017 15:05:52 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/11/17 2:16 AM, Richard Purdie wrote:
> For some reason prelink was refusing to prelink musl images but now sometimes
> does modify the binaries. Since musl has no support for this, such images
> end up broken and unable to boot.
> 
> To avoid this, be explicit and only apply prelinking for libc-glibc.
> 
> [YOCTO #11913]
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Ack.  Agreed, best solution.  (If anyone wants to update musl to support the
prelinker, I'd love to see it.. but I don't expect that to happen.)

--Mark

> ---
>  meta/classes/image-prelink.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
> index 4157df0..6fcd699 100644
> --- a/meta/classes/image-prelink.bbclass
> +++ b/meta/classes/image-prelink.bbclass
> @@ -1,6 +1,6 @@
>  do_rootfs[depends] += "prelink-native:do_populate_sysroot"
>  
> -IMAGE_PREPROCESS_COMMAND += "prelink_setup; prelink_image; "
> +IMAGE_PREPROCESS_COMMAND_append_libc-glibc = " prelink_setup; prelink_image; "
>  
>  python prelink_setup () {
>      oe.utils.write_ld_so_conf(d)
> 


