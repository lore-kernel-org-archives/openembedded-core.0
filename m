Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B0554605F4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 12:35:47 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2UCZRDl009246; Sun, 30 Mar 2014 13:35:27 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cyVAlAZgTGft; Sun, 30 Mar 2014 13:35:27 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2UCZN9t009228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 30 Mar 2014 13:35:24 +0100
Message-ID: <1396182918.14790.45.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 30 Mar 2014 13:35:18 +0100
In-Reply-To: <20140330112517.GE2428@jama>
References: <1394820950-17162-1-git-send-email-Martin.Jansa@gmail.com>
	<1395048338-25754-1-git-send-email-Martin.Jansa@gmail.com>
	<1395052685.3808.27.camel@ted>
	<4118819.bWkrsFYPBI@peggleto-mobl5.ger.corp.intel.com>
	<20140330112517.GE2428@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [WIP][PATCHv2] report-error: Allow to upload reports automatically
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
X-List-Received-Date: Sun, 30 Mar 2014 12:35:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2014-03-30 at 13:25 +0200, Martin Jansa wrote:
> On Mon, Mar 17, 2014 at 11:03:06AM +0000, Paul Eggleton wrote:
> > On Monday 17 March 2014 10:38:05 Richard Purdie wrote:
> > > On Mon, 2014-03-17 at 10:25 +0100, Martin Jansa wrote:
> > > > * useful when distro wants to collect build statistics from
> > > > 
> > > >   all users/developers without any manual interaction from them
> > > > 
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > ---
> > > > 
> > > >  meta/classes/report-error.bbclass    | 103
> > > >  ++++++++++++++++++++++++++++++++++- meta/conf/local.conf.sample.extended
> > > >  |  20 +++++++
> > > >  2 files changed, 121 insertions(+), 2 deletions(-)
> > > 
> > > I get worried about this as people could (rightly) be very nervous about
> > > the system sharing information with a remote server without their
> > > knowledge. Adding in this functionality makes it look as if that is the
> > > intent of the system.
> > > 
> > > This is why there was a two step process, first to save out the data and
> > > second to have the user upload it (once they'd looked at what it was
> > > sharing).
> > > 
> > > Does anyone else have thoughts on this?
> > 
> > I have the same concerns. It's fine if people enable this in their own build 
> > server's local.conf / auto.conf; but if someone were to put this into their 
> > distro config which is downloaded and used by someone to do their own builds 
> > with configuration or additional components that they do not wish to share, 
> > there's the potential for that person to be unaware that their build failures 
> > will be uploaded and shared automatically.
> 
> My use-case was private distro, where it's imho valid to gather
> build stats from every build which happens in the company (we're using
> it to find builds which weren't configured correctly, e.g. referencing
> non-existent premirror/sstate-mirror etc).
> 
> Should I just change the description and commit message so that it
> doesn't promote it for distro config to use it or should I keep it all
> private?
> 
> I'm thinking about using this also in my bitbake world builds and it's
> also easier to enable it in config there, than parsing the log and
> calling send-error-report from jenkins job config when report was
> created.

I can see the usecase for this, equally, we do need to be mindful of the
privacy concerns. FWIW, I do want to see the class in use on the
yoctoproject autobuilders, however I had envisaged we'd just add a
command after the "bitbake" one which would hoover up any errors and
report them.

I think I'm ok with the idea, as long as it only gets triggered if the
user adds a specific file into HOME. 

I don't like the idea of using raw_input() in the bbclass file, I think
this is fragile and likely to cause issues. How about we have an
external script which handles setup of this file? I'd like to see a big
warning the user has to acknowledge in setting up this such that they
realise that all build errors may get reported.

I'd also like to have two separate classes since I'd like to have the
"saving errors" part enabled by default for everyone. The "sending
errors" part would enough happen automatically if configured, otherwise
the user could run it manually. 

> Should I use error-report-web installed on yoctoproject.org or create my own
> instance somewhere?

I'm hoping we can try and share a server in the hope that we can then
figure out statistics on errors. If 50 people see a given error we can
then prioritise it compared to an error only 2 people see. I know
Michael is working on setting something up.

Cheers,

Richard


