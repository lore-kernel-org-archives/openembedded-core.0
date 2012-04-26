Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SNDoO-0004Fz-2c
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Apr 2012 03:48:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3Q1cM9a021035
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2012 18:38:22 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 25 Apr 2012 18:38:22 -0700
Date: Wed, 25 Apr 2012 20:38:05 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20120425203805.71113201@wrlaptop>
X-Mailer: Claws Mail 3.7.8 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Toolchain library whitelisting: A first pass
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
X-List-Received-Date: Thu, 26 Apr 2012 01:48:00 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

This is a followup from some chat in #yocto and elsewhere.  To make a
long story short, some of the commercial vendors (like Wind River) tend
to ship prebuilt binaries for glibc, and want to require these binaries
to be used as-is (unless the user has done something special and is
building libc).  It would be convenient for people providing
replacement toolchain layers to be able to catch attempts to build
something that will fail because there are no corresponding libc
binaries.

With prebuilt libraries, the library is not always built with the exact
same flags that everything else is, but it needs to be ABI-compatible
with them.  With that in mind, I coin the name "TUNEABI" to refer to
the descriptor for a prebuilt library.  This is basically like a
tuning, but it's special in that multiple tunings can refer back to it
as a thing they are based on or will work with.  So I define a couple
of values:

1.  TUNEABI_WHITELIST.  This is a space-separated list of tuneabi
values which are supported.  If this list does not exist, nothing
happens; the check is a no-op.
2.  TUNEABI_OVERRIDE.  If this value exists, it suppresses the check
even if TUNEABI_WHITELIST is set.  This is sort of a placeholder for
whatever people want to do about specifying a rebuild instead of using
prebuilts.
3.  TUNEABI_tune-foo.  This specifies the (space-separated list of)
tuneabis that can support the tuning foo.  If absent, the tuning name
is used.

Intended use:  Imagine that you are distributing a toolchain layer
which has only one ARM library, which is armv7 thumb2, you would
specify TUNEABI_WHITELIST = armv7at.  Then a build for armv7at would
work, but a build for armv6t would fail.  If you are using the
interwork feature, you might also specify TUNEABI_tune-armv7a =
armv7at; then armv7a builds would be allowed also.

The intent of this is that if you're providing a toolchain, and you
want to support a limited set of prebuilt libraries, this check should
be able to let you specify what you need without necessarily having to
replace all the existing tuning and configurations.  All you have to do
is provide TUNEABI_tune-foo settings for any tunings you know to work
with your libraries, and a TUNEABI_WHITELIST value, and the sanity
check should catch everything likely.

Thoughts, feedback?

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


