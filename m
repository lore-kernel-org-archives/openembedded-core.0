Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9828279C64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 10:28:16 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9IASDx7022589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 18 Oct 2018 11:28:14 +0100
Message-ID: <3c135d27d6897c3802700438fd58eec85630d76d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2018 11:28:13 +0100
In-Reply-To: <20181017164326.67111-5-mark.hatle@windriver.com>
References: <20181017164326.67111-1-mark.hatle@windriver.com>
	<20181017164326.67111-5-mark.hatle@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 4/4] gstreamer: Remove machine specific append
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
X-List-Received-Date: Thu, 18 Oct 2018 10:28:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-10-17 at 12:43 -0400, Mark Hatle wrote:
> If you try to build a system with multiple BSPs, one of which is qemux86
> or qemux86-64, the gstreamer package will change.  This will trigger
> anything using gstream to also be rebuilt.
> 
> For a package based system, the PR values will also be incremented each
> time.  The end result will be an ever growing set of PR values as well as
> being unable to tell which configured version of the multimedia components
> are really being deployed.
> 
> The solution here was to remove the rrecommend for consistency.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.2.bb | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.2.bb
> index 7f291f6630..3a6e53de04 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.2.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.2.bb
> @@ -55,8 +55,6 @@ FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
>  FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
>  FILES_${PN}-bash-completion += "${datadir}/bash-completion/completions/ ${datadir}/bash-completion/helpers/gst*"
>  
> -RRECOMMENDS_${PN}_qemux86 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
> -RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
>  RDEPENDS_${PN}-ptest += "make"


We can't just delete these, they need moving to the machine conf files
instead. Since we need to build M4 soon and this is a problem, I've put
a patch into master-next which does this for testing.

Cheers,

Richard



