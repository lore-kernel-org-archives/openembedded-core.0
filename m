Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 70B366AC7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 13:18:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Oct 2014 06:18:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,692,1406617200"; d="scan'208";a="612455368"
Received: from ncmcquil-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga002.fm.intel.com with ESMTP; 10 Oct 2014 06:17:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 10 Oct 2014 14:17:46 +0100
Message-ID: <20188744.UHIPAMfvA0@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.1 (Linux/3.16.3-200.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <1412891594-9608-1-git-send-email-otavio@ossystems.com.br>
References: <1412891594-9608-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] toolchain-scripts.bbclass: Allow sourcing of subscript for environment
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
X-List-Received-Date: Fri, 10 Oct 2014 13:18:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 09 October 2014 18:53:13 Otavio Salvador wrote:
> Sometimes we require extra environment settings to be available on the
> environment for proper SDK work. This were done, in past, using
> '_append' tasks however with the split of the environment in a
> canadian package this has been broken.
> 
> The easier and more flexible solution is to use environment subscripts
> which are sources by the main script. These are now looked at:
> 
>  $OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh
> 
> and sourced.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/toolchain-scripts.bbclass |   10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/meta/classes/toolchain-scripts.bbclass
> b/meta/classes/toolchain-scripts.bbclass index 6cc8eba..11ffbe5 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -72,6 +72,16 @@ toolchain_shared_env_script () {
>  	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
>  	echo 'export ARCH=${ARCH}' >> $script
>  	echo 'export CROSS_COMPILE=${TARGET_PREFIX}' >> $script
> +
> +    cat >> $script <<EOF
> +
> +# Append environment subscripts
> +if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
> +    for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh; do
> +	    source \$envfile
> +    done
> +fi
> +EOF
>  }
> 
>  #we get the cached site config in the runtime

This series looks great to me, and adds a much better extension mechanism than 
we've had here previously.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre

