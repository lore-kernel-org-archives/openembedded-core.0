Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id D816B65D59
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 16:45:29 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sA3GjOKC010373
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Nov 2014 17:45:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1415033128;
	bh=WkAUn1qiVpQv4vil7ffadH0KDTL+8I53PSiR/mAWNyw=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=duZ32hdCmQEIRQPZcW18zWY0Vz4RcudXE6Rz+tzfs03QaMcdHypNyTZ4MgtIthZEh
	RWFyokmWg5m9vUYbMdoqzFBPygNOPEElN3MfQ5XRgWFVH67YgYtdqKiHzV5MqOfduU
	zdIaCmmIyui4zcOvufhMhoN7zmetydZTLk57sPtk=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sA3GjJYp024904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Nov 2014 17:45:20 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1XlKkn-0007IV-G9
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Nov 2014 17:45:18 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1415000039.git.hongxu.jia@windriver.com>
	<afef7088ee50cfc2be2d08f16ddd8fe087a1c490.1415000039.git.hongxu.jia@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 03 Nov 2014 17:45:16 +0100
In-Reply-To: <afef7088ee50cfc2be2d08f16ddd8fe087a1c490.1415000039.git.hongxu.jia@windriver.com>
	(Hongxu Jia's message of "Mon, 3 Nov 2014 15:37:55 +0800")
Message-ID: <lyh9ygxmg3.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.2
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Subject: Re: [PATCH 1/1] systemd: add network config while networkd supported
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
X-List-Received-Date: Mon, 03 Nov 2014 16:45:35 -0000
Content-Type: text/plain

Hongxu Jia <hongxu.jia-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:

> While networkd supported, we add network config which starts
> dhcp by default.
> ...
> +++ b/meta/recipes-core/systemd/systemd/oe-core.network
> @@ -0,0 +1,8 @@
> +[Match]
> +Name=eth*
> +
> +[Network]
> +DHCP=v4
> +
> +[DHCPv4]
> +UseHostname=false

IMO, this is too much a target specific customization.  DHCP is not
used everywhere; it might conflict with NFS rootfs, there are different
preferences for the DHCP options (UseDomains, VendorClassIdentifier,
CriticalConnection, ...).

It would be better to place this confguration into a separate recipe.


> +		install -m 0755 ${WORKDIR}/oe-core.network ${D}${sysconfdir}/systemd/network

You should name this file like '50-oe-core.network' to make it easier to
override it.


Enrico

