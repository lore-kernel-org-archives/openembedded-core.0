Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id F1A636D8E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 22:31:31 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rACMUbNR003532; Tue, 12 Nov 2013 22:30:38 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JlhD4xFtgpzM; Tue, 12 Nov 2013 22:30:37 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rACMUWnq003528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 12 Nov 2013 22:30:33 GMT
Message-ID: <1384295428.6460.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 12 Nov 2013 22:30:28 +0000
In-Reply-To: <52829660.4060507@linux.intel.com>
References: <1383839993-21102-1-git-send-email-ml@communistcode.co.uk>
	<527C34A3.6050708@linux.intel.com>
	<52812C68.4020701@communistcode.co.uk>
	<52829660.4060507@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Jack Mitchell <jmitchell@cbnl.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv4] libjson: update to 0.11 and rename to json-c
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
X-List-Received-Date: Tue, 12 Nov 2013 22:31:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-12 at 12:58 -0800, Saul Wold wrote:
> On 11/11/2013 11:13 AM, Jack Mitchell wrote:
> > On 08/11/2013 00:47, Saul Wold wrote:
> >> On 11/07/2013 07:59 AM, Jack Mitchell wrote:
> >>> From: Jack Mitchell <jmitchell@cbnl.com>
> >>>
> >>> libjson is now known as json-c, support for the old namespace is
> >>> disabled as it seems to break SEPBUILDDIR configs. Built without
> >>> parallel make as it fails, official word is not to bother trying.
> >>>
> >>> Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
> >>> ---
> >>>
> >>>   v4:
> >>>    - add --disable-oldname-compat to try and fix suspected SEPBUILDDIR
> >>>      issues
> >>>
> >>
> >> Jack,
> >>
> >> I hate to ask this, but given this version is also failing, how have you
> >> been testing this recipe?
> >
> > Just the usual way, standard x86 atom target -c cleansstate and a build
> > + build -c populate_sdk. It also gets rebuilt without a clean sstate as
> > I've been holding this patch in my working tree for weeks now.
> >
> > I don't really know where to go with this now, I was sure it was going
> > to be the compat configure functons which were breaking things, but
> > obviously not. I'll see if I can find some time to tidy up the actual
> > configure script some, and see if that irons out the issues we're
> > seeing. I'll also give it a go with SEPBUILDDIR and see if I can get it
> > failing over here too.
> >
> I think I figured it out, the tarball contains autoconf cruft such as 
> config.status, I am not sure why you are not seeing the failure with 
> configure, but I found that removing that cruft in a 
> do_configure_prepend(), it fixed the build problem.
> 
> +
> +do_configure_prepend() {
> +       # Clean up autoconf cruft that should noe be in the tarball

This isn't true, some of this is perfectly fine in the tarball...

> +       rm -rf ${S}/config.status ${S}/config.log ${S}/configure 
> ${S}/config.h ${S}/config.h.in~

of these, config.status should get overwritten by gnu-configize
(timestamp issue?), config.log/config.h should get overwritten running
configure and configure itself should get blown away by do_configure.

Equally, if you were doing out of tree builds, autoconf might detect
that and error, maybe on the presence of config.log or config.h? Perhaps
try narrowing it down to the specific files and mention its out of tree
builds that trigger the issue in the comment?

Cheers,

Richard


