Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 38FE274887
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 13:56:37 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w33Dub23030283
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 3 Apr 2018 14:56:38 +0100
Message-ID: <1522763797.11431.234.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Cuero Bugot <cbugot@sierrawireless.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 03 Apr 2018 14:56:37 +0100
In-Reply-To: <BY1PR02MB11478B00DEE78E80BF02468CA3A10@BY1PR02MB1147.namprd02.prod.outlook.com>
References: <CY1PR02MB115212269AF12AA9BC2963DBA3D40@CY1PR02MB1152.namprd02.prod.outlook.com>
	<BY1PR02MB11478B00DEE78E80BF02468CA3A10@BY1PR02MB1147.namprd02.prod.outlook.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] uninative: add variables to the whitelist so that it does not re-triger recipe parsing
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
X-List-Received-Date: Tue, 03 Apr 2018 13:56:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-03-30 at 12:45 +0000, Cuero Bugot wrote:
> > 
> > > 
> > > > 
> > > > On Fri, Mar 16, 2018 at 10:31 AM Cuero Bugot <mailto:cbugot@sie
> > > > rrawireless.com> wrote:
> > > > When uninative is activated (poky's default) internal
> > > > datastore 
> > > > variables are modified (NATIVELSBSTRING and
> > > > SSTATEPOSTUNPACKFUNCS) 
> > > > to enable uninative support. This is happening after parsing is
> > > > done at the beginning of the build. On the next bitbake call
> > > > the recipe would be parsed if the two variables above were not
> > > > added to the parsing whitelist BB_HASHCONFIG_WHITELIST.
> > > > 
> > > > The fix is to add these two variables to the recipe parsing 
> > > > whitelist BB_HASHCONFIG_WHITELIST, this is done at recipe
> > > > parsing time, only when uninative.bbclass is used.
> > > 
> > > It seems you have a case where data is already parsed and then 
> > > uninstive is enabled after this the reparse is happening. Or is
> > > it 
> > > always happening when uninative is enabled
> > It is always happening when uninative is enabled (which is poky's
> > default). The 2 first times you build you will have a full recipe
> > parsing.
> > The reason is that the data is effectively modified on reception of
> > BuildStarted event that happens after the parsing is done. Next
> > time you run bitbake, the datastore signature is different and thus
> > retrigger a recipe aprsing.
> Anything I could do help make merge-in this proposal?

Sorry about the delay, I wanted to check that we shouldn't be teaching
get_hash() in data_smart.py in bitbake something about excludevardeps
to make it work better.

In short the answer is that no, we shouldn't and your patch is the
better option. I've queued it in sumo-next. Thanks for figuring it out
as it is an annoying problem.

Cheers,

Richard

