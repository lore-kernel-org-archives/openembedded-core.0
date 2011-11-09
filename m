Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RO71I-00032P-19 for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 13:12:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA9C6SVv015294
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2011 12:06:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14395-07 for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2011 12:06:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA9C6LE6015270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2011 12:06:22 GMT
Message-ID: <1320840383.10843.173.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 09 Nov 2011 12:06:23 +0000
In-Reply-To: <20111109115126.GG3641@jama.jama.net>
References: <20111108143701.GC3641@jama.jama.net>
	<1320834738.10843.159.camel@ted> <20111109115126.GG3641@jama.jama.net>
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
X-List-Received-Date: Wed, 09 Nov 2011 12:12:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-09 at 12:51 +0100, Martin Jansa wrote:
> I have talked with kergoth on IRC yesterday and he had very nice remark:
> 
> 16:40:50 < kergoth_> JaMa: heh, the biggest weakness of the sstate
> signature bits, in my opinion, is that it only tracks inputs, not
> outputs. If task A depends on B, and the metadata input to B changes,
> then A will be rebuilt, even if the *output* of B didn't change as a 
> result of the change to its metadata.
> 
> And with this idea applied on those 2 changes I think that PR change in
> libxml2 should of course invalidate checksum for 
> sstate-libxml2-native-x86_64-linux-2.7.8-r*populate-sysroot.tgz.siginfo
> and probably wont hurt so much when neon-native is also rebuilt, but then 
> if the output of neon build is the same with new sstate checksum as it was 
> with older one (I know it's hard to detect ie if some file in build has 
> "generation timestamp inside"), then we won't continue to rebuild
> subversion, gcc, ... all (just because neon was rebuilt due to libxml2 PR 
> change which didn't influence neon output).
> 
> The same with openssl PR change.. which can cause python-native rebuild,
> but as long as python-native build output is "the same" we don't need to
> rebuild everything which (even transitively) depends on python-native.

In an ideal world it would be nice to track the output. I've never seen
a proposal for how we could make this work in practise though. There are
at least two big problems that spring to mind:

a) How do you compare two sets of output and decide whether they're the
same? Same list of files? Same contents? How to deal with timestamps?

b) You can't know in advance that the output will or won't match and its
near impossible to calculate any kind of checksum without having the
output available to perform that calculation on. This breaks a lot of
the way bitbake runs the builds and makes it hard to compare two
configurations. Is A compatible with B? You'd have to build them both to
find out.

Whilst output tracking sounds nice, I think its trading one set of
problems for another and in the end, I'm not sure its the perfect
solution it might look like from our current position.

Cheers,

Richard



