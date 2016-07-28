Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 805AF6072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 20:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6SKglQ2024885; Thu, 28 Jul 2016 21:42:47 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HdjxHUCZNuvK; Thu, 28 Jul 2016 21:42:47 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6SKgip6024882
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 28 Jul 2016 21:42:46 +0100
Message-ID: <1469738564.9142.17.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	openembedded-core@lists.openembedded.org, Patrick Ohly
	<patrick.ohly@intel.com>
Date: Thu, 28 Jul 2016 21:42:44 +0100
In-Reply-To: <0dacdf96b1ac7c9c2bcd0071a0b8d88fcc6231d5.1469623667.git.ed.bartosh@linux.intel.com>
References: <cover.1469623667.git.ed.bartosh@linux.intel.com>
	<0dacdf96b1ac7c9c2bcd0071a0b8d88fcc6231d5.1469623667.git.ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v4 1/4] image.bbclass: fix dependency calculation when using conversion chaining
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
X-List-Received-Date: Thu, 28 Jul 2016 20:42:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-07-27 at 15:51 +0300, Ed Bartosh wrote:
> From: Patrick Ohly <patrick.ohly@intel.com>
> 
> When using conversion chaining (for example example: .dsk.vdi.xz),
> the imagetypes_getdepends() did not properly detect all compression
> commands (thus skipping the corresponding COMPRESS_DEPENDS) and
> the base type, leading to missing dependencies of the image's
> do_rootfs
> task.
> 
> This is not a big problem in practice because in those cases where
> conversion chaining is useful (as in the example above), the missing
> dependency is qemu-native, which typically gets built anyway.
> 
> imagetypes_getdepends() had hard-coded special treatment for certain
> image types. This gets replaced with setting the normal IMAGE_DEPENDS
> variables for these types.
> 
> [YOCTO #9076]
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

This patch has come in multiple times and each time I look at it I ask
that it be checked against changes that happened in parallel since I
believe there is something "not right" in the merge. Its not an easy
one to review as it makes several different kinds of changes.

I just spent a while comparing the changes and it removes the reference
to IMAGE_FSTYPES_DEBUGFS so I do believe this patch *does* cause at
least one regression. Whether there are other issues its really hard to
say.

Can someone try and perhaps make the diff more obvious and split it up?

Cheers,

Richard



> ---
>  meta/classes/image.bbclass       | 19 ++-----------
>  meta/classes/image_types.bbclass | 60 ++++++++++++++++++++++++++++--
> ----------
>  2 files changed, 45 insertions(+), 34 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index af789f4..a3f48fa 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -143,7 +143,7 @@ IMAGE_TYPE_vm = '${@bb.utils.contains_any("IMAGE_
> FSTYPES", ["vmdk", "vdi", "qcow
>  inherit ${IMAGE_TYPE_vm}
>  
>  python () {
> -    deps = " " + imagetypes_getdepends(d)
> +    deps = " " + image_getdepends(d)
>      d.appendVarFlag('do_rootfs', 'depends', deps)
>  
>      deps = ""
> @@ -354,19 +354,6 @@ python () {
>      ctypes = set(d.getVar('COMPRESSIONTYPES', True).split())
>      old_overrides = d.getVar('OVERRIDES', 0)
>  
> -    def _image_base_type(type):
> -        basetype = type
> -        for ctype in ctypes:
> -            if type.endswith("." + ctype):
> -                basetype = type[:-len("." + ctype)]
> -                break
> -
> -        if basetype != type:
> -            # New base type itself might be generated by a
> conversion command.
> -            basetype = _image_base_type(basetype)
> -
> -        return basetype
> -
>      basetypes = {}
>      alltypes = d.getVar('IMAGE_FSTYPES', True).split()
>      typedeps = {}
> @@ -377,7 +364,7 @@ python () {
>              alltypes.append("debugfs_" + t)
>  
>      def _add_type(t):
> -        baset = _image_base_type(t)
> +        baset = image_split_type(t, ctypes)[0]
>          input_t = t
>          if baset not in basetypes:
>              basetypes[baset]= []
> @@ -396,7 +383,7 @@ python () {
>              if dep not in alltypes:
>                  alltypes.append(dep)
>              _add_type(dep)
> -            basedep = _image_base_type(dep)
> +            basedep = image_split_type(dep, ctypes)[0]
>              typedeps[baset].add(basedep)
>  
>          if baset != input_t:
> diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> index 2b97397..c24df8f 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -9,30 +9,47 @@ IMAGE_NAME_SUFFIX ??= ".rootfs"
>  # set this value to 2048 (2MiB alignment).
>  IMAGE_ROOTFS_ALIGNMENT ?= "1"
>  
> -def imagetypes_getdepends(d):
> -    def adddep(depstr, deps):
> -        for d in (depstr or "").split():
> -            # Add task dependency if not already present
> -            if ":" not in d:
> -                d += ":do_populate_sysroot"
> -            deps.add(d)
> +def image_split_type(type, allctypes):
> +    '''Returns (basetype, set of compression types in use).'''
> +    basetype = type
> +    compressiontypes = set()
> +    for ctype in allctypes:
> +        if type.endswith("." + ctype):
> +             basetype = type[:-len("." + ctype)]
> +             compressiontypes.add(ctype)
> +             break
>  
> -    fstypes = set((d.getVar('IMAGE_FSTYPES', True) or "").split())
> -    fstypes |= set((d.getVar('IMAGE_FSTYPES_DEBUGFS', True) or
> "").split())
> +    if basetype != type:
> +        # New base type itself might be generated by a conversion
> command.
> +        basetype, newctypes = image_split_type(basetype, allctypes)
> +        compressiontypes.update(newctypes)
>  
> -    deps = set()
> -    for typestring in fstypes:
> -        types = typestring.split(".")
> -        basetype, resttypes = types[0], types[1:]
> +    return (basetype, compressiontypes)
>  
> -        adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype, True) , deps)
> +
> +def image_getdepends(d):
> +    def adddep(depstr, deps):
> +        # It is not an error if the dependency was not set,
> +        # simply do nothing in that case.
> +        for i in (depstr or "").split():
> +            if i not in deps:
> +                deps.append(i)
> +
> +    deps = []
> +    ctypes = set(d.getVar('COMPRESSIONTYPES', True).split())
> +    for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
> +        basetype, compressiontypes = image_split_type(type, ctypes)
> +        for ctype in compressiontypes:
> +            adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype, True),
> deps)
>          for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype,
> True) or "").split():
>              adddep(d.getVar('IMAGE_DEPENDS_%s' % typedepends, True)
> , deps)
> -        for ctype in resttypes:
> -            adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype, True),
> deps)
> +        adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype, True) , deps)
> +
> +    depstr = ""
> +    for dep in deps:
> +        depstr += " " + dep + ":do_populate_sysroot"
> +    return depstr
>  
> -    # Sort the set so that ordering is consistant
> -    return " ".join(sorted(deps))
>  
>  XZ_COMPRESSION_LEVEL ?= "-3"
>  XZ_INTEGRITY_CHECK ?= "crc32"
> @@ -294,6 +311,13 @@ IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>  IMAGE_DEPENDS_multiubi = "mtd-utils-native"
>  IMAGE_DEPENDS_wic = "parted-native"
>  
> +# Same dependencies as in ext4. image_getdepends() shouldn't
> +# have to hard-code this, so just define it normally in
> +# variables.
> +IMAGE_DEPENDS_live = "${IMAGE_DEPENDS_ext4}"
> +IMAGE_DEPENDS_iso = "${IMAGE_DEPENDS_ext4}"
> +IMAGE_DEPENDS_hddimg = "${IMAGE_DEPENDS_ext4}"
> +
>  # This variable is available to request which values are suitable
> for IMAGE_FSTYPES
>  IMAGE_TYPES = " \
>      jffs2 jffs2.sum \
> -- 
> 2.1.4
> 

