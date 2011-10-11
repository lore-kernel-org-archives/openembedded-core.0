Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RDjKZ-0004Az-B9
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 22:53:44 +0200
Received: from mail-ey0-f180.google.com ([209.85.215.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 11 Oct 2011 13:47:59 -0700
Received: by eyg5 with SMTP id 5so23170eyg.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 13:47:58 -0700 (PDT)
Received: by 10.223.62.16 with SMTP id v16mr43223108fah.35.1318366078025;
	Tue, 11 Oct 2011 13:47:58 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id o22sm114351fab.11.2011.10.11.13.47.56
	(version=SSLv3 cipher=OTHER); Tue, 11 Oct 2011 13:47:57 -0700 (PDT)
Message-ID: <4E94AB7A.6050603@intel.com>
Date: Tue, 11 Oct 2011 13:47:54 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317403283-17471-1-git-send-email-msm@freescale.com>
In-Reply-To: <1317403283-17471-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH v3 01/16] libnl2: Fix a race on route/pktloc_syntax.h
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
X-List-Received-Date: Tue, 11 Oct 2011 20:53:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/30/2011 10:21 AM, Matthew McClintock wrote:
> From: Tom Rini<tom_rini@mentor.com>
>
> At issue is that route/pktloc.c (not generated) depends on
> route/pktloc_syntax.h (generated).
>
> Signed-off-by: Tom Rini<tom_rini@mentor.com>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
>   .../libnl/fix-pktloc_syntax_h-race.patch           |   26 ++++++++++++++++++++
I just noticed that this patch get put in the libnl directory, not the 
libnl-2.0 directory.

Can you pull all the libnl changes together and resbumit this, also is 
there a reason you can not just update this to the latest libnl 3.2.1?

Cab you test that against the wpa-supplicant which seems to be libnl's 
sole dependee.

Thanks
	Sau!


>   meta/recipes-support/libnl/libnl_2.0.bb            |    3 +-
>   2 files changed, 28 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
>
> diff --git a/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch b/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
> new file mode 100644
> index 0000000..05d75db
> --- /dev/null
> +++ b/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
> @@ -0,0 +1,26 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +libnl has progressed to 0.3.2 and there does not appear to be any
> +"make -j" issues with this build after my limited testing on that
> +newer version so we can assume this issue is fixed upstream
> +
> +Index: libnl-2.0/lib/Makefile.am
> +===================================================================
> +--- libnl-2.0.orig/lib/Makefile.am
> ++++ libnl-2.0/lib/Makefile.am
> +@@ -27,11 +27,15 @@ CLEANFILES = \
> + 	route/pktloc_grammar.c route/pktloc_grammar.h \
> + 	route/pktloc_syntax.c route/pktloc_syntax.h
> +
> ++BUILT_SOURCES = route/pktloc_syntax.h route/pktloc_grammar.h
> ++
> + # Hack to avoid using ylwrap. It does not function correctly in combination
> + # with --header-file=
> ++route/pktloc_grammar.h: route/pktloc_grammar.c
> + route/pktloc_grammar.c: route/pktloc_grammar.l
> + 	$(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
> +
> ++route/pktloc_syntax.h: route/pktloc_syntax.c
> + route/pktloc_syntax.c: route/pktloc_syntax.y
> + 	$(YACC) -d $(YFLAGS) -o $@ $^
> +
> diff --git a/meta/recipes-support/libnl/libnl_2.0.bb b/meta/recipes-support/libnl/libnl_2.0.bb
> index 0dfcaf6..5339846 100644
> --- a/meta/recipes-support/libnl/libnl_2.0.bb
> +++ b/meta/recipes-support/libnl/libnl_2.0.bb
> @@ -6,10 +6,11 @@ LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=2b41e13261a330ee784153ecbb6a82bc"
>
>   DEPENDS = "flex-native bison-native"
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI= "http://www.infradead.org/~tgr/libnl/files/${BPN}-${PV}.tar.gz \
>             file://fix-makefile.patch \
> +	  file://fix-pktloc_syntax_h-race.patch \
>            "
>
>   SRC_URI[md5sum] = "6aaf1e9802a17a7d702bb0638044ffa7"



