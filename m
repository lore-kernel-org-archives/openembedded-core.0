Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qqngr-0000jp-Lr for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 16:53:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p79EnSpb014361
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 15:49:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14206-02 for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2011 15:49:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p79EnHDl014355
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 15:49:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E4097A3.8090204@gmail.com>
References: <1312784043-3081-1-git-send-email-raj.khem@gmail.com>
	<1312845842.14274.282.camel@rex>  <4E4097A3.8090204@gmail.com>
Date: Tue, 09 Aug 2011 15:48:44 +0100
Message-ID: <1312901324.14274.307.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] shared-mime-info, avahi, polkit: inherit perlnative
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
X-List-Received-Date: Tue, 09 Aug 2011 14:54:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-08 at 19:12 -0700, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 08/08/2011 04:24 PM, Richard Purdie wrote:
> > On Sun, 2011-08-07 at 23:14 -0700, Khem Raj wrote:
> >> Otherwise we end up with configure errors like below
> >> 
> >> | checking for perl... /usr/bin/perl | checking for perl >=
> >> 5.8.1... 5.12.4 | checking for XML::Parser... configure: error:
> >> XML::Parser perl module is required for intltool | + bbfatal
> >> 'oe_runconf failed' | + echo 'ERROR: oe_runconf failed' | ERROR:
> >> oe_runconf failed
> >> 
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > 
> > We really need to tweak intltool's m4 file so we don't need to add
> > in this ton of dependencies unnecessarily...
> > 
> 
> intltool.m4 uses
> 
> AC_PATH_PROG(INTLTOOL_PERL,perl)
> 
> 
> if test -z "$INTLTOOL_PERL"; then
> 
> 
>    AC_MSG_ERROR([perl not found])
> 
> 
> fi
> 
> 
> 
> its using AC_PATH_PROG to find perl which is quite right I think.
> We somehow have to make sure that the path to perl-native
> is added into environment which does not happen unless
> we inherit perlnative as of now. and perlnative class is
> 
> PATH_prepend = "${STAGING_BINDIR_NATIVE}/perl-native:"
> 
> 
> DEPENDS += "perl -native"
> 
> 
> are you proposing that we hardcode path to perl-native in intltool
> macros and assume that perl-native is already built ? or something else

I was proposing we change 
AC_PATH_PROG(INTLTOOL_PERL,perl) 
to 
AC_PATH_PROG(INTLTOOL_PERL,nativeperl)

Cheers,

Richard





