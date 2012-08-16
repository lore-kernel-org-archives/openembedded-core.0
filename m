Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T24Md-0007or-6e
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 20:00:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2012 10:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="181588521"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2012 10:48:12 -0700
Message-ID: <502D325C.8020405@linux.intel.com>
Date: Thu, 16 Aug 2012 10:48:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343923596-28854-1-git-send-email-yao.zhao@windriver.com>
In-Reply-To: <1343923596-28854-1-git-send-email-yao.zhao@windriver.com>
Subject: Re: [PATCH] base.bbclass: fix PACKAGECONFIG handling code
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
X-List-Received-Date: Thu, 16 Aug 2012 18:00:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2012 09:06 AM, Yao Zhao wrote:
> PACKAGECONFIG flag code only handles that when it has 3 or 4 items in flag,
> it may have a stale data if some flags doesn't need DEPENDS and RDEPENDS.
>
> Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ---
>   meta/classes/base.bbclass |   25 ++++++++++++-------------
>   1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index e15fa26..3e6a7de 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -364,20 +364,19 @@ python () {
>               if flag == "defaultval":
>                   continue
>               items = flagval.split(",")
> -            if len(items) == 3:
> -                enable, disable, depend = items
> -                rdepend = ""
> -            elif len(items) == 4:
> -                enable, disable, depend, rdepend = items
> +            num = len(items)
> +            if num > 4:
> +                bb.error("Only enable,disable,depend,rdepend can be specified!")
> +
>               if flag in pkgconfig:
> -                if depend:
> -                    extradeps.append(depend)
> -                if rdepend:
> -                    extrardeps.append(rdepend)
> -                if enable:
> -                    extraconf.append(enable)
> -            elif disable:
> -                    extraconf.append(disable)
> +                if num >= 3 and items[2]:
> +                    extradeps.append(items[2])
> +                if num >= 4 and items[3]:
> +                    extrardeps.append(items[3])
> +                if num >= 1 and items[0]:
> +                    extraconf.append(items[0])
> +            elif num >= 2 and items[1]:
> +                    extraconf.append(items[1])
>           appendVar('DEPENDS', extradeps)
>           appendVar('RDEPENDS_${PN}', extrardeps)
>           appendVar('EXTRA_OECONF', extraconf)
>

Merged into OE-Core

Thanks
	Sau!



