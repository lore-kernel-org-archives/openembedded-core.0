Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7Cno-000601-VF
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 22:29:13 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Mar 2012 14:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="117025655"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2012 14:20:27 -0700
Message-ID: <4F5E689B.9090701@linux.intel.com>
Date: Mon, 12 Mar 2012 14:20:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331027262-13318-1-git-send-email-s.stirtzel@googlemail.com>
In-Reply-To: <1331027262-13318-1-git-send-email-s.stirtzel@googlemail.com>
Subject: Re: [PATCH] mime.bbclass: Fix bracket error.
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
X-List-Received-Date: Mon, 12 Mar 2012 21:29:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2012 01:47 AM, Samuel Stirtzel wrote:
> This fixes the following error:
>
> ERROR: Error executing a python function in ...:
> AttributeError: 'str' object has no attribute 'append'
>
> ERROR: The stack trace of python calls that resulted in this exception/failure was:
> ERROR:   File "populate_packages", line 193, in<module>
> ERROR:
> ERROR:   File "populate_packages", line 189, in populate_packages
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0189:                       rdepends.append("shared-mime-info-data")
> ERROR:      0190:                       d.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends))
> ERROR:      0191:
> ERROR:      0192:
> ERROR:  *** 0193:populate_packages(d)
> ERROR:      0194:
> ERROR: (file: 'populate_packages', lineno: 193, function:<module>)
> ERROR:      0185:                       postrm += d.getVar('mime_postrm', True)
> ERROR:      0186:                       d.setVar('pkg_postrm_%s' % pkg, postrm)
> ERROR:      0187:                       bb.note("adding shared-mime-info-data dependency to %s" % pkg)
> ERROR:      0188:                       rdepends = explode_deps(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False)) or ""
> ERROR:  *** 0189:                       rdepends.append("shared-mime-info-data")
> ERROR:      0190:                       d.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends))
> ERROR:      0191:
> ERROR:      0192:
> ERROR:      0193:populate_packages(d)
>
> Signed-off-by: Samuel Stirtzel<s.stirtzel@googlemail.com>
> ---
>   meta/classes/mime.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
> index dcdc27a..6302747 100644
> --- a/meta/classes/mime.bbclass
> +++ b/meta/classes/mime.bbclass
> @@ -54,7 +54,7 @@ python populate_packages_append () {
>   			postrm += d.getVar('mime_postrm', True)
>   			d.setVar('pkg_postrm_%s' % pkg, postrm)
>   			bb.note("adding shared-mime-info-data dependency to %s" % pkg)
> -			rdepends = explode_deps(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False)) or ""
> +			rdepends = explode_deps(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False) or "" )
>   			rdepends.append("shared-mime-info-data")
>   			d.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends))
>   }

Merged into OE-Core

Thanks
	Sau!


