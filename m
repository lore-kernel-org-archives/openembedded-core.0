Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TgaY7-0006Ay-0w for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 13:28:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB6CD5tA028628;
	Thu, 6 Dec 2012 12:13:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28027-04; Thu,  6 Dec 2012 12:13:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB6CCuXF028622
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 6 Dec 2012 12:12:57 GMT
Message-ID: <1354795966.25268.178.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 06 Dec 2012 12:12:46 +0000
In-Reply-To: <1354674831-24287-1-git-send-email-mark.hatle@windriver.com>
References: <1354674831-24287-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/22 v2] update-alternatives.bbclass: Add missing runtime dependency
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
X-List-Received-Date: Thu, 06 Dec 2012 12:28:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-12-04 at 20:33 -0600, Mark Hatle wrote:
> When using update-alternatives, there should be a runtime dependency on
> ${VIRTUAL-RUNTIME_update-alternatives}.  Without this, it's possible to
> get into a situation where the package is not installable.
> 
> (If VIRTUAL-RUNTIME_update-alternatives is not defined, no requirement
> is added.)
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/update-alternatives.bbclass |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
> index 4e1ff27..96fd1e8 100644
> --- a/meta/classes/update-alternatives.bbclass
> +++ b/meta/classes/update-alternatives.bbclass
> @@ -304,6 +304,14 @@ python populate_packages_prepend () {
>              alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)
>  
>          if alt_setup_links:
> +            # RDEPENDS setup
> +            provider = d.getVar('VIRTUAL-RUNTIME_update-alternatives', True)
> +            if provider:
> +                bb.note('adding runtime requirement for update-alternatives for %s' % pkg)
> +                rdepends = d.getVar('RDEPENDS_%s' % pkg, True) or ""
> +                rdepends += ' ' + d.getVar('MLPREFIX') + provider
> +                d.setVar("RDEPENDS_%s" % pkg, rdepends)
> +
>              bb.note('adding update-alternatives calls to postinst/postrm for %s' % pkg)
>              bb.note('%s' % alt_setup_links)
>              postinst = (d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)) or '#!/bin/sh\n'

I'm afraid I don't like this patch. Firstly, do we really need a bb.note
in there? We don't note every little thing we do, not least as it would
kill performance.

Secondly, why not simply do:

d.appendVar('RDEPENDS_%s' % pkg, ' ' + d.getVar('MLPREFIX') + provider)

?

Cheers,

Richard



