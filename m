Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RQPa5-0000Vf-WB
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 21:26:10 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 5B6AD1100182
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 21:19:45 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 5070211000B0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 21:19:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225166078.adsl.alicedsl.de
	[92.225.166.78]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 21:19:42 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 867B93C49D; Tue, 15 Nov 2011 21:19:41 +0100 (CET)
Date: Tue, 15 Nov 2011 21:19:41 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111115201941.GA3773@rhein.zuhause.netz>
References: <4EC24711.2010805@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4EC24711.2010805@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Reproducible build problem with BB_NUMBER_THREADS=8
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
X-List-Received-Date: Tue, 15 Nov 2011 20:26:10 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 15, 2011 at 12:03:45PM +0100, Eric B=E9nard wrote:
> Hi,
>=20
> I often meet a problem related to C++ headers which are not found
> (despite existing)n often when bitbake starts compiling mysql &
> directfb.
> I tested on 2 build hosts (both with Core i7, one i686 ubuntu, one
> x64_64 Fedora) and manage to reproduce the problem easily with
> BB_NUMBER_THREADS=3D8 in both cases.
>=20
> The configuration is quite simple :
> angstrom setup script + beagleboard machine + bitbake qt4e-demo-image
> with
> PARALLEL_MAKE     =3D "-j6"
> BB_NUMBER_THREADS =3D "8"

Hi Eric,

I found another problem with the crosscompiler setup and c++,
while compile llvm with cmake.

In recipes-devtools/gcc/gcc-configure-cross.inc we set

EXTRA_OECONF_PATHS =3D "--with-local-prefix=3D${STAGING_DIR_TARGET}${targ=
et_exec_prefix} \
                      --with-gxx-include-dir=3D${target_includedir}/c++ \
                       --with-sysroot=3D${STAGING_DIR_TARGET} \
                       --with-build-sysroot=3D${STAGING_DIR_TARGET}"


which results in a headersearch path for c++

 .../usr/usr/include/c++

unfornatly I do not have the time to test it some more. But this little p=
atch plus INC bumping
sovled it for my setup:

-EXTRA_OECONF_PATHS =3D "--with-local-prefix=3D${STAGING_DIR_TARGET}${tar=
get_exec_prefix} \
+EXTRA_OECONF_PATHS =3D "--with-local-prefix=3D${STAGING_DIR_TARGET} \


Bye Henning


