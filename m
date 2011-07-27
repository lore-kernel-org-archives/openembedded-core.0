Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qm5Pe-0008JV-Lq
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 16:48:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6REiRsa019062
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 07:44:27 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 27 Jul 2011 07:44:27 -0700
Message-ID: <4E30244A.5030209@windriver.com>
Date: Wed, 27 Jul 2011 09:44:26 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
	<7cdd5b62608ae2047d4fdd2ee98e452398401b1e.1311776363.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <7cdd5b62608ae2047d4fdd2ee98e452398401b1e.1311776363.git.richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/4] base.bbclass: Add compatibility package name mapping handler
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
X-List-Received-Date: Wed, 27 Jul 2011 14:48:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/27/11 9:29 AM, Richard Purdie wrote:
> This means if PKGARCHCOMPAT_ARMV7A is set, "armv7a-vfp-neon" is renamed
> to be "armv7a". Other compatibility mappings can be added as needed.

There are multiple armv7 cores without neon...  I think there might even be one
or two custom cores w/o VFP.  (Yes I know this violates the core spec from ARM,
but people do that all of the time.)

--Mark

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/base.bbclass |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index f12b3cb..3ed1bb8 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -133,6 +133,13 @@ def generate_git_config(e):
>                  f.write(proxy_command)
>                  f.close
>  
> +def pkgarch_mapping(d):
> +    # Compatibility mappings of TUNE_PKGARCH (opt in)
> +    if d.getVar("PKGARCHCOMPAT_ARMV7A", True):
> +        if d.getVar("TUNE_PKGARCH", True) == "armv7a-vfp-neon":
> +            d.setVar("TUNE_PKGARCH", "armv7a")
> +
> +
>  addhandler base_eventhandler
>  python base_eventhandler() {
>  	from bb import note, error, data
> @@ -203,6 +210,7 @@ python base_eventhandler() {
>  
>          if name == "ConfigParsed":
>                  generate_git_config(e)
> +                pkgarch_mapping(e.data)
>  
>  	if not data in e.__dict__:
>  		return



