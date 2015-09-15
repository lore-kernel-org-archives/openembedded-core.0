Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id EF57776DE1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 11:36:52 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 305D12210B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 07:36:51 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Tue, 15 Sep 2015 07:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=tLu6H1ni9de22it
	unkAs2iAGYCA=; b=IdF6vou9HJOrK6O/SwwlWKnWnxhu/ecjnOjE+n1ErO4hejA
	9DQWJ/5cixoC2NT2TRMkyqk4Z650lWOR3fqwfRpsqodkeCcPNLKXd88/l48sUE2f
	UfqYGVlSHMmqLydZDf/7ffg+kIklg1NmLNs41NxzvTDNJEcEykZha8XScSsk=
X-Sasl-enc: zRoBwL2LEvI05XOuuerWmWjgK4AMFy6p4HOEeJmbciU3 1442317010
Received: from laptop (a88-114-110-232.elisa-laajakaista.fi [88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 85EE2C00021;
	Tue, 15 Sep 2015 07:36:50 -0400 (EDT)
Message-ID: <1442317009.1922.4.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 14:36:49 +0300
In-Reply-To: <1442227275-19855-1-git-send-email-andrew.shadura@collabora.co.uk>
References: <1440666021-11411-1-git-send-email-andrew.shadura@collabora.co.uk>
	<1442227275-19855-1-git-send-email-andrew.shadura@collabora.co.uk>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH v3 1/2] dbus: add user sessions support
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
X-List-Received-Date: Tue, 15 Sep 2015 11:36:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-09-14 at 12:41 +0200, Andrew Shadura wrote:
> ---
>  meta/recipes-core/dbus/dbus_1.10.0.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/dbus/dbus_1.10.0.bb b/meta/recipes-core/dbus/dbus_1.10.0.bb
> index 31cbef0..e099f4b 100644
> --- a/meta/recipes-core/dbus/dbus_1.10.0.bb
> +++ b/meta/recipes-core/dbus/dbus_1.10.0.bb
> @@ -68,7 +68,9 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
>                 ${datadir}/dbus-1/session.conf \
>                 ${datadir}/dbus-1/system.d \
>                 ${datadir}/dbus-1/system.conf \
> -               ${systemd_unitdir}/system/"
> +               ${systemd_system_unitdir} \
> +               ${systemd_user_unitdir} \
> +"
>  FILES_${PN}-lib = "${libdir}/lib*.so.*"
>  RRECOMMENDS_${PN}-lib = "${PN}"
>  FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool ${bindir}/dbus-test-tool"
> @@ -105,6 +107,7 @@ PACKAGECONFIG_class-nativesdk = ""
>  PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir"
>  PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
>  PACKAGECONFIG[apparmor] = "--enable-apparmor,--disable-apparmor,libapparmor"
> +PACKAGECONFIG[user-session] = "--enable-user-session,--disable-user-session"

I think user-session should be enabled by default when systemd is in
DISTRO_FEATURES. Some services, e.g. PulseAudio, can fully enable their
systemd integration only if dbus is compiled with --enable-user
-session.

-- 
Tanu

