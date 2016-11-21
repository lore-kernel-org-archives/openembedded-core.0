Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 88055601D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 12:57:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 21 Nov 2016 04:57:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,675,1473145200"; d="scan'208";a="903926379"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 21 Nov 2016 04:57:11 -0800
Received: from drozhkov-desk.fi.intel.com (drozhkov-desk.fi.intel.com
	[10.237.72.60])
	by linux.intel.com (Postfix) with ESMTP id CD5096A4006;
	Mon, 21 Nov 2016 04:56:29 -0800 (PST)
Message-ID: <1479733029.29591.30.camel@linux.intel.com>
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 14:57:09 +0200
In-Reply-To: <20161110061149.20570-1-raj.khem@gmail.com>
References: <20161110061149.20570-1-raj.khem@gmail.com>
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Subject: Re: [RFT][PATCH] systemd: Upgrade to 232
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
X-List-Received-Date: Mon, 21 Nov 2016 12:57:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Raj,

Could you please add this change


diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-
core/systemd/systemd_232.bb
index 892a109..def6e05 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -275,7 +275,7 @@ python populate_packages_prepend (){
     systemdlibdir = d.getVar("rootlibdir", True)
     do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s',
'Systemd %s library', extra_depends='', allow_links=True)
 }
-PACKAGES_DYNAMIC += "^lib(udev|systemd).*"
+PACKAGES_DYNAMIC += "^lib(udev|systemd|nss).*"
 
 PACKAGES =+ "\
     ${PN}-gui \


to the patch, so libnss-resolve would be packaged properly.

BR,
Dmitry

On Wed, 2016-11-09 at 22:11 -0800, Khem Raj wrote:
> * Drop support for rcS.d SysV init scripts.
>   These are prone to cause dependency loops, and almost all packages
> with
>   rcS scripts now ship a native systemd service.
> 
> * Drop mount propagation patch, it only happens with libseccomp, OE
> doesnt
>   enable it
> 
> * kdbus option has disappeared from configure
> 
> * Ignore dev-so for PN now since systemd introduced private .so see
>   https://github.com/systemd/systemd/issues/3810
> 


