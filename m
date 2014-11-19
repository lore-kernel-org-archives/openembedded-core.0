Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 9B59E6AC93
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 18:00:01 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1Xr9Xs-0005nz-01 for openembedded-core@lists.openembedded.org;
	Wed, 19 Nov 2014 19:00:00 +0100
Received: from S0106001c10b78396.vc.shawcable.net ([96.49.26.10])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 18:59:59 +0100
Received: from jurobystricky by S0106001c10b78396.vc.shawcable.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 18:59:59 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Juro Bystricky <jurobystricky@hotmail.com>
Date: Wed, 19 Nov 2014 17:59:49 +0000 (UTC)
Message-ID: <loom.20141119T185456-477@post.gmane.org>
References: <cover.1415390286.git.peter.seebach@windriver.com>
	<d2ce73488a8afb7a8d10286da138810d30b4a4be.1415390286.git.peter.seebach@windriver.com>
	<1415457765.2820.21.camel@linuxfoundation.org>
	<1415703324.2820.37.camel@linuxfoundation.org>
	<20141111122956.3e842de1@e6410-2>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 96.49.26.10 (Mozilla/5.0 (X11; Ubuntu; Linux x86_64;
	rv:33.0) Gecko/20100101 Firefox/33.0)
Subject: Re: [PATCH 1/1] eglibc-use-option-groups.patch: Several fixups
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
X-List-Received-Date: Wed, 19 Nov 2014 18:00:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Peter Seebach <peter.seebach@...> writes:

> 
> On Tue, 11 Nov 2014 10:55:24 +0000
> Richard Purdie <richard.purdie@...> wrote:
> 
> > > Whilst I haven't 100% confirmed it,
> > >
https://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/102/steps
/BuildImages/logs/stdio
> > > looks like it may well be as a result of this change (which was included
> > > in the master-next build in question)...  
> > 
> > It is 100% confirmed now, with the patch reverted there was a green
> > build.
> 
> Drat. I'll study this more and try to figure out what I missed.
> 
> -s

Peter, I noticed you have another patch that fixes this issue:

@@ -16469,7 +16452,7 @@ Index: git/include/libc-symbols.h
-#define HAVE_MBSTATE_T 1
-#define HAVE_MBSRTOWCS 1
+
-+#if __OPTION_EGLIBC_LOCALE_CODE
++#if defined(__OPTION_EGLIBC_LOCALE_CODE) && __OPTION_EGLIBC_LOCALE_CODE
+# define HAVE_MBSTATE_T 1
+# define HAVE_MBSRTOWCS 1
+#endif

This will fix the the issue, but (please correct me if I'm wrong) 
the way I see it, since__OPTION_EGLIBC_LOCALE_CODE is defined in 
gnu/option-groups.h, which is NOT included libc-symbols.h and hence
 
	#if defined(__OPTION_EGLIBC_LOCALE_CODE) 
 
will always evaluate as false and HAVE_MBSTATE_T will be never defined.

I am not sure why the HAVE_MBSTATE_T needs to be conditioned at all, my
understanding is
it is defined if the file <wchar.h> contains type definition "mbstate_t".
This typedef either exists or not and saying it not exists when in fact 
it does might be confusing (as it already is for me) and I don't see any 
relation with __OPTION_EGLIBC_LOCALE_CODE.


The only place in glibc I could find that uses HAVE_MBSTATE_T is in 
fnmatch.c:

#if defined _LIBC
# include <gnu/option-groups.h>
#endif

#  if (HAVE_MBSTATE_T && HAVE_MBSRTOWCS) || (_LIBC &&
__OPTION_EGLIBC_LOCALE_CODE)
#   define HANDLE_MULTIBYTE    1
#  endif

To me it seems it is actually HANDLE_MULTIBYTE that we want conditioned 
with a new patch, resulting in something like:

#if defined _LIBC
# include <gnu/option-groups.h>
#endif

#if (HAVE_MBSTATE_T && HAVE_MBSRTOWCS)
#  if _LIBC 
#    if __OPTION_EGLIBC_LOCALE_CODE
#      define HANDLE_MULTIBYTE    1
#    endif
#  else 
#    define HANDLE_MULTIBYTE    1
#  endif
#endif

Incidentally, I tried a core-image-minimal build with unconditioned
HAVE_MBSTATE_T and encountered no problems, just like you did originally.
This would imply poky-tiny problem is a probably a different problem.
(The suggested patch in fnmatch.c could possibly fix it as well)

One last unrelated thing: I believe in the patch you missed one ".out"
extension, 
I think it should be:

...
++ $(objpfx)tst-pcre-mem.out $(objpfx)tst-boost-mem.out
...

instead of 

...
++ $(objpfx)tst-pcre-mem $(objpfx)tst-boost-mem.out
...





