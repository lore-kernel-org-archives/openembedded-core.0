Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SaEnQ-0006KQ-Hz
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 01:28:48 +0200
Received: by ggnp4 with SMTP id p4so1358116ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 16:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=JbDvCcgznrgcw50VgZEJthByAKEKZR5vxRK6H+0qMas=;
	b=MpOXaKT/ZawLtMkfKbrrvX694YyXW7HNXrthhPu3SPnkX4A7nYCMDZTwNH51ToBsld
	tDGGko+7WELpI5LVq/1ST5fiUYsfxg4FzEPa1JdQnTo6brUpUeRUrHVvBSYyizbfAn1F
	T1Dro1PrTBg2L7ZVNFsWLlgH940WVQGceTZbj3zfDoaMR+UqjrhjVaAdSLfpWmPIcEbH
	YYXUv1P+byu6NYgH9peU8C6UCBj23ZJc5gCh65jVu0qtRTby9dphpLPudPMYhpusAxia
	ZfRVfg7zx8K129HXwgNeXZik6FTpZK58cLZLTYmMG0ok51s0aPAqN0i2f1qI8juwCcmF
	LLAA==
MIME-Version: 1.0
Received: by 10.50.104.167 with SMTP id gf7mr15700416igb.38.1338506307420;
	Thu, 31 May 2012 16:18:27 -0700 (PDT)
Received: by 10.64.18.10 with HTTP; Thu, 31 May 2012 16:18:27 -0700 (PDT)
Date: Fri, 1 Jun 2012 01:18:27 +0200
Message-ID: <CALbNGRQ_9XmHOQyPZUoT4rUKmjzH_vxBidYp_eJ0vsLAZNe1rw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: systemtap build fails
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
X-List-Received-Date: Thu, 31 May 2012 23:28:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I pulled today, started a build from scratch and ran into trouble with
systemtap:
...
| In file included from csclient.h:12:0,
|                  from main.cxx:24:
| cscommon.h:8:17: fatal error: ssl.h: No such file or directory
| compilation terminated.
| In file included from csclient.h:12:0,
|                  from session.cxx:18:
| cscommon.h:8:17: fatal error: ssl.h: No such file or directory
| compilation terminated.
| make[2]: *** [stap-session.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: *** [stap-main.o] Error 1
| make[2]: Leaving directory
`/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/systemtap-1.7+git1+83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81-r4/git'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/systemtap-1.7+git1+83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81-r4/git'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
...

I added --without-nss to EXTRA_OECONF and rebuild. Now stap-main.o and
stap-session.o were build but now I get
...
| modverify.c:28:21: fatal error: pk11pub.h: No such file or directory
| compilation terminated.
| make[3]: *** [staprun-modverify.o] Error 1
| make[3]: *** Waiting for unfinished jobs....
| ../../nsscommon.cxx:37:17: fatal error: ssl.h: No such file or directory
| compilation terminated.
| make[3]: *** [staprun-nsscommon.o] Error 1
| make[3]: Leaving directory
`/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/systemtap-1.7+git1+83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81-r5/git/runtime/staprun'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory
`/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/systemtap-1.7+git1+83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81-r5/git/runtime/staprun'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/systemtap-1.7+git1+83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81-r5/git'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
...

In config.log I find
...
HAVE_NSS_TRUE='#'
...

This is strange: In runtime/staprun/Makefile.am the failed files
should be excluded from build
...
if HAVE_NSS
staprun_SOURCES += modverify.c ../../nsscommon.cxx
staprun_CFLAGS += $(nss_CFLAGS)
staprun_CXXFLAGS += $(nss_CFLAGS)
staprun_LDADD += $(nss_LIBS)
endif
...

Seems HAVE_NSS_TRUE='#' has not reached runtime/staprun

Any thoughts?

Andreas


