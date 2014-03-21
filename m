Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9566F6FA6D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 20:07:36 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id v1so2878425yhn.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 13:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=sq5F/gTQBtxBVD+9Q7HeWfoltd5nPT3D++fA4uB6u9U=;
	b=awecfjiZzqza74HdWjOuH/9U/PKHG8mugG9QLh5oQvduQwF/VUGIJ89OaLN/8eWdCe
	6JrT1U4OCTd0/MmGDEJKKvSOQyugFC7cbp7kCVAeeEw6X9hB2eRDgaus/S8eo6spS0YX
	OO27W7lfjp2cXpDmHDuD754Rq1S3Qg+xFjIPAhODXOEaOvQPnfKWCLDmWJVg11Y9HlTt
	GS2W0HEq0CBmJLrFaTSL3NqIu7gkKSfl6k6UP3n4ZKNbXUTaS+Dd+MLUxu9CqEbZI8+l
	E2qftTGUUqbIxaXva/iBkL4mMjEBtGqHPrCHvNudWin3HjlwheSzePr5P1WuQDNKeJ61
	1o4Q==
MIME-Version: 1.0
X-Received: by 10.236.7.225 with SMTP id 61mr44660934yhp.51.1395432457766;
	Fri, 21 Mar 2014 13:07:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Fri, 21 Mar 2014 13:07:37 -0700 (PDT)
In-Reply-To: <1395392266.24296.19.camel@firebird.rb.intel.com>
References: <cover.1395332218.git.stefanx.stanacar@intel.com>
	<726442aad46caaed6a069b6428692ed2e4903026.1395332218.git.stefanx.stanacar@intel.com>
	<CAP9ODKrG_3ieAdpiAOyX0bJBbQQySAEWRvT_y+VJDqjusgjzyw@mail.gmail.com>
	<1395392266.24296.19.camel@firebird.rb.intel.com>
Date: Fri, 21 Mar 2014 17:07:37 -0300
X-Google-Sender-Auth: ipMSQsUq23y0Fy4GoNsyaVkbut8
Message-ID: <CAP9ODKoHJj0MzfHX1G0MZ9bKzq7JYCTiFUBXfJGK+ks9V6BSrw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 4/4] lib/oeqa: add a test target controller for EFI targets
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
X-List-Received-Date: Fri, 21 Mar 2014 20:07:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 21, 2014 at 5:57 AM, Stanacar, StefanX
<stefanx.stanacar@intel.com> wrote:
> On Thu, 2014-03-20 at 18:08 -0300, Otavio Salvador wrote:
>> On Thu, Mar 20, 2014 at 1:29 PM, Stefan Stanacar
>> <stefanx.stanacar@intel.com> wrote:
>
>> > +        # test rootfs + kernel
>> > +        self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("IMAGE_LINK_NAME", True) + '.tar.gz')
>> > +        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE"))
>> > +        if not os.path.isfile(self.rootfs):
>> > +            # we could've checked that IMAGE_FSTYPES contains tar.gz but the config for running testimage might not be
>> > +            # the same as the config with which the image was build, ie
>> > +            # you bitbake core-image-sato with IMAGE_FSTYPES += "tar.gz"
>> > +            # and your autobuilder overwrites the config, adds the test bits and runs bitbake core-image-sato -c testimage
>> > +            bb.fatal("No rootfs found. Did you build the image ?\nIf yes, did you build it with IMAGE_FSTYPES += \"tar.gz\" ? \
>> > +                      \nExpected path: %s" % self.rootfs)
>>
>> Couldn't testimage class add it?
>>
>
> Nope... testimage task can be triggered in two ways: from
> testimage.bbclass or testimage-auto.bbclass, that means:
>   - manually: you have already built your image, then add INHERIT +=
> "testimage" in local.conf and run bitbake <image> -c testimage (the AB
> does it this way). The testimage task does not have a depends on
> do_rootfs, so it won't create a tar.gz rootfs if IMAGE_FSTYPES wasn't
> added to local.conf at build time.
>   - automatically: you add TEST_IMAGE = "1" in local.conf before bitbake
> <image>. That's a hidden inherit in image.bbclass that inherits
> testimage-auto that does depend on rootfs.
>
> We want to support both cases... So checking that tar.gz is
> IMAGE_FSTYPES doesn't mean that the image actually was built with that.
> Also, tar.gz might not be there although the image was built with that
> (The AB has two different build steps for build and running tests, and
> in between the config can be overwritten).

