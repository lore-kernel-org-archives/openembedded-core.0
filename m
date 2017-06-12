Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 91183782EF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 23:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8860B20B84;
	Mon, 12 Jun 2017 23:23:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id A5SFHokoc7Sb; Mon, 12 Jun 2017 23:23:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5DB04203C2;
	Mon, 12 Jun 2017 23:23:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D2F8D1624FA; Mon, 12 Jun 2017 19:23:45 -0400 (EDT)
Date: Mon, 12 Jun 2017 19:23:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170612232345.GA28053@denix.org>
References: <cover.85d08ae286e0b2f8503f9e657148201e6b90edde.1497013310.git-series.patrick.ohly@intel.com>
	<9dfd9eff13b3831c7e88c97318f97d2daeac9a78.1497013310.git-series.patrick.ohly@intel.com>
	<20170612194635.GX28053@denix.org>
	<1497301519.30163.288.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1497301519.30163.288.camel@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Mon, 12 Jun 2017 23:23:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 12, 2017 at 11:05:19PM +0200, Patrick Ohly wrote:
> On Mon, 2017-06-12 at 15:46 -0400, Denys Dmytriyenko wrote:
> > This now breaks parsing my distro config on these lines:
> > 
> > ENABLE_SYSVINIT ?= "0"
> > DISTRO_FEATURES_append = "${@base_conditional("ENABLE_SYSVINIT", "1", "", " systemd", d)}"
> > 
> > 
> > Here's the log:
> > 
> > ERROR: Unable to parse /OE/arago-master/sources/bitbake/lib/bb/data_smart.py
> > Traceback (most recent call last):
> >   File "/OE/arago-master/sources/bitbake/lib/bb/data_smart.py", line 426, in DataSmart.expandWithRefs(s='${@base_conditional("ENABLE_SYSVINIT", "1", "", " systemd", d)}', varname='DISTRO_FEATURES_append'):
> >                  except Exception as exc:
> >     >                raise ExpansionError(varname, s, exc) from exc
> >      
> > bb.data_smart.ExpansionError: Failure expanding variable DISTRO_FEATURES_append, expression was ${@base_conditional("ENABLE_SYSVINIT", "1", "", " systemd", d)} which triggered exception NameError: name 'base_conditional' is not defined
> 
> base_conditional() seems to come from utils.bbclass, which gets
> inherited by base.bbclass. Looks like DISTRO_FEATURES and thus this
> DISTRO_FEATURES_append end up getting expanded before these classes are
> fully parsed.

FWIW, replacing it with oe.utils.conditional() doesn't help.


> I'll need to discuss this with Richard tomorrow.

Richard mentioned this on IRC, but no solution yet. Please keep me posted.

-- 
Denys

