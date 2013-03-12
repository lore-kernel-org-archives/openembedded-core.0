Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UFK9A-0008TI-Fb
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 09:01:21 +0100
Received: by mail-ee0-f51.google.com with SMTP id d17so2533749eek.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 00:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Fc5o4Ok8Yqdp5XtNyznlKJiGe+VW/+OS1jhW+r3k90k=;
	b=RTxhQr6JVWmaGqo9yYnJsPZmmUGsNohI+ToXViP9HDOuO1FXIe7A3OVNxfKFabckrw
	e6JJr53sXFQhKGt5uAX5vDQRMyvOKOcw36yFjKMc7s4UcLwGYMYKQCkoG/DxG+fuNgRC
	7lIzNbp/+ViS1mCMC83gWOd4htcMJN6DfyWDwBzPN1Ein/3zVF9mL8Bfh2wgd6/zJ8V9
	XMwVBRWwW4HEtQKXmzys/tQywIYWcSsR/J/NHevBbXXr6TepoIexLqltn1UVkQPErTit
	HX0i7zKsEDWIUEo6lmnvMfOO2X09BhGaYD7eYhF5bWn7TCcMY3umY1vMq+8yxTTmrqxZ
	WlTg==
X-Received: by 10.14.173.196 with SMTP id v44mr37403612eel.29.1363074281684;
	Tue, 12 Mar 2013 00:44:41 -0700 (PDT)
Received: from ?IPv6:2001:610:612::4504:873f:60a5:8047?
	([2001:610:612:0:4504:873f:60a5:8047])
	by mx.google.com with ESMTPS id q5sm27996475eeo.17.2013.03.12.00.44.40
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 00:44:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1362743153-29094-1-git-send-email-olivier.guiter@linux.intel.com>
Date: Tue, 12 Mar 2013 08:44:39 +0100
Message-Id: <F506099E-ECE4-4EA8-B12E-C95329B571B2@dominion.thruhere.net>
References: <CAJTo0LbfS1ghZ3wDcmoAQC-Kvm-J9m2neDa86Ekhj3ckraUZHw@mail.gmail.com>
	<1362743153-29094-1-git-send-email-olivier.guiter@linux.intel.com>
To: Olivier Guiter <olivier.guiter@linux.intel.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQlQn0Y51a4YJC8UDHDf/eZTmneEapgss0MSnDLq+PhE2GEPesM495+ZLBjCH2YLyDhWQuhA
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] neard:Update reference commit sha1 and install script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2013 08:01:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 mrt. 2013, om 12:45 heeft Olivier Guiter =
<olivier.guiter@linux.intel.com> het volgende geschreven:

> This patch installs neard daemon in /usr/lib/neard.
> ---
> meta/recipes-connectivity/neard/neard/neard    |   42 =
------------------------
> meta/recipes-connectivity/neard/neard/neard.in |   42 =
++++++++++++++++++++++++
> meta/recipes-connectivity/neard/neard_0.9.bb   |   27 ++++++++++-----
> 3 files changed, 61 insertions(+), 50 deletions(-)
> delete mode 100644 meta/recipes-connectivity/neard/neard/neard
> create mode 100644 meta/recipes-connectivity/neard/neard/neard.in
>=20
>=20
> diff --git a/meta/recipes-connectivity/neard/neard/neard.in =
b/meta/recipes-connectivity/neard/neard/neard.in
> new file mode 100644
> index 0000000..38361c8
> --- /dev/null
> +++ b/meta/recipes-connectivity/neard/neard/neard.in
> @@ -0,0 +1,42 @@
> +#!/bin/sh
> +
> +DAEMON=3D@installpath@/neard
> +PIDFILE=3D/var/run/neard.pid
> +DESC=3D"Linux NFC daemon"
> +
> +if [ -f /etc/default/neard ] ; then
> +	. /etc/default/neard
> +fi
> +
> +set -e
> +
> +do_start() {
> +	$DAEMON
> +}
> +
> +do_stop() {
> +	start-stop-daemon --stop --name neard --quiet
> +}
> +
> +case "$1" in
> +  start)
> +	echo "Starting $DESC"
> +	do_start
> +	;;
> +  stop)
> +	echo "Stopping $DESC"
> +	do_stop
> +	;;
> +  restart|force-reload)
> +	echo "Restarting $DESC"
> +	do_stop
> +	sleep 1
> +	do_start
> +	;;
> +  *)
> +	echo "Usage: $0 {start|stop|restart|force-reload}" >&2
> +	exit 1
> +	;;
> +esac
> +
> +exit 0

That initscript is missing  LSB headers.=


