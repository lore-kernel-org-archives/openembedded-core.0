Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7B99B65C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 16:23:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 23 Jan 2015 08:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="444251711"
Received: from vvatula-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.22.114])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2015 08:10:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Fabien Proriol <fabien.proriol@jdsu.com>
Date: Fri, 23 Jan 2015 16:23:34 +0000
Message-ID: <2460138.vO4jA8ecyG@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <1421935715-25772-1-git-send-email-fabien.proriol@jdsu.com>
References: <1421935715-25772-1-git-send-email-fabien.proriol@jdsu.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4-x11-free: Fix Qt4 to build without opengl
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
X-List-Received-Date: Fri, 23 Jan 2015 16:23:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Fabien,

On Thursday 22 January 2015 15:08:35 Fabien Proriol wrote:
> ---
>  meta/recipes-qt/qt4/qt4-x11-free.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc
> b/meta/recipes-qt/qt4/qt4-x11-free.inc index 3b1e0fe..d1b88ea 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -4,7 +4,8 @@ SUMMARY = "Cross-platform UI toolkit and application
> framework (X11 version)" DESCRIPTION = "Qt is a versatile cross-platform
> application framework -- this is the X11 version." HOMEPAGE =
> "http://qt-project.org/"
>  SECTION = "x11/libs"
> -DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext
> libxrender libxrandr libxcursor" +DEPENDS += "virtual/libx11 fontconfig
> libxft libxext libxrender libxrandr libxcursor" 
> +DEPENDS +=
> "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}

This is OK, but looking at how GL is configured in this file (via QT_GLFLAGS
which is set via ?= and thus could be overridden) I think maybe we should
check whether QT_CONFIG_FLAGS contains -opengl, i.e.:

DEPENDS += "${@bb.utils.contains('QT_CONFIG_FLAGS', '-opengl', 'virtual/libgl', '', d)}"

(In other recipes we use PACKAGECONFIG to solve this kind of thing, but for
various reasons we aren't using PACKAGECONFIG in the Qt recipes apart from
qt-mobility).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

