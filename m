Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1T0ogK-0004DH-J7
	for openembedded-core@lists.linuxtogo.org;
	Mon, 13 Aug 2012 09:03:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2012 23:50:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,758,1336374000"; d="scan'208";a="185550177"
Received: from lpalcu-linux (HELO [10.237.105.41]) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 12 Aug 2012 23:50:20 -0700
Message-ID: <5028A3AB.703@intel.com>
Date: Mon, 13 Aug 2012 09:50:19 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1344761322-10816-1-git-send-email-marc@cpdesign.com.au>
In-Reply-To: <1344761322-10816-1-git-send-email-marc@cpdesign.com.au>
Cc: openembedded-core@lists.linuxtogo.org
Subject: Re: classes: populate_sdk_base: Refine search for SDK env setup file
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
X-List-Received-Date: Mon, 13 Aug 2012 07:03:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 08/12/2012 11:48 AM, Marc Reilly wrote:
> This fixes a relocation failure when installing SDKs built with
> meta-toolchain-qte.
> SDKs build with meta-toolchain-qte have a file named "environment-setup"
> in them as well as the environment-setup-MACH-WHATEVER-BLAH file.
> This patch changes the find name pattern so that only the appropriate
> file is matched.
> 
> Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
> ---
>  meta/classes/populate_sdk_base.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 0d19741..60c67bd 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -154,7 +154,7 @@ echo "done"
>  
>  echo -n "Setting it up..."
>  # fix environment paths
> -env_setup_script=$(find $target_sdk_dir -name "environment-setup*")
> +env_setup_script=$(find $target_sdk_dir -name "environment-setup-*")
Good catch! Wouldn't be even better if we used
${REAL_MULTIMACH_TARGET_SYS} instead of *? This way we would match the
exact environment setup script and avoid matching with other scripts.

Thanks,
Laurentiu
>  sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
>  
>  # fix dynamic loader paths in all ELF SDK binaries
> 


