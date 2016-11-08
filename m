Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id A54156B6F7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 11:18:41 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20161108111842110_0485
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 11:18:42 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=29884 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c44QG-0000Bj-7J for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2016 06:18:36 -0500
Date: Tue, 8 Nov 2016 06:17:33 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.20.1611080334060.19840@localhost.localdomain>
Message-ID: <alpine.LFD.2.20.1611080556150.4555@ca624034.mitel.com>
References: <alpine.LFD.2.20.1611080334060.19840@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: compile error for handwritten "perl-RPM2", 'RPM_GNUC_NULL_TERMINATED' error
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
X-List-Received-Date: Tue, 08 Nov 2016 11:18:43 -0000
Content-Type: text/plain; charset=US-ASCII


  replying to my earlier post with additional info ... man, i want to
debug this ...

On Tue, 8 Nov 2016, Robert P. J. Day wrote:

>   following on my earlier post, here's the specific issue i'm
> tackling. having found no existing OE recipe equivalent to a centos
> "perl-RPM2" RPM, i wrote my own. here's the info about that RH RPM on
> my fedora system, so i know what the final result should look like:
>
>   $ rpm -ql perl-RPM2
>   /usr/lib64/perl5/vendor_perl/RPM2.pm
>   /usr/lib64/perl5/vendor_perl/auto/RPM2
>   /usr/lib64/perl5/vendor_perl/auto/RPM2/RPM2.so
>   /usr/share/doc/perl-RPM2
>   /usr/share/doc/perl-RPM2/Changes
>   /usr/share/doc/perl-RPM2/README
>   /usr/share/man/man3/RPM2.3pm.gz
>   $
>
> so, as before, track down the source at cpan:
>
>   https://metacpan.org/pod/RPM2
>
> and write a boilerplate recipe, "perl-rpm2", containing the following
> line since it's an older style recipe:
>
>   inherit cpan_build
>
> fetching works fine:
>
>   $ bitbake -c fetchall perl-rpm2
>
> but here's the problem:
>
>   $ bitbake perl-rpm2
>
> ... snip ...
>
> | DEBUG: Executing shell function do_compile
> | Copying lib/RPM2.pm -> blib/lib/RPM2.pm
> | lib/RPM2.xs -> lib/RPM2.c
> | powerpc-poky-linux-gcc -m32 -mhard-float -mcpu=7400 -mno-spe
> --sysroot=/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc
> -I/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/usr/lib/perl/5.22.1/CORE
> -DVERSION="1.3" -DXS_VERSION="1.3" -fPIC -DRPM2_API=5004
> -I/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/usr/include/rpm
> -c -O2 -pipe -g -feliminate-unused-debug-types
> -fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/tmp/work/ppc7400-poky-linux/perl/5.22.1-r0=/usr/src/debug/perl/5.22.1-r0
> -fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/x86_64-linux=
> -fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc=
> -DDEBIAN -D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe
> -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2 -O2
> -pipe -g -feliminate-unused-debug-types
> -fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/tmp/work/ppc7400-poky-linux/perl-rpm2/1.3-r0=/usr/src/debug/perl-rpm2/1.3-r0
> -fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/x86_64-linux=
> -fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc=
> -O2 -o lib/RPM2.o lib/RPM2.c
> | In file included from
> /home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/usr/include/rpm/rpmcli.h:9:0,
> |                  from lib/RPM2.xs:3:
> |
> /home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/usr/include/rpm/rpmmacro.h:
> In function 'rpmExpand':
> |
> /home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/usr/include/rpm/rpmmacro.h:249:2:
> error: expected declaration specifiers before
> 'RPM_GNUC_NULL_TERMINATED'
> |   RPM_GNUC_NULL_TERMINATED
> |   ^~~~~~~~~~~~~~~~~~~~~~~~
> |
> /home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/usr/include/rpm/rpmmacro.h:260:2:
> error: expected '=', ',', ';', 'asm' or '__attribute__' before
> 'RPM_GNUC_NULL_TERMINATED'
> |   RPM_GNUC_NULL_TERMINATED
> |   ^~~~~~~~~~~~~~~~~~~~~~~~
>
> ... big snip, lots more errors ...

  ok, here's my wildly-uneducated record of what is going on:

  first, unpacking and configuring perl-RPM2 source (and running XS
processor) gives me the source file "lib/RPM2.c" (which is what is
generating the first build error above), which includes the header
file:

  #include <rpm/rpmcli.h>

  next, wander over to the qemuppc sysroot, to usr/include/rpm/, to
check out that header file, which contains (among other things):

  #include <popt.h>
  #include <rpmmacro.h>      <----- there
  #include <rpmtypes.h>
  #include <rpmtag.h>
  #include <rpmps.h>
  #include <rpmrc.h>
  #include <rpmfi.h>      /* XXX rpmfileAttrs */
  #include <rpmts.h>      /* XXX rpmdepFlags *

  next, in the same directory, examine rpmmacro.h, which contains:

  #if defined(_MACRO_INTERNAL)
  #include <rpmiotypes.h>
  ... snip ...

  at this point, inclusion is now conditional on _MACRO_INTERNAL, so
move on to rpmiotypes.h, which contains:

  #include <rpmutil.h>

and finally visit that header file in the qemuppc sysroot to find:

  #if     __GNUC__ >= 4
  #define RPM_GNUC_NULL_TERMINATED __attribute__((__sentinel__))
  #else
  #define RPM_GNUC_NULL_TERMINATED
  #endif

where we find the definition of that macro.

  now, is it my imagination, or could a lot of this compile-time error
be resolved by simply defining the macro "_MACRO_INTERNAL" for the
build? and if so, what is the proper way to add that setting to the
compile step for this recipe?

  would i use the standard EXTRA_* variables? or are there
perl-specific variables one would use when build CPAN recipes? or am i
totally off-track here?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================




