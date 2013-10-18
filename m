Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 012D46CBD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 08:57:09 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id q58so3378904wes.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 01:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=n2jAoz+pNMfxG22H6BSbtb4aNg3t82WlzBoSdH9sgkA=;
	b=i9JyB6wiK6+Ii1OYExhveBnBF0pn6Xw1Hax2A5C1ZZYnkxUBEGnklAVEDVcjMP57w3
	PPSTyXE99DC+rfQbJhwVaMFNxioYXBHvBkTPgfb9FKHHSiQiDZ/ysWJddsOiUYJYvPzJ
	2h31FTaNyMMk6sfv9ZjHK3VMde6CKgiOrvaBUuQ/AkvnPo0aBKimiA6LMfqHfjBsd3cD
	LbKRWL0NoBMzvvxMSD7xfkeQAv/bQbjWFc9FvjkU5mGPeWKO8MD0oEas+7+dariDA3dg
	/5UshyrYW9c7KJUFjAGmclVLPUWxrBxJIhP9gYECppSQ2xj3gBBn0IVFZrr8gbZ0XcUU
	ZeNw==
X-Gm-Message-State: ALoCoQmXlETIiG5bMihjPoscwJtcHDLgVX6dEkOwXtRKFSFG3NZxVQW+1C54QVMfsBj5KT8KCpiK
X-Received: by 10.180.83.40 with SMTP id n8mr1466249wiy.0.1382086631040;
	Fri, 18 Oct 2013 01:57:11 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id b7sm1305909wiz.8.2013.10.18.01.57.08
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 18 Oct 2013 01:57:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1382083973-13444-1-git-send-email-rongqing.li@windriver.com>
Date: Fri, 18 Oct 2013 10:57:07 +0200
Message-Id: <67863C52-194A-4D5E-BB85-4939BE6E93D2@dominion.thruhere.net>
References: <1382083973-13444-1-git-send-email-rongqing.li@windriver.com>
To: rongqing.li@windriver.com
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Fri, 18 Oct 2013 08:57:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 okt. 2013, om 10:12 heeft rongqing.li@windriver.com het volgende =
geschreven:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> Create connman-evn.service, which will run a script to compute the =
networking
> device when nfs root is on, and pass the result to connman.service
>=20
> Copy Connmand.service from source code, add ExecStartPre into it to =
release
> do_configure_append work, use the options which is passed by =
connman-evn.service
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>=20
> +++ b/meta/recipes-connectivity/connman/connman/connman-env.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=3DGenerate options for connection service
> +Before=3Dconnman.service
> +ConditionKernelCommandLine=3Droot=3D/dev/nfs

So this only runs when using NFS root and calls...

> +After=3Dsyslog.target
> +
> +[Service]
> +Type=3Doneshot
> +ExecStart=3D@SBINDIR@/connmand-env

... the above script. Let's see what the script does below ...

> +++ b/meta/recipes-connectivity/connman/connman/connmand-env
> @@ -0,0 +1,42 @@
> +#!/bin/sh
> +
> +nfsroot=3D0
> +
> +exec 9<&0 < /proc/mounts
> +while read dev mtpt fstype rest; do
> +	if test $mtpt =3D "/" ; then
> +		case $fstype in
> +		    nfs | nfs4)
> +			nfsroot=3D1
> +			break
> +			;;
> +		    *)
> +			;;
> +		esac
> +	fi
> +done
> +
> +EXTRA_PARAM=3D""
> +if test $nfsroot -eq 1 ; then

Ah. A whole lot of tests for a script that only runs *after* NFS root =
has been detected already. Looks like you can kill that part of the =
script.



