Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 670E365F1E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jun 2014 13:41:01 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5RDeuav032593; Fri, 27 Jun 2014 14:40:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tb3e3z13IwPe; Fri, 27 Jun 2014 14:40:55 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5RDepE5032584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 27 Jun 2014 14:40:52 +0100
Message-ID: <1403876444.28648.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Rini <tom.rini@gmail.com>
Date: Fri, 27 Jun 2014 14:40:44 +0100
In-Reply-To: <1403785652-17065-1-git-send-email-tom.rini@gmail.com>
References: <1403785652-17065-1-git-send-email-tom.rini@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Ensure IMAGE_FSTYPES is fully evaluated before live/live logic
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
X-List-Received-Date: Fri, 27 Jun 2014 13:41:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-06-26 at 08:27 -0400, Tom Rini wrote:
> Incase we have overrides applied to IMAGE_FSTYPES we need to make sure
> that we evaluate it fully before performing the live and vmdk logic
> checks.
> 
> Signed-off-by: Tom Rini <tom.rini@gmail.com>
> ---
>  meta/classes/image.bbclass | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 79de5a2..ccfa1b1 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -78,10 +78,11 @@ do_rootfs[vardeps] += "BAD_RECOMMENDATIONS NO_RECOMMENDATIONS"
>  
>  do_build[depends] += "virtual/kernel:do_deploy"
>  
> +EVALED_IMAGE_FSTYPES := "${IMAGE_FSTYPES}"
>  def build_live(d):
> -    if base_contains("IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
> -        d.setVar('NOISO', base_contains('IMAGE_FSTYPES', "iso", "0", "1", d))
> -        d.setVar('NOHDD', base_contains('IMAGE_FSTYPES', "hddimg", "0", "1", d))
> +    if base_contains("EVALED_IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
> +        d.setVar('NOISO', base_contains('EVALED_IMAGE_FSTYPES', "iso", "0", "1", d))
> +        d.setVar('NOHDD', base_contains('EVALED_IMAGE_FSTYPES', "hddimg", "0", "1", d))
>          if d.getVar('NOISO', True) == "0" or d.getVar('NOHDD', True) == "0":
>              return "image-live"
>          return ""

The trouble is this doesn't add up. 

EVALED_IMAGE_FSTYPES := "${IMAGE_FSTYPES}"

basically sets EVALED_... to the expanded value of IMAGE_FSTYPES

base_contains() also expands the variable its passed.

I'm a little concerned as to why those two expansions of the same thing
should result in something different.

From your later explaination, it would appear the use of the override is
causing problems but I don't understand how immediate expansion would
work around that :/.

So before this merges, more investigation is needed as there is
something not adding up...

Cheers,

Richard


> @@ -90,7 +91,7 @@ def build_live(d):
>  IMAGE_TYPE_live = "${@build_live(d)}"
>  
>  inherit ${IMAGE_TYPE_live}
> -IMAGE_TYPE_vmdk = '${@base_contains("IMAGE_FSTYPES", "vmdk", "image-vmdk", "", d)}'
> +IMAGE_TYPE_vmdk = '${@base_contains("EVALED_IMAGE_FSTYPES", "vmdk", "image-vmdk", "", d)}'
>  inherit ${IMAGE_TYPE_vmdk}
>  
>  python () {
> -- 
> 1.9.3
> 



