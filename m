Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QQMg2-0003K1-Bd
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 18:47:50 +0200
Received: by pxj25 with SMTP id 25so596364pxj.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2011 09:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Pc66RannmNJ3mFcKGWbve8RB/cvPVTb6Zhc9FkuhhfU=;
	b=oOY7q3yM6CrPdNUBk9R3FUBkeFEwCQ41tOrA5gepE/veCs1+eRI4CQxnCybn+04y5m
	9qePwEpaYXheDdACtWHQAL0AqAGXnHqTYiSYypHoiPXbUZ4Th8WPOnQnYmuLonvEzGrg
	sgL6VbXRUFlSDw7ZQc1GocnBLUFi8J1b+a5bw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=Apev+2c1eMD0gnX9PfVi14AqWmN56w50CBPNjbX+Swk+QjbOi2ccSPkAiJNeWElDh7
	j3kx1O3kKyU9R5JWvFPSca4+NnoPQ3Diljg8Myi4/FAVEbjjODdaoytKSNHgTEjJrOlR
	juaI1ystHCLahx5qElDwDau5mmEfl3I6eTMww=
Received: by 10.142.117.5 with SMTP id p5mr480517wfc.246.1306601083244;
	Sat, 28 May 2011 09:44:43 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x8sm2061116wfx.7.2011.05.28.09.44.40
	(version=SSLv3 cipher=OTHER); Sat, 28 May 2011 09:44:42 -0700 (PDT)
Message-ID: <4DE12673.3040604@gmail.com>
Date: Sat, 28 May 2011 09:44:35 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4DE0221C.9070803@intel.com>
In-Reply-To: <4DE0221C.9070803@intel.com>
Subject: Re: [PATCH 1/1][v3] license.bbclass: Sane Parsing of licenses
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
X-List-Received-Date: Sat, 28 May 2011 16:47:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/2011 3:13 PM, Elizabeth Flanagan wrote:
>
> This is a first pass at sane license parsing, using python
> abstract syntax trees.
>
> A few notes on this since ast is not generally used. I massage
> the LICENSE field to be more pythonesque and then create an ast.
>
> I then dump the ast and using a LicenseVisitor class, recurse
> through the tree, looking for licenses. I then copy and link.
>
> It's cleaner, allows for easier addition of logic and while it
> takes slightly more CPU, it's also slightly faster in initial
> small scale tests.
>
> It doesn't recognize the '+' or '*' modifiers to the licenses yet
> nor does it know what to do with bitors (|), since I'm not even
> sure what to do with them.
>
> Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>

elfutils uses () around license which is not parsable now after this
commit.

