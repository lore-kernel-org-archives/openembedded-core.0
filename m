Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QYzuL-00021q-09 for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 14:18:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5LCEhQF020374
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 13:14:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20069-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 13:14:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5LCEZTZ020367
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 13:14:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2011 13:14:21 +0100
Message-ID: <1308658461.20015.24.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Multilib Development Update
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
X-List-Received-Date: Tue, 21 Jun 2011 12:18:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We've been experimenting with multilib and I now feel it right to
discuss the changes a bit further now there is something to discuss :).
The work so far on this is available on the branch:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rpurdie/ml

There have been a few issues and some lessons to learn. I've also have
to make some implementation decisions based on the issues we were
running into. To summarise them:

a) bitbake has issues if you try and delete variables from the data
store. Patches two and three on the branch fix the issues I was seeing.
More details are in the commits.

b) I found the recent additional event in bitbake wasn't in the right
place to optimally support multilib so I had to move the expandKeys()
call. Since the only known user is the native/nativesdk classes in
OE-Core, this should be ok to do at this point. Again, the commit has
the specific details.

c) When adding parameter support to BBCLASSEXTEND I added some variables
so the class can figure out which class is being processed and what the
parameter is. Related to this is the issue that bbclass event handlers
once added always get called, even if the class isn't inherited in a
subsequent recipe file!

d) I switched to using <multilib>- as the prefix for multilib recipes.
This was because using the ":" character didn't work out as it gets
placed into paths in too many places if you add it to PN.

e) I've made the assumption that if a name in PACKAGES uses PN, its at
the start.

f) The use of := in cross.bbclass makes life hard for multilib. There is
a special section of multilib.bbclass devoted to handling those
variables. Initially I approached this as two separate multilib classes
but these are merged together now.

g) I set the TARGET_VENDOR to the horrendously ugly string
"-pokymllib32". The reason is that any "-" characters in there breaks
config.sub at present and other separators cause other issues. I suspect
we can fix that going forward but for now it works albeit looking
horrible.

h) I had to introduce MLPREFIX for use in certain places, thankfully all
in places "normal" recipes shouldn't need to use it.


Summary is that you can now add:

require conf/multilib.conf
MULTILIBS = "multilib:lib32 multilib:lib64"

to your local.conf and then "bitbake zlib lib64-zlib lib32-zlib" and it
will build all three configurations. Packaging of the components I've
looked at is ok so far with the files in the correct directories and
whilst I've not tried building an image from these, I'm optimistic :).

Since various Yocto people are scheduled to work on pieces of this, I've
split the subsequent work into the following tasks for development
purposes:

1) Change libdir to "lib64" for qemux86-64 and see what breaks.

2) Extend MULTILIB class extension to recipes required to build:
     a) minimal image
     b) LSB image?
     c) Sato image?
     d) world [stretch goal for 1.1]

   This task also could include a better way of specifying which 
   recipes to extend.

3) Add support to RPM packaging backend to turn modified package names 
   into true rpm multilib packages.

4) Add support to standard opkg backend to allow parallel install of 
   multilib variant packages (likely to be hacky at first but also 
   include a proposal for better native opkg support of this)

5) Add support to bitbake to pass BBEXTEND parameters from options like 
   bitbake -b where filenames are specified on the commandline

6) Create some "standard" multilib configurations (x86 32+64 bit)

7) Overhaul architecture, ABI, optimisation configuration files with a 
   view to better structure (and ease specifying multilib 
   configurations).

8) Reconsolidate multilib + multilibcross class differences [already 
   done by RP now]

9) Directly support multlibs within the toolchain itself [post 1.1]

10) Investigate better TARGET_VENDOR handling for config.sub. Currently 
   we can only have ARCH-VENDOR-linux where VENDOR cannot contain "-" 
   but it might be possible to relax that constraint.

I'm quite pleased with the way this code "feels" now and it isn't
working out too invasive into the rest of the system. I therefore think
we have a solid base to start building the above tasks upon.

There are other cleanup issues it does highlight such as the convoluted
mess of MULIMACH_ARCH variables, BASE_PACKAGE_ARCH, PACKAGE_ARCH and so
forth but I'll save that for a separate discussion.

Cheers,

Richard




