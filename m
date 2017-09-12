Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B3441783FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 16:27:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8CGRrL7003584
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Sep 2017 09:27:53 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 12 Sep 2017 09:27:52 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20170912155906.29716-1-ross.burton@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <fd5d461b-2217-ef1e-9aa4-690d7508d806@windriver.com>
Date: Tue, 12 Sep 2017 11:28:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170912155906.29716-1-ross.burton@intel.com>
Subject: Re: [PATCH] allarch: don't reset baselib
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
X-List-Received-Date: Tue, 12 Sep 2017 16:27:56 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/12/17 10:59 AM, Ross Burton wrote:
> allarch currently resets baselib to "lib" in an attempt to keep allarch recipes
> uniform.  However if the real value for $baselib is actually needed, for example
> in a multilib environment where $baselib is lib64 for standard binaries and the
> allarch package is using postinst intercepts which need to know the real value
> of $libdir, then a non-existant or incorrect $libdir will be used.
> 
> Real world example: liberation-fonts is allarch and inherits fontcache, which
> uses a postinst intercept to run fc-cache inside qemu-user.  In a multilib
> configuration where normal libdir=/usr/lib64 and lib32 libdir=/usr/lib qemu will
> try running a 64-bit fc-cache with a 32-bit ld-linux, and predicatably the
> binary crashes.

This still won't work right.  If we put an allarch package in a configuration
that can be either 32-bit or 64-bit (which is the point of allarch), then how
will it know which arch this magic script is running on?

It sounds to me like the way the script is running needs to be fixed (and/or
qemu needs to be fixed).   Calls to QEMU should inherit the matching system
envrionment, not assume an environment from the post-install scripts.

--Mark

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/allarch.bbclass | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> index 51ba509cd0a..e0326039d0c 100644
> --- a/meta/classes/allarch.bbclass
> +++ b/meta/classes/allarch.bbclass
> @@ -13,7 +13,7 @@ python () {
>  
>          # Set these to a common set of values, we shouldn't be using them other that for WORKDIR directory
>          # naming anyway
> -        d.setVar("baselib", "lib")
> +        #d.setVar("baselib", "lib")
>          d.setVar("TARGET_ARCH", "allarch")
>          d.setVar("TARGET_OS", "linux")
>          d.setVar("TARGET_CC_ARCH", "none")
> @@ -48,4 +48,3 @@ python () {
>      elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
>          bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
>  }
> -
> 


