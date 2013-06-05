Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 5E0D96065C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 16:30:53 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Jun 2013 09:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,808,1363158000"; d="scan'208";a="251060169"
Received: from unknown (HELO [10.255.13.19]) ([10.255.13.19])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Jun 2013 09:30:49 -0700
Message-ID: <51AF67B8.20502@linux.intel.com>
Date: Wed, 05 Jun 2013 09:30:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <1370417067-30166-1-git-send-email-nicolas.dechesne@linaro.org>
In-Reply-To: <1370417067-30166-1-git-send-email-nicolas.dechesne@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH dylan, master] Fix meta-toolchain-qte SDK build for x11-less DISTRO
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
X-List-Received-Date: Wed, 05 Jun 2013 16:30:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2013 12:24 AM, Nicolas Dechesne wrote:
> When building QTe SDK for a DISTRO that does not have x11 FEATURES,
> building meta-toolchain-qte failed because it unconditionally pulls in
> nativesdk-libx11. The 'culprit' is meta/recipes-qt/qt4/nativesdk-qt4-tools.inc.
>
> The fix is inspired from the following commits:
>
> abf2ab7 dbus: only use x11 if DISTRO_FEATURES has selected it
> ba22cfa cairo: only use x11 if selected in DISTRO_FEATURES
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>   meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> index cfc6fd8..3725cac 100644
> --- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> +++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> @@ -1,5 +1,6 @@
>   DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
> -DEPENDS = "nativesdk-zlib nativesdk-dbus nativesdk-libx11 qt4-native"
> +X11DEPENDS = "nativesdk-libx11"
> +DEPENDS = "nativesdk-zlib nativesdk-dbus qt4-native ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"

You could just directly put the nativesdk-libx11 in place of the 
variable, no need to have the variable there.

Sau!

>   SECTION = "libs"
>   HOMEPAGE = "http://qt.nokia.com"
>   LICENSE = "LGPLv2.1 | GPLv3"
>

