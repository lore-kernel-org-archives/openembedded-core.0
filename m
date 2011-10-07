Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RCCou-0001Cv-7R for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 17:58:45 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97FxakW015208; Fri, 7 Oct 2011 16:59:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7em0UHeKHBpm; Fri,  7 Oct 2011 16:59:36 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97FxVjk015203
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 7 Oct 2011 16:59:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 07 Oct 2011 16:52:53 +0100
In-Reply-To: <CAEsOVNdUTaVc1NR0hDH7PU1gVCXotJWEJquiz=EMQXQ231GmzA@mail.gmail.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-2-git-send-email-msm@freescale.com>
	<1317815212.14671.142.camel@ted>
	<CAEsOVNdUTaVc1NR0hDH7PU1gVCXotJWEJquiz=EMQXQ231GmzA@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318002781.8533.16.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 2/6] Fix perl for powerpc64 build
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
X-List-Received-Date: Fri, 07 Oct 2011 15:58:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-05 at 19:04 +0000, McClintock Matthew-B29882 wrote:
> On Wed, Oct 5, 2011 at 6:46 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >> --- a/meta/recipes-devtools/perl/perl_5.12.3.bb
> >> +++ b/meta/recipes-devtools/perl/perl_5.12.3.bb
> >> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
> >>  # We need gnugrep (for -I)
> >>  DEPENDS = "virtual/db grep-native"
> >>  DEPENDS += "gdbm zlib"
> >> -PR = "r5"
> >> +PR = "r6"
> >>
> >>  # 5.10.1 has Module::Build built-in
> >>  PROVIDES += "libmodule-build-perl"
> >> @@ -95,6 +95,8 @@ export LDDLFLAGS = "${LDFLAGS} -shared"
> >>  # We're almost Debian, aren't we?
> >>  CFLAGS += "-DDEBIAN"
> >>
> >> +export ARCH_powerpc64 = "powerpc64"
> >> +
> >
> > I'm finding it really hard to believe this makes any difference. I just
> > tried a powerpc64 build here and perl built fine. I can't find any
> > evidence for any part of the perl build using an ARCH variable
> > (TARGET_ARCH is used but that isn't ARCH).
> >
> > Can you give some further information about how/where this is used?
> 
> I'm trying to reproduce this again on 'edison' as well and it does not
> appear to be occurring anymore! The problem before had to do with a
> configuration script error:
> 
> config.sh-powerpc64-linux
> 
> This script was getting invoked as 'config.sh-powerpc-linux' on the
> 64bit build, then the file did not exist and the configure step failed
> out. Not sure if this was somehow fixed in a different manner.
> 
> Please drop this patch for now. I'll bring it up again if I see issues.

Do you still need this bit:

        case "${TARGET_ARCH}" in
-               x86_64 | powerpc | s390)
+               x86_64 | powerpc | powerpc64 | s390)
                        sed -i -e "s,\(need_va_copy=\)'undef',\1'define',g" \
                                config.sh-${TARGET_ARCH}-${TARGET_OS}
                        ;;

?

Cheers,

Richard



