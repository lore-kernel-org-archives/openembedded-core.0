Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 3F9D760557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 01:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7F3C820918;
	Thu, 29 Sep 2016 01:31:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pYpOe6Ae2qPt; Thu, 29 Sep 2016 01:31:58 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-110-130.washdc.fios.verizon.net
	[100.15.110.130])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5A0DB20068;
	Thu, 29 Sep 2016 01:31:57 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id E2FED16214C; Wed, 28 Sep 2016 21:31:56 -0400 (EDT)
Date: Wed, 28 Sep 2016 21:31:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160929013156.GC3771@denix.org>
References: <cover.1463546289.git.raj.khem@gmail.com>
	<c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
	<CAMKF1sqUdo1X0v1ET1_udjGb8-7pg8sucv5yZ3=PuYacvtGQwA@mail.gmail.com>
	<1463990873.3095.13.camel@intel.com>
	<1463996105.9570.18.camel@linuxfoundation.org>
	<20160929005923.GA3771@denix.org> <20160929010719.GB3771@denix.org>
MIME-Version: 1.0
In-Reply-To: <20160929010719.GB3771@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] useradd.bbclass: Strip trailing '; ' in cmd params
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
X-List-Received-Date: Thu, 29 Sep 2016 01:32:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 28, 2016 at 09:07:19PM -0400, Denys Dmytriyenko wrote:
> On Wed, Sep 28, 2016 at 08:59:23PM -0400, Denys Dmytriyenko wrote:
> > On Mon, May 23, 2016 at 10:35:05AM +0100, Richard Purdie wrote:
> > > On Mon, 2016-05-23 at 10:07 +0200, Patrick Ohly wrote:
> > > > On Wed, 2016-05-18 at 12:38 -0700, Khem Raj wrote:
> > > > > This fix was not sufficient and there has to be extra fix done to
> > > > > also
> > > > > consider the case
> > > > > when sysroot is created during image build time. I have updated it
> > > > > in
> > > > > pull request here
> > > > > 
> > > > > http://git.openembedded.org/openembedded-core-contrib/commit/?h=kra
> > > > > j/pu&id=642c6cf0b6a0371de476513162bd0cefa9c438b3
> > > > 
> > > > That now fails for cases where the USERADD_PARAM ends in trailing
> > > > white
> > > > space after the last valid opts. The reason is that the 'if test "x
> > > > $opts" = "x$remaining"; then break; fi' check does not get triggered
> > > > anymore, because $remaining has the trailing white space whereas
> > > > "$opts"
> > > > does not.
> > > > 
> > > > I'm not sure what the best approach is in this case. Perhaps also
> > > > strip
> > > > trailing whitespace from all assignments to $remaining?
> > > > 
> > > > The case were we see this is:
> > > > USERADD_PARAM_iot-rest-api-server="--system --home /var/lib/empty -
> > > > -no-create-home --shell /bin/false --gid restful restful "
> > > > 
> > > > The build then hangs because the useradd preinst loops forever.
> > > 
> > > I've posted a patch which addresses this issue since its pretty nasty
> > > for people to run into.
> > 
> > This now has been merged to krogoth and I get vsftpd preinst hanging forever - 
> > has everything related been picked up during backport or something got missed?
> 
> Ok, it seems this change hasn't been picked up:
> 
> http://cgit.openembedded.org/openembedded-core/commit/meta/classes/useradd.bbclass?id=d6241e4c94a0a72acfc57e96a59918c0b2146d65

Ok, this fixes my problem with vsftpd - I sent a patch to backport this commit 
into krogoth.

-- 
Denys

