Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U9ZDG-0001La-Ru
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Feb 2013 11:53:48 +0100
Received: by mail-wi0-f172.google.com with SMTP id ez12so2370084wid.17
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2013 02:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:date:from:to:message-id:in-reply-to:references:subject
	:x-mailer:mime-version:content-type:content-transfer-encoding
	:content-disposition:x-gm-message-state;
	bh=Y7sbTg7P9CSx+k0mBVzHC2+bdQApNhOCSHKbugKa7uM=;
	b=Q/fUTYqlKIaMMlpsV4U9rvldUcKjsd1L3QTqJ++yrTiAqgLhoDT+WsRMj3dfUrKCSb
	BfakEBv8ESsc5B+1UbAeKCy5uEG6Y3Uz4tpGMnKs+sAZWdezML3vbyy3gahyUc/NeOmi
	e01R/e+EQtqgt6jfEnMMYgc3MtUaNUVjU8LTviZWiG18Dssc8hHPKJcvwJ/ooGYVObIx
	T49bxaMcSJUcenk5NdzLfuV9UL9DC4aPHVj2xOFIufNxVP7BoaEmnaEGxpPw9aohqWbD
	Bnvf2b7T3AVM5sojvQOVwBWrRQDo9pnc6JClVyn666/mxDqnAPovuJ/1/9Cjtn2K17UF
	sv0A==
X-Received: by 10.180.76.84 with SMTP id i20mr6224587wiw.9.1361702250446;
	Sun, 24 Feb 2013 02:37:30 -0800 (PST)
Received: from [192.168.1.11] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id du2sm8181299wib.0.2013.02.24.02.37.28
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 24 Feb 2013 02:37:29 -0800 (PST)
Date: Sun, 24 Feb 2013 10:37:26 +0000
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <E79C80CE9122499B9C7D2D855CDF6319@intel.com>
In-Reply-To: <CAJTo0LYo_FLTkZ_OiFf6Tt_oYO6NoUAUB74s__2UcKv7ccdxaA@mail.gmail.com>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYo_FLTkZ_OiFf6Tt_oYO6NoUAUB74s__2UcKv7ccdxaA@mail.gmail.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmcbmvXTWjyf6txmeL9FsZN8d5UB/bXHVlQNKr7z0OzMcAklkrSklZSt9J+IqAofDOP4sSH
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Sun, 24 Feb 2013 10:54:23 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

Just brainstorming out loud, but here's a suggestion that might just plea=
se everyone:

A virtual provider for the init manager, which can be overridden per-imag=
e (for main / rescue images).

DISTRO=5F=46EATURES contains the init script *style* that you want: sysvi=
nit or systemd.  These are not mutually exclusive so specifying both will=
 get you both directly in packages that support both.  I'm still not conv=
inced we need to split these out into separate packages, the size impact =
is practically negligible and the dependencies are effectively redundant =
as you'll have trouble booting without an init system.  Instead the posti=
nsts should wrap the initscript fragments in checks.

Those distro features will also be used to enable/disable features in the=
 source, so enabling systemd may well lead to libsystemd-* libraries snea=
king into your rescue image.  The systemd libraries will have to be revie=
wed to verify that installing one of them doesn't pull in systemd itself.=


Here's the fun bit - we can't have two builds of udev in the same distro,=
 and that's what could happen, so I think we'll need to cut down to one u=
dev instead of two.

I'm not entirely convinced this is a good plan yet myself though=E2=80=A6=


Ross


