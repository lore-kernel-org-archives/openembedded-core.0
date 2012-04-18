Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SKIVv-0004D2-15
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 02:12:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 56A45315B31B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 02:03:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id h2KCxUzBXP6f
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 02:03:15 +0200 (CEST)
Received: from [10.200.6.10] (unknown [82.149.226.166])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 4828D315B305
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 02:03:15 +0200 (CEST)
Message-ID: <4F8E04C1.8040508@opendreambox.org>
Date: Wed, 18 Apr 2012 02:03:13 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1334704605.git.paul.eggleton@linux.intel.com>
	<967c78b6c30d6d6620db8066aac28224153d3359.1334704605.git.paul.eggleton@linux.intel.com>
In-Reply-To: <967c78b6c30d6d6620db8066aac28224153d3359.1334704605.git.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/1] libproxy: remove dependency on gconf when x11 not in DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2012 00:12:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 18.04.2012 01:18, Paul Eggleton wrote:
> This allows libzypp to successfully build when x11 is not in
> DISTRO_FEATURES (avoiding the libzypp -> libproxy -> gconf -> gtk+
> dependency chain which without X results in gtk+ failing at
> do_configure).
> 
> Fixes [YOCTO #2320].
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-support/libproxy/libproxy_0.4.7.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> index 11b2abf..6d99861 100644
> --- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> +++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
>  
>  DEPENDS = "gconf"
>  
> -PR = "r2"
> +PR = "r3"
>  
>  SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz \
>             file://g++-namepace.patch \
> @@ -31,7 +31,7 @@ do_configure_prepend() {
>  }
>  
>  python() {
> -    if (d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1:
> +    if base_contains("INCOMPATIBLE_LICENSE", "GPLv3", "x", "", d) == "x" or base_contains("DISTRO_FEATURES", "x11", "x", "", d) == "":
>          d.setVar("EXTRA_OECMAKE", d.getVar("EXTRA_OECMAKE").replace("-DWITH_GNOME=yes", "-DWITH_GNOME=no"))
>          d.setVar("DEPENDS", " ".join(i for i in d.getVar("DEPENDS").split() if i != "gconf"))
>  }

A very similar patch I submitted was rejected, because this problem
should be solved using PACKAGECONFIG.

See
http://git.openembedded.org/openembedded-core-contrib/commit/?h=obi/current&id=224921423b6bcd7dc7e8570a4f3d8b3ba1291720

Has something changed since when I submitted the patch? Should I resend
my patches to remove gconf etc. dependencies when x11 is not defined?

See patches 7 through 11 at
http://git.openembedded.org/openembedded-core-contrib/log/?h=obi/current

Regards,
Andreas


