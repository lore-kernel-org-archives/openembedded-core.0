Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id C91A1607F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 22:56:47 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id ox1so5640022veb.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 15:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=1ujEhdKATxME0laAaV6ii9DchKjqDbg1cA7tFuzKcD0=;
	b=JxpAAxhkqUyBH0DDn4DZkHHJ1SpYaxtM1cnwfDqF4Ba6LxaOp+yV8wPs0QHiMSEqMS
	tBA493FumqBi4qAS48Wxo0ZOydxQGu0VTg/oCJ4tm9AuBiAJAEUYyAyCz8iPyfxXhKzB
	+WvzXJKv3mUsZvSXSP8O1kn6+jnyog1C7SiEGaBCZm6hzw/GR3uOkJYX4XOGipil8wQi
	cf9Y36pYXujX4hcdJRIoakXc3a6sWx6QfOYv4CdtoedNhwfUTrw2adHNF2qsUftE69oN
	CAFEtWiGwAihSnEH81gyRO26hOPPPdffK24pICQPCm+YJXPb3Lxyf0qeDfhPpJrth8/q
	WidQ==
MIME-Version: 1.0
X-Received: by 10.220.169.146 with SMTP id z18mr4037550vcy.80.1371769008247;
	Thu, 20 Jun 2013 15:56:48 -0700 (PDT)
Received: by 10.52.114.170 with HTTP; Thu, 20 Jun 2013 15:56:48 -0700 (PDT)
Date: Thu, 20 Jun 2013 15:56:48 -0700
Message-ID: <CAPhnLPBBK1=GohMDVCSGseg=DWn_Ac32p+UjjbGff585rWTG_w@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkSQJWca22F1KpW5F1o0MdumSGOF6naTEAD6qRB9cyoPeHIwD+MuCRtU38bNT94mNNS2TLC
Subject: [RFC] Utilizing LAYERVERSION_ to identify breaking changes to a layer
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
X-List-Received-Date: Thu, 20 Jun 2013 22:56:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

I know I've run into this issue and I'm going to bet that other folks
have as well.

When running some sort of continuous integration system (in my case,
yocto-autobuilder), I need to build to at least two releases back. The
problem is, sometimes, local.conf and bblayers.conf requirements
change, for example, a layer needs a BBMASK for the prior release but
can't have it for the current one or a layer gets split so that I need
to add two directories to BBLAYERS as opposed to just the one that I
used a few commits back. I currently have no great way of figuring
that out and it has causes immense amounts of pain.

I'd like to propose extending LAYERVERSION (which is already utilized
in oe-core as LAYERVERSION_core) out to other layers.

meta-angstrom LAYERVERSION_angstrom
meta-baryon LAYERVERSION_baryon
meta-beagleboard LAYERVERSION_beagleboard
meta-browser LAYERVERSION_browser
meta-fsl-arm LAYERVERSION_fsl-arm
meta-fsl-ppc LAYERVERSION_fsl-ppc
meta-guacamayo LAYERVERSION_guacamayo
meta-intel LAYERVERSION_intel
meta-minnow LAYERVERSION_minnow
meta-ti LAYERVERSION_ti
meta-xilinx LAYERVERSION_xilinx
meta-yocto LAYERVERSION_yocto

For bsp layers with multiple machine layers, like meta-intel or
meta-xilinx, I'd suggest something like:

LAYERVERSION_layername_machinename
e.g.
LAYERVERSION_intel_nuc
LAYERVERSION_xilinx_kc705

I'll be happy to do the above layers if folks approve of this
addition. Or, alternatively, if anyone has a better suggestion to be
able to identify breaking changes, I'm all ears.

-b

-- 
Elizabeth Flanagan
Yocto Project
Build and Release

