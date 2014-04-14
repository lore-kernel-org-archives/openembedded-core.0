Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE3EF65EBB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Apr 2014 02:00:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3E20txw019070
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Apr 2014 19:00:55 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Sun, 13 Apr 2014 19:00:54 -0700
Message-ID: <534B4153.1080900@windriver.com>
Date: Mon, 14 Apr 2014 10:00:51 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1396927648.git.Chong.Lu@windriver.com>
	<3fe868b924a9fe3241ab56b8d01c1e8052dd0166.1396927648.git.Chong.Lu@windriver.com>
In-Reply-To: <3fe868b924a9fe3241ab56b8d01c1e8052dd0166.1396927648.git.Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH V4 1/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Mon, 14 Apr 2014 02:00:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 04/08/2014 11:30 AM, Chong Lu wrote:
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
> index 5727ae7..9a9a00a 100644
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
> +RDEPENDS_dbus-ptest_class-target = "dbus-test-ptest"
>   
>   SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>              file://tmpdir.patch \


