Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id E787A6CBAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 10:10:20 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id t60so8363641wes.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 03:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=YdVbVYZ0ebZvAxcidtNosEHrodkhxrhfJUQi8D56u3o=;
	b=hZii0jJEcQb64JuqbwbQTWXiDcDmy6/QTat8bHATLO/wwfghMfzgIaSE2rfRyHMbvM
	s0CEyDY03IVwlwlj4pGntq++DR+QrXlrMN6m+DEpwGScAiEOaxjzX+C2pOJCYnqXeZ2J
	VhgroPi3S53FXaqvVvT1zTpz8vVeJxCLrHonfdcr29GTZt8pEmeycBh0S06F5xniQxaW
	rFF1bx6q/+pbXwmEdqC7OoKnHZVhkQ132TXMEDuaWVn9J2rxfFwrg1Ro4iiPUw8NfZrL
	jG2hvCHcCpGzcdA7Z4ARBeYcqSLyk8lDCQoOlHugB6vkGpIUj1+zFqo1LTZWJPiojCTb
	jxYg==
X-Gm-Message-State: ALoCoQlm2FAO5T3s5hzlXTsOJiJAH23AxvykDRLbw1zYeoOp1s+8fNnJ4Jg0SW4ary6zVYrcAlhH
X-Received: by 10.194.21.131 with SMTP id v3mr1157098wje.44.1381831821924;
	Tue, 15 Oct 2013 03:10:21 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id jf2sm4660429wic.2.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 03:10:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1381824734-2946-1-git-send-email-rongqing.li@windriver.com>
Date: Tue, 15 Oct 2013 12:10:21 +0200
Message-Id: <E0C668BE-B0FA-4BE0-91E9-BB779A8ABDC3@dominion.thruhere.net>
References: <1381824734-2946-1-git-send-email-rongqing.li@windriver.com>
To: rongqing.li@windriver.com
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Tue, 15 Oct 2013 10:10:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 okt. 2013, om 10:12 heeft rongqing.li@windriver.com het volgende =
geschreven:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> Otherwise system will hang since nfs is not disconnected
>=20
> and remove the judgement of initscript DISTRO_FEATURE when install =
init
> script connman, because inherit systemd will remove init script

> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---

[..]

> diff --git =
a/meta/recipes-connectivity/connman/connman/connman-nfs.service =
b/meta/recipes-connectivity/connman/connman/connman-nfs.service
> new file mode 100644
> index 0000000..9f9b690
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/connman-nfs.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=3DConnection service
> +After=3Dsyslog.target
> +
> +[Service]
> +Type=3Ddbus
> +BusName=3Dnet.connman
> +Restart=3Don-failure
> +ExecStartPre=3D-/usr/lib64/connman/wired-setup
> +ExecStart=3D/usr/bin/connman-nfs

Those hardcoded paths aren't going to work. And isn't:

ConditionKernelCommandLine!=3Droot=3D/dev/nfs=20

A lot cleaner to use in systemd?=

