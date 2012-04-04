Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFTd7-0003y2-K5
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 19:04:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Apr 2012 09:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125306913"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2012 09:55:08 -0700
Message-ID: <4F7C7CEC.1060307@linux.intel.com>
Date: Wed, 04 Apr 2012 09:55:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1333451148-32709-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1333451148-32709-1-git-send-email-andrei@gherzan.ro>
Subject: Re: [PATCH] license.bbclass: Check if copyfile succeeded with isfile
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
X-List-Received-Date: Wed, 04 Apr 2012 17:04:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2012 04:05 AM, Andrei Gherzan wrote:
> A cleaner way to check if copyfile suceeded is to use os.path.isfile.
> In this way we can omit warns in some python versions where copyfile
> return the same non-0 value even is this action is successfull.
>
> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> ---
>   meta/classes/license.bbclass |    5 +++--
>   1 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index c85233c..6c4a673 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -215,9 +215,10 @@ python do_populate_lic() {
>           if spdx_generic and license_source:
>               # we really should copy to generic_ + spdx_generic, however, that ends up messing the manifest
>               # audit up. This should be fixed in emit_pkgdata (or, we actually got and fix all the recipes)
> -            ret = bb.copyfile(os.path.join(license_source, spdx_generic), os.path.join(os.path.join(d.getVar('LICSSTATEDIR', True), pn), "generic_" + license_type))
> +
> +            bb.copyfile(os.path.join(license_source, spdx_generic), os.path.join(os.path.join(d.getVar('LICSSTATEDIR', True), pn), "generic_" + license_type))
> +            if not os.path.isfile(os.path.join(os.path.join(d.getVar('LICSSTATEDIR', True), pn), "generic_" + license_type)):
>               # If the copy didn't occur, something horrible went wrong and we fail out
> -            if not ret:
>                   bb.warn("%s for %s could not be copied for some reason. It may not exist. WARN for now." % (spdx_generic, pn))
>           else:
>               # And here is where we warn people that their licenses are lousy

Merged into OE-Core

Thanks
	Sau!


