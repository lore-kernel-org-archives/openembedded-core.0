Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RqNf0-0002de-8B for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 12:38:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QBUkEi021753
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 11:30:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21514-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 11:30:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QBUd6b021747
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 11:30:41 GMT
Message-ID: <1327577442.19643.345.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jan 2012 11:30:42 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Setscene tasks and useradd
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
X-List-Received-Date: Thu, 26 Jan 2012 11:38:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Bug 1721 about useradd dependency issues has surfaced some questions
about the setscene tasks and when and how they should be running.

One of the key questions is whether the setscene tasks should honour
dependencies and what order they should run in. 

When sstate was created, it was designed with the aim of solving many of
the issues OE had at the time. Some of these were:

a) A way to package up prebuilt binary output
b) Being able to detect when that output was still valid
c) Being able to accelerate builds using valid prebuilt binaries
d) Handle this caching of binary objects generically in a extensible way

I believe sstate combined with the checksum/signature code is achieving
many of these objectives but for c), there was some further reaching
vision we've yet to really achieve. Its easiest to think about this with
an example.

Imagine you have a fully populated sstate cache and a clean tmp
directory and then you "bitbake some-image". What you're interested in
is the image being generated. To generate the image, is the target
sysroot required at all? No, its clearly not. What is really needed is
some subset of binaries in the -native sysroot and the relevant package
files.

The vision was that the system would figure this out and install only
the subset of sstate files required and skip the target sysroot
population in this case. If you then did decide to compile something, a
subsequent command might generate the target sysroot if it was needed.

When you look at the setscene code, its for this reason the code works
in reverse dependency order. If A depends on B which depends on C, it
will install A first, then B, then C.

There were problems with the code that decided where to stop on a given
dependency chain. This was mainly due to problems with interpreting
DEPENDS. If A DEPENDS on B and C-native, it expects *all* depends on
C-native to be installed but doesn't usually care about B's
dependencies. For that reason I relatively recently removed that code
since installing all dependencies is at least "safe" and we could work
on this problem later once sstate was working well. Completeness and
functionality first, optimisation later!

In the useradd case, it expects that the dependencies on base-passwd,
shadow-sysroot and shadow-native are all ready in the sysroot before the
setscene for a useradd recipe is installed. There is therefore a request
that the setscene code get "fixed" to work in dependency order.

Part of the reason we have separate "setscene" task execution at all was
so we could totally change the dependency ordering. If we'd wanted to
use the same dependency ordering, we likely could have just reused the
existing runqueue task execution code. If we change the dependency
order, its going to make achieving the sstate performance optimisations
mentioned above all that much harder to achieve.

When this dependency issue is first mentioned to people, their immediate
reaction is "we must have proper dependency ordering". I would ask that
people think about why we'd need that. The setscene tasks are
effectively extraction of tarballs to reconstruct previous output. I can
think of two cases where we've had ordering issues which are useradd,
and registration of certain docbook/xml catalogs. Both are basically
cases where we have a central file which requires changes from multiple
sources.

Assuming we did decide to change the setscene dependency ordering, does
it solve all our problems? I'm not sure it does. For example, what
happens if I remove the base-basswd sstate file from the cache, then try
a build? This is a perfectly valid scenario. The system will cope by
having things like dbus's setscene fail and then fallback to rebuilding
dbus entirely but I'd like to think we could do better.

There is also a question about ordering. I suspect the current useradd
code is still broken since it constructs the passwd/group files *after*
it extracts the sstate tarball and likely doesn't preserve the actual ID
values, or at least ensure the mappings are the same.

All things considered, I think we have a can of worms which we haven't
fully understood yet.

I am reluctant to force the setscene dependency issue to solve useradd
at the expense of some of the optimisations it was originally intended
to allow. If we don't do that, what else can we do?

I suspect we might have to add a new class of file to sstate which is an
"incrementally constructed one". We could include a copy of such files
in the sstate cache and have it install them if not already present,
else "merge" the contents. This mechanism could be implemented in python
so avoid dependencies and be generic, solving the doc catalogue and
passwd/group issues in one go.

I'm going to continue to think about and work on this but I thought
summarising the situation might be useful so people understand all the
different dimensions to the problem.

Cheers,

Richard




