Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SMdKP-0008UH-Lx for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 12:50:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3OAf2UI006212;
	Tue, 24 Apr 2012 11:41:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05670-06; Tue, 24 Apr 2012 11:40:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3OAerJK006206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 Apr 2012 11:40:55 +0100
Message-ID: <1335264053.12692.117.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Apr 2012 11:40:53 +0100
In-Reply-To: <4F957991.8090800@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
	<086fa62c043e3cd4b9bc8d2377507ed842a3097b.1334940120.git.sgw@linux.intel.com>
	<4F957991.8090800@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Rifenbark, Scott M" <scott.m.rifenbark@intel.com>
Subject: Re: [CONSOLIDATED PULL 29/43] package.bbclass: Ensure kernel modules get stripped
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Apr 2012 10:50:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-23 at 08:47 -0700, Darren Hart wrote:
> 
> On 04/20/2012 09:45 AM, Saul Wold wrote:
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > Kernel modules are not marked as executable but we do expect to strip them.
> > This patch adds in missing code to ensure we do this. Without this images
> > are getting sigificantly bloated in size.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/package.bbclass |    8 ++++++++
> >  1 files changed, 8 insertions(+), 0 deletions(-)
> > 
> > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> > index 99c945d..71bd3a6 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -870,6 +870,14 @@ python split_and_strip_files () {
> >  				elf_file = int(file_list[file][5:])
> >  				#bb.note("Strip %s" % file)
> >  				runstrip(file, elf_file, d)
> > +
> > +
> > +	if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):	<- white space at end
> 
> Note: Whitespace at end of line.
> 
> I understand it's common practice with bitbake recipes to compare to '1'
> as a string. However, this isn't documented in the usae of
> INHIBIT_PACKAGE_STRIP, and it seems reasonable that someone might try
> setting "True" or "yes" or some other common affirmative label.
> 
> Scott, can we update the ref manual glossary to indicate that assigning
> to the string "1" is the way to set this to true?

I think we need to go over all these "1" tests that change them to be
conditional on the variable set/unset. I did just copy this some another
location within package.bbclass which is fine for 1.2 but needs
revisiting.

> > +		for root, dirs, files in os.walk(dvar):
> > +			for f in files:
> > +				if not f.endswith(".ko"):
> > +					continue
> > +				runstrip(os.path.join(root, f), None, d)
> 
> Not a big deal, but you can drop the "not" and the "continue" and only
> runtstrip if the file ends with ".ko" since there isn't anything else
> done in the loop.

I just have a dislike of functions that look like a set of steps :). I
also suspect the conditions might change here in the future.

Cheers,

Richard



