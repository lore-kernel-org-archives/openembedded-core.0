Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 81AD36E446
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 20:32:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Apr 2014 13:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,790,1389772800"; d="scan'208";a="486793053"
Received: from unknown (HELO [10.255.12.43]) ([10.255.12.43])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2014 13:31:44 -0700
Message-ID: <533DC530.1030400@linux.intel.com>
Date: Thu, 03 Apr 2014 13:31:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Chong Lu <Chong.Lu@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1395194072.git.Chong.Lu@windriver.com>
	<3e91ee5bf0390d700dd57ed89b1dba1434e3f17c.1395194072.git.Chong.Lu@windriver.com>
In-Reply-To: <3e91ee5bf0390d700dd57ed89b1dba1434e3f17c.1395194072.git.Chong.Lu@windriver.com>
Subject: Re: [PATCH V3 1/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Thu, 03 Apr 2014 20:32:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/18/2014 07:00 PM, Chong Lu wrote:
> If image contains dbus and ptest is in DISTRO_FEATURES, dbus-ptest package
> is installed, regardless of whether ptest-pkgs is in IMAGE_FEATURES. This
> issue will increase size for most small images.
> This patch fixes this problem.
>
> [YOCTO #5702]
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   meta/recipes-core/dbus/{dbus-ptest_1.6.18.bb => dbus-test_1.6.18.bb} | 0
>   meta/recipes-core/dbus/dbus.inc                                      | 4 +++-
>   2 files changed, 3 insertions(+), 1 deletion(-)
>   rename meta/recipes-core/dbus/{dbus-ptest_1.6.18.bb => dbus-test_1.6.18.bb} (100%)
>
> diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb b/meta/recipes-core/dbus/dbus-test_1.6.18.bb
> similarity index 100%
> rename from meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
> rename to meta/recipes-core/dbus/dbus-test_1.6.18.bb
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index 677ff78..6059e7c 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -6,9 +6,11 @@ LICENSE = "AFL-2 | GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
>                       file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
>   DEPENDS = "expat virtual/libintl"
> -RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '', d)}"
>   RDEPENDS_dbus_class-native = ""
>   RDEPENDS_dbus_class-nativesdk = ""
> +PACKAGES += "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest', '', d)}"
> +ALLOW_EMPTY_dbus-ptest = "1"
> +RDEPENDS_dbus-ptest = "dbus-test-ptest"

Seems like this is still causing some issues

> ERROR: Nothing RPROVIDES 'nativesdk-dbus-test-ptest' (but virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-intel-gpl/build/meta/recipes-core/dbus/dbus_1.6.18.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'nativesdk-dbus-test-ptest' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['nativesdk-dbus-test-ptest']
> ERROR: Required build target 'nativesdk-qt4-tools' has no buildable providers.
> Missing or unbuildable dependency chain was: ['nativesdk-qt4-tools', 'nativesdk-dbus', 'nativesdk-dbus-test-ptest']


As seen in this AB Failure: 
http://autobuilder.yoctoproject.org/main/builders/nightly-intel-gpl/builds/30/steps/BuildImages/logs/stdio

Sau!





>
>   SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>              file://tmpdir.patch \
>

