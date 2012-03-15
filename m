Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S869O-0005lm-C8 for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 09:35:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2F8QMks018319;
	Thu, 15 Mar 2012 08:26:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15320-08; Thu, 15 Mar 2012 08:26:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2F8QDQW018313
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 15 Mar 2012 08:26:14 GMT
Message-ID: <1331799972.18586.67.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Mar 2012 08:26:12 +0000
In-Reply-To: <CAEsOVNdBma0dRbnzkq05avjSbtJfVuSC67ihWvLi17RK_duaxQ@mail.gmail.com>
References: <cover.1331776831.git.nitin.a.kamble@intel.com>
	<ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
	<513484b0dacc94af1730ddf919b88f57adc63f53.1331776832.git.nitin.a.kamble@intel.com>
	<CAEsOVNdBma0dRbnzkq05avjSbtJfVuSC67ihWvLi17RK_duaxQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 8/8] gcc: enable multilib for target gcc
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
X-List-Received-Date: Thu, 15 Mar 2012 08:35:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-15 at 02:47 +0000, McClintock Matthew-B29882 wrote:
> On Wed, Mar 14, 2012 at 9:02 PM,  <nitin.a.kamble@intel.com> wrote:
> > +    multilibs = d.getVar('MULTILIB_VARIANTS', True)
> > +    target_arch = d.getVar('TARGET_ARCH', True)
> > +
> > +    gcc_target_config_files = {
> > +        'x86_64'      : ['gcc/config/i386/t-linux64', 'gcc/config/i386/t-linux'],
> > +        'i586'        : ['gcc/config/mips/t-linux'],
> > +        'mips'        : ['gcc/config/mips/t-linux64', 'gcc/config/mips/t-linux'],
> > +        'ppc'         : ['gcc/config/rs6000/t-linux64'] }
> > +
> > +    gcc_header_config_files = {
> > +        'x86_64'      : ['gcc/config/i386/linux64.h'],
> > +        'i586'        : ['gcc/config/mips/linux.h'],
> > +        'mips'        : ['gcc/config/mips/linux64.h', 'gcc/config/mips/linux.h'],
> > +        'ppc'         : ['gcc/config/rs6000/linux64.h', 'gcc/config/rs6000/linux.h'] }
> > +
> > +    if target_arch not in gcc_target_config_files:
> > +        bb.warn('gcc multilib setup is not supported for TARGET_ARCH=' + target_arch)
> > +        return
> > +
> > +    gcc_multilib_target_config_files = gcc_target_config_files[target_arch]
> > +    gcc_multilib_header_config_files = gcc_header_config_files[target_arch]
> > +
> > +    ml_list = ['DEFAULTTUNE']
> > +    if multilibs != '':
> > +        for ml in multilibs.split(' '):
> > +            ml_list.append('DEFAULTTUNE_virtclass-multilib-' + ml)
> 
> What about adding non-multilib variants? I want to make one toolchain
> for ppce500v2, ppce500mc, ppce5550, and ppc64e5500?
> 
> Also, somehow, should we enforce all "toolchains" are built through
> this multilib build process such that I only need to configure things
> properly and then theoretically I can make a toolchain ONCE that
> supports all desired targets? E.g. I don't think we want references to
> DEFAULTTUNE since I don't want the DEFAULTTUNE to matter? Does this
> make any sense?

Whilst I understand the desire, this is not what the patch series is
intended for and I don't think it reasonable to try and change the patch
series to fit that requirement.

The big issue you face trying to do the above is iterating over the
toolchain building libgcc and libc for each of the variants you mention.
This is particularly hard since at least in the multilib case they have
different libdir paths, in your non-multilib case, they would overlap.

So no, I don't think its possible to do what you describe in this
context.

Cheers,

Richard





