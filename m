Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ShfCo-0007N4-1S for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 13:05:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LAsuuM021533
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 11:54:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21206-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 11:54:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LAslwU021527
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 11:54:48 +0100
Message-ID: <1340276089.1640.90.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2012 11:54:49 +0100
In-Reply-To: <8e362de541f2827cb615e86b850353d929d33d24.1340038108.git.scott.a.garman@intel.com>
References: <cover.1340038108.git.scott.a.garman@intel.com>
	<8e362de541f2827cb615e86b850353d929d33d24.1340038108.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/6] sanity.bbclass: warn the user if BBPATH contains wrong entries
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
X-List-Received-Date: Thu, 21 Jun 2012 11:05:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-06-18 at 12:57 -0700, Scott Garman wrote:
> From: Laurentiu Palcu <laurentiu.palcu@intel.com>
> 
> If BBPATH references the working directory, the user is warned and asked
> to fix the problem.
> 
> [Yocto #1465]
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Reworked commit to fix merge conflicts with denzil branch.
> 
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
>  meta/classes/sanity.bbclass |   13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 9755694..298372b 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -310,7 +310,18 @@ def check_sanity(sanity_data):
>      if "." in data.getVar('PATH', sanity_data, True).split(":"):
>          messages = messages + "PATH contains '.' which will break the build, please remove this"
>  
> -    if data.getVar('TARGET_ARCH', sanity_data, True) == "arm":
> +    bbpaths = sanity_data.getVar('BBPATH', True).split(":")
> +    if "." in bbpaths or "" in bbpaths:
> +        # TODO: change the following message to fatal when all BBPATH issues
> +        # are fixed
> +        bb.warn("BBPATH references the current directory, either through "    \
> +                "an empty entry, or a '.'.\n\t This is unsafe and means your "\
> +                "layer configuration is adding empty elements to BBPATH.\n\t "\
> +                "Please check your layer.conf files and other BBPATH "        \
> +                "settings to remove the current working directory "           \
> +                "references.");
> +
> +    if sanity_data.getVar('TARGET_ARCH', True) == "arm":
>          # This path is no longer user-readable in modern (very recent) Linux
>          try:
>              if os.path.exists("/proc/sys/vm/mmap_min_addr"):

I think for this one, I'd like to merge the bitbake fixes back to denzil
but leave this one out. Its going to warn pretty much everywhere and we
don't have good ways of fixing it yet.

The actual manifestation of the bug is fixed by the bitbake changes.

Cheers,

Richard



