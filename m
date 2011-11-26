Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RUHct-0002Bs-Ov
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Nov 2011 13:45:04 +0100
Received: from [192.168.2.8] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 9C761A6731;
	Sat, 26 Nov 2011 13:38:25 +0100 (CET)
Message-ID: <4ED0DDBF.9000104@eukrea.com>
Date: Sat, 26 Nov 2011 13:38:23 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4ED0CC76.4040606@emagii.com>
In-Reply-To: <4ED0CC76.4040606@emagii.com>
Cc: ulf@emagii.com
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Sat, 26 Nov 2011 12:45:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

Le 26/11/2011 12:24, Ulf Samuelsson a =E9crit :
> 3. When I ran into this problem, I exited with ctrl-C.
> This left some recipes in the middle of a fetch ,and the build could no=
t
> continue.
> I had to "bitbake -c clean <package>" on all problematic packages to re=
cover.
> Seems a little bit fragile to me.
>
already met here : you must let bitbake end the other tasks already start=
ed to=20
prevent that (so only one control C).

> 4. linux-3.0 recipe in meta-ti does not build (On Ubuntu 11.10 x64).
> Fails in the fetch stage.
> I removed the layer, since it was not needed for qemuarm.
>
I also met this kind of problem. To prevent that problem, in my bsp overl=
ay, I=20
always add COMPATIBLE_MACHINE =3D "" to the machine specific recipes.
What is strange is that meta-ti also have this in its recipes so their=20
linux-3.0 recipe should not be used if you target qemuarm.

> 5. When compiling on a Ubuntu 11.10 x64 host (linux 3.x host)
> tiff won't build.
> Did:
> bitbake console-image"
> bitbake -c clean tiff
> bitbake tiff
> - No luck
> Reading through the mailing list, I found someone which deleted
> $TMPDIR and then
> bitbake tiff
> bitbake console-image
> That worked for me as well once, second time, same problem.
> Problem is that #include <iostream> fails.
>
> I noted that "iostream" is built and available in <sysroot>/usr/include=
/c++
> On the host, it is located in /usr/incolude/c++/<version>
> "tiff" build seems to be OK with Ubuntu 11.04 i686.
>
what is your BB_NUMBER_THREADS setting ?
Here (on 2 different hosts/distro/arch but with an i7 CPU in both cases) =
if I=20
set it over 4, I often (always with a value of 8) meet problems with c++=20
includes during build from scratch. 4 seems the magic value which never=20
trigger the problem.

Eric


