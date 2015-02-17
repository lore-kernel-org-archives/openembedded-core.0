Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 0C5E672DE2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 10:49:01 +0000 (UTC)
Received: from [99.240.204.5] (port=37848 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YNfi5-0004JV-OO for openembedded-core@lists.openembedded.org;
	Tue, 17 Feb 2015 05:48:58 -0500
Date: Tue, 17 Feb 2015 05:48:57 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.11.1502170421230.26768@localhost>
Message-ID: <alpine.LFD.2.11.1502170544370.21344@localhost>
References: <alpine.LFD.2.11.1502120750130.5392@localhost>
	<alpine.LFD.2.11.1502170421230.26768@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: ncurses-native compile error -- i'm starting to blame gcc-5.0.0 [SOLVED]
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
X-List-Received-Date: Tue, 17 Feb 2015 10:49:02 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  never mind ... i was just pointed at this fedora-specific page:

https://lists.fedoraproject.org/pipermail/devel/2015-February/207549.html

which discusses the impact of trying a mass rebuild on fedora
packages using gcc-5.0.0, wherein it's explained that a number of
packages now fail to build because:

cclive-0.9.3-4.fc22.src.rpm
cvc4-1.3-7.fc22.src.rpm
dans-gdal-scripts-0.23-5.fc22.src.rpm
emacs-24.4-3.fc22.src.rpm
ember-0.7.2-3.fc22.src.rpm
flamerobin-0.9.3-8.20130401snap.fc22.src.rpm
ghc-gtk-0.12.5.0-3.fc22.src.rpm
ghc-webkit-0.12.5.1-3.fc22.src.rpm
gnote-3.14.0-1.fc22.src.rpm
ksh-20120801-21.fc22.src.rpm
libason-0.1.2-2.fc22.src.rpm
libcmis-0.5.0-1.fc22.src.rpm
libgpg-error-1.16-1.fc22.src.rpm
libixion-0.7.0-3.fc22.src.rpm
liborcus-0.7.0-5.fc22.src.rpm
ncurses-5.9-17.20140906.fc22.src.rpm
openldap-2.4.40-5.fc22.src.rpm
perl-5.20.1-315.fc22.src.rpm
xorg-x11-server-1.16.2.901-1.fc22.src.rpm
xorg-x11-server-utils-7.7-10.fc22.src.rpm
zsh-5.0.7-4.fc22.src.rpm
	these packages failed to build because of the changes in the preprocessor;
	gcc started to generate line directives to better detect whether a macro
	tokens come from a system header - see http://gcc.gnu.org/PR60723
	The fix is to use the -P option if the code isn't prepared to deal with
	such directives.


  so i just added to my local.conf:

CPPFLAGS_append_pn-ncurses-native = " -P"

and that appears to have solved this build problem. i'm guessing i'll
still hit a few more build errors because of gcc-5.0.0.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

