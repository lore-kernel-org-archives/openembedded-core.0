Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 513E365C87
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 10:21:25 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id fb4so6671435wid.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 03:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=agYIS/BHEeTyFyH+Burt/xcGEFBlG6dGpBeN80rgu5M=;
	b=ATRZlwR3Pbgk1Ak4FdqN6/jbf3GnqqtB8hrEtmC/f/VKE1miqE+6YhTfXw5faxGU49
	U1yLrjvmgtpC9oCsgBCzNqApXyPe9LlI9ZKhIshpFdPbslDMDpkWnFwtjN8i/rVE+Q/j
	UgizpuSmQQWKAuTsFDGpfOsbXC8XiHNNOjvHY67EMVdrM2/XS5Ro3QiyfVCYmlnroEiB
	vZSTG7esUyxE5ULauC7GAOwL/HZt+iqnAsIWRutAghSZIgzBH8PA6euUrwhhUFedyxRN
	cdvg9lgpU2bPQPZW1Zwj8+vKuFytyy8kna8YG4Roo1Gy+1gP/5jjYaIpMAhXlM9xhtig
	z+zQ==
X-Gm-Message-State: ALoCoQlwvq5vV5PBweio3GHmblCCzTvbhyeFI1P5AKujWlNDUNBglZb9/2EDd2XdxIK+yVvejuZV
X-Received: by 10.180.39.65 with SMTP id n1mr18901156wik.13.1413800485644;
	Mon, 20 Oct 2014 03:21:25 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id t9sm11340544wjf.41.2014.10.20.03.21.24
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 Oct 2014 03:21:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LboKNAOi7_tx31+m2KOxF_HEKEGePU2wnHXSzGpoeGTgA@mail.gmail.com>
Date: Mon, 20 Oct 2014 12:21:23 +0200
Message-Id: <0B4E9113-92D0-404F-ACFD-878A27AD70BC@dominion.thruhere.net>
References: <cover.1413341569.git.Chong.Lu@windriver.com>
	<b2f5f79f9e08f008043508392775c2bb52f819b3.1413341569.git.Chong.Lu@windriver.com>
	<CAJTo0LboKNAOi7_tx31+m2KOxF_HEKEGePU2wnHXSzGpoeGTgA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Mon, 20 Oct 2014 10:21:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 15 okt. 2014, om 12:42 heeft Burton, Ross <ross.burton@intel.com> =
het volgende geschreven:
>=20
> On 15 October 2014 03:54, Chong Lu <Chong.Lu@windriver.com> wrote:
>> The gconfd-2 will be called in org.gnome.GConf.service file and the =
path of
>> gconfd-2 is ${libexecdir}, this will get following error when =
multilib exported
>> in the sdk:
>> error: file /usr/share/dbus-1/services/org.gnome.GConf.service from =
install
>> of gconf-3.2.6-r0.0.lib32_x86 conflicts with file from package
>> gconf-3.2.6-r0.0.x86_64
>>=20
>> Split org.gnome.GConf.service to ${PN}-service, the conflict was =
fixed.
>=20
> Why are both ML variants of gconf being installed?    Presumably for
> libgconf, which needs to have ML variants and is packaged into $PN.
> $PN also contains the binaries and data files, which are not
> ML-specific and can only be installed once.
>=20
> So, gconf should split the daemon/binaries from the libraries.  I
> suggested this back in July as it seems the logical answer, instead of
> splitting the daemon binary and the service file that defines where
> the binary is.

Keep in mind that both solutions mentioned above will make it virtually =
impossible to keep a working upgrade path.

regards,

Koen=

