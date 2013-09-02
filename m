Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa11-07.prod.phx3.secureserver.net
	(p3plsmtpa11-07.prod.phx3.secureserver.net [68.178.252.108])
	by mail.openembedded.org (Postfix) with ESMTP id 8A44C6BCF1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 11:58:47 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa11-07.prod.phx3.secureserver.net with 
	id LByn1m0081mTNtu01BynzV; Mon, 02 Sep 2013 04:58:48 -0700
Message-ID: <52247D78.4070406@pabigot.com>
Date: Mon, 02 Sep 2013 06:58:48 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1378121740.git.Qi.Chen@windriver.com>
	<35139b57aba1b70ba9780e19765c1ef54cd4bab7.1378121740.git.Qi.Chen@windriver.com>
In-Reply-To: <35139b57aba1b70ba9780e19765c1ef54cd4bab7.1378121740.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 2/2] sysklogd: lower the ALTERNATIVE_PRIORITY in case of systemd
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
X-List-Received-Date: Mon, 02 Sep 2013 11:58:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2013 06:40 AM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The sysklogd package hasn't got systemd support yet. So in case of
> a systemd based system, the commands and corresponding configuration
> files should have a lower priority than that of the busybox's syslogd
> and klogd utilities. These two utilities from busybox have internal
> systemd support if CONFIG_FEATURE_SYSTEMD is enabled. And that config
> item is enabled by default.
>
> [YOCTO #5066]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-extended/sysklogd/sysklogd.inc |    9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
> index 1167328..30dac2d 100644
> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
> @@ -38,7 +38,14 @@ do_install () {
>   	install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog
>   }
>   
> -ALTERNATIVE_PRIORITY = "100"
> +python () {
> +    # sysklogd package has no internal systemd support, so we weigh busybox's
> +    # sysklogd utility over it in case of systemd
> +    if 'systemd' in d.getVar("DISTRO_FEATURES", True).split():
> +        d.setVar("ALTERNATIVE_PRIORITY", "10")
> +    else:
> +        d.setVar("ALTERNATIVE_PRIORITY", "100")
> +}

Is there a reason an anonymous python block is better for this purpose than:

ALTERNATIVE_PRIORITY = "${@base_contains('DISTRO_FEATURES','systemd','10','100',d)}"

?

>   ALTERNATIVE_${PN} = "syslogd klogd syslog-init syslog-conf"
>   


