Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A436565E1A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 23:27:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s99NRIUm028388
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Oct 2014 16:27:19 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Thu, 9 Oct 2014 16:27:17 -0700
Message-ID: <543719D4.9080308@windriver.com>
Date: Thu, 9 Oct 2014 18:27:16 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1412891594-9608-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1412891594-9608-1-git-send-email-otavio@ossystems.com.br>
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
X-List-Received-Date: Thu, 09 Oct 2014 23:27:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/14, 4:53 PM, Otavio Salvador wrote:
> Sometimes we require extra environment settings to be available on the
> environment for proper SDK work. This were done, in past, using
> '_append' tasks however with the split of the environment in a
> canadian package this has been broken.
>
> The easier and more flexible solution is to use environment subscripts
> which are sources by the main script. These are now looked at:
>
>   $OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh
>
> and sourced.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

I really like this approach.  However, is there any way for the subscripts to be 
arch specific?

--Mark

> ---
>   meta/classes/toolchain-scripts.bbclass |   10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index 6cc8eba..11ffbe5 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -72,6 +72,16 @@ toolchain_shared_env_script () {
>   	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
>   	echo 'export ARCH=${ARCH}' >> $script
>   	echo 'export CROSS_COMPILE=${TARGET_PREFIX}' >> $script
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
>   }
>
>   #we get the cached site config in the runtime
>


