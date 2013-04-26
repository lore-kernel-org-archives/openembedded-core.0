Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UVkC0-0000Vp-FM
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 17:04:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3QEkMB9027051
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Apr 2013 07:46:22 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Fri, 26 Apr 2013 07:46:20 -0700
Message-ID: <517A933C.4020507@windriver.com>
Date: Fri, 26 Apr 2013 09:46:20 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
References: <20130426092655.1d0ffdb2@e6520eb> <517A867E.3030708@windriver.com>
	<20130426164157.42a0226b@e6520eb>
In-Reply-To: <20130426164157.42a0226b@e6520eb>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	r3QEkMB9027051
Cc: openembedded-core@lists.openembedded.org
Subject: Re: dylan: meta-toolchain and u-boot : "cannot find -lgcc"
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
X-List-Received-Date: Fri, 26 Apr 2013 15:05:22 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 4/26/13 9:41 AM, Eric B=C3=A9nard wrote:
> Hi Mark,
>
> Le Fri, 26 Apr 2013 08:51:58 -0500,
> Mark Hatle <mark.hatle@windriver.com> a =C3=A9crit :
>> On 4/26/13 2:26 AM, Eric B=C3=A9nard wrote:
>>> this can be fixed by installing the sdk to it's standard path
>>> (/usr/local/oecore-x86_64/ in the present case).
>>>
>>> Is that an expected behaviour (as the sdk is primarly designed to bui=
ld
>>> applications) or can that be fixed during the sdk relocation ?
>>
>> When you use the SDK, you need to be sure to source the SDK environmen=
t setup.
>> Once you do that, pass to the compiler/linker the included CFLAGS and =
LDFLAGS as
>> specified in that environment file.
>
> of course I did source it (and forget to put it in the email as that
> was obvious to me, sorry).
>
>> They should end up passing at some point a --sysroot=3D... and that wi=
ll tell gcc
>> where the libraries and headers are for linking.  Without the --sysroo=
t=3D option,
>> the compiler has no choice but to look for it's original compilation d=
irectory.
>>
> true, that's why I provided the step to reproduce and said "as the
> sdk is primarly designed to build applications" and that's certainly
> why we get this problem : for linux & u-boot we can't use the LDFLAGS
> as set by the environment script else we get :
>
> for u-boot :
> arm-oe-linux-gnueabi-ld.bfd: unrecognized option '-Wl,-O1'
> so we need to pass LDFLAGS=3D"" which then leads to :
> arm-oe-linux-gnueabi-ld.bfd: cannot find -lgcc
> if and only if the sdk was relocated.
> (and I also get the error even if I add LDFLAGS=3D"
> --sysroot=3D/path_to/oecore-x86_64/sysroots/armv5te-oe-linux-gnueabi"
> so this seems specific to -lgcc)
>
> for linux :
> arm-oe-linux-gnueabi-ld: unrecognized option '-Wl,-O1'
> so here again we need to pass LDFLAGS=3D"" which leads to a successful
> build as the build is not using lgcc.

I see, it's using ld instead of gcc for linking.  AFAIK though, you reall=
y=20
shouldn't be using -lgcc in either uboot or linux for any platform.  That=
 seems=20
suspicious to me.

It's reasonable to file a bug in the Yocto Project bugzilla, but I'm not =
sure=20
what kind of resolution we'll get.

--Mark

> Eric
>



