Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PvIN4-0001iZ-VV for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 00:55:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p23NOeAI023398;
	Thu, 3 Mar 2011 23:24:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23025-07; Thu,  3 Mar 2011 23:24:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p23NOYMg023392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 3 Mar 2011 23:24:35 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <732c81e35c4936d54c7fb495420cbb5c67c474ba.1299192495.git.sgw@linux.intel.com>
References: <cover.1299192495.git.sgw@linux.intel.com>
	<732c81e35c4936d54c7fb495420cbb5c67c474ba.1299192495.git.sgw@linux.intel.com>
Date: Thu, 03 Mar 2011 23:24:28 +0000
Message-ID: <1299194668.17567.181.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky@yoctoproject.org, Zhai Edwin <edwin.zhai@intel.com>
Subject: Re: [PATCH 03/10] sato-icon-theme: Explictly use "Sato" as gtk icon theme
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
X-List-Received-Date: Thu, 03 Mar 2011 23:55:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-03 at 14:49 -0800, Saul Wold wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> There is a tricky race condition that "Sato" icons got missing on
> matchbox-desktop as low priority "hicolor" theme was chosen. Explictly
> settting "Sato" in gtk config file to avoid this.
> 
> [BUGID #456] got fixed.
> 
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
>  .../sato-icon-theme/sato-icon-theme.inc            |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> index a1669c6..0eff9dd 100644
> --- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> +++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> @@ -16,9 +16,12 @@ PACKAGE_ARCH = "all"
>  
>  EXTRA_OECONF += "--with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
>  
> +#explictly setting "Sato" as default icon theme to avoid icon missing due to
> +#tricky race condition
>  pkg_postinst_${PN} () {
>          if [ "x$D" != "x" ]; then
>                  exit 1
>          fi
>          gtk-update-icon-cache -q /usr/share/icons/Sato
> +        echo 'gtk-icon-theme-name = "Sato"' >> /etc/gtk-2.0/gtkrc
>  }

I've deliberately merged the previous version of this patch as this one
wipes out any contents of the file! I can live with duplicate lines for
now.

I'd like the bug to remain open on this one as this is a workaround, not
a proper fix for the problem. It can change priority/target milestone
though.

Cheers,

Richard



