Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9C99F77BE0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 17:58:30 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r77so4989177wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 10:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6jvY3cdlL/ryaqGvYWCXxLp7t2L+323HcL2TP+1Eq6k=;
	b=lz6TN3jWDGfUm2BYjOkfghzHjUKjFvJtJO+oGINmsJv+nK46UOfF7k8m12ByQ0SkNl
	OTX9IlVDgx8/aGKT9YKbXUrNBhx+VKwJyiPiMw7FCeNn91fn9E2aYZYA+bUjACRh3oDx
	/nhMhvqSPJaa6rRvW7HekiCjZw5q7W0j/WMcTYXVYEAS3kLUGY2xASgq3KtNk4xNjo5q
	be6WZZsP1yHrvstQjlh0FSfkAMxuzSnAKPDQXqDuIqIiIei+FjzXIlTMR2gG1xeLTe45
	sgjwd5Zy/jnQkWmCI7lfcg3yQth73CRM8hBQBeLX4jYhD8eLLURro+BqVK2ZStVB62W+
	pWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6jvY3cdlL/ryaqGvYWCXxLp7t2L+323HcL2TP+1Eq6k=;
	b=N/V+cQD7Zd1maDN1lkLbAndz08iAhm68JeV+tvD8w6Teiywkb4noJmjVTSknZpuhJN
	kIa2c43jCqaMl20u8K9mO/2jZ0DbwZNhm4sqBAww9URJecxvDK12J+WGVwF+QmT/kVUA
	dBOvcsblqTMekWCXLwiCPsSmDpkesEYhvWpbQwJE9NN2nVHQvjAPGlBAgHvAnE0eqwl9
	SzSbUBFggnnobT5klBc5wNqtTMc0yCuFIc/oHZjcoVhdIHKVu1A7q7LKbdq2I92nHfKO
	qKpl037rYiu0sVUKD2HmIn/swQKNdcAhCEuodaDrlmgRTDlNGVJpiPOmdN/wnwjyJw2D
	6CRw==
X-Gm-Message-State: AHYfb5ioD9r2nvjjiEbe/XWZgJM20iG0wtRa4eZ0qJN9/P3L8pZCYnfB
	pyw0VCipVY2eR2P37OzKklf/cnvY2w==
X-Received: by 10.28.38.133 with SMTP id m127mr1790129wmm.6.1503079111421;
	Fri, 18 Aug 2017 10:58:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.169.70 with HTTP; Fri, 18 Aug 2017 10:58:30 -0700 (PDT)
