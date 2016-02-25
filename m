Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 3649E73169
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 08:19:33 +0000 (UTC)
Received: from localhost (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id D191344233E;
	Thu, 25 Feb 2016 09:19:33 +0100 (CET)
Date: Thu, 25 Feb 2016 09:19:33 +0100
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Joshua Lock <joshua.g.lock@intel.com>
Message-ID: <20160225081933.GC3868@comp-006-thk.openrnd.local>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<6372957b8304964030e874ad8e5b05b1727d7be8.1456325292.git.joshua.g.lock@intel.com>
MIME-Version: 1.0
In-Reply-To: <6372957b8304964030e874ad8e5b05b1727d7be8.1456325292.git.joshua.g.lock@intel.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/10] swupdbundle: new class to generate virtual images for swupd-image
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
X-List-Received-Date: Thu, 25 Feb 2016 08:19:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 02/24 14:52, Joshua Lock wrote:
> Our initial strategy to generate bundles for consumption by swupd
> is to generate images which contain the base image (os-core) plus
> the additional contents of the bundle, then prune out the core
> contents. By generating images in this manner we hope to accomodate
> packages which modify the rootfs outside of installing files, i.e.
> with postinsts.
>
> To that end this class, to be used via BBCLASSEXTEND, will generate
> virtual image recipes that add extra packages to the extended
> image.
>
> Only extensions matching entries in a SWUPD_BUNDLES variable are
> valid and the bundle contents should be listed in a varFlag
> matching the bundle's name on the BUNDLE_CONTENTS variable.
>
> An example of usage in an image recipe follows:
>
> SWUPD_BUNDLES = "foo bar"
> BUNDLE_CONTENTS[foo] = "foo foo-bar foobaz"
> BUNDLE_CONTENTS[bar] = "bar baz quux"
>
> BBCLASSEXTEND = "swupdbundle:foo"
>
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
>  meta/classes/swupdbundle.bbclass | 59 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 meta/classes/swupdbundle.bbclass
>
> diff --git a/meta/classes/swupdbundle.bbclass b/meta/classes/swupdbundle.bbclass
> new file mode 100644
> index 0000000..897666d
> --- /dev/null
> +++ b/meta/classes/swupdbundle.bbclass
> @@ -0,0 +1,59 @@
> +# Our initial strategy to generate bundles for consumption by swupd is to
> +# generate images which contain the base image (os-core) plus the additional
> +# contents of the bundle, then prune out the core contents. By generating
> +# images in this manner we hope to accomodate packages which modify the rootfs
> +# outside of installing files, i.e.with postinsts.
> +#
> +# To that end this class, to be used via BBCLASSEXTEND, will generate virtual
> +# image recipes that add extra packages to the extended image.
> +#
> +# Only extensions matching entries in a SWUPD_BUNDLES variable are valid and
> +# the bundle contents should be listed in a varFlag matching the bundle's name
> +# on the BUNDLE_CONTENTS variable. i.e in foo-image.bb:
> +#
> +# SWUPD_BUNDLES = "foo bar"
> +# BUNDLE_CONTENTS[foo] = "foo foo-bar foobaz"
> +# BUNDLE_CONTENTS[bar] = "bar baz quux"
> +# BBCLASSEXTEND = "swupdbundle:foo"
> +
> +python swupdbundle_virtclass_handler () {
> +    pn = e.data.getVar("PN", True)
> +    cls = e.data.getVar("BBEXTENDCURR", True)
> +    bundle = e.data.getVar("BBEXTENDVARIANT", True)
> +
> +    if cls != 'swupdbundle':
> +        return
> +
> +    if not bundle:
> +        bb.fatal('swupdbundle must be used with a parameter i.e. BBCLASSEXTEND="swupdbundle:foo"')
> +
> +    # Rename the virtual recipe to create the desired image bundle variant.
> +    e.data.setVar("PN_BASE", pn)
> +    pn = pn + '-' + bundle
> +    e.data.setVar("PN", pn)
> +    e.data.setVar("BUNDLE_NAME", bundle)
> +
> +    bundles = (e.data.getVar('SWUPD_BUNDLES', True) or "").split()
> +    if not bundles:
> +        bb.fatal('SWUPD_BUNDLES is not defined, this variable should list bundles for the image.')
> +
> +    curr_install = (e.data.getVar('IMAGE_INSTALL', True) or "").split()
> +
> +    def get_bundle_contents(bndl):
> +        contents = e.data.getVarFlag('BUNDLE_CONTENTS', bndl, True)
> +        if contents:
> +            return contents.split()
> +        else:
> +            bb.fatal('BUNDLE_CONTENTS[%s] is not set, this should list the packages to be included in the bundle.' % bndl)
> +
> +    if bundle == 'mega':
> +        for bndl in bundles:
> +            curr_install += get_bundle_contents(bndl)

Bundle named 'mega' seems to be very specific (a bundle of bundles) but
is not documented as a reserved name.

> +    else:
> +        curr_install += get_bundle_contents(bundle)
> +
> +    e.data.setVar('IMAGE_INSTALL', ' '.join(curr_install))
> +}
> +
> +addhandler swupdbundle_virtclass_handler
> +swupdbundle_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
Maciej Borzęcki
Senior Software Developer at Open-RnD Sp. z o.o., Poland

