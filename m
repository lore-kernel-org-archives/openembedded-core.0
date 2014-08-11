Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 037B970B0E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 01:19:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7B1JXYj021878
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 18:19:33 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sun, 10 Aug 2014 18:19:32 -0700
Message-ID: <53E81A22.5060503@windriver.com>
Date: Mon, 11 Aug 2014 09:19:30 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1407227521.git.Chong.Lu@windriver.com>
	<74981f17a6e413de376a24ca45126e7f8c16482b.1407227521.git.Chong.Lu@windriver.com>
In-Reply-To: <74981f17a6e413de376a24ca45126e7f8c16482b.1407227521.git.Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 2/3] strace: fix ptest execution failure
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
X-List-Received-Date: Mon, 11 Aug 2014 01:19:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 08/05/2014 04:33 PM, Chong Lu wrote:
> ptest needs runtest-TESTS target.
> serial-tests is required to generate this target.
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   .../strace/strace-4.8/Makefile-ptest.patch              | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/strace/strace-4.8/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace-4.8/Makefile-ptest.patch
> index f5556b2..3a0eb39 100644
> --- a/meta/recipes-devtools/strace/strace-4.8/Makefile-ptest.patch
> +++ b/meta/recipes-devtools/strace/strace-4.8/Makefile-ptest.patch
> @@ -1,11 +1,13 @@
>   strace: Add ptest
>   
> +Upstream-Status: Inappropriate
> +
>   Signed-off-by: Gabriel Barbu <gabriel.barbu@enea.com>
> -Upstream-Status: Pending
> +Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>   
>   --- old/tests/Makefile.am	2013-07-23 13:44:24.660481381 +0200
>   +++ new/tests/Makefile.am	2013-07-23 16:22:42.937654391 +0200
> -@@ -9,3 +9,20 @@
> +@@ -9,3 +9,21 @@
>    EXTRA_DIST = init.sh $(TESTS)
>    
>    CLEANFILES = check.log
> @@ -18,6 +20,7 @@ Upstream-Status: Pending
>   +	install -d $(DESTDIR)/$(TESTDIR)
>   +	cp $(BUILDDIR)/$(TESTDIR)/Makefile $(DESTDIR)/$(TESTDIR)
>   +	sed -i -e 's/^Makefile:/_Makefile:/' $(DESTDIR)/$(TESTDIR)/Makefile
> ++	sed -i -e 's/bash/sh/' $(DESTDIR)/$(TESTDIR)/Makefile
>   +	for file in $(check_PROGRAMS); do \
>   +		install $(BUILDDIR)/$(TESTDIR)/$$file $(DESTDIR)/$(TESTDIR); \
>   +	done
> @@ -26,3 +29,13 @@ Upstream-Status: Pending
>   +		sed -i -e 's/$${srcdir=.}/./g' $(DESTDIR)/$(TESTDIR)/$$file; \
>   +	done
>   +	sed -i -e 's/$$srcdir/./g' $(DESTDIR)/$(TESTDIR)/net
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -6,7 +6,7 @@ AC_INIT([strace],
> + AC_CONFIG_SRCDIR([strace.c])
> + AC_CONFIG_AUX_DIR([.])
> + AC_CONFIG_HEADERS([config.h])
> +-AM_INIT_AUTOMAKE([foreign dist-xz no-dist-gzip silent-rules])
> ++AM_INIT_AUTOMAKE([foreign dist-xz no-dist-gzip silent-rules serial-tests])
> + AM_MAINTAINER_MODE
> + AC_CANONICAL_HOST


