Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SryLC-0005gs-Hj
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 23:32:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6JLLVYT014658
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 14:21:34 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.35.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 19 Jul 2012 14:21:31 -0700
Message-ID: <50087A5B.9030905@windriver.com>
Date: Thu, 19 Jul 2012 15:21:31 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAKSdS8L32A5wB4fzuc-EQTBX9_GXLhLO_gt4HgzgJk=UC+XZKw@mail.gmail.com>
In-Reply-To: <CAKSdS8L32A5wB4fzuc-EQTBX9_GXLhLO_gt4HgzgJk=UC+XZKw@mail.gmail.com>
Subject: Re: meta-toolchain type SDK containing external toolchain possible?
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
X-List-Received-Date: Thu, 19 Jul 2012 21:32:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/19/12 3:13 PM, Manuel Bessler wrote:
> Hi all,
>
> I'm using a vendor-supplied external (pre-built) toolchain in my build
> (poky-denzil).
> Is it possible to setup my toolchain such that it will be part of the
> SDK package instead of the default {gcc,binutils}-cross-canadian?

It is possible, but the external toolchain needs to be provided via a 
crosssdk/cross-canadian binary.  The external-csl-toolchain.bb can be used as a 
model for how to do this.

PREFERRED_PROVIDER and similar may also be needed to ensure you get the correct 
version, and not rebuilt from source versions.

> I'm modeling my SDK after the meta-toolchain type SDK.
>
> Right now when I build my image, all target code is built using my
> pre-built external toolchain,
> but when I 'bitbake <mysdk>', the toolchain built and distributed in
> the SDK tarball is one built by bitbake.
>
> That, in effect, makes my SDK unusable as the toolchain inside is
> based on a different GCC/Binutils versions.
>
>  From my digging around in the recipes and classes, I think if I could
> somehow make my toolchain
> look like it provides gcc-cross-canadian and binutils-cross-canadian,
> it might work. However I'm not
> quite sure what I need to set to make this happen.
>
> I tried to add this to conf/distro/include/tcmode-external-xxx.inc in my layer:
> PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "external-xxx-toolchain"
> PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "external-xxx-toolchain"

For my stuff I did;

PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = 
"external-csl-toolchain-cross-canadian-${TRANSLATED_TARGET_ARCH}"

PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = 
"external-csl-toolchain-cross-canadian-${TRANSLATED_TARGET_ARCH}"

PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = 
"external-csl-toolchain-cross-canadian-${TRANSLATED_TARGET_ARCH}"


> That alone did not change anything.
>
> Then I tried adding the following to
> recipes-core/meta/external-xxx-toolchain_4.5.3.bb in my layer:
> PROVIDES += " gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} "
> PROVIDES += " binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} "

Within the external-cs-toolchain-cross-canadian.bb I had similar provides as well..

> to which bitbake complained:
> ERROR: Multiple .bb files are due to be built which each provide
> gcc-cross-canadian-mipsel
> (xxx/recipes-core/meta/external-xxx-toolchain_4.5.3.bb
> xxx/meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb).
>   This usually means one provides something the other doesn't and should.
> (and the same for binutils).
>
> All I want is to dump the external toolchain tree into the SDK output.
>
> Any clues as to what I might be missing, or am I on the wrong path?
>
> Thanks,
> Manuel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>




