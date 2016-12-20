Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id C7E9171A8D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 18:33:59 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20161220183358736_0486
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 18:33:58 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=32926 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cJPEX-0006LZ-47 for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2016 13:33:53 -0500
Date: Tue, 20 Dec 2016 13:32:31 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1612201321490.5281@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: $50 bounty for an OE recipe for libfilesys-smbclient-perl. seriously.
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
X-List-Received-Date: Tue, 20 Dec 2016 18:34:00 -0000
Content-Type: text/plain; charset=US-ASCII


  really, i just don't have time to mess with this anymore and i'm
more than happy to pay someone $50 CAD (interac transfer) to provide
me with a proper recipe and essential patches for the perl module
Filesys-SmbClient-3.2 here:

  http://search.cpan.org/~alian/Filesys-SmbClient-3.2/

the fundamental issue seems to be that the source for that module is
simply not set up for cross-compilation -- the Makefile.PL file would
suggest that:

sub find_path {
  my $ext = ($_[0]=~m!\.h$! ? "include" : ( $ENV{HOSTTYPE}=~m!x86_64! ? "lib64" : "lib"));
  my $defaultsDir = { "/usr" => 1,
		      "/usr/local" => 1,
		      "/usr/local/samba" => 1,
		      "/usr/local/samba3" => 1 };
                      ... etc etc ...


and when i throw together an absolutely boilerplate recipe for that
module along the lines of what i did for dozens of others, i get:

| I search in: /home/rpjday/oe/builds/qemuarm/tmp/sysroots-uninative/x86_64-linux/usr/include
| /home/rpjday/oe/builds/qemuarm/tmp/sysroots/x86_64-linux/usr/perl-native/include
| /home/rpjday/oe/dist/layers/poky/scripts/include
| /home/rpjday/oe/builds/qemuarm/tmp/sysroots/x86_64-linux/usr/arm-poky-linux-gnueabi/include
| /home/rpjday/oe/builds/qemuarm/tmp/sysroots/qemuarm/usr/crossscripts/include
| /home/rpjday/oe/builds/qemuarm/tmp/sysroots/x86_64-linux/usr/s/include
| /home/rpjday/oe/builds/qemuarm/tmp/sysroots/x86_64-linux/usr/include
| /home/rpjday/oe/builds/qemuarm/tmp/sysroots/x86_64-linux/s/include
| /home/rpjday/oe/builds/qemuarm/tmp/sysroots/x86_64-linux/include
| /home/rpjday/oe/dist/layers/poky/scripts/include
| /home/rpjday/oe/dist/layers/poky/bitbake/include
| /home/rpjday/oe/dist/bb/bin/include
| /home/rpjday/oe/dist/bb/bin/include
| /usr/local/s/include
| /usr/s/include
| /home/rpjday/.local/include
| /home/rpjday/include
| /usr/local/include
| /usr/local/samba3/include
| /usr/include
| /usr/local/samba/include
| Where can I find libsmbclient.h ? []
*************************************************************
| ** WHAT !!!!
| ** I Can't find /libsmbclient.h : No such file or directory.

... and same problem looking for libsmbclient.so.

  using the latest poky checkout, i built a perfectly reasonable
core-image-minimal for qemuarm, and it boots and runs, and i've added
samba to it so that one can find libsmbclient.so here under
tmp/sysroots/:

$ find . -name libsmbclient.so*
./qemuarm/usr/lib/libsmbclient.so.0.2.3
./qemuarm/usr/lib/libsmbclient.so.0
./qemuarm/usr/lib/libsmbclient.so
$

  but when i try to bitbake that smbclient recipe, i get the errors
above. anyway, what little i still know about perl modules, it looks
pretty clear that the source for that module doesn't understand
cross-compilation, so if anyone wants to collect, get me something
that builds under OE. thank you kindly.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


