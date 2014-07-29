Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F416770908
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 08:25:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Jul 2014 01:25:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,755,1400050800"; d="scan'208";a="550562120"
Received: from cfitzsim-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.251])
	by orsmga001.jf.intel.com with ESMTP; 29 Jul 2014 01:25:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Date: Tue, 29 Jul 2014 09:25:20 +0100
Message-ID: <4190240.9FhIxat4L9@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.6-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <CADV-EXGEW1dQb1x6+20myn3X4JfUjPRfkBj2hon8kuX35ap91g@mail.gmail.com>
References: <CADV-EXGEW1dQb1x6+20myn3X4JfUjPRfkBj2hon8kuX35ap91g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Specifying MACHINE inside distro config only
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
X-List-Received-Date: Tue, 29 Jul 2014 08:25:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Yevhen,

On Tuesday 29 July 2014 09:55:20 Yevhen Kyriukha wrote:
> I have several distro config files. I bind each of them to single machine
> like this:
> 
> # cat conf/distro/mydistro.conf
> 
> DISTRO = "mydistro"
> DISTRO_NAME = "My Distro"
> DISTRO_VERSION = "1.01"
> MACHINE = "cedartrail"
> ...
> 
> I also created "conf/auto.conf" file with following content:
> DISTRO = "mydistro"
> to specify distro to build.
> 
> The problem is that without specifying MACHINE in "conf/auto.conf" I get
> following error:
> 
> ERROR:  OE-core's config sanity checker detected a potential
> misconfiguration.
>     Either fix the cause of this error or at your own risk disable the
> checker (see sanity.conf).
>     Following is the list of potential problems / advisories:
> 
>     TUNE_ARCH is unset. Please ensure your MACHINE configuration includes a
> valid tune configuration file which will set this correctly.
> Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH
> ().Toolchain tunings invalid:
> No tuning found for default multilib.
> 
> 
> I use a script to change distro (in "auto.conf") and each distro knows its
> machine to build for. So specifying MACHINE in "auto.conf" isn't desirable.
> 
> Can someone tell what did I miss?

This is caused by a subtlety in the way that we have structured the 
configuration files. Here's a snippet from meta/conf/bitbake.conf (which aside 
from bblayers.conf is the only file that BitBake knows to look at by itself):

---------------- snip ----------------
##################################################################
# Include the rest of the config files.
##################################################################

require conf/abi_version.conf
include conf/site.conf
include conf/auto.conf
include conf/local.conf
include conf/build/${BUILD_SYS}.conf
include conf/target/${TARGET_SYS}.conf
include conf/machine/${MACHINE}.conf
include conf/machine-sdk/${SDKMACHINE}.conf
include conf/distro/${DISTRO}.conf
include conf/distro/defaultsetup.conf
include conf/documentation.conf
include conf/licenses.conf
require conf/sanity.conf
---------------- snip ----------------

These statements are parsed in order; thus, by the time the distro config has 
been parsed, it's too late to include the right machine config file, that's 
already happened. (These lines are in this order deliberately; the reason 
being we want to allow the distro config to easily override things that are 
specified in the machine configuration if desired.)

So the answer is you simply can't do what you're trying to do with the way 
that OE is set up. You need to set the MACHINE value from local.conf / 
auto.conf, or the external environment.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

