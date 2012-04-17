Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SK4AA-0005Nf-Gs for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 10:53:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3H8hwxe010296
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 09:43:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08755-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 09:43:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3H8hmem010284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 09:43:49 +0100
Message-ID: <1334652231.616.55.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 17 Apr 2012 09:43:51 +0100
In-Reply-To: <8ccb7e0d4dc93c7a32ef05db0665d1f7be1e0fc9.1334616144.git.mark.hatle@windriver.com>
References: <cover.1334616144.git.mark.hatle@windriver.com>
	<8ccb7e0d4dc93c7a32ef05db0665d1f7be1e0fc9.1334616144.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 01/17] update-alternatives.bbclass: Ensure alternatives end up in per file deps
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
X-List-Received-Date: Tue, 17 Apr 2012 08:53:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-16 at 17:45 -0500, Mark Hatle wrote:
> Ensure that alternatives end up in per file provides, associated with the
> source of the alternative.
> 
> Add a way to specify MANUAL_ALTERNATIVE_LINKS in order for programs that
> manage their own alternatives to be more easily added to the per file
> provides.
> 
> Add a function, package_do_filedeps_append to handle the setup of these
> automatic per file dependencies.  The method is based on the code in the
> busybox package that does similar work.  It replaces the brute force RPM
> method that just adds a "Provides:" for each alternative.
> 
> Add a check before moving the item to see if the destination already exists,
> if it does, assume the package already performed the rename.  This is
> necessary to deal with some packages that have symlinks pointing to renamed
> items.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/package.bbclass             |   16 ++++---
>  meta/classes/package_rpm.bbclass         |    4 --
>  meta/classes/update-alternatives.bbclass |   69 +++++++++++++++++++++++++++++-
>  3 files changed, 77 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index c3f077a..99c945d 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1162,6 +1162,15 @@ python package_do_filedeps() {
>  	rpmdeps = d.expand("${RPMDEPS}")
>  	r = re.compile(r'[<>=]+ +[^ ]*')
>  
> +	def file_translate(file):
> +		ft = file.replace("@", "@at@")
> +		ft = ft.replace(" ", "@space@")
> +		ft = ft.replace("\t", "@tab@")
> +		ft = ft.replace("[", "@openbrace@")
> +		ft = ft.replace("]", "@closebrace@")
> +		ft = ft.replace("_", "@underscore@")
> +		return ft
> +
>  	# Quick routine to process the results of the rpmdeps call...
>  	def process_deps(pipe, pkg, provides_files, requires_files):
>  		provides = {}
> @@ -1179,12 +1188,7 @@ python package_do_filedeps() {
>  				continue
>  
>  			file = f.replace(pkgdest + "/" + pkg, "")
> -			file = file.replace("@", "@at@")
> -			file = file.replace(" ", "@space@")
> -			file = file.replace("\t", "@tab@")
> -			file = file.replace("[", "@openbrace@")
> -			file = file.replace("]", "@closebrace@")
> -			file = file.replace("_", "@underscore@")
> +			file = file_translate(file)
>  			value = line.split(":", 1)[1].strip()
>  			value = r.sub(r'(\g<0>)', value)
>  
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index ffe3b31..30bb08b 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -720,10 +720,6 @@ python write_specfile () {
>  		splitrconflicts  = strip_multilib(localdata.getVar('RCONFLICTS', True), d) or ""
>  		splitrobsoletes  = []
>  
> -		# For now we need to manually supplement RPROVIDES with any update-alternatives links
> -		if pkg == d.getVar("PN", True):
> -			splitrprovides = splitrprovides + " " + (d.getVar('ALTERNATIVE_LINK', True) or '') + " " + (d.getVar('ALTERNATIVE_LINKS', True) or '')
> -
>  		# Gather special src/first package data
>  		if srcname == splitname:
>  			srcrdepends    = splitrdepends
> diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
> index 7b0518d..85733f7 100644
> --- a/meta/classes/update-alternatives.bbclass
> +++ b/meta/classes/update-alternatives.bbclass
> @@ -35,10 +35,18 @@
>  #
>  # If above assumption breaks your requirement, then you still need to use
>  # your own update-alternatives command directly.
> +#
> +# Even if you specify your update-alternatives manually, you need to
> +# use MANUAL_ALTERNATIVE_LINKS to specify each of the target linked items.
> +# This ensures that package dependencies/provides are set appropriately.
> +#
> +# MANUAL_ALTERNATIVE_LINKS = "<target>:<source>"
> +#
> +# If no source is specified, it is assumed to be <target>.${PN}
>  
>  # defaults
>  ALTERNATIVE_PRIORITY = "10"
> -ALTERNATIVE_LINK = "${bindir}/${ALTERNATIVE_NAME}"
> +ALTERNATIVE_LINK = "${@['${bindir}/' + (d.getVar('ALTERNATIVE_NAME') or ""), ''][d.getVar('ALTERNATIVE_NAME') != None]}"
>  
>  update_alternatives_postinst() {
>  update-alternatives --install ${ALTERNATIVE_LINK} ${ALTERNATIVE_NAME} ${ALTERNATIVE_PATH} ${ALTERNATIVE_PRIORITY}
> @@ -71,7 +79,11 @@ done
>  update_alternatives_batch_doinstall() {
>  	for link in ${ALTERNATIVE_LINKS}
>  	do
> -		mv ${D}${link} ${D}${link}.${PN}
> +		# Only do this if not already done..
> +		# There are a few cases where a package will do this manually
> +		if [ ! -e ${D}${link}.${PN} ]; then
> +			mv ${D}${link} ${D}${link}.${PN}
> +		fi
>  	done
>  }

We have cases where the recipe does this yet calls in here?

I'd rather stop packages doing this manually...

>  
> @@ -85,6 +97,9 @@ def update_alternatives_after_parse(d):
>          d.setVar('do_install', doinstall)
>          return
>  
> +    if d.getVar('MANUAL_ALTERNATIVE_LINKS') != None:
> +	return
> +

Presumably this is the problem case above? Do any of these really
want/need the do_install addition?

>      if d.getVar('ALTERNATIVE_NAME') == None:
>          raise bb.build.FuncFailed, "%s inherits update-alternatives but doesn't set ALTERNATIVE_NAME" % d.getVar('FILE')
>      if d.getVar('ALTERNATIVE_PATH') == None:
> @@ -114,3 +129,53 @@ python populate_packages_prepend () {
>  		postrm += d.getVar('update_alternatives_postrm', True)
>  	d.setVar('pkg_postrm_%s' % pkg, postrm)
>  }
> +
> +python package_do_filedeps_append () {
> +	# We need to load the provides for each manually updated alternative
> +	# This function sets up the provides only, it's up to the pkg_postinst
> +	# to setup the actual links...
> +
> +	alt_links = ""
> +
> +	if d.getVar('ALTERNATIVE_PATH', True) and d.getVar('ALTERNATIVE_LINK', True):
> +		alt_target = d.getVar('ALTERNATIVE_LINK', True)
> +		alt_source = d.getVar('ALTERNATIVE_PATH', True)
> +		if alt_source[0] != '/':
> +			alt_source = os.path.dirname(alt_target) + '/' + alt_source
> +		alt_links += " " + alt_target + ":" + alt_source
> +
> +	alt_links += " " + (d.getVar('ALTERNATIVE_LINKS', True) or "")
> +	alt_links += " " + (d.getVar('MANUAL_ALTERNATIVE_LINKS', True) or "")
> +
> +	if alt_links and alt_links.strip() != "":
> +		pn = d.getVar('PN', True)
> +
> +		for alt_target in alt_links.split():
> +			# Generate the filename we need to set the dependency in
> +			if ':' in alt_target:
> +				alt_source = alt_target.split(':')[1]
> +				alt_target = alt_target.split(':')[0]
> +			else:
> +				alt_source = alt_target + '.' + pn
> +
> +			bb.note('%s: Adding alternative provide %s' % (alt_source, alt_target))
> +
> +			# Add the new dependency into the file rprovide
> +			# Since we don't know which split owns this, set it in all of them
> +			# this should not cause any issues by doing so...
> +			for split_pn in d.getVar('PACKAGES', True).split():
> +				# Match the original function skip routine
> +				if split_pn.endswith('-dbg') or split_pn.endswith('-doc') or split_pn.find('-locale-') != -1 or split_pn.find('-localedata-') != -1 or split_pn.find('-gconv-') != -1 or split_pn.find('-charmap-') != -1 or split_pn.startswith('kernel-module-'):
> +					continue
> +
> +				ft_alt_source = file_translate(alt_source)
> +				filerprovides = d.getVar('FILERPROVIDES_%s_%s' % (ft_alt_source, split_pn), True) or ""
> +				filerprovides += " " + alt_target
> +				d.setVar('FILERPROVIDES_%s_%s' % (ft_alt_source, split_pn), filerprovides)
> +
> +				# Make sure there is an entry for this item in the FILERPROVIDESFLIST...
> +				filerprovidesflist = (d.getVar('FILERPROVIDESFLIST_%s' % split_pn, True) or "").split()
> +				if ft_alt_source not in filerprovidesflist:
> +					filerprovidesflist.append(ft_alt_source)
> +				d.setVar('FILERPROVIDESFLIST_%s' % split_pn, " ".join(filerprovidesflist))
> +}

I'm not sure I like this code style. How about:

python package_do_filedeps_append () {
	# We need to load the provides for each manually updated alternative
	# This function sets up the provides only, it's up to the pkg_postinst
	# to setup the actual links...

	alt_links = {}

	target = d.getVar('ALTERNATIVE_LINK', True)
	source = d.getVar('ALTERNATIVE_PATH', True)
	if target and source:
		if source[0] != '/':
			source = os.path.dirname(target) + '/' + source
		alt_links[source] = target

	pn = d.getVar('PN', True)
	links = ((d.getVar('ALTERNATIVE_LINKS', True) or "") + " " + (d.getVar('MANUAL_ALTERNATIVE_LINKS', True) or "")).split()
	for target in links:
		# Generate the filename we need to set the dependency in
		if ':' in target:
			source = target.split(':')[1]
			target = target.split(':')[0]
		else:
			source = target + '.' + pn
		alt_links[source] = target

	pkgdest = d.getVar('PKGDEST', True)
	for link in alt_links:
		source = file_translate(link)
		target = alt_links[link]

		for pkg in d.getVar('PACKAGES', True).split():
			if not os.path.exists(os.path.join(pkgdest, pkg, target)):
				continue

			bb.note('%s: Adding alternative provide %s to package %s' % (source, target, pkg))
	
			d.appendVar('FILERPROVIDES_%s_%s' % (source, pkg), " " + target)
			if not source in (d.getVar('FILERPROVIDESFLIST_%s' % pkg, True) or "").split():
				d.appendVar('FILERPROVIDESFLIST_%s' % pkg, " " + source)
}

which as well as being slightly easier to read (IMO), ditches the
package endings check since that was only there for performance in the
other function and also checks which package contains the target file
rather than just adding to them all. I've not tested the code above.

I have to say that changes like this at -rc4 in a release cycle are not
a good idea and I'm not sure this patchset will make it into the release
as a result.
 
Cheers,

Richard



