Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RO8zu-0008WM-MK for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 15:19:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA9EDBpn015971
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2011 14:13:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14395-10 for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2011 14:13:07 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA9ED4WR015965
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2011 14:13:05 GMT
Message-ID: <1320847986.10843.184.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 09 Nov 2011 14:13:06 +0000
In-Reply-To: <20111109124521.GH3641@jama.jama.net>
References: <20111108143701.GC3641@jama.jama.net>
	<1320834738.10843.159.camel@ted> <20111109115126.GG3641@jama.jama.net>
	<1320840383.10843.173.camel@ted> <20111109124521.GH3641@jama.jama.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: BB_SIGNATURE_HANDLER = "basichash" unusable strict?
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
X-List-Received-Date: Wed, 09 Nov 2011 14:19:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-09 at 13:45 +0100, Martin Jansa wrote:
> On Wed, Nov 09, 2011 at 12:06:23PM +0000, Richard Purdie wrote:
> > On Wed, 2011-11-09 at 12:51 +0100, Martin Jansa wrote:
> > > I have talked with kergoth on IRC yesterday and he had very nice remark:
> > > 
> > > 16:40:50 < kergoth_> JaMa: heh, the biggest weakness of the sstate
> > > signature bits, in my opinion, is that it only tracks inputs, not
> > > outputs. If task A depends on B, and the metadata input to B changes,
> > > then A will be rebuilt, even if the *output* of B didn't change as a 
> > > result of the change to its metadata.
> > > 
> > > And with this idea applied on those 2 changes I think that PR change in
> > > libxml2 should of course invalidate checksum for 
> > > sstate-libxml2-native-x86_64-linux-2.7.8-r*populate-sysroot.tgz.siginfo
> > > and probably wont hurt so much when neon-native is also rebuilt, but then 
> > > if the output of neon build is the same with new sstate checksum as it was 
> > > with older one (I know it's hard to detect ie if some file in build has 
> > > "generation timestamp inside"), then we won't continue to rebuild
> > > subversion, gcc, ... all (just because neon was rebuilt due to libxml2 PR 
> > > change which didn't influence neon output).
> > > 
> > > The same with openssl PR change.. which can cause python-native rebuild,
> > > but as long as python-native build output is "the same" we don't need to
> > > rebuild everything which (even transitively) depends on python-native.
> > 
> > In an ideal world it would be nice to track the output. I've never seen
> > a proposal for how we could make this work in practise though. There are
> > at least two big problems that spring to mind:
> > 
> > a) How do you compare two sets of output and decide whether they're the
> > same? Same list of files? Same contents? How to deal with timestamps?
> > 
> > b) You can't know in advance that the output will or won't match and its
> > near impossible to calculate any kind of checksum without having the
> > output available to perform that calculation on. This breaks a lot of
> > the way bitbake runs the builds and makes it hard to compare two
> > configurations. Is A compatible with B? You'd have to build them both to
> > find out.
> > 
> > Whilst output tracking sounds nice, I think its trading one set of
> > problems for another and in the end, I'm not sure its the perfect
> > solution it might look like from our current position.
> 
> This could be completely silly idea and I don't have any tmpdir to check
> it on real sstate data, but what if we extend
> 
> sstate-libxml2-native-x86_64-linux-2.7.8-r4-x86_64-2-85a14f7a73ea96fe85227c5a4bac3f1f_populate-sysroot.tgz.siginfo
> to contain checksums for every file included in
> sstate-libxml2-native-x86_64-linux-2.7.8-r4-x86_64-2-85a14f7a73ea96fe85227c5a4bac3f1f_populate-sysroot.tgz
> maybe store them in new extra file like
> sstate-libxml2-native-x86_64-linux-85a14f7a73ea96fe85227c5a4bac3f1f_populate-sysroot.tgz.files.siginfo
> and add only checksum of this file to oridinal siginfo file
> 
> And then when neon-native do_configure task is in runqueue because of:
> Hash for dependent task virtual:native:/OE/shr-core/openembedded-core/meta/recipes-core/libxml/libxml2_2.7.8.bb.do_populate_sysroot
> changed from 85a14f7a73ea96fe85227c5a4bac3f1f to f3bbb2f69cdef3ee60360fbbd6fab311
> 
> We'll compare
> sstate-libxml2-native-x86_64-linux-85a14f7a73ea96fe85227c5a4bac3f1f_populate-sysroot.tgz.files.siginfo
> and
> sstate-libxml2-native-x86_64-linux-f3bbb2f69cdef3ee60360fbbd6fab311_populate-sysroot.tgz.files.siginfo
> and if they're the same, we can skip neon-native.do_configure and all
> followning tasks pulled to runqueue just because of libxml2-native PR
> change.

Two problems spring to mind to start with:

a) bitbake could have to checksum the .tgz file each time it runs (yes
we can add caches and so on but we've tried to be clever to avoid
needing to md5sum data we don't already have)

b) I can't calculate in advance what the checksum of a given task should
be without executing the task itself and generating the output files to
checksum. This means remote sstate packages become effectively useless.


> I know this still has a lot of false positives, but we can whitelist
> some files with something like filesdepsexclude (as vardepsexclude) so
> that files matching some pattern won't be included in files.siginfo
> because they contain ie build timestamp (in generated files) or they
> change name without change of content (like
> /usr/doc/share/foo-1.0/README could be the same as
> /usr/doc/share/foo-1.1/README and it's not important for other packages
> depending on foo).

I suspect this logic is going to get very difficult to write
maintain :(.

> What I fear is that change like this will force "rebuild almost from scratch"
> too often to finish build before another such change is pushed in some
> layer (=> cannot do continual builds on current hw anymore)
> 
> Or that auto-PR-bump thing is going to use same checksum mechanism, 
> so even opkg upgrade will be slower then reflashing the device.
> 
> And my last thought yesterday was that it would be nice to be able to
> disable sstate completely, to save some IO (generating sstate-cache and
> siginfos) for people who know what they're doing (and can rebuild stuff
> manually when needed), as with basic signature handler it doesn't reuse
> sstate much in multimachine builds (when everything is built acording to 
> basic signature handler, but sstate checksums are already somewhere
> else)
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-November/012053.html
> and when it does reuse sstate package, it sometimes causes troubles
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-November/012149.html

We can customise the siggen code to do whatever we think is appropriate,
including just permanently just generate the same hash value with no
computation, effectively disabling 99.9% of the code/overhead.

I think there are ways to solve the problems and we will find a solution
that works the majority of the time but until people start thinking
about and using the code, its not going to happen. Its nice to see
people starting to think about this though :)

Cheers,

Richard



