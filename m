Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 1DB507701C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 21:57:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 45E2D608E37
To: Reinette Chatre <reinette.chatre@intel.com>
References: <fc756e8119184af7625c7aa191716cf265fe77fa.1443129296.git.reinette.chatre@intel.com>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <561D7E5F.1080901@collabora.co.uk>
Date: Tue, 13 Oct 2015 22:57:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <fc756e8119184af7625c7aa191716cf265fe77fa.1443129296.git.reinette.chatre@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][fido] systemd: fix tmpfiles location when multilib in use
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
X-List-Received-Date: Tue, 13 Oct 2015 21:57:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 24/09/15 22:21, Reinette Chatre wrote:
> Systemd's configuration files for creation, deletion and cleaning
> of volatile and temporary files are installed in /usr/lib even when
> multilib is in use (when /usr/lib64 is available). In this check the
> systemd.conf file will not be found if libdir is /usr/lib64 so we fix the
> path to match this file's installation path to look for it in
> ${exec_prefix}/lib
>
> (From OE-Core rev: c1ef36c2b3e3876cc166a9a5e153fc6f23b42b92)
>
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> Hi Joshua,
>
> This is a backport of systemd fix that was recently merged to master. This
> fixes broken timesynd in fido images built with multilib. Could you please
> consider it for fido?
>
> Thank you very much

Thanks Reinette,

I've queued this change in my joshuagl/fido-next branch[1].

Regards,

Joshua

1. 
http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/fido-next

>
> Reinette
>
>   meta/recipes-core/systemd/systemd_219.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> index b972dd4..2f12284 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -181,8 +181,8 @@ do_install() {
>   	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
>   	# this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
>   	# for existence else it fails
> -	if [ -s ${D}${libdir}/tmpfiles.d/systemd.conf ]; then
> -		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${libdir}/tmpfiles.d/systemd.conf', d)}
> +	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
> +		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf', d)}
>   	fi
>   }
>
>


