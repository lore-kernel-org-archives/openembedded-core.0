Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 1D1E661EBD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 17:42:53 +0000 (UTC)
Received: from [192.168.178.101] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 27EFE213F5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 19:42:53 +0200 (CEST)
Message-ID: <51ACD5A7.2060707@pseudoterminal.org>
Date: Mon, 03 Jun 2013 19:43:03 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1370278425-22062-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1370278425-22062-1-git-send-email-otavio@ossystems.com.br>
Subject: Re: [PATCH] gst-plugins-package.inc: Allow ${PN}-apps and ${PN}-glib to be empty
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
X-List-Received-Date: Mon, 03 Jun 2013 17:42:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03.06.2013 18:53, Otavio Salvador wrote:
> The ${PN}-meta package rdepends on ${PN}-apps and ${PN}-glib so we
> need to have them available or the installation of the meta package
> will fail.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> This patch is need to make the meta packages work. This should also be
> applied in dylan branch as currently ${PN}-meta packages are not
> installable.
>
>   meta/recipes-multimedia/gstreamer/gst-plugins-package.inc | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> index 7ae3ef6..b768094 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> @@ -28,6 +28,8 @@ python populate_packages_prepend () {
>   # each plugin depends on PN, plugin-dev on PN-dev and plugin-staticdev on PN-staticdev
>   # so we need them even when empty (like in gst-plugins-good case)
>   ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY_${PN}-apps = "1"
> +ALLOW_EMPTY_${PN}-glib = "1"
>   ALLOW_EMPTY_${PN}-dev = "1"
>   ALLOW_EMPTY_${PN}-staticdev = "1"
>   

Note that I posted a similar patch here some time ago, and the concern 
about unnecessary empty packages was raised. My proposed OE-core 
GStreamer 1.0 patches include code that takes care of this by adding 
packages to the -meta rdepends only if they are not empty.

