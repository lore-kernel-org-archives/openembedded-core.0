Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3990C6AC7B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 02:51:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s822pcuu011055
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Sep 2014 19:51:38 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 19:51:38 -0700
Message-ID: <540530B8.8040107@windriver.com>
Date: Tue, 2 Sep 2014 10:51:36 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
References: <CAP9ODKpWHy4XW6OVs34=-p+GRK6iOLvgsAqr22obSAaj9_2SDQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpWHy4XW6OVs34=-p+GRK6iOLvgsAqr22obSAaj9_2SDQ@mail.gmail.com>
Subject: Re: Error while building qemu without X11 support.
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
X-List-Received-Date: Tue, 02 Sep 2014 02:51:45 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


On 09/02/2014 10:30 AM, Otavio Salvador wrote:
> Hello,
>
> During our regression tests we found the following error:
>
> directfb fsl-image-machine-test@imx6qsabresd (1/4) consider defining a
> PREFERRED_PROVIDER entry to match jpeg
> directfb fsl-image-machine-test@imx6qsabresd (1/4) ERROR: Nothing
> PROVIDES 'libxext-native' (but

Did you use meta/recipes-graphics/xorg-lib/libxext_git.bb ? This one
doesn't provide native, but libxext_1.3.2.bb does.

Seems that we need remove the git version since it is older:

PV = "1.0.99.1+gitr${SRCPV}"

And doesn't see a license issue.

// Robert

> virtual:native:.../sources/poky/meta/recipes-devtools/qemu/qemu_2.1.0.bb
> DEPENDS on or otherwise requires it)
> directfb fsl-image-machine-test@imx6qsabresd (1/4) ERROR:
> libxext-native was skipped: missing required distro feature 'x11' (not
> in DISTRO_FEATURES)
> directfb fsl-image-machine-test@imx6qsabresd (1/4) Runtime target
> 'pango' is unbuildable, removing...
> directfb fsl-image-machine-test@imx6qsabresd (1/4) Missing or
> unbuildable dependency chain was: ['pango', 'qemu-native',
> 'libxext-native']
> directfb fsl-image-machine-test@imx6qsabresd (1/4) Runtime target
> 'packagegroup-core-directfb' is unbuildable, removing...
>
> Do someone know how to fix it?
>

