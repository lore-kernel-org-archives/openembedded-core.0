Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVtdt-00044z-IH for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:32:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUNQ6VW007635
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 23:26:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07559-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 23:26:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUNPx3H007629
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 23:26:01 GMT
Message-ID: <1322695568.17484.82.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 23:26:08 +0000
In-Reply-To: <1322606818-2817-1-git-send-email-raj.khem@gmail.com>
References: <1322606818-2817-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] classes: Apply libc-${LIBC} overrides to target recipes only
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
X-List-Received-Date: Wed, 30 Nov 2011 23:32:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 14:46 -0800, Khem Raj wrote:
> Currently these overrides are enabled for native and nativesdk
> recipes as well when inheriting native and nativesdk classes. This patch
> filters these from OVERRIDES variables for native and nativesdk
> recipes.
> 
> oe_filter_out and oe_filter functions currently only operated on
> space separated strings. Since OVERRIDES are separated using ':'
> these functions are enhanced to take and additional parameter
> called 'sep' which defaults to None if not specified which means we keep
> the existing behaviour.
> 
> Drop the last parameter 'd' from filter functions since it was not being
> used.

This last piece worries me a lot. It requires a flag day where everyone
changes, particularly layers. I don't think that is something that is
acceptable.

I'd like to think simpler. How about we change tclibc*.inc to do
something like:

LIBCOVERRIDE = ":libc-glibc"
OVERRIDES .= "${LIBCOVERRIDE}"

and then native.bbclass can just do:

LIBCOVERRIDE = ""

Cheers,

Richard



