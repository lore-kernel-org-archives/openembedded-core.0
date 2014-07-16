Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E1DB1701E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 20:50:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2014 13:45:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,673,1400050800"; d="scan'208";a="574287656"
Received: from unknown (HELO [10.255.12.224]) ([10.255.12.224])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2014 13:50:38 -0700
Message-ID: <53C6E59D.4080104@linux.intel.com>
Date: Wed, 16 Jul 2014 13:50:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Joe Slater <jslater@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1405536014-16921-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1405536014-16921-1-git-send-email-jslater@windriver.com>
Subject: Re: (resending) [PATCH 1/1] rpm: compile rpmqv.c instead of rpmqv.cc
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
X-List-Received-Date: Wed, 16 Jul 2014 20:50:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/16/2014 11:40 AM, Joe Slater wrote:
> Some versions of gcc will put a reference to __gxx_personality_v0
> into rpm.o and rpmbuild.o.  This means we must link using g++,
> and Makefile does not.
>
> Go back to using rpmqv.c (which is currently identical to rpmqv.cc).
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>   .../recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch |   25 ++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    1 +
>   2 files changed, 26 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
>
> diff --git a/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch b/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
> new file mode 100644
> index 0000000..0996448
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
> @@ -0,0 +1,25 @@
> +

Patch needs Signed-off-by: and Upstream-Status tags please

Thanks
	Sau!

> +Some versions of gcc, 4.4.5 for example, will put a reference to __gxx_personality_v0
> +into rpm.o and rpmbuild.o.  This means we must link with g++, and the Makefile we
> +generate does not.
> +
> +So, go back to using rpmqv.c (which is currently identical to rpmqv.cc).
> +
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -127,13 +127,13 @@ rpm_SOURCES =		build.c
> + rpm_LDFLAGS =		@LDFLAGS_STATIC@ $(LDFLAGS)
> + rpm_LDADD =		rpm.o $(myLDADD)
> + rpm.o:	$(top_srcdir)/rpmqv.c
> +-	$(COMPILE) -DIAM_RPMBT -DIAM_RPMDB -DIAM_RPMEIU -DIAM_RPMK -DIAM_RPMQV -o $@ -c $(top_srcdir)/rpmqv.cc
> ++	$(COMPILE) -DIAM_RPMBT -DIAM_RPMDB -DIAM_RPMEIU -DIAM_RPMK -DIAM_RPMQV -o $@ -c $(top_srcdir)/rpmqv.c
> +
> + rpmbuild_SOURCES =	build.c
> + rpmbuild_LDFLAGS =	@LDFLAGS_STATIC@ $(LDFLAGS)
> + rpmbuild_LDADD =	rpmbuild.o $(myLDADD)
> + rpmbuild.o: $(top_srcdir)/rpmqv.c
> +-	$(COMPILE) -DIAM_RPMBT -o $@ -c $(top_srcdir)/rpmqv.cc
> ++	$(COMPILE) -DIAM_RPMBT -o $@ -c $(top_srcdir)/rpmqv.c
> +
> + .PHONY:	splint
> + splint:
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> index 15c1738..8fec656 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> @@ -92,6 +92,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
>   	   file://rpm-fix-logio-cp.patch \
>   	   file://rpm-db5-or-db6.patch \
>   	   file://rpm-disable-Wno-override-init.patch \
> +	   file://rpmqv_cc_b_gone.patch \
>   	  "
>
>   # Uncomment the following line to enable platform score debugging
>

