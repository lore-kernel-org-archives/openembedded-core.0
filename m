Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1UPZzG-0005Wj-Ss
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:57:46 +0200
Received: from cpebcc8100de718-cmbcc8100de715.cpe.net.cable.rogers.com
	([99.240.144.66]:57245 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1UPZiW-0005Vn-2Q for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 10:40:12 -0400
Date: Tue, 9 Apr 2013 10:40:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1304091025170.19176@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
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
Subject: bitbake "fetch" vs "fetchall" vs something in between?
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
X-List-Received-Date: Tue, 09 Apr 2013 14:57:58 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  (if there's a simple answer to this, just point me at the URL and
i'll be happy, thanks.)

  for the purpose of documenting the various steps in a build, i'm
summarizing the difference between bitbake commands "fetch" and
"fetchall", and it strikes me that it would be useful if there was
something in between.

  as an example, say i want to build a core-image-minimal for qemuarm
(i'm deliberately picking a non-x86 target just to ensure there's no
confusion between what is built natively and what is built for the
target.)

  if i start with:

$ bitbake -c fetch core-image-minimal

i get the following downloads:

autoconf-2.69.tar.gz
automake-1.12.6.tar.gz
gnu-config-20120814.tar.bz2
libtool-2.4.2.tar.gz
m4-1.4.16.tar.gz
pkg-config-0.25.tar.gz
pseudo-1.5.1.tar.bz2
quilt-0.60.tar.gz
sqlite-autoconf-3071502.tar.gz

  what would be the best way to describe the above? it's obviously(?)
the absolute minimum that needs to be built and available *natively*
in order to even download anything else, would that be a fair way to
describe it?  and i get the corresponding build output:

tmp-eglibc/work/x86_64-linux/
autoconf-native
automake-native
gnu-config-native
libtool-native
m4-native
pkgconfig-native
pseudo-native
quilt-native
sqlite3-native

and all of that is used to populate the initial native sysroot
"sysroots/x86_64-linux".  but that is *clearly* not enough to start an
actual build, there's much more that needs to be built natively, which
you get with "fetchall":

$ bitbake -c fetchall core-image-minimal

however, what this does is download not only all the remaining source
to be configured and built *natively*, but for the target as well.
what would be useful (unless it exists already, of course) would be a
command that represents building the entire native sysroot with no
regard whatever to what will be needed for the target.

  am i missing the simple incantation that would do that?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


