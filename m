Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 6025260FD5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 03:30:08 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Sep 2013 20:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,888,1371106800"; d="scan'208";a="293828094"
Received: from unknown (HELO [10.255.14.99]) ([10.255.14.99])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Sep 2013 20:30:05 -0700
Message-ID: <5231353D.6070604@linux.intel.com>
Date: Wed, 11 Sep 2013 20:30:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1378923463-31773-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1378923463-31773-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] base: improve PACKAGECONFIG handling logic
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
X-List-Received-Date: Thu, 12 Sep 2013 03:30:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2013 11:17 AM, Ross Burton wrote:
> The existing code for handling PACKAGECONFIG lists wasn't the cleanest Python
> around.  Instead of diving into the list directly using indices and lengths, use
> pop() to iterate through the list.
>

I started to get some strange behaviour with building world, 
specifically, rpm-native stopped building.  You can test this by 
cleaning beecrypt-native and then try to build rpm-native.

Sau!

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/classes/base.bbclass |   23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index dfa580c..37dc790 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -420,7 +420,7 @@ python () {
>           def appendVar(varname, appends):
>               if not appends:
>                   return
> -            if varname.find("DEPENDS") != -1:
> +            if "DEPENDS_" in varname:
>                   if pn.startswith("nativesdk-"):
>                       appends = expandFilter(appends, "", "nativesdk-")
>                   if pn.endswith("-native"):
> @@ -442,12 +442,21 @@ python () {
>                   bb.error("Only enable,disable,depend,rdepend can be specified!")
>
>               if flag in pkgconfig:
> -                if num >= 3 and items[2]:
> -                    extradeps.append(items[2])
> -                if num >= 4 and items[3]:
> -                    extrardeps.append(items[3])
> -                if num >= 1 and items[0]:
> -                    extraconf.append(items[0])
> +                if items:
> +                    item = items.pop(0)
> +                    if item:
> +                        extraconf.append(item)
> +                # Skip over disable
> +                if items:
> +                    items.pop(0)
> +                if items:
> +                    item = items.pop(0)
> +                    if item:
> +                        extradeps.append(item)
> +                if items:
> +                    item = items.pop(0)
> +                    if item:
> +                        extrardeps.append(item)
>               elif num >= 2 and items[1]:
>                       extraconf.append(items[1])
>           appendVar('DEPENDS', extradeps)
>