Ok.

>> > +        if not os.path.isfile(self.kernel):
>> > +            bb.fatal("No kernel found. Expected path: %s" % self.kernel)
>> > +
>> > +        # if the user knows what he's doing, then by all means...
>> > +        # test-rootfs.tar.gz and test-kernel are hardcoded names in other places
>> > +        # they really have to be used like that in commands though
>> > +        cmds = d.getVar("TEST_DEPLOY_CMDS", True)
>> > +        if cmds:
>> > +            self.deploy_cmds = cmds.split("\n")
>>
>> Good.
>>
>> > +        else:
>> > +            self.deploy_cmds = [
>> > +                'mount -L boot /boot',
>> > +                'mkdir -p /mnt/testrootfs',
>> > +                'mount -L testrootfs /mnt/testrootfs',
>> > +                'modprobe efivarfs',
>> > +                'mount -t efivarfs efivarfs /sys/firmware/efi/efivars',
>> > +                'cp ~/test-kernel /boot',
>> > +                'rm -rf /mnt/testrootfs/*',
>> > +                'tar xzvf ~/test-rootfs.tar.gz -C /mnt/testrootfs',
>>
>> How target see those files? NFS?
>
> Nope, see below in _deploy.
> Those files are scp'ed from the build machine to the target.
>
>       self.master.copy_to(self.rootfs, "~/test-rootfs.tar.gz")
>       self.master.copy_to(self.kernel, "~/test-kernel")
>       for cmd in self.deploy_cmds:
>             self.master.run(cmd)

What happens if the image is bigger than RAM size?

>> > +                r'printf "\x07\x00\x00\x00\x74\x00\x65\x00\x73\x00\x74\x00\x00\x00" > /sys/firmware/efi/efivars/LoaderEntryOneShot-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f'
>>
>> Can you elaborate this? Seems too 'black magic' for me.
>>
>
> Okay so one of the reasons this GenericEfi target requires that the
> master image deployed uses gummiboot is because of that.
> gummiboot actually reads and obeys system EFI variables. [1]
> One of those variables is LoaderEntryOneShot which tells it to boot a
> label (kernel  + rootfs) once and only once so this how we know that we
> always get back to the master/good image.

So it is misnamed. GummiBootEfi would be clearer.

> [1] "Some EFI variables control the loader or exported the loaders state
> to the started operating system. The vendor UUID
> 4a67b082-0a4c-41cf-b6c7-440b29bb8c4f and the variable names are supposed
> to be shared across all loaders implementations which follow this scheme
> of configuration: "
> http://freedesktop.org/wiki/Software/gummiboot/
>
>
> Accessing the EFI vars subsystem is done in two ways:
>   - old sysfs-efivars interface (CONFIG_EFI_VARS), populated
> at /sys/firmware/efi/vars, which has some limitations (basically you
> need another tool to read/write)
> - new efivarfs interface (CONFIG_EFIVAR_FS), typically mounted like
> this: mount -t efivarfs efivarfs /sys/firmware/efi/efivars
> It was added in 3.8 intended as a replacement for the sysfs-efivars
> interface, has no maximum per-variable size limitation and supports UEFI
> Secure Boot variables.
> You can read more about that at:
> http://uefidk.intel.com/blog/accessing-uefi-variables-linux#sthash.2wI28Mkn.dpuf
>
> The first four bytes are EFI_VARIABLE_NON_VOLATILE,
> EFI_VARIABLE_BOOTSERVICE_ACCESS and EFI_VARIABLE_RUNTIME_ACCESS bits set
> in the attribute bitmask, and the rest is just the output from:
> [stefans@firebird ~]$ echo -en "test" | iconv -f ascii -t utf-16le |
> hexdump -C
> 00000000  74 00 65 00 73 00 74 00                           |t.e.s.t.|
> 00000008
> [stefans@firebird ~]$

So please make those constants in the code and proper documented.

> The gummiboot loader config that gets installed with the master image
> has two labels: boot and test and this is how we tell it that for the
> next boot only we want the test label.
>
> The simplest tool to read EFI vars I've found is efivar. I've used it
> when debugging and playing with this stuff.
> There is a recipe here:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=stefans/wip2&id=3df22b8ab36553052381458314b43b76cd1d3dff

I think it would be nice for debugging so in worse case send t to meta-oe

:-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

