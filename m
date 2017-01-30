Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5760877437
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 19:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2CFB620B1C;
	Mon, 30 Jan 2017 19:53:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1xidX81A9zoS; Mon, 30 Jan 2017 19:53:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ECB1C208B1;
	Mon, 30 Jan 2017 19:53:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2540C162330; Mon, 30 Jan 2017 14:53:17 -0500 (EST)
Date: Mon, 30 Jan 2017 14:53:17 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170130195317.GF15833@denix.org>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
	<ef36ec5c696cc690af21e560c82924e5dab51a1e.1484921498.git-series.patrick.ohly@intel.com>
	<1484924046.23233.126.camel@intel.com>
	<CAMKF1spnwmo4cLdnaA1p-fvscpYm2WQQM3vEkOeHqinpwvn-bQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spnwmo4cLdnaA1p-fvscpYm2WQQM3vEkOeHqinpwvn-bQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 02/12] acpica: work around flex 2.6.2 code generation issue
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
X-List-Received-Date: Mon, 30 Jan 2017 19:53:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 21, 2017 at 08:00:13PM -0800, Khem Raj wrote:
> On Fri, Jan 20, 2017 at 6:54 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > On Fri, 2017-01-20 at 15:12 +0100, Patrick Ohly wrote:
> >> Without this patch, linking fails with a missing implementation of
> >> yy_scan_string. This looks like a regression in flex, because 2.6.0 generated
> >> different code that called PrParser_scan_string
> >> resp. DtParser_scan_string.
> >>
> >> Working around that in acpica until this is better understood or fixed
> >> in flex is the easiest solution for now.
> >
> > It turned out that flex 2.6.3 has a fix for the problem. But the github
> > issue tracker for flex has several people who reported issues with 2.6.3
> > (affecting gdb, binutils, grub) that we probably should wait a bit
> > before trying to update to that release.
> 
> I am seeing issues with qtwebkit as well.
> 
> error: 'yyset_column' was not declared in
>  this scope
> 
> Similar errors for 'yyset_lineno' 'yylex' 'yylex_init_extra'
> 'yyrestart' 'yylex_destroy'
> 
> Haven't really dug into details but it seems to be caused by update to 2.6.2

Having issues with flex 2.6.2 and doxygen as well. Supposed to be fixed in 
2.6.3, but as mentioned above, that one breaks binutils, etc...

Can we temporarily revert back to flex 2.6.0? It seems the update is breaking 
too many things, including numerous other layers, and the fix is not yet 
avaialble.

-- 
Denys

