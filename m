Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QTdR9-0004R0-Q7 for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 19:18:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p56HEhfb007449
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 18:14:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07156-05 for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2011 18:14:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p56HEZu1007443
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 18:14:39 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <e66fee724ac6efa49cb941a59b2fc7c61bf14405.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
	<e66fee724ac6efa49cb941a59b2fc7c61bf14405.1307342214.git.sgw@linux.intel.com>
Date: Mon, 06 Jun 2011 18:14:33 +0100
Message-ID: <1307380473.7672.30.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 10/20] package.bbclass: add support to split Qt translation files
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
X-List-Received-Date: Mon, 06 Jun 2011 17:18:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-06-05 at 23:44 -0700, Saul Wold wrote:
> From: Otavio Salvador <otavio@ossystems.com.br>
> 
> There're many Qt applications that provide translation files in '.qm'
> format however those weren't being splitted as GetText based
> ones.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Am I right in assuming all these qt applications use one of the qt
classes?

I do wonder if this shouldn't be part of one of the qt classes as part
of a package_do_split_locales_append() or prepend() style function from
a code separation point of view. I do appreciate the need to influence
the list of locales although you could do that through directory
creation or an extra variable but we could enhance package.bbclass to
support that.

> ---
>  meta/classes/package.bbclass |   41 +++++++++++++++++++++++++++++++++++++----
>  1 files changed, 37 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 1e6a872..e4be20f 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -343,6 +343,8 @@ python package_do_split_locales() {
>  		bb.debug(1, "package requested not splitting locales")
>  		return
>  
> +	import re
> +
>  	packages = (bb.data.getVar('PACKAGES', d, True) or "").split()
>  
>  	datadir = bb.data.getVar('datadir', d, True)
> @@ -358,12 +360,29 @@ python package_do_split_locales() {
>  
>  	localedir = os.path.join(dvar + datadir, 'locale')
>  
> -	if not os.path.isdir(localedir):
> +	locales = []
> +	if os.path.isdir(localedir):
> +		locales = os.listdir(localedir)
> +
> +	# Check of Qt translation files
> +	qm_re = re.compile("(.*)\.qm$")
> +	qm_files = {}
> +	for root, dirs, files in os.walk(dvar):
> +		for file in files:
> +			qm_file = qm_re.match(file)
> +			if qm_file:
> +				locale = qm_file.group(1)
> +				relpath = os.path.join(root, file).replace(dvar, '', 1)
> +				if relpath:
> +					if not qm_files.has_key(locale):
> +						qm_files[locale] = []
> +
> +					qm_files[locale].append(relpath)
> +
> +	if len(locales) == 0 and len(qm_files) == 0:
>  		bb.debug(1, "No locale files in this package")
>  		return
>  
> -	locales = os.listdir(localedir)
> -
>  	# This is *really* broken
>  	mainpkg = packages[0]
>  	# At least try and patch it up I guess...
> @@ -372,13 +391,27 @@ python package_do_split_locales() {
>  	if mainpkg.find('-dev'):
>  		mainpkg = mainpkg.replace('-dev', '')
>  
> +	# Queue Qt locales for spliting
> +	for l in qm_files.keys():
> +		if l not in locales:
> +			locales.append(l)
> +
> +	# Split the locales into different packages
>  	summary = bb.data.getVar('SUMMARY', d, True) or pn
>  	description = bb.data.getVar('DESCRIPTION', d, True) or "" 
>  	for l in locales:
>  		ln = legitimize_package_name(l)
>  		pkg = pn + '-locale-' + ln
>  		packages.append(pkg)
> -		bb.data.setVar('FILES_' + pkg, os.path.join(datadir, 'locale', l), d)
> +		files = []
> +		files.append(os.path.join(datadir, 'locale', l))
> +
> +		if qm_files.has_key(l):
> +			locale_re = re.compile("^.*([a-z]{2}(_[A-Z]{2})?)$")
> +			ln = legitimize_package_name(locale_re.match(l).group(1))
> +			files += qm_files[l]

Regardless, this is changing ln under some weird circumstances.
Shouldn't the code adding this to the locales list be handling this
translation? I can see potential duplication between the arrays and a
host of other nasty bugs with this code as it stands :/. Please take
that regexp out of this loop at the very least.


Cheers,

Richard


> +
> +		bb.data.setVar('FILES_' + pkg, " ".join(files), d)
>  		bb.data.setVar('RDEPENDS_' + pkg, '%s virtual-locale-%s' % (mainpkg, ln), d)
>  		bb.data.setVar('RPROVIDES_' + pkg, '%s-locale %s-translation' % (pn, ln), d)
>  		bb.data.setVar('SUMMARY_' + pkg, '%s - %s translations' % (summary, l), d)




