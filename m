Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 172796D899
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 09:38:39 +0000 (UTC)
Received: from [172.16.141.133] (172.16.141.133) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 28 Feb 2014 10:38:34 +0100
Message-ID: <53105913.6020407@enea.com>
Date: Fri, 28 Feb 2014 10:38:27 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1393532438-6852-1-git-send-email-david.c.nystrom@gmail.com>
	<4343044.DpKneM5m4P@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <4343044.DpKneM5m4P@peggleto-mobl5.ger.corp.intel.com>
X-Originating-IP: [172.16.141.133]
Subject: Re: [PATCH 1/2] do_rootfs: Added PACKAGE_FEED_URIS functionality
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
X-List-Received-Date: Fri, 28 Feb 2014 09:38:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2014-02-27 23:34, Paul Eggleton wrote:
> On Thursday 27 February 2014 21:20:37 David Nystr=F6m wrote:
>> Adding a common interface to add predefined package manager
>> channels to prebuilt rootfs:es.
>>
>> Adding PACKAGE_FEED_URIS =3D "http://myre.po/repo/, will
>> assume repo directories named (rpm,ipk,deb) as subdirectories
>> and statically add them to the rootfs, using the same PKG_ARCHs
>> as the build which produced the images.
>>
>> Tested with RPM, IPK and DEB.
>
> Looks good. The only thing that looks like it might be missing here is th=
ere
> appears to be no way to name the package repo entries individually, thoug=
h I'm
> not sure what syntax we would use to allow that.
>
> Thoughts?

Well, there is the old moblin syntax for IPK_FEED_URIS:

For qemux86-64
--
IPK_FEED_URIS =3D " \
=20
all##http://downloads.yoctoproject.org/releases/yocto/yocto-1.5/ipk/all \
=20
x86_64##http://downloads.yoctoproject.org/releases/yocto/yocto-1.5/ipk/x86_=
64=20
\
=20
core2-64##http://downloads.yoctoproject.org/releases/yocto/yocto-1.5/ipk/co=
re2-64=20
\
=20
qemux86_64##http://downloads.yoctoproject.org/releases/yocto/yocto-1.5/ipk/=
qemux86_64=20
\
--
I don't particularly agree with above format.
When using the deploy directory as input it makes the feed_syntax=20
MACHINE dependent, and difficult to keep in sync for new machines and=20
upstream changes.

IMHO, bitbake should support the same input format as it generates as=20
output format for the repos.
If someone want to share code for the post-processing of outputted=20
bitbake repos(deb,ipk,rpm), I'll happily reconsider.

Having multiple feed formats is confusing though, we should fix this so=20
we have the same format everywhere.

What could be done is to add names to the top level repos directory,
i.e. PACKAGE_FEED_URIS =3D"stable##http://myre.op/deploy/ \
			"experimental#http://not_trusted.to/ext_deploy/"

But I'm not sure what this will accomplish. The real channel names would=20
become experimental-all, stable-all instead of current hardcoded=20
url0-all, url1-all et.c.
Is this what you were suggesting ?

With smart and apt, you can prioritize channels, which the=20
implementation will do, in descending order, keeping the pkg_arch=20
inter-priorities intact.
However, for opkg, you prioritize archs rather than channels afaik.


> Cheers,
> Paul
>


