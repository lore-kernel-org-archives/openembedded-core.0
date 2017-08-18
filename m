Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9948178443
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 18:07:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7II7pB7026250
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Aug 2017 11:07:51 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 18 Aug 2017 11:07:50 -0700
To: Andre McCurdy <armccurdy@gmail.com>, Mark Asselstine
	<mark.asselstine@windriver.com>
References: <1503071067-15104-1-git-send-email-mark.asselstine@windriver.com>
	<CAJ86T=Wz--m+US0Xf5pvOGMuG5FV5XtD1XTdUZerR_LXHfUmOg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <90867196-11da-4451-643c-c17c55a0d520@windriver.com>
Date: Fri, 18 Aug 2017 13:07:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Wz--m+US0Xf5pvOGMuG5FV5XtD1XTdUZerR_LXHfUmOg@mail.gmail.com>
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
X-List-Received-Date: Fri, 18 Aug 2017 18:07:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/18/17 12:58 PM, Andre McCurdy wrote:
> On Fri, Aug 18, 2017 at 8:44 AM, Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
>> This is a new class which can be used (for example via USER_CLASSES in
>> local.conf) to make your build more development friendly. When
>> included this class will create symlinks to the various bb and
>> bbappend files in WORKDIR.
>>
>> Normally when you are debugging or extending a package's recipe files
>> a developer will employ one of a few indirect techniques to determine
>> where bb and bbappends files associated with a recipe exist. For
>> example they might use bitbake-layers show-recipes or similar, or
>> simply rely on their experience to guide them. Even after working with
>> openembedded for serveral years now I find these techniques tedious
>> and time consuming, and sometimes even hit and miss.
>>
>> Since the whereabouts of these files are already stored in various
>> files at parse time we can create symlinks to simplify the task of
>> finding these files, making them available in WORKDIR for easy
>> inpsection and in a convenient location if using devshel for instance.
>>
>> For now this work is completely optional but we could conceivable make
>> this the default behavior if folks find it is convenient and the cost
>> of performing these operations across all builds is minimal enough.
>>
>> recipe_links can safely be added to USER_CLASSES for existing builds,
>> care has been taken to avoid this action causing anything to be
>> rebuilt. After this has been added you can either 'bitbake <recipe> -C
>> unpack' or 'bitbake <recipe> -c create_recipe_links' to cause the
>> links to be created in the WORKDIR for the specified recipe.
>>
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> ---
>>  meta/classes/recipe_links.bbclass | 79 +++++++++++++++++++++++++++++++++++++++
>>  meta/conf/documentation.conf      |  1 +
>>  2 files changed, 80 insertions(+)
>>  create mode 100644 meta/classes/recipe_links.bbclass
>>
>> diff --git a/meta/classes/recipe_links.bbclass b/meta/classes/recipe_links.bbclass
>> new file mode 100644
>> index 0000000..ea97605
>> --- /dev/null
>> +++ b/meta/classes/recipe_links.bbclass
>> @@ -0,0 +1,79 @@
>> +# Create symlink in WORKDIR to the various bb and
>> +# bbappend files used to define the package ops
>> +
>> +# Create a symlink given src and dst paths
>> +def create_link(d, src, dst):
>> +    if os.path.islink(dst):
>> +        try:
>> +            os.unlink(dst)
>> +        except OSError as err:
>> +            bb.error("  Failed to cleanup old link %s: %s"
>> +                         % (os.path.basename(dst), os.strerror(err.errno)))
>> +            return False
>> +
>> +
>> +    try:
>> +        os.symlink(src, dst)
>> +    except OSError as err:
>> +        bb.error("  Failed to create file link for %s: %s"
>> +                     % (src, os.strerror(err.errno)))
>> +        return False
>> +
>> +    return True
>> +
>> +# Ensure the work is scheduled. We do this as a func
>> +# to avoid sig changes causing things to be rebuilt
>> +# when the class is added/removed after the fact.
>> +do_unpack[postfuncs] += "create_recipe_links "
>> +do_unpack[vardepsexclude] += "create_recipe_links "
>> +python create_recipe_links() {
>> +    import re
>> +    import glob
>> +
>> +    workdir = d.getVar('WORKDIR')
>> +
>> +    # Main recipe file
>> +    bb.note("Add main recipe file link:")
>> +    bb_path = d.getVar('FILE')
>> +    bb_filename = os.path.basename(bb_path)
>> +    bb_destname = "%s/%s" % (workdir, bb_filename)
>> +    bb.note("  Linking %s" % bb_path)
>> +    if not create_link(d, bb_path, bb_destname):
>> +        return False
>> +
>> +    # Cleanup old bbappends links
>> +    bb.note("Removing old bbappend links:")
>> +    pn = d.getVar('PN')
>> +    files = glob.glob('%s/[0-9][0-9]_%s.bbappend' % (workdir,pn))
>> +    files += glob.glob('%s/[0-9][0-9]_%s_*.bbappend' % (workdir, pn))
>> +    for filename in files:
>> +        bb.note("  Removing: %s" % filename)
>> +        try:
>> +            os.unlink(filename)
>> +        except OSError as err:
>> +            bb.error("  Failed to cleanup old link %s: %s" %
>> +                         (os.path.basename(filename), os.strerror(err.errno)))
>> +            return False
>> +
>> +    # Add bbappends links
>> +    bb.note("Adding bbappend links:")
>> +    included_files = d.getVar('BBINCLUDED').split()
>> +    bbappend_re = re.compile( r".*/%s(_[^/]*)?\.bbappend$" % re.escape(pn))
>> +    for filename in included_files:
>> +        if bbappend_re.match(filename):
>> +            bb.note("  Linking %s" % filename)
>> +            destname = "00_%s" % (os.path.basename(filename))
>> +            while os.path.exists("%s/%s" % (workdir, destname)):
>> +                 destname = str(int(destname[:2]) + 1).zfill(2) + destname[2:]
>> +            if not create_link(d, filename, "%s/%s" % (workdir, destname)):
>> +                return False
>> +
>> +    return True
>> +}
>> +
>> +# In addition to the func we want to make things able to be (re)run
>> +# easily by the user so ensure it is available as a task.
>> +addtask do_create_recipe_links
> 
> Perhaps just create the symlinks unconditionally as part of
> do_devshell instead of creating an optional new task?

I rarely use the devshell, so I prefer if the links are always created as it
will make it easier to find the items (.bb and .bbappend) used to construct the
working directory.

--Mark

>> +python do_create_recipe_links() {
>> +    bb.build.exec_func("create_recipe_links", d)
>> +}
>> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
>> index a55e283..5a8a07e 100644
>> --- a/meta/conf/documentation.conf
>> +++ b/meta/conf/documentation.conf
>> @@ -23,6 +23,7 @@ do_devshell[doc] = "Starts a shell with the environment set up for development/d
>>  do_diffconfig[doc] = "Compares the old and new config files after running do_menuconfig for the kernel"
>>  do_fetch[doc] = "Fetches the source code"
>>  do_fetchall[doc] = "Fetches all remote sources required to build a target"
>> +do_create_recipe_links[doc] = "Creates links to bb and bbappend files in a package's WORKDIR"
>>  do_install[doc] = "Copies files from the compilation directory to a holding area"
>>  do_install_ptest_base[doc] = "Copies the runtime test suite files from the compilation directory to a holding area"
>>  do_kernel_checkout[doc] = "Checks out source/meta branches for a linux-yocto style kernel"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


