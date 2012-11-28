Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Muhammad_Shakeel@mentor.com>) id 1TdgLu-0006mU-B0
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 13:02:55 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1TdfWO-0001H0-F1 from Muhammad_Shakeel@mentor.com ;
	Wed, 28 Nov 2012 03:09:40 -0800
Received: from SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 28 Nov 2012 03:09:40 -0800
Received: from EU-MBX-04.mgc.mentorg.com ([169.254.4.64]) by
	SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) with mapi id
	14.01.0289.001; Wed, 28 Nov 2012 11:09:38 +0000
From: "Shakeel, Muhammad" <Muhammad_Shakeel@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] udev 182: Create a symlink of
	/lib/udev/udevd in /sbin
Thread-Index: AQHNzJ7JpGfa0ptP6EK4B5ZTGlUnlpf9uhCAgADMHoCAAI1PAIAAAVGw
Date: Wed, 28 Nov 2012 11:09:37 +0000
Message-ID: <A8A2F4C5E3D3D0468DDA3544476725F85BC7EE51@EU-MBX-04.mgc.mentorg.com>
References: <1354021038-26183-1-git-send-email-muhammad_shakeel@mentor.com>
	<CAP9ODKqLkqZ=AtU9SNVfXRFxs04LnsQEe-9iE0nsU34Yru2pnw@mail.gmail.com>
	<50B5763B.1040107@windriver.com>
	<CAP9ODKpyi3Hs1B8C9OovatGG2VxukWU9pdip2HMTMFjJn9FSJQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpyi3Hs1B8C9OovatGG2VxukWU9pdip2HMTMFjJn9FSJQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 28 Nov 2012 11:09:40.0336 (UTC)
	FILETIME=[DC793700:01CDCD58]
Cc: Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Wed, 28 Nov 2012 12:02:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If we ensure that udev will always be found in /lib/udev/udevd then this pa=
tch will not be required.

Actually I needed this patch to start udev on a mips64 target where ${base_=
libdir} is '/lib64' and original udev init script was failing to start udev=
.
(I am not using initramfs).

--Shakeel

-----Original Message-----
From: otavio.salvador@gmail.com [mailto:otavio.salvador@gmail.com] On Behal=
f Of Otavio Salvador
Sent: Wednesday, November 28, 2012 3:52 PM
To: ChenQi
Cc: Shakeel, Muhammad; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] udev 182: Create a symlink of /lib/udev/udev=
d in /sbin

On Wed, Nov 28, 2012 at 12:26 AM, ChenQi <Qi.Chen@windriver.com> wrote:
> On 11/27/2012 10:15 PM, Otavio Salvador wrote:
>>
>> On Tue, Nov 27, 2012 at 10:57 AM, Shakeel, Muhammad=20
>> <muhammad_shakeel@mentor.com>  wrote:
>>>
>>> From: Muhammad Shakeel<muhammad_shakeel@mentor.com>
>>>
>>>  From udev 174 changelog:
>>> "The udev daemon moved to /lib/udev/udevd. Non-systemd init systems=20
>>> and non-dracut initramfs image generators need to change the init=20
>>> scripts. Alternatively the udev build needs to move udevd back to=20
>>> /sbin or create a symlink in /sbin, which is not done by default."
>>>
>>> Also for 64 bit architectures there exists /lib64/udev instead of=20
>>> /lib/udev and current init script fails to start udev.
>>>
>>> Signed-off-by: Muhammad Shakeel<muhammad_shakeel@mentor.com>
>>
>> As far as I know, all code in master now handles it properly (the=20
>> missing bits I sent a patch today) so why to include this symlink?
>>
> I'm not sure about this.
>
> Two things:
>
> 1) Have we ever tested udev on a target where its ${base_libdir} is=20
> '/lib64'?
> Apparently, if udevd is intalled under '/lib64', its init script=20
> cannot start udev correctly.
>
> 2) Bug#2804 is related to to udev and ${base_libdir}.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2804
> (Some packages hardcode their udev rules directory to be=20
> '/lib/udev/rules.d/'. So can udev find them if the ${base_libdir} is=20
> '/lib64'? )

It seems the right fix for it is to ensure udev is always installed in /lib=
/udev/udevd (for all targets) as you propose to do for the rules.d director=
y.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


