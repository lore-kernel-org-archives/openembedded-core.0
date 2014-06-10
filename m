Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 458DB65D6B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 21:06:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5AL6qFL011817
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 14:06:52 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Tue, 10 Jun 2014 14:06:52 -0700
Message-ID: <5397736B.5000301@windriver.com>
Date: Tue, 10 Jun 2014 16:06:51 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1402431641.git.max.eliaser@intel.com>
In-Reply-To: <cover.1402431641.git.max.eliaser@intel.com>
Subject: Re: [PATCH 0/3] Suppress Texinfo utilities invoked at build time for -cross & native recipes (revised)
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
X-List-Received-Date: Tue, 10 Jun 2014 21:06:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 6/10/14, 3:24 PM, Max Eliaser wrote:
> Hello list,
>
> As per discussion with Richard Purdie and others, I'm submitting a patch to
> suppress some unnecessary invocations of utilities from the Texinfo suite during
> Yocto builds. Specifically, it targets -native and -cross recipes that inherit
> texinfo.bbclass. This series is revised to fix issues that came up on the
> autobuilder when I first tried submitting it.
>
> The Texinfo utilities are suppressed by supplying doppelgänger executables which
> understand the same command-line options as the genuine Texinfo utilites, and
> which can create blank output files where expected, but which do no actual
> processing, formatting, or markup. To see how this is done, look in the
> texinfo-dummy-native recipe (under meta/recipes-extended,) added in this patch
> series, as well as the modifications to texinfo.bbclass, also in this patch
> series.
>
> Suppressing the Texinfo utilities for -native and -cross recipes does provide a
> noticable performance gain, as documented in bug 2421. [1] You could make the
> case that this patch series still does not completely address bug 2421, as there
> are other utilities not from the Texinfo suite (groff, pod2man, etc) which are
> not suppressed by these changes.

There are a few cases, where I've wanted texinfo processed files to be shipped 
as part of an SDK.  Specifically nativesdk and the SDK cross compiler packages. 
  Will this affect either of those cases?

(Looking at the code, I don't think it will, but I wanted to check.)

> Target-architecture recipes continue to use the host system's Texinfo utilities
> as before, so that dependency is not eliminated by this patch series.

--Mark

> Regards,
> -Max Eliaser
>
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=2421
> The following changes since commit e7114046be6e71fb326477dc882adb814ef6a751:
>
>    busybox: fix meta-yocto's bbappend's FILESEXTRAPATH (2014-06-03 17:53:13 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib meliaser/texinfo-build-2
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=meliaser/texinfo-build-2
>
> Max Eliaser (3):
>    texinfo: Use texinfo-replacement-native as an alias for
>      texinfo-native.
>    texinfo-dummy-native: Create recipe w/ scripts to stand in for Texinfo
>      utils.
>    texinfo.bbclass: native/cross uses dummy texinfo; target uses host's
>      Texinfo.
>
>   meta/classes/texinfo.bbclass                       |  15 ++-
>   meta/conf/bitbake.conf                             |   1 +
>   .../texinfo-dummy-native/texinfo-dummy-native.bb   |  30 +++++
>   .../texinfo-dummy-native/texinfo-dummy/COPYING     |  19 ++++
>   .../texinfo-dummy-native/texinfo-dummy/template.py | 122 +++++++++++++++++++++
>   meta/recipes-extended/texinfo/texinfo_5.2.bb       |   4 +-
>   6 files changed, 189 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
>   create mode 100644 meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/COPYING
>   create mode 100644 meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
>


