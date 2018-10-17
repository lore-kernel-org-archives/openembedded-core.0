Return-Path: <martin@geanix.com>
X-Greylist: delayed 367 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 17 Oct 2018 08:36:25 UTC
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 61C4565D00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 08:36:25 +0000 (UTC)
Received: from [10.0.0.246] (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id BF3611C1A30;
	Wed, 17 Oct 2018 10:30:18 +0200 (CEST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20181016192546.15672-1-richard.purdie@linuxfoundation.org>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <bb016a11-6387-b7cd-4b64-7c8f925874fe@geanix.com>
Date: Wed, 17 Oct 2018 10:29:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181016192546.15672-1-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] systemtap: Fix issues from 4.0 upgrade
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
X-List-Received-Date: Wed, 17 Oct 2018 08:36:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit

Hi Richard,

On 16/10/2018 21.25, Richard Purdie wrote:
> 4.0 adds systemd support but installs the unit files in the wrong location.
> Fix this in do_install and inherit systemd to package them correctly.
> 
> Also fix ownership of files manually copied in to root:root to avoid QA warnings.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-kernel/systemtap/systemtap_git.bb | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
> index 0b7833e901b..3c45bfa9374 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> @@ -25,7 +25,7 @@ PACKAGECONFIG[sqlite] = "--enable-sqlite,--disable-sqlite,sqlite3"
>   PACKAGECONFIG[monitor] = "--enable-monitor,--disable-monitor,ncurses json-c"
>   PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,python3-setuptools-native"
>   
> -inherit autotools gettext pkgconfig distutils3-base
> +inherit autotools gettext pkgconfig distutils3-base systemd
>   
>   do_configure_prepend () {
>       # Improve reproducibility for c++ object files
> @@ -39,6 +39,14 @@ do_install_append () {
>         rm -rf ${D}${datadir}/${PN}
>         rm ${D}${libexecdir}/${PN}/stap-env
>      fi
> +
> +   # Fix makefile hardcoded path assumptions for systemd (assumes $prefix)
> +   install -d `dirname ${D}${systemd_unitdir}`
> +   mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
> +   rmdir ${D}${prefix}/lib --ignore-fail-on-non-empty
> +
> +   # Ensure correct ownership for files copied in
> +   chown root.root ${D}${sysconfdir}/stap-exporter/* -R

root:root ?

>   }
>   
>   BBCLASSEXTEND = "nativesdk"
> 

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix IVS
https://geanix.com
DK39600706

