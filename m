Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6511962051
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 16:16:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jun 2013 09:16:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,807,1363158000"; d="scan'208";a="348590764"
Received: from unknown (HELO helios.localnet) ([10.252.121.228])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2013 09:16:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Javier Viguera <javier.viguera@digi.com>
Date: Wed, 05 Jun 2013 17:16:03 +0100
Message-ID: <2054359.tVZUoD7RsO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-23-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <519A1B6A.8080600@digi.com>
References: <519A1B6A.8080600@digi.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gst-plugins-base tremor build time dependence?
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
X-List-Received-Date: Wed, 05 Jun 2013 16:16:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Javier,

On Monday 20 May 2013 14:47:38 Javier Viguera wrote:
> In gst-plugins-base package there is a patch that explicitly removes the
> '-DTREMOR' symbol so the package compiles without that support:
> 
> <http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-multimedia
> /gstreamer/gst-plugins-base-0.10.36/gst-plugins-base-tremor.patch>
> 
> But then the gst-plugins-base bitbake recipe has a build-time dependence
> on tremor:
> 
> <http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-multimedia
> /gstreamer/gst-plugins-base_0.10.36.bb>
> 
> DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora
> util-linux *tremor*"
> 
> Is this expected?
> Can tremor build-time dependence be removed?
> 
> If this is the case i can cook up a patch, but I'm not sure if I'm
> missing something else.

I just had a look at this. It's not at all clear from the commit message that 
added this patch (which was quite a long time ago) but I don't think it can be 
removed outright; without tremor the ivorbisdec plugin won't be built, so 
despite the removal of -DTREMOR, tremor still appears to be being used. If 
this is something you don't want then it's probably more a case of needing to 
introduce a PACKAGECONFIG option to disable it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

