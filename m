Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QodbM-0000Yv-2K
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:43:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p73Fcshb000286
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 08:38:55 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 3 Aug 2011 08:38:54 -0700
Message-ID: <4E396B8D.9060806@windriver.com>
Date: Wed, 3 Aug 2011 10:38:53 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
	<a59303a5b3249096635224817a6b20c828277132.1312384552.git.dongxiao.xu@intel.com>
In-Reply-To: <a59303a5b3249096635224817a6b20c828277132.1312384552.git.dongxiao.xu@intel.com>
Subject: Re: [PATCH 6/7] package_rpm: fix strip_multilib function
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
X-List-Received-Date: Wed, 03 Aug 2011 15:43:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/3/11 10:19 AM, Dongxiao Xu wrote:
> The previous logic could only strip MLPREFIX from the first element in
> an array, take an example, strip_multilib the [lib32-a lib32-b lib32-c]
> will result in [a lib32-b lib32-c]. This commit change it to strip all
> elements' multilib prefix.
> 
> CC: Mark Hatle <mark.hatle@windriver.com>
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  meta/classes/package_rpm.bbclass |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 9d0eeba..a29ce9d 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -326,7 +326,7 @@ python write_specfile () {
>  		for ext in multilibs.split():
>  			eext = ext.split(':')
>  			if len(eext) > 1 and eext[0] == 'multilib' and name and name.find(eext[1] + '-') == 0:
> -				name = (eext[1] + '-').join(name.split(eext[1] + '-', 1)[1:])
> +				name = " ".join(name.split(eext[1] + '-')[1:])

This looks incorrect to me, with the " ".join, it's going to join multiple
elements with a whitespace between them.  The original code was written to work
on one item at a time within the list of multilibs.

How well has this been tested?  Since I don't have all of the context this very
well might be correct within the current scope of the multilib implementation.

>  		return name
>  
>  #		ml = bb.data.getVar("MLPREFIX", d, True)
> @@ -720,7 +720,7 @@ python do_package_rpm () {
>  	def strip_multilib(name, d):
>  		ml = bb.data.getVar("MLPREFIX", d, True)
>  		if ml and name and len(ml) != 0 and name.find(ml) == 0:
> -			return ml.join(name.split(ml, 1)[1:])
> +			return " ".join(name.split(ml)[1:])
>  		return name
>  
>  	workdir = bb.data.getVar('WORKDIR', d, True)