> ---
> meta/classes/license.bbclass | 152
> +++++++++++++++++++++++++++++++-----------
> 1 files changed, 114 insertions(+), 38 deletions(-)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 4fd1f85..a4d34e7 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -14,6 +14,42 @@ LICSSTATEDIR = "${WORKDIR}/license-destdir/"
> addtask populate_lic after do_patch before do_package
> do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
> do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
> +
> +# Standards are great! Everyone has their own. In an effort to
> standardize licensing
> +# names, common-licenses will use the SPDX standard license names. In
> order to not
> +# break the non-standardized license names that we find in LICENSE,
> we'll set
> +# up a bunch of VarFlags to accomodate non-SPDX license names.
> +#
> +# We should really discuss standardizing this field, but that's a
> longer term goal.
> +# For now, we can do this and it should grab the most common LICENSE
> naming variations.
> +#
> +#GPL variations
> +SPDXLICENSEMAP[GPL] = "GPL-1"
> +SPDXLICENSEMAP[GPLv2] = "GPL-2"
> +SPDXLICENSEMAP[GPLv3] = "GPL-3"
> +
> +#LGPL variations
> +SPDXLICENSEMAP[LGPL] = "LGPL-2"
> +SPDXLICENSEMAP[LGPLv2] = "LGPL-2"
> +SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
> +SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
> +SPDXLICENSEMAP[LGPLv3] = "LGPL-3"
> +
> +#MPL variations
> +SPDXLICENSEMAP[MPL] = "MPL-1"
> +SPDXLICENSEMAP[MPLv1] = "MPL-1"
> +SPDXLICENSEMAP[MPLv1.1] = "MPL-1"
> +
> +#MIT variations
> +SPDXLICENSEMAP[MIT-X] = "MIT"
> +
> +#Openssl variations
> +SPDXLICENSEMAP[openssl] = "Openssl"
> +
> +#Other variations
> +SPDXLICENSEMAP[AFL2.1] = "AFL-2"
> +SPDXLICENSEMAP[EPLv1.0] = "EPL-1"
> +
> python do_populate_lic() {
> """
> Populate LICENSE_DIRECTORY with licenses.
> @@ -21,6 +57,68 @@ python do_populate_lic() {
> import os
> import bb
> import shutil
> + import ast
> +
> + class LicenseVisitor(ast.NodeVisitor):
> + def generic_visit(self, node):
> + ast.NodeVisitor.generic_visit(self, node)
> +
> + def visit_Str(self, node):
> + #
> + # Until I figure out what to do with
> + # the two modifiers I support (or greater = +
> + # and "with exceptions" being *
> + # we'll just strip out the modifier and put
> + # the base license.
> + find_license(node.s.replace("+", "").replace("*", ""))
> + ast.NodeVisitor.generic_visit(self, node)
> +
> + def visit_BinOp(self, node):
> + op = node.op
> + if isinstance(op, ast.BitOr):
> + x = LicenseVisitor()
> + x.visit(node)
> + else:
> + ast.NodeVisitor.generic_visit(self, node)
> +
> + def copy_license(source, destination, file_name):
> + try:
> + bb.copyfile(os.path.join(source, file_name), os.path.join(destination,
> file_name))
> + except:
> + bb.warn("%s: No generic license file exists for: %s at %s" % (pn,
> file_name, source))
> + pass
> +
> + def link_license(source, destination, file_name):
> + try:
> + os.symlink(os.path.join(source, file_name), os.path.join(destination,
> "generic_" + file_name))
> + except:
> + bb.warn("%s: Could not symlink: %s at %s to %s at %s" % (pn,
> file_name, source, file_name, destination))
> + pass
> +
> + def find_license(license_type):
> +
> + try:
> + bb.mkdirhier(gen_lic_dest)
> + except:
> + pass
> +
> + # If the generic does not exist we need to check to see if there is an
> SPDX mapping to it
> + if not os.path.isfile(os.path.join(generic_directory, license_type)):
> + if bb.data.getVarFlag('SPDXLICENSEMAP', license_type, d) != None:
> + # Great, there is an SPDXLICENSEMAP. We can copy!
> + bb.warn("We need to use a SPDXLICENSEMAP for %s" % (license_type))
> + spdx_generic = bb.data.getVarFlag('SPDXLICENSEMAP', license_type, d)
> + copy_license(generic_directory, gen_lic_dest, spdx_generic)
> + link_license(gen_lic_dest, destdir, spdx_generic)
> + else:
> + # And here is where we warn people that their licenses are lousy
> + bb.warn("%s: No generic license file exists for: %s at %s" % (pn,
> license_type, generic_directory))
> + bb.warn("%s: There is also no SPDXLICENSEMAP for this license type: %s
> at %s" % (pn, license_type, generic_directory))
> + pass
> + elif os.path.isfile(os.path.join(generic_directory, license_type)):
> + copy_license(generic_directory, gen_lic_dest, license_type)
> + link_license(gen_lic_dest, destdir, license_type)
> +
>
> # All the license types for the package
> license_types = bb.data.getVar('LICENSE', d, True)
> @@ -33,6 +131,12 @@ python do_populate_lic() {
> srcdir = bb.data.getVar('S', d, True)
> # Directory we store the generic licenses as set in the distro
> configuration
> generic_directory = bb.data.getVar('COMMON_LICENSE_DIR', d, True)
> + bb.warn(generic_directory)
> + try:
> + bb.mkdirhier(destdir)
> + except:
> + pass
> +
> if not generic_directory:
> raise bb.build.FuncFailed("COMMON_LICENSE_DIR is unset. Please set this
> in your distro config")
>
> @@ -51,45 +155,18 @@ python do_populate_lic() {
> if ret is False or ret == 0:
> bb.warn("%s could not be copied for some reason. It may not exist. WARN
> for now." % srclicfile)
>
> - # This takes some explaining.... we now are going to go an try to symlink
> - # to a generic file. But, with the way LICENSE works, a package can
> have multiple
> - # licenses. Some of them are, for example, GPLv2+, which means it can
> use that version
> - # of GPLv2 specified in it's license, or a later version of GPLv2. For
> the purposes of
> - # what we're doing here, we really don't track license revisions
> (although we may want to)
> - # So, we strip out the + and link to a generic GPLv2
> - #
> - # That said, there are some entries into LICENSE that either have no
> generic (bzip, zlib, ICS)
> - # or the LICENSE is messy (Apache 2.0 .... when they mean Apache-2.0).
> This should be corrected
> - # but it's outside of scope for this.
> - #
> - # Also, you get some clever license fields with logic in the field.
> - # I'm sure someone has written a logic parser for these fields, but if
> so, I don't know where it is.
> - # So what I do is just link to every license mentioned in the license
> field.
> + gen_lic_dest = os.path.join(bb.data.getVar('LICENSE_DIRECTORY', d,
> True), "common-licenses")
>
> - for license_type in ((license_types.replace('+', '').replace('|', '&')
> - .replace('(', '').replace(')', '').replace(';', '')
> - .replace(',', '').replace(" ", "").split("&"))):
> - if os.path.isfile(os.path.join(generic_directory, license_type)):
> - gen_lic_dest = os.path.join(bb.data.getVar('LICENSE_DIRECTORY', d,
> True), "common-licenses")
> - try:
> - bb.mkdirhier(gen_lic_dest)
> - except:
> - pass
> -
> - try:
> - bb.copyfile(os.path.join(generic_directory, license_type),
> os.path.join(gen_lic_dest, license_type))
> - except:
> - bb.warn("%s: No generic license file exists for: %s at %s" % (pn,
> license_type, generic_directory))
> - pass
> - try:
> - os.symlink(os.path.join(gen_lic_dest, license_type),
> os.path.join(destdir, "generic_" + license_type))
> - except:
> - bb.warn("%s: No generic license file exists for: %s at %s" % (pn,
> license_type, generic_directory))
> - pass
> + clean_licenses = ""
> + for x in license_types.replace("(", " ( ").replace(")", " ) ").split():
> + if ((x != "(") and (x != ")") and (x != "&") and (x != "|")):
> + clean_licenses += "'" + x + "'"
> else:
> - bb.warn("%s: Something went wrong with copying: %s to %s" % (pn,
> license_type, generic_directory))
> - bb.warn("This could be either because we do not have a generic for
> this license or the LICENSE field is incorrect")
> - pass
> + clean_licenses += " " + x + " "
> +
> + node = ast.parse(clean_licenses)
> + v = LicenseVisitor()
> + v.visit(node)
> }
>
> SSTATETASKS += "do_populate_lic"
> @@ -102,4 +179,3 @@ python do_populate_lic_setscene () {
> }
> addtask do_populate_lic_setscene
>
> -



