Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 57CED70018
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 07:51:50 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Feb 2018 23:51:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,396,1515484800"; d="scan'208";a="20305723"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga007.jf.intel.com with ESMTP; 25 Feb 2018 23:51:50 -0800
Date: Mon, 26 Feb 2018 09:54:47 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180226075447.GA8270@mbabyjoh-desk.ger.corp.intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
	<1519029438-11092-2-git-send-email-maxin.john@intel.com>
	<CAMKF1spVFhwnV2v4+O0KV-+9+a66HSK9eWyYzdJK142TZ1rXGQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spVFhwnV2v4+O0KV-+9+a66HSK9eWyYzdJK142TZ1rXGQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/27] pkgconf: upgrade to version 1.4.2
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
X-List-Received-Date: Mon, 26 Feb 2018 07:51:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Sun, Feb 25, 2018 at 11:18:58PM -0800, Khem Raj wrote:
> This is regressing kmod builds
> 
> ERROR: kmod-25+gitAUTOINC+aca4eca103-r0 do_package: QA Issue: kmod:
> Files/directories were installed but not shipped in any pack
> age:
> 
> /mnt/a/oe-build/build/tmp/work/aarch64-bec-linux/kmod/25+gitAUTOINC+aca4eca103-r0/recipe-sysroot/usr/share/bash-completion/completions/kmod
> 
> as you can see its stll carrying the sysroot prefix into DESTDIR
> 
> and this is how kmod is asserting for bash-completion dir
> 
> with_bashcompletiondir=$($PKG_CONFIG --variable=completionsdir bash-completion)
> 
> it was working fine with 1.4.0

Good catch. This patch has removed the work-around that we had to make 
pkgconf build compatible with freedesktop.org's pkg-conf in wrappers like: 

> > -            unset PKG_CONFIG_SYSROOT_DIR

Without the associated kmod fix, this will fail as above. I will revert
those wrapper changes till we decide to go with pkgconf or not.

> On Mon, Feb 19, 2018 at 12:36 AM, Maxin B. John <maxin.john@intel.com> wrote:
> > pkgconf improved compatibility with freedesktop.org pkg-config.
> > So, we don't need to unset PKG_CONFIG_SYSROOT_DIR in wrappers.
> >
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > ---
> >  meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in         | 4 +---
> > -            unset PKG_CONFIG_SYSROOT_DIR

Best Regards,
Maxin

