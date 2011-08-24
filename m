Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qw4Qa-0004VF-9A
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 05:46:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2011 20:41:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="41577302"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2011 20:41:57 -0700
Message-ID: <4E547305.3040902@linux.intel.com>
Date: Tue, 23 Aug 2011 20:41:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4e4e5424.8c5cdf0a.7d94.ffffbafd@mx.google.com>
In-Reply-To: <4e4e5424.8c5cdf0a.7d94.ffffbafd@mx.google.com>
Cc: martin.jansa@gmail.com
Subject: Re: [PATCH] utils.bbclass: skip empty paths when handling FILESEXTRAPATHS
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
X-List-Received-Date: Wed, 24 Aug 2011 03:46:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2011 05:16 AM, martin.jansa@gmail.com wrote:
> From: Martin Jansa<Martin.Jansa@gmail.com>
>
> * if there is multiple .bbappend files with FILESEXTRAPATHS_prepend := "/:"
>    then the one parsed last is causing trailing ':' and that's causing empty element in
>    path = extrapaths.split(:) + path
> * it's hard to keep all .bbappends from foreign layers to follow this rule, so it's better
>    to be able to handle trailing ':'
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/classes/utils.bbclass |    5 +++--
>   1 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> index 56abdd8..3c2e342 100644
> --- a/meta/classes/utils.bbclass
> +++ b/meta/classes/utils.bbclass
> @@ -338,8 +338,9 @@ def base_set_filespath(path, d):
>   	# The ":" ensures we have an 'empty' override
>   	overrides = (bb.data.getVar("OVERRIDES", d, 1) or "") + ":"
>   	for p in path:
> -		for o in overrides.split(":"):
> -			filespath.append(os.path.join(p, o))
> +		if p != "":
> +			for o in overrides.split(":"):
> +				filespath.append(os.path.join(p, o))
>   	return ":".join(filespath)
>
>   def extend_variants(d, var, extend, delim=':'):

Merged into OE-Core

Thanks
	Sau!


