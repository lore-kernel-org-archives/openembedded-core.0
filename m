Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoIqr-0008Fd-Vi
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 19:33:58 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2011 10:29:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,307,1309762800"; 
   d="scan'208";a="3460181"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2011 10:29:35 -0700
Message-ID: <4E3833FF.2070503@linux.intel.com>
Date: Tue, 02 Aug 2011 10:29:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311898077-13062-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1311898077-13062-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] sanity.bbclass: Add sanity check that	TUNE_PKGARCH appears in PACKAGE_ARCHS
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
X-List-Received-Date: Tue, 02 Aug 2011 17:33:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 05:07 PM, Kumar Gala wrote:
> Its possible we get duplications if we explicity add TUNE_PKGARCH to
> PACKAGE_ARCHS so instead just add a sanity check to verify it.
>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   meta/classes/sanity.bbclass |   10 +++++++++-
>   1 files changed, 9 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index b054146..999e15d 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -375,8 +375,10 @@ def check_sanity(e):
>       elif oeroot.find (' ') != -1:
>           messages = messages + "Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space."
>
> -    # Check that we don't have duplicate entries in PACKAGE_ARCHS
> +    # Check that we don't have duplicate entries in PACKAGE_ARCHS&  that TUNE_PKGARCH is in PACKAGE_ARCHS
>       pkgarchs = data.getVar('PACKAGE_ARCHS', e.data, True)
> +    tunepkg = data.getVar('TUNE_PKGARCH', e.data, True)
> +    tunefound = False
>       seen = {}
>       dups = []
>
> @@ -385,9 +387,15 @@ def check_sanity(e):
>   	    dups.append(pa)
>   	else:
>   	    seen[pa] = 1
> +	if pa == tunepkg:
> +	    tunefound = True
> +
>       if len(dups):
>          messages = messages + "Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: %s" % " ".join(dups)
>
> +    if tunefound == False:
> +       messages = messages + "Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (%s)." % tunepkg
> +
>       if messages != "":
>           raise_sanity_error(messages)
>

Merged as is into OE-Core, we still want to check for duplicates since 
it means something else might be wrong.

Thanks
	Sau!



