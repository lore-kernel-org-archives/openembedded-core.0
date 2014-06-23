Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 8014465F41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 22:55:14 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7N0057V8ZLGP80@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 23 Jun 2014 17:55:13 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1460C200BF; Mon,
	23 Jun 2014 18:54:57 -0400 (EDT)
Date: Mon, 23 Jun 2014 18:54:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-id: <20140623225457.GA1580@denix.org>
References: <1402674385.29913.6.camel@ted>
	<CADkTA4MtGT145NMXzwfL9z6HDnrLzbvcDdeGeCjC5AJuN-Ad+g@mail.gmail.com>
	<20140613191356.GR27324@denix.org>
	<CFC5A0C1.97B0E%darren.hart@intel.com>
	<1403023618.2104.2.camel@ted>
MIME-version: 1.0
In-reply-to: <1403023618.2104.2.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "Hart, Darren" <darren.hart@intel.com>,
	Scott Rifenbark <srifenbark@gmail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-module-split: Add support for KERNEL_MODULE_AUTOLOAD and KERNEL_MODULE_PROBECONF
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
X-List-Received-Date: Mon, 23 Jun 2014 22:55:16 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Sorry for the delay...

On Tue, Jun 17, 2014 at 05:46:58PM +0100, Richard Purdie wrote:
> On Tue, 2014-06-17 at 14:53 +0000, Hart, Darren wrote:
> > Adding Scott R.
> 
> I do need to sort out a documentation update.
> 
> > I was just looking into that. It appears the ref-manual.html is the place
> > to update. The glossary has a module_autoload definition, which I suppose
> > needs to be replaced with KERNEL_MODULE_AUTOLOAD, which  will have
> > slightly different semantics.
> > 
> > If I understand this correctly, the old model was:
> > 
> > 	module_autoload_foo = "foo"
> > 	module_autoload_bar = "bar"
> > 
> > Although the following line in the docs confuses me:
> > 
> > 	module_autoload_<modname> = "modname1 modname2 modname3"
> 
> That is just wrong.

Yeah, I think I confused people here... During one of the discussions I tried 
to mention that standard /etc/modules-load.d/ can have a single file with 
multiple module entries in it (and the above line was given as an example). 
Unfortunately, kernel-module-split class couldn't handle that and required 
placing one module entry per file. So the old syntax would look like this:

module_autoload_<modname1> = "modname1"
module_autoload_<modname2> = "modname2"
etc.

Sorry for the confusion.


> > And now, if I interpreted the commit comment correctly, it should look
> > like:
> > 
> > 	KERNEL_MODULE_AUTOLOAD = "foo"
> > 	...
> > 	KERNEL_MODULE_AUTOLOAD += "bar"
> 
> Correct.
> 
> > I'm not sure how KERNEL_MODULE_PROBECONF is involved, or what value it
> > brings beyond module_conf. From what I can tell, the changes now require:
> > 
> > 	KERNEL_MODULE_PROBECONF = "foo"
> > 
> > 	module_conf_foo = "options foo baz=1"
> > 
> > (/me notes the order of operations is non-obvious here "if modconf and
> > basename in modconflist")
> 
> For module_conf, the value is the build system can know which variables
> were set and account for them in the task checksums. If it doesn't have
> the list, we'd have to iterate the whole data store and that is a
> *painfully* slow operation.
> 
> module_conf isn't commonly used so maintaining a list isn't too much of
> a hardship IMO.
> 
> > Do I have this correct?
> 
> Yes.
> 
> CHeers,
> 
> Richard
> 

