Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RBpKN-0006iq-8Q
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 16:53:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p96Em1Es010831
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 07:48:01 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 6 Oct 2011 07:48:01 -0700
Message-ID: <4E8DBF9E.70600@windriver.com>
Date: Thu, 6 Oct 2011 09:47:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1317910843.6398.87.camel@ted>
In-Reply-To: <1317910843.6398.87.camel@ted>
Subject: Re: [PATCH] native.bbclass: Ensure native recipes have a deterministic baselib value
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Oct 2011 14:53:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 10/6/11 9:20 AM, Richard Purdie wrote:
> Changes to baselib by specific machine configuration were resulting
> in sstate cache invalidation, particularly in multilib configurations.
> 
> This patch ensures this doesn't happen and native sstate cache files
> are reusable.

Likely throwing in a can of worms here, but for our existing (non-OE based)
work, we generally change the baselib to "lib64" on 64-bit machines.  Without
patching native.bbclass, is it possible to do that?

We do this because we ship both 32-bit and 64-bit host tooling for a variety of
host distributions, I expect we'll have to continue doing that as we transition
to an OE-based system.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
> index 5e45aed..ba8b0bf 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -69,6 +69,8 @@ exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
>  
>  libdir = "${STAGING_DIR_NATIVE}${libdir_native}"
>  
> +baselib = "lib"
> +
>  # Libtool's default paths are correct for the native machine
>  lt_cv_sys_lib_dlsearch_path_spec[unexport] = "1"
>  
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



