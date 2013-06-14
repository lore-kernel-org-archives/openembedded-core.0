Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6F14F601DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 11:32:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5EBcKRn021184; Fri, 14 Jun 2013 12:38:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vfEx_pQT9HrO; Fri, 14 Jun 2013 12:38:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5EBcHTt021181
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 14 Jun 2013 12:38:19 +0100
Message-ID: <1371209547.20823.70.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>
Date: Fri, 14 Jun 2013 12:32:27 +0100
In-Reply-To: <20130614111922.GA16884@mcrowe.com>
References: <20130613111601.GA27137@mcrowe.com>
	<1371158507.20823.64.camel@ted> <20130614111922.GA16884@mcrowe.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: populate-sysroot files in sstate cache overwritten by "empty" ones
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
X-List-Received-Date: Fri, 14 Jun 2013 11:32:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-06-14 at 12:19 +0100, Mike Crowe wrote:
> On Thu, Jun 13, 2013 at 10:21:47PM +0100, Richard Purdie wrote:
> > On Thu, 2013-06-13 at 12:16 +0100, Mike Crowe wrote:
> > > The problem seems to be caused by having an ancillary task in recipe1 that
> > > depends on do_configure and the same ancillary task in recipe2 that depends
> > > on recipe1:populate-sysroot. The result is that recipe1:do_configure runs
> > > followed by recipe1:do_populate_sysroot without the intervening important
> > > tasks such as do_install.
> > 
> > Hmm, interesting.
> > 
> > There is some code in staging.bbclass:
> > 
> > BB_SETSCENE_VERIFY_FUNCTION = "sysroot_checkhashes"
> > 
> > where sysroot_checkhashes() is meant to notice that do_configure reruns
> > and hence forces do_populate_sysroot to rerun. It appears to do this
> > successfully, however its missing out the dependencies of
> > do_populate_sysroot (compile, install) which is why the package ends up
> > broken.
> > 
> > I think this is a collision of two sets of data, there are some tasks
> > being skipped which shouldn't be. So I'd guess that the values from
> > BB_SETSCENE_VERIFY_FUNCTION aren't being processed with respect to
> > removing things from the setscene covered list.
> 
> Thanks for analysing this.
> 
> What is the correct thing to happen in this situation?
> 
> Should do_configure be run but not do_populate_sysroot?
> 
> Or, should the fact that do_configure needs to be run stop the sstate
> solution from being considered valid altogether and force recipe1 to be
> compiled, installed and populate_sysroot'ed in the traditional manner?

I think this needs to stop the sstate solution from being considered
valid altogether. The reason is that the re-run of do_configure cleans
out the result of do_populate_sysroot so we have to force things to wait
for it to complete again.

(http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/classes/staging.bbclass?id=3ab018c6254b883a6b6a61f79405dc3f8e40ad77)

Cheers,

Richard





