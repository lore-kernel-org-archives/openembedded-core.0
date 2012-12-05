Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Muhammad_Shakeel@mentor.com>) id 1TgFIj-0003ga-8j
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 14:46:14 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1TgF4g-000187-MA from Muhammad_Shakeel@mentor.com ;
	Wed, 05 Dec 2012 05:31:42 -0800
Received: from SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 5 Dec 2012 05:31:42 -0800
Received: from EU-MBX-04.mgc.mentorg.com ([169.254.4.64]) by
	SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) with mapi id
	14.01.0289.001; Wed, 5 Dec 2012 13:31:41 +0000
From: "Shakeel, Muhammad" <Muhammad_Shakeel@mentor.com>
To: ChenQi <Qi.Chen@windriver.com>
Thread-Topic: [OE-core] [PATCH] udev 182: Create a symlink of
	/lib/udev/udevd in /sbin
Thread-Index: AQHNzJ7JpGfa0ptP6EK4B5ZTGlUnlpf9uhCAgADMHoCAAI1PAIAAAVGwgALSFgCACD9P4A==
Date: Wed, 5 Dec 2012 13:31:40 +0000
Message-ID: <A8A2F4C5E3D3D0468DDA3544476725F85BC803E4@EU-MBX-04.mgc.mentorg.com>
References: <1354021038-26183-1-git-send-email-muhammad_shakeel@mentor.com>
	<CAP9ODKqLkqZ=AtU9SNVfXRFxs04LnsQEe-9iE0nsU34Yru2pnw@mail.gmail.com>
	<50B5763B.1040107@windriver.com>
	<CAP9ODKpyi3Hs1B8C9OovatGG2VxukWU9pdip2HMTMFjJn9FSJQ@mail.gmail.com>
	<A8A2F4C5E3D3D0468DDA3544476725F85BC7EE51@EU-MBX-04.mgc.mentorg.com>
	<50B84B9A.5020502@windriver.com>
In-Reply-To: <50B84B9A.5020502@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 05 Dec 2012 13:31:42.0463 (UTC)
	FILETIME=[DCF2D8F0:01CDD2EC]
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev 182: Create a symlink of /lib/udev/udevd in /sbin
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 13:46:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Chen Qi,

Seems like baselib is getting value from here:
baselib =3D "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) =
or 'INVALID'), True) or 'lib'}"

In your conf file, tune-mips64.inc requires arch-mips.inc which sets:

DEFAULTTUNE ?=3D "mips"
and then:
BASE_LIB_tune-mips =3D "lib"

This seems to be the reason that why you get /lib in 'baselib' even for mip=
s64 arch.

I have a modified conf file which sets 'DEFAULTTUNE" to 'mips64'  explicitl=
y.

DEFAULTTUNE=3D"mips64"

And arch-mips.inc has:
BASE_LIB_tune-mips64 =3D "lib64"

I am sure if you modify DEFAULTTUNE in your conf file then you will get /li=
b64 in baselib.

(Sorry for replying late as I forgot to flag this conversation.)

Regards,
Shakeel

-----Original Message-----
From: ChenQi [mailto:Qi.Chen@windriver.com]=20
Sent: Friday, November 30, 2012 11:01 AM
To: Shakeel, Muhammad
Cc: openembedded-core@lists.openembedded.org; Otavio Salvador
Subject: Re: [OE-core] [PATCH] udev 182: Create a symlink of /lib/udev/udev=
d in /sbin

On 11/28/2012 07:09 PM, Shakeel, Muhammad wrote:
> If we ensure that udev will always be found in /lib/udev/udevd then this =
patch will not be required.
>
> Actually I needed this patch to start udev on a mips64 target where ${bas=
e_libdir} is '/lib64' and original udev init script was failing to start ud=
ev.
> (I am not using initramfs).
>
> --Shakeel
Hi Muhammad,

I'm somewhat confused by this 'baselib' problem. I just built udev on a tes=
t machine which has mips64 arch. But it turned out that its baselib was '/l=
ib' instead of '/lib64'.

How did you get '/lib64' on a mips64 target?

My test machine's conf file is:
"
require conf/machine/include/tune-mips64.inc

KERNEL_IMAGETYPE =3D "vmlinux"
KERNEL_ALT_IMAGETYPE =3D "vmlinux.bin"

SERIAL_CONSOLE =3D "115200 ttyS0"

MACHINE_EXTRA_RRECOMMENDS =3D " kernel-modules"
"

Besides, I tried it on x86-64.  As long as we don't explicitly specify mult=
ilib (lib64) for udev, it defaults to '/lib'.

I seems that the baselib defaults to '/lib64' only when the target has
powerpc64 arch.

Could you please give me some more information to help me?

Thanks,
Chen Qi

> -----Original Message-----
> From: otavio.salvador@gmail.com [mailto:otavio.salvador@gmail.com] On=20
> Behalf Of Otavio Salvador
> Sent: Wednesday, November 28, 2012 3:52 PM
> To: ChenQi
> Cc: Shakeel, Muhammad; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] udev 182: Create a symlink of=20
> /lib/udev/udevd in /sbin
>
> On Wed, Nov 28, 2012 at 12:26 AM, ChenQi<Qi.Chen@windriver.com>  wrote:
>> On 11/27/2012 10:15 PM, Otavio Salvador wrote:
>>> On Tue, Nov 27, 2012 at 10:57 AM, Shakeel, Muhammad
>>> <muhammad_shakeel@mentor.com>   wrote:
>>>> From: Muhammad Shakeel<muhammad_shakeel@mentor.com>
>>>>
>>>>    From udev 174 changelog:
>>>> "The udev daemon moved to /lib/udev/udevd. Non-systemd init systems=20
>>>> and non-dracut initramfs image generators need to change the init=20
>>>> scripts. Alternatively the udev build needs to move udevd back to=20
>>>> /sbin or create a symlink in /sbin, which is not done by default."
>>>>
>>>> Also for 64 bit architectures there exists /lib64/udev instead of=20
>>>> /lib/udev and current init script fails to start udev.
>>>>
>>>> Signed-off-by: Muhammad Shakeel<muhammad_shakeel@mentor.com>
>>> As far as I know, all code in master now handles it properly (the=20
>>> missing bits I sent a patch today) so why to include this symlink?
>>>
>> I'm not sure about this.
>>
>> Two things:
>>
>> 1) Have we ever tested udev on a target where its ${base_libdir} is=20
>> '/lib64'?
>> Apparently, if udevd is intalled under '/lib64', its init script=20
>> cannot start udev correctly.
>>
>> 2) Bug#2804 is related to to udev and ${base_libdir}.
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2804
>> (Some packages hardcode their udev rules directory to be=20
>> '/lib/udev/rules.d/'. So can udev find them if the ${base_libdir} is=20
>> '/lib64'? )
> It seems the right fix for it is to ensure udev is always installed in /l=
ib/udev/udevd (for all targets) as you propose to do for the rules.d direct=
ory.
>



