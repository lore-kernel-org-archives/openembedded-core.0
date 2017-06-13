Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 03F17782DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 08:07:14 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5D86Cvv014851
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 13 Jun 2017 09:06:13 +0100
Message-ID: <1497341172.3942.19.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>, Denys Dmytriyenko <denis@denix.org>
Date: Tue, 13 Jun 2017 09:06:12 +0100
In-Reply-To: <1497338044.30163.324.camel@intel.com>
References: <cover.85d08ae286e0b2f8503f9e657148201e6b90edde.1497013310.git-series.patrick.ohly@intel.com>
	<9dfd9eff13b3831c7e88c97318f97d2daeac9a78.1497013310.git-series.patrick.ohly@intel.com>
	<20170612194635.GX28053@denix.org>
	<1497301519.30163.288.camel@intel.com>
	<20170612232345.GA28053@denix.org>
	<1497338044.30163.324.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 13 Jun 2017 09:06:14 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] bitbake.conf: DISTRO_FEATURES as overrides
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
X-List-Received-Date: Tue, 13 Jun 2017 08:07:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-06-13 at 09:14 +0200, Patrick Ohly wrote:
> Let me also point out that the approach below completely sidesteps
> potential vardeps problems, because the dependency of OVERRIDES on
> DISTRO_FEATURES_OVERRIDES and DISTRO_FEATURES is hidden. My
> expectation is that OVERRIDES are part of the base hash and that thus
> tracking of how it gets computed isn't necessary.

I'm not sure what the best approach for the ordering issue is. The
system is setup to dynamically adjust for OVERRIDES as they change.
Perhaps setting it at the end of parsing is better, I'm not sure.

Regardless, you're not quite right above when you say that OVERRIDES
are part of the basehash, they're not in most cases.

We actually need OVERRIDES to change without changing the basehash, for
example when you switch MACHINE, you don't want allarch packages to
rebuild (or tune shared packages with the same tune but a different
MACHINE).

For this reason, OVERRIDES are very much not part of the hash, we rely
on computed values.

Your patch has broken that in several places and I'm trying to untangle
an unfortunate series of changes locally to resolve this behaviour
correctly.

Cheers,

Richard

