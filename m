Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TqTjR-00025R-5G
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Jan 2013 20:12:05 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jan 2013 10:57:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,397,1355126400"; d="scan'208";a="272128460"
Received: from unknown (HELO [10.255.14.135]) ([10.255.14.135])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jan 2013 10:56:09 -0800
Message-ID: <50E4829C.9040908@linux.intel.com>
Date: Wed, 02 Jan 2013 10:55:24 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <alpine.DEB.2.02.1301021151240.6551@oneiric>
In-Reply-To: <alpine.DEB.2.02.1301021151240.6551@oneiric>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: value of "PACKAGE_BEFORE_PN" versus "PACKAGES =+"?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jan 2013 19:12:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/02/2013 09:04 AM, Robert P. J. Day wrote:
>
>    just now noticed the variable PACKAGE_BEFORE_PN, whose entire
> usage in poky (other than documentation) is:
>
> meta/conf/bitbake.conf:PACKAGE_BEFORE_PN ?= ""
> meta/conf/bitbake.conf:PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
> meta/classes/lib_package.bbclass:PACKAGE_BEFORE_PN = "${PN}-bin"
>
>    is there an actual need for that variable that places the new
> package names *precisely* in that location in the PACKAGES list?  and
> given the specificity of the initial PN-related packages:
>
Yes, the need in the case of lib_package it to ensure that the ${PN}-bin 
(bindir and sbindir) files get packages separately from the ${PN} files, 
which are typically the libraries in the case of recipes that deliver 
libraries and binaries.

>    "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale"
>
> is there any reason more recipes couldn't use PACKAGE_BEFORE_PN
> instead of "PACKAGES =+" when defining new packages?  i *realize*
> those two things don't represent the same thing but, in many cases,
> would the end result be the same?
>
>    is there any reason more code doesn't use "PACKAGE_BEFORE_PN"?
>
The =+ prepends it to the list and therefore is correctly greedy for the 
items they are trying to package. Since the PACKAGE_BEFORE_PN 
specifically inserts it, so for the most part there is no real need to 
use the P_B_P variable, and =+ is more consistent.

Sau!


> rday



