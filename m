Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 144756B4FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 10:51:07 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VAHcZ-0005aK-H6; Fri, 16 Aug 2013 12:51:07 +0200
Message-ID: <1376650266.17787.33.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 16 Aug 2013 11:51:06 +0100
In-Reply-To: <1376649704.22952.116.camel@ted>
References: <520C9F8A.7080703@windriver.com>
	<1376559796.17787.14.camel@phil-desktop.brightsign>
	<1376649704.22952.116.camel@ted>
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: About PACKAGECONFIG audit
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
X-List-Received-Date: Fri, 16 Aug 2013 10:51:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-08-16 at 11:41 +0100, Richard Purdie wrote:
> On Thu, 2013-08-15 at 10:43 +0100, Phil Blundell wrote:
> > I don't think there's currently any straightforward way
> > for package.bbclass to generate the recursive dependency chain for an
> > arbitrary recipe. 
> 
> Bitbake itself has that information and I suspect we should share it to
> tasks. The exact form of that would be the harder thing to determine...

If it's something that bitbake already computes (or could compute
cheaply) then you could just arrange for it to add it to the datastore
as something like ${BB_COMPUTED_DEPENDS} before running each task.  Just
a flat textual list of recipes, de-duped but in arbitrary order, would
probably be good enough for all the use-cases we've talked about so far.
I guess the question is whether you need to do anything clever with
selecting the dependencies for particular tasks, or whether you could
just take the dependencies for all tasks that the recipe defines and
collapse them into a single list.  I think probably the latter.

If it's expensive to compute then I guess there'd need to be some sort
of bb.cooker.get_recursive_dependencies() kind of function that tasks
can call when they want the information.

p.



