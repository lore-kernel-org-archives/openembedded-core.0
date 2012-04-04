Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFTc5-0003to-8a
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 19:03:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Apr 2012 09:54:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125306592"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2012 09:54:05 -0700
Message-ID: <4F7C7CAD.9050408@linux.intel.com>
Date: Wed, 04 Apr 2012 09:54:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1333135290-13424-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1333135290-13424-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] webkit: Fix build with gcc-4.7
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
X-List-Received-Date: Wed, 04 Apr 2012 17:03:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/30/2012 12:21 PM, Khem Raj wrote:
> Include unistd.h for all linux and not
> just for android.
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../recipes-sato/webkit/files/function-scope.patch |   21 ++++++++++++++++++++
>   meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    3 +-
>   2 files changed, 23 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-sato/webkit/files/function-scope.patch
>
> diff --git a/meta/recipes-sato/webkit/files/function-scope.patch b/meta/recipes-sato/webkit/files/function-scope.patch
> new file mode 100644
> index 0000000..a20a805
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/files/function-scope.patch
> @@ -0,0 +1,21 @@
> +we need to include unistd.h on all linux platforms therefore
> +extend the conditional inclusion accordingly
> +
> +This gets proper declation of sleep() into the source file
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +Index: webkit-gtk-1.7.2+svnr101488-r3/Tools/DumpRenderTree/TestNetscapePlugIn/PluginTest.cpp
> +===================================================================
> +--- webkit-gtk-1.7.2+svnr101488-r3.orig/Tools/DumpRenderTree/TestNetscapePlugIn/PluginTest.cpp	2012-03-30 12:11:04.912613223 -0700
> ++++ webkit-gtk-1.7.2+svnr101488-r3/Tools/DumpRenderTree/TestNetscapePlugIn/PluginTest.cpp	2012-03-30 12:14:21.840622752 -0700
> +@@ -29,7 +29,7 @@
> + #include<assert.h>
> + #include<string.h>
> +
> +-#if defined(ANDROID)
> ++#if defined(__linux__)
> + #include<unistd.h>
> + #endif
> +
> diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> index 9181c2c..7db573d 100644
> --- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> +++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> @@ -15,7 +15,7 @@ SRCREV_FORMAT = "source"
>
>   SRCREV = "101488"
>   PV = "1.7.2+svnr${SRCPV}"
> -PR = "r3"
> +PR = "r4"
>
>   SRC_URI = "\
>     svn://svn.webkit.org/repository/webkit/trunk/;module=Source;proto=http;name=source \
> @@ -28,6 +28,7 @@ SRC_URI = "\
>     file://GNUmakefile.am \
>     file://gtk-doc.make \
>     file://nodolt.patch \
> +  file://function-scope.patch \
>    "
>
>   S = "${WORKDIR}/"

Merged this along with the 2 QT patches for gcc to OE-Core

Thanks
	Sau!


