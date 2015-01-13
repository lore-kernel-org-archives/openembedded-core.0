Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3381D7162E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 19:20:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0DJKqwo007170
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 11:20:52 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 13 Jan 2015 11:20:51 -0800
Message-ID: <54B57013.8040108@windriver.com>
Date: Tue, 13 Jan 2015 13:20:51 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1421175733-22762-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1421175733-22762-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [RFC][PATCH] WIP: feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thumb suffix
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
X-List-Received-Date: Tue, 13 Jan 2015 19:21:00 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

While I haven't tested this.  I'm fine with this change.

(It's more or less what I wanted from the beginning, but wasn't able to make
everyone happy.)

--Mark

On 1/13/15 1:02 PM, Martin Jansa wrote:
> * this means that recipes with ARM_INSTRUCTION_SET explicitly changed
>   to arm will be built in feed without thumb suffix, the same does apply
>   for workdir, e.g. after "bitbake glib-2.0" you can see:
> 
>   tmp-glibc/work/armv5e-oe-linux-gnueabi:
>   glib-2.0  glibc  glibc-initial
> 
>   tmp-glibc/work/armv5te-oe-linux-gnueabi:
>   acl              db              gdk-pixbuf     kmod  ....
> 
>   and
> 
>   tmp-glibc/deploy/ipk:
>   all  armv5e  armv5te  qemuarm
> 
> * feed config should be ok, because all default DEFAULTTUNEs always
>   include "arm" variants of all supported PACKAGE_ARCHs
> 
> * for more details see
>   http://lists.openembedded.org/pipermail/openembedded-core/2014-April/091960.html
>   the toolchain path issues were resolved in 1.8
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/machine/include/arm/feature-arm-thumb.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> index 8e6619d..4c4eb6d 100644
> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> @@ -32,7 +32,8 @@ python () {
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}', '', d)}"
>  OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thumb', '', d)}"
>  
> -ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d)}"
> +# Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_M_OPT to thumb
> +ARMPKGSFX_THUMB .= "${@ d.getVar('ARM_THUMB_SUFFIX', True) if d.getVar('ARM_M_OPT', True) == 'thumb' else ''}"
>  
>  # Whether to compile with code to allow interworking between the two
>  # instruction sets. This allows thumb code to be executed on a primarily
> 


