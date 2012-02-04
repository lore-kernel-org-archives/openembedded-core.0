Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtkLN-0007p1-1X
	for openembedded-core@lists.linuxtogo.org;
	Sat, 04 Feb 2012 19:28:13 +0100
Received: by lahc1 with SMTP id c1so2317444lah.6
	for <openembedded-core@lists.linuxtogo.org>;
	Sat, 04 Feb 2012 10:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=fpqNAnQPyvb3WcRVUthOAiaDsC3tQgQ/qk/SnPmNA5o=;
	b=pZ/X9QF/XjdUJKkKmZEm7aVkcHB0VgZs+hcWU0Xpzxv2sYSTWfyoWP5+Gxo7oz9dOF
	E1cql4UD00M6ZzXptKna5so6jayoOV1znswJlhoXD6Ls7c4vutGShafnO8cYi64lPA9x
	13fJytiEdgfoSDq+NJypWpTeqVhq6vJgrrHwk=
Received: by 10.152.123.68 with SMTP id ly4mr709295lab.13.1328379608392; Sat,
	04 Feb 2012 10:20:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Sat, 4 Feb 2012 10:19:38 -0800 (PST)
In-Reply-To: <CAMKF1spO-FVweKU21EdHK-Rs5gc4qun=JRYnwMWc88SOSeQufg@mail.gmail.com>
References: <CAMKF1spO-FVweKU21EdHK-Rs5gc4qun=JRYnwMWc88SOSeQufg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 4 Feb 2012 10:19:38 -0800
Message-ID: <CAMKF1soq=EaZ4KMb7McFcEjNyTVT2sMHPHvEr11+kL603iCOUQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: Duplicate recipes in meta-oe
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
X-List-Received-Date: Sat, 04 Feb 2012 18:28:13 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 4, 2012 at 9:12 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> Following recipes are duplicated in meta-oe
>
> recipes-devtools/python/python-imaging_1.1.7.bb
> recipes-devtools/python/python-setuptools_0.6c11.bb
> recipes-core/eglibc/ldconfig-native_2.12.1.bb
> recipes-graphics/xorg-app/rgb_1.0.4.bb
> recipes-extended/tzcode/tzcode-native_2011i.bb
> recipes-multimedia/libmad/libmad_0.15.1b.bb
> recipes-extended/cups/cups_1.4.6.bb
>

I sent a patch to delete obvious ones from meta-oe but following still
needs to be looked at
recipes-devtools/python/python-imaging_1.1.7.bb

the above recipes apply same patch but meta-oe has extra  stuff in
do_install which probably should go into oe-core and pr scheme is
different mlX Vs rX so that will change

recipes-devtools/python/python-setuptools_0.6c11.bb

one in meta-oe has
NATIVE_INSTALL_WORKS = "1"
I dont know if this is needed anymore if not then this can be delete
from meta-oe

recipes-extended/tzcode/tzcode-native_2011i.bb

We are good with one for oe-core I think Andrea is working on it.

recipes-multimedia/libmad/libmad_0.15.1b.bb

meta-oe has

-           file://fix_for_mips_with_gcc-4.5.0.patch"
+           file://mad.diff \
+           file://mad-mips-h-constraint.patch"
+
+SRC_URI_append_avr32 = " file://libmad-0.15.1b-avr32-optimization.patch"

fix_for_mips_with_gcc-4.5.0.patch and mad-mips-h-constrain.patch are
essentially fixing same thing

mad.diff disables certain optimizations I dont think we need that

so I think this can be converted into a bbapend for avr
SRC_URI_append_avr32 = " file://libmad-0.15.1b-avr32-optimization.patch"



> lets try to find the differences and consolidate them and move them to
> either oe-core or meta-oe
> where ever they are more suitable.
>
> Thanks
> -Khem


