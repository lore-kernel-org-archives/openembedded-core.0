Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D4CB17319F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 12:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NCZsBB014076 for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 12:35:54 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qxHkMQud0feF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 12:35:54 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NCZqkk014072
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 12:35:53 GMT
Message-ID: <1485174952.30673.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 12:35:52 +0000
In-Reply-To: <1485174363-32506-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485174363-32506-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] busybox: Guard against interrupted compiles
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
X-List-Received-Date: Mon, 23 Jan 2017 12:35:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-01-23 at 12:26 +0000, Richard Purdie wrote:
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-
> core/busybox/busybox.inc
> index 1f4a48c..f247e8d 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -141,6 +141,10 @@ do_compile() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>  	if [ "${BUSYBOX_SPLIT_SUID}" = "1" -a x`grep
> "CONFIG_FEATURE_INDIVIDUAL=y" .config` = x ]; then
>  	# split the .config into two parts, and make two busybox
> binaries
> +		if [ -e .config.org ]; then
> +			# Need to guard again an interrupted
> do_compile - restore any backup
> +			cp .config.orig .config
> +		fi

I have fixed the typo...

Cheers,

Richard

