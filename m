Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id C78F062134
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 16:06:55 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 3C9AB5C0E11;
	Mon,  4 Jun 2018 18:06:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1528128416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=FFqr0sHMaupWJ0c8h1Wtb2jTJxBXCcOGjA5hp4NIqpE=;
	b=k/tdMT/kYh4vciCiPonpVxQPPpVIzCgUFhbMYadYQW0yHF1u+u+E/Rk/+Pb6JiFKYPIPHu
	njZPxoR2c8mIF7CFdZ0fvGcmTPrMWJ3mauG023sp+xd6Q4QeTlY3lZTPWL4Tak7GJGfo1r
	8ifUrLR0/Vh6nmoU0dOdhprtwwzK/3o=
MIME-Version: 1.0
Date: Mon, 04 Jun 2018 18:06:56 +0200
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org, alexander.kanavin@linux.intel.com
In-Reply-To: <20180516091352.29279-1-stefan@agner.ch>
References: <20180516091352.29279-1-stefan@agner.ch>
Message-ID: <84556032da03a0e29a955e347028db45@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.4
X-Spamd-Result: default: False [-2.98 / 15.00]; TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[]; MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[]; DKIM_SIGNED(0.00)[];
	TO_DN_SOME(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
	ASN(0.00)[asn:29691, ipnet:2a02:418::/29, country:CH];
	RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-2.88)[99.49%]; ARC_NA(0.00)[]
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH v2 0/3] postinst fixes for opgk/dpkg
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
X-List-Received-Date: Mon, 04 Jun 2018 16:06:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2018 11:13, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
> 
> Hi,
> 
> This follows up on the discussion a while ago:
> https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg104996.html
> 
> Patch 1 is rather simple and really fixes the main issue. The patch
> by itself has been tested with the relevant self test and passes.
> 
> Patch 2/3 get rid of /etc/*-postinsts script in cases where the package
> management is present. This avoids a bunch of unnecessary scripts to be
> present on the rootfs. It also avoids the systemd service to be present
> forever with in case no postinst scripts have been deployed:
> Condition: start condition failed at Tue 2018-05-15 10:57:43 UTC; 42s ago
>            └─ ConditionPathExistsGlob=/etc/*-postinsts was not met
> 
> Self test executed using:
> $ oe-selftest --run-tests runtime_test.Postinst.test_postinst_rootfs_and_boot

Anything holding us back merging this changes?

--
Stefan

> 
> Changes since v1:
> - Note that patches are specific for opkg/dpkg
> 
> Stefan Agner (3):
>   opkg: avoid running postinst scripts twice when using systemd
>   run-postinsts: for dpkg/opkg, do not rely on /etc/*-postinsts
>   rootfs.py: for dpkg/opkg, don't install postinsts if package
>     management is present
> 
>  meta/lib/oe/rootfs.py                               |  3 +++
>  .../opkg/opkg/opkg-configure.service                | 17 -----------------
>  meta/recipes-devtools/opkg/opkg_0.3.6.bb            | 14 --------------
>  .../run-postinsts/run-postinsts/run-postinsts       | 21 ++++++++++++---------
>  .../run-postinsts/run-postinsts.service             |  1 -
>  5 files changed, 15 insertions(+), 41 deletions(-)
>  delete mode 100644 meta/recipes-devtools/opkg/opkg/opkg-configure.service

