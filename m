Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qoaaj-0000fj-Be for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 14:30:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73CQ7pn025087
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 13:26:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23958-09 for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2011 13:26:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73CPwhD025081
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 13:25:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <A8C5CE71-29E0-4C18-9D66-7CE0EFAE4782@kernel.crashing.org>
References: <3C9A62B9-7C88-4DF0-A379-8E58955B89CD@kernel.crashing.org>
	<A8C5CE71-29E0-4C18-9D66-7CE0EFAE4782@kernel.crashing.org>
Date: Wed, 03 Aug 2011 13:25:41 +0100
Message-ID: <1312374341.2344.661.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: help with gcc-configure-common bug
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
X-List-Received-Date: Wed, 03 Aug 2011 12:30:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-02 at 10:36 -0500, Kumar Gala wrote:
> On Aug 1, 2011, at 1:58 PM, Kumar Gala wrote:
> 
> > I'm trying to track down a bug related the following in gcc-configure-common.inc.  I know there is one bug in the sed line, but when I fix that I run into a second issue.  I'm trying to understand what we think the following two lines are trying to attempt:
> > 
> >        SYSTEMLIBS_DIR=`dirname ${SYSTEMLIBS}`
> >        [ "$SYSTEMLIBS_DIR" = "/" ] && SYSTEMLIBS_DIR=""
> > 
> > any ideas?
> > 
> >> From the commit log we expect something like:
> >        #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR"/ld-linux-x86-64.so.2"
> >        and we define SYSTEMLIBS_DIR in defaults.h.
> > 
> > so its seems if SYSTEMLIBS = 'lib', that we end up with:
> > 	#define SYSTEMLIBS ""
> > 
> > and thus becomes:
> > 	GLIBC_DYNAMIC_LINKER64 "ld-linux-x86-64.so.2"
> > 
> > which ends up being wrong.
> > 
> > - k
> > 
> > do_configure_prepend () {
> >        # Change the default dynamic linker path, only useful for SDK, other's value
> >        # are not changed according to the SYSTEMLIBS_DIR
> >        sed -i ${S}/gcc/config/*/linux*.h -e \
> >                's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 SYSTEMLIBS_DIR\2#'
> > 
> >        SYSTEMLIBS_DIR=`dirname ${SYSTEMLIBS}`
> >        [ "$SYSTEMLIBS_DIR" = "/" ] && SYSTEMLIBS_DIR=""
> >        # teach gcc to find correct target includedir when checking libc ssp support
> >        mkdir -p ${B}/gcc
> >        echo "NATIVE_SYSTEM_HEADER_DIR = ${SYSTEMHEADERS}" > ${B}/gcc/t-oe
> >        cat ${S}/gcc/defaults.h | grep -v "\#endif.*GCC_DEFAULTS_H" > ${B}/gcc/defaults.h.new
> >        cat >>${B}/gcc/defaults.h.new <<_EOF
> > #ifndef STANDARD_INCLUDE_DIR
> > #define STANDARD_INCLUDE_DIR "${SYSTEMHEADERS}"
> > #endif
> > #ifndef STANDARD_STARTFILE_PREFIX_1
> > #define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}"
> > #endif
> > #ifndef STANDARD_STARTFILE_PREFIX_2
> > #define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
> > #endif
> > #define SYSTEMLIBS_DIR "$SYSTEMLIBS_DIR"
> > #endif /* ! GCC_DEFAULTS_H */
> > _EOF
> >        mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h
> > }
> 
> Would really love if anyone knows what is suppose to be going on with SYSTEMLIBS_DIR to chime in here.

Ah, I can help here :)

We only have one gcc source checkout with the shared work directory.
Each multilib (or sdk build) needs to customise SYSTEMLIBS depending on
its configuration. This is why its being done in the defaults.h file in
${B} instead of files in ${S}.

We likely should do the substitutions in ${S} at unpack time to make
this clearer.

Cheers,

Richard





