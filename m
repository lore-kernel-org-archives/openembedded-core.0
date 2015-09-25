Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 15BE77653B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 16:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id DAFE8315AEC1;
	Fri, 25 Sep 2015 18:06:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id BlwNSxvvA0up; Fri, 25 Sep 2015 18:06:01 +0200 (CEST)
Received: from [172.22.22.61] (55d45210.access.ecotel.net [85.212.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 0635E315AD2E;
	Fri, 25 Sep 2015 18:06:01 +0200 (CEST)
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	openembedded-core@lists.openembedded.org
References: <aa28a5439d5375728b83962d6814045053f9fdd6.1443179044.git.jussi.kukkonen@intel.com>
	<6aa4eaa74c5e4d96f92c0b6bd022deb13a2e8be9.1443179044.git.jussi.kukkonen@intel.com>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <560570E8.7040808@opendreambox.org>
Date: Fri, 25 Sep 2015 18:06:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <6aa4eaa74c5e4d96f92c0b6bd022deb13a2e8be9.1443179044.git.jussi.kukkonen@intel.com>
Subject: Re: [PATCH 2/2] connman: Don't use a blanket "allow" D-Bus policy
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
X-List-Received-Date: Fri, 25 Sep 2015 16:06:04 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 25.09.2015 13:14, Jussi Kukkonen wrote:
> There are already "allow" rules for root and conditionally xuser to
> send messages to connman: there should be no reason for a default
> allow policy.
> 
> Also, conditionally add a policy to allow xuser to send to the
> connman vpn service (similar to main service).
> 
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/recipes-connectivity/connman/connman.inc      |  6 -----
>  .../connman/add_xuser_dbus_permission.patch        | 28 +++++++++++++++++++---
>  2 files changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 6c062ae..1712af3 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -70,13 +70,7 @@ SYSTEMD_SERVICE_${PN} = "connman.service"
>  SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
>  SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
>  
> -# This allows *everyone* to access ConnMan over DBus, without any access
> -# control.  Really the at_console flag should work, which would mean that
> -# both this and the xuser patch can be dropped.
>  do_compile_append() {
> -	sed -i -e s:deny:allow:g ${S}/src/connman-dbus.conf
> -	sed -i -e s:deny:allow:g ${S}/vpn/vpn-dbus.conf
> -
>  	sed -i "s#ExecStart=#${SYSTEMD_WIRED_SETUP}\nExecStart=#" ${B}/src/connman.service
>  }
>  
> diff --git a/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch b/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
> index 707b3ca..15a191d 100644
> --- a/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
> +++ b/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
> @@ -1,9 +1,14 @@
> -Because Poky doesn't support at_console we need to special-case the session
> -user.
> +Because Poky doesn't support at_console we need to
> +special-case the session user.

Here you can see that it really is poky's distro policy that slipped
into OE-Core. How about removing ROOTLESS_X and xuser from OE-Core and
putting it into a layer that actually sets the variable?

Regards,
Andreas

>  
>  Upstream-Status: Inappropriate [configuration]
>  
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +
> +---
> + src/connman-dbus.conf | 3 +++
> + vpn/vpn-dbus.conf     | 3 +++
> + 2 files changed, 6 insertions(+)
>  
>  diff --git a/src/connman-dbus.conf b/src/connman-dbus.conf
>  index 98a773e..466809c 100644
> @@ -19,3 +24,20 @@ index 98a773e..466809c 100644
>       <policy at_console="true">
>           <allow send_destination="net.connman"/>
>       </policy>
> +diff --git a/vpn/vpn-dbus.conf b/vpn/vpn-dbus.conf
> +index 0f0c8da..9ad05b9 100644
> +--- a/vpn/vpn-dbus.conf
> ++++ b/vpn/vpn-dbus.conf
> +@@ -6,6 +6,9 @@
> +         <allow send_destination="net.connman.vpn"/>
> +         <allow send_interface="net.connman.vpn.Agent"/>
> +     </policy>
> ++    <policy user="xuser">
> ++        <allow send_destination="net.connman.vpn"/>
> ++    </policy>
> +     <policy at_console="true">
> +         <allow send_destination="net.connman.vpn"/>
> +     </policy>
> +-- 
> +2.1.4
> +
> 


