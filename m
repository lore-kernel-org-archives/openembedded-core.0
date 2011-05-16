Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QLwe9-0004j9-60 for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 14:11:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GC8jlo019206
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 13:08:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18804-08 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 13:08:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GC8Zxf019198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 13:08:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2011 13:08:34 +0100
Message-ID: <1305547714.3424.51.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Performance - Staus and plans
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
X-List-Received-Date: Mon, 16 May 2011 12:11:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm going to cover both disk usage and build time in this list with a
summary of the currently identified tasks we're working on and their
status as I understand them:

a) Split libc locale generation from libc do_install/do_package

   Status: Dongxiao has a WIP patch. Do we have an ETA on that?

b) Share the source directories for gcc, glibc and maybe others

   Status: RP wrote a proof of concept patch, needs further work, on 
   Yocto schedule for 1.1

c) Set CCACHE on a per recipe basis. need to figure out whether ccache 
   data can be shared and under what circumstances.

   Status: Idea talked about, no code yet

d) Cache do_configure autoreconf result

   Status: We know this is about 50% of the time on configure, no code 
   yet. Need fixes to SRC_URI variable dependency code to include 
   checksums (which we need to fix regardless)

e) Remove perl-native from most build dependencies by installing it 
   into its own sysroot

   Status: WIP

f) Document performance best practises (e.g. no premempt in kernel, 
   use server kernel on ubuntu)

   Status: Not done yet.

Further investigative ideas I've been wondering about:

a) Consider current dependency tree and see if any dependencies could 
   be avoided?

b) Consider contents of our standard images and what could be removed 
   for what build time improvement?

c) Find a system with complete symbol data present, then run a minimal 
   build under oprofile and see if anything significant bottle necks 
   appear? To get good debug data we might do a build under a poky 
   generated image! :)

d) Consider better ways to enable pseudo to be prebuilt in parallel 
   with other native recipes as this takes a significant chunk of time 
   when we aren't using parallelism.

e) Compare the build time of "bitbake glibc -c populate_sysroot; 
   bitbake core-image-sato" with "bitbake core-image-sato"

My big concern is that whilst I think if we keep working at it, we can
get the standard build time to 90 minutes (currently master is 102), we
don't currently have any gain identified that could get us to the 60
minute build time.

Cheers,

Richard






