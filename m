Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QEQYR-0002zP-K0
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:30:39 +0200
Received: by wwi18 with SMTP id 18so1574457wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:28:10 -0700 (PDT)
Received: by 10.227.140.77 with SMTP id h13mr4101588wbu.217.1303756090826;
	Mon, 25 Apr 2011 11:28:10 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	o23sm3394871wbc.61.2011.04.25.11.28.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:28:09 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DB5AB17.2060806@linux.intel.com>
Date: Mon, 25 Apr 2011 20:28:07 +0200
Message-Id: <D62ACE6C-3786-4C60-91EE-316D4EC49EB6@dominion.thruhere.net>
References: <73DFD7AC-9837-4C27-BB34-2B2AC7D1DD8B@dominion.thruhere.net>
	<4DB5AB17.2060806@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Bruce Ashfield <Bruce.Ashfield@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] don't run make clean on kernel_do_install
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
X-List-Received-Date: Mon, 25 Apr 2011 18:30:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 apr 2011, om 19:10 heeft Darren Hart het volgende geschreven:

> Hi Koen,
>=20
> On 04/23/2011 07:47 AM, Koen Kooi wrote:
>> Hi,
>>=20
>> Over the holidays I was trying to build some externel kernel modules
>> and they failed to build because linux/bounds.h wasn't in sysroots.
>>=20
>=20
>=20
> According the the linux Makefile:
>=20
> ###
> # Cleaning is done on three levels.
> # make clean     Delete most generated files
> #                Leave enough to build external modules
>=20
> The kernel Makefile should not be deleting it.
>=20
> And indeed:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D11475
>=20
> This was addressed by the following in 2.6.27:
> 7d3cc8b6d899e53222c22a78d98bb53a695f7962
> Don't clean bounds.h and asm-offsets.h
>=20
> Later, bounds.h moved as well in 2.6.33:
> 01fc0ac198eabcbf460e1ed058860a935b6c2c9a
> kbuild: move bounds.h to include/generated
>=20
>=20
> Which kernel version are you attempting to build?

The 2.6.32 kernel from TI

>=20
> We shouldn't add code to address a bug in a specific kernel version in =
a
> kernel base class. That belongs in the specific recipe. I suggest =
trying
> to add the 7d3cc8b6d899e53222c22a78d98bb53a695f7962 patch to your =
kernel
> recipe and see if that resolves the issue for you without resorting to
> recreating the clean process in the base class.

That's already in :(

=
koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x/work/beagleboard-angs=
trom-linux-gnueabi/linux-omap-psp-2.6.32-r99a+gitr5fc29e7b2a76a64a739f8578=
58ef0b98294aa155/git$ grep bound Kbuild=20
# 1) Generate bounds.h
# 2) Generate asm-offsets.h (may need bounds.h)
# 1) Generate bounds.h
bounds-file :=3D include/linux/bounds.h
always  :=3D $(bounds-file)
targets :=3D $(bounds-file) kernel/bounds.s
quiet_cmd_bounds =3D GEN     $@
define cmd_bounds
kernel/bounds.s: kernel/bounds.c FORCE
$(obj)/$(bounds-file): kernel/bounds.s Kbuild
	$(call cmd,bounds)
                                      $(obj)/$(bounds-file) FORCE
clean-files :=3D $(addprefix $(objtree)/,$(filter-out $(bounds-file) =
$(offsets-file),$(targets)))

I'll dig a bit deeper to see why bounds.h is getting cleaned.

regards,

Koen


>=20
> --
> Darren
>=20
>> I did this quick hack to work around it:
>>=20
>> --- a/meta-oe/classes/kernel.bbclass
>> +++ b/meta-oe/classes/kernel.bbclass
>> @@ -159,7 +159,8 @@ kernel_do_install() {
>>        # we clean the scripts dir while leaving the generated config
>>        # and include files.
>>        #
>> -       oe_runmake -C $kerneldir CC=3D"${KERNEL_CC}" =
LD=3D"${KERNEL_LD}" clean
>> +       find $kerneldir -name "*.o" -delete
>> +       #oe_runmake -C $kerneldir CC=3D"${KERNEL_CC}" =
LD=3D"${KERNEL_LD}"
> clean
>>        make -C $kerneldir _mrproper_scripts
>>        find $kerneldir -path $kerneldir/scripts -prune -o -name
> "*.[csS]" -exec rm '{}' \;
>>        find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
>>=20
>> I'm not convinced that the above is the right way to solve it, but I
>> lack the required kbuild knowledge to come up with a better one. Does
>> anyone have a hint on how to approach this problem in a better way?
>>=20
>> regards,
>>=20
>> Koen
>=20
> --=20
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel



