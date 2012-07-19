Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Srs7Y-0008Fn-8X for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 16:54:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JEh6m4003333
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 15:43:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02557-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 15:43:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JEgwp1003324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 15:42:59 +0100
Message-ID: <1342708981.7940.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jul 2012 15:43:01 +0100
In-Reply-To: <1340871186-20545-1-git-send-email-andrei@gherzan.ro>
References: <1340871186-20545-1-git-send-email-andrei@gherzan.ro>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] package.bbclass: Create symlinks for packages with different packaged name
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
X-List-Received-Date: Thu, 19 Jul 2012 14:54:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-06-28 at 11:13 +0300, Andrei Gherzan wrote:
> While generating license.manifest package information is searched in:
> filename=`ls ${TMPDIR}/pkgdata/*/runtime/${pkg}| head -1`
> This is ok as long as package name is the same as the package name
> after packaging.
> For example dbus is packaged as dbus-1. So, searching
> ls ${TMPDIR}/pkgdata/*/runtime/dbus-1 will fail because there is no file
> with this package name.
> 
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  meta/classes/package.bbclass |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 10c2f0a..460b351 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1120,6 +1120,11 @@ python emit_pkgdata() {
>  		sf.write('%s_%s: %s\n' % ('PKGSIZE', pkg, get_directory_size(pkgdest + "/%s" % pkg)))
>  		sf.close()
>  
> +		# Symlinks needed while generating manifest
> +		pkgval = d.getVar('PKG_%s' % (pkg), True)
> +		if pkgval != pkg:
> +			subdata_sym = pkgdatadir + "/runtime/%s" % pkgval
> +			os.symlink(pkg,subdata_sym)
>  
>  		allow_empty = d.getVar('ALLOW_EMPTY_%s' % pkg, True)
>  		if not allow_empty:

I think this is the right idea, I'm just worried about having things in
the same directory. Could we do this but create the symlinks in a
"runtime-renamed" directory instead, then alter licence.bbclass to look
there?

Cheers,

Richard