In-Reply-To: <1503071067-15104-1-git-send-email-mark.asselstine@windriver.com>
References: <1503071067-15104-1-git-send-email-mark.asselstine@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 18 Aug 2017 10:58:30 -0700
Message-ID: <CAJ86T=Wz--m+US0Xf5pvOGMuG5FV5XtD1XTdUZerR_LXHfUmOg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] recipe_links.bbclass: introduction
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
X-List-Received-Date: Fri, 18 Aug 2017 17:58:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 18, 2017 at 8:44 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> This is a new class which can be used (for example via USER_CLASSES in
> local.conf) to make your build more development friendly. When
> included this class will create symlinks to the various bb and
> bbappend files in WORKDIR.
>
> Normally when you are debugging or extending a package's recipe files
> a developer will employ one of a few indirect techniques to determine
> where bb and bbappends files associated with a recipe exist. For
> example they might use bitbake-layers show-recipes or similar, or
> simply rely on their experience to guide them. Even after working with
> openembedded for serveral years now I find these techniques tedious
> and time consuming, and sometimes even hit and miss.
>
> Since the whereabouts of these files are already stored in various
> files at parse time we can create symlinks to simplify the task of
> finding these files, making them available in WORKDIR for easy
> inpsection and in a convenient location if using devshel for instance.
>
> For now this work is completely optional but we could conceivable make
> this the default behavior if folks find it is convenient and the cost
> of performing these operations across all builds is minimal enough.
>
> recipe_links can safely be added to USER_CLASSES for existing builds,
> care has been taken to avoid this action causing anything to be
> rebuilt. After this has been added you can either 'bitbake <recipe> -C
> unpack' or 'bitbake <recipe> -c create_recipe_links' to cause the
> links to be created in the WORKDIR for the specified recipe.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta/classes/recipe_links.bbclass | 79 +++++++++++++++++++++++++++++++++++++++
>  meta/conf/documentation.conf      |  1 +
>  2 files changed, 80 insertions(+)
>  create mode 100644 meta/classes/recipe_links.bbclass
>
> diff --git a/meta/classes/recipe_links.bbclass b/meta/classes/recipe_links.bbclass
> new file mode 100644
> index 0000000..ea97605
> --- /dev/null
> +++ b/meta/classes/recipe_links.bbclass
> @@ -0,0 +1,79 @@
> +# Create symlink in WORKDIR to the various bb and
> +# bbappend files used to define the package ops
> +
> +# Create a symlink given src and dst paths
> +def create_link(d, src, dst):
> +    if os.path.islink(dst):
> +        try:
> +            os.unlink(dst)
> +        except OSError as err:
> +            bb.error("  Failed to cleanup old link %s: %s"
> +                         % (os.path.basename(dst), os.strerror(err.errno)))
> +            return False
> +
> +
> +    try:
> +        os.symlink(src, dst)
> +    except OSError as err:
> +        bb.error("  Failed to create file link for %s: %s"
> +                     % (src, os.strerror(err.errno)))
> +        return False
> +
> +    return True
> +
> +# Ensure the work is scheduled. We do this as a func
> +# to avoid sig changes causing things to be rebuilt
> +# when the class is added/removed after the fact.
> +do_unpack[postfuncs] += "create_recipe_links "
> +do_unpack[vardepsexclude] += "create_recipe_links "
> +python create_recipe_links() {
> +    import re
> +    import glob
> +
> +    workdir = d.getVar('WORKDIR')
> +
> +    # Main recipe file
> +    bb.note("Add main recipe file link:")
> +    bb_path = d.getVar('FILE')
> +    bb_filename = os.path.basename(bb_path)
> +    bb_destname = "%s/%s" % (workdir, bb_filename)
> +    bb.note("  Linking %s" % bb_path)
> +    if not create_link(d, bb_path, bb_destname):
> +        return False
> +
> +    # Cleanup old bbappends links
> +    bb.note("Removing old bbappend links:")
> +    pn = d.getVar('PN')
> +    files = glob.glob('%s/[0-9][0-9]_%s.bbappend' % (workdir,pn))
> +    files += glob.glob('%s/[0-9][0-9]_%s_*.bbappend' % (workdir, pn))
> +    for filename in files:
> +        bb.note("  Removing: %s" % filename)
> +        try:
> +            os.unlink(filename)
> +        except OSError as err:
> +            bb.error("  Failed to cleanup old link %s: %s" %
> +                         (os.path.basename(filename), os.strerror(err.errno)))
> +            return False
> +
> +    # Add bbappends links
> +    bb.note("Adding bbappend links:")
> +    included_files = d.getVar('BBINCLUDED').split()
> +    bbappend_re = re.compile( r".*/%s(_[^/]*)?\.bbappend$" % re.escape(pn))
> +    for filename in included_files:
> +        if bbappend_re.match(filename):
> +            bb.note("  Linking %s" % filename)
> +            destname = "00_%s" % (os.path.basename(filename))
> +            while os.path.exists("%s/%s" % (workdir, destname)):
> +                 destname = str(int(destname[:2]) + 1).zfill(2) + destname[2:]
> +            if not create_link(d, filename, "%s/%s" % (workdir, destname)):
> +                return False
> +
> +    return True
> +}
> +
> +# In addition to the func we want to make things able to be (re)run
> +# easily by the user so ensure it is available as a task.
> +addtask do_create_recipe_links

Perhaps just create the symlinks unconditionally as part of
do_devshell instead of creating an optional new task?

> +python do_create_recipe_links() {
> +    bb.build.exec_func("create_recipe_links", d)
> +}
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index a55e283..5a8a07e 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -23,6 +23,7 @@ do_devshell[doc] = "Starts a shell with the environment set up for development/d
>  do_diffconfig[doc] = "Compares the old and new config files after running do_menuconfig for the kernel"
>  do_fetch[doc] = "Fetches the source code"
>  do_fetchall[doc] = "Fetches all remote sources required to build a target"
> +do_create_recipe_links[doc] = "Creates links to bb and bbappend files in a package's WORKDIR"
>  do_install[doc] = "Copies files from the compilation directory to a holding area"
>  do_install_ptest_base[doc] = "Copies the runtime test suite files from the compilation directory to a holding area"
>  do_kernel_checkout[doc] = "Checks out source/meta branches for a linux-yocto style kernel"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

