Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TYQGf-0006br-Uk
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 00:51:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qADNblGN005352
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 15:37:47 -0800 (PST)
Received: from msp-dhcp30.wrs.com (172.25.34.30) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 13 Nov 2012 15:37:47 -0800
Message-ID: <50A2D9CB.30709@windriver.com>
Date: Tue, 13 Nov 2012 17:37:47 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <506DCF4A.5020101@windriver.com>
In-Reply-To: <506DCF4A.5020101@windriver.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	qADNblGN005352
Subject: RFC: Secondary Toolchain -- Followup
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
X-List-Received-Date: Tue, 13 Nov 2012 23:51:46 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: quoted-printable

I have taken the RFC added it to the OE Wiki -- as well as added example=20
details.  I've got most of the information implemented now, only the SDK=20
specific items are remaining.

I'm looking for people to review this and let me know if the contents are=
=20
reasonable or not -- and if you have any suggestions or comments.

http://www.openembedded.org/wiki/Adding_a_secondary_toolchain

Once the document is complete, and all of the comments are addressed, I e=
xpect=20
this will become the 'standard' way to implement and control a secondary =
toolchain.

On 10/4/12 1:02 PM, Mark Hatle wrote:
> We have an issue where we'd like to have an alternative toolchain (asse=
mbler,
> linker, compiler) available for our customers to selectively use.  Howe=
ver,
> before we just go off and implement something, I'd like at least some b=
asic
> consensus on what the best practice is for doing this work.  Below is m=
y attempt
> at an early proposal.
>
> Background
> ----------------
>
> Many companies have commercial / highly optimized toolchains for specif=
ic
> purpose, such as ICC from Intel, LLVM, ARM specific toolchain, etc..  F=
or
> (potentially) better performance with some applications a mechanism to =
both
> provide the hooks for the alternative toolchain as well as a way to act=
ive it
> per-package is desired.
>
> This work assumes that the third party toolchain is generally compatibl=
e with
> the idea of sysroots, linking to the libc provided by OE, and generally
> compatible with GNU conventions.
>
> However, as part of the third party toolchain, it may not be GNU compat=
ible.
> This means many Open Source applications simply may not work with this
> toolchain.  That means that we need to have a way for a toolchain to bl=
acklist
> (or whitelist) specific recipes.  This way only supported components ca=
n be
> built by the user, avoiding numerous complaints.
>
> Currently OE has a method to generate an SDK based on the GNU toolchain=
.  We
> would like to be able to also export the external toolchain along with =
the SDK,
> effectively providing both the GNU toolchain and the third party toolch=
ain using
> the common sysroot.
>
> We need a way to active the third party toolchain on a per-package basi=
s.  This
> activation will need to use the existing sysroot, but be able to pass d=
ifferent
> C, C++, LD, AS and other flags as specified by the third party toolchai=
n.
>
> Finally third party toolchains should be implemented as layers that can=
 easily
> plug into OE.
>
> Implementation
> ---------------------
>
> Add an OVERRIDE to specify the alternative toolchain.  Can this be done=
 within
> the layer by doing something like:
>
> OVERRIDE_append =3D ":toolchain-${TOOLCHAIN}"
>
> TOOLCHAIN =3D "gnu" (or "icc")
>
> To activate the toolchain you would use things like:
>
> TOOLCHAIN_pn-bash =3D 'icc'
>
> To define the correct behavior for the toolchain, the following would n=
eed to be
> defined (with _toolchain-<toolchain>):
>
> TARGET_CPPFLAGS
> TARGET_CFLAGS
> TARGET_CXXFLAGS
> TARGET_LDFLAGS
> CC
> CXX
> F77
> CPP
> LD
> CCLD
> AR
> AS
> RANLIB
> STRIP
> OBJCOPY
> OBJDUMP
> NM
> FULL_OPTIMIZATIONS
> DEBUG_OPTIMIZATION
>
> Is anyone aware of any other items that may require additional items?  =
Will the
> above actually work?  Using the override of the TOOLCHAIN_=85 will that=
 actually
> change the override values or do we get stuck?
>
> Comments/suggestions appreciated!
> --Mark
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



