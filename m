Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qc5Jv-0004Y2-UI
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 02:41:28 +0200
Received: (qmail invoked by alias); 30 Jun 2011 00:37:45 -0000
Received: from p5B0A22BD.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.34.189]
	by mail.gmx.net (mp050) with SMTP; 30 Jun 2011 02:37:45 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+55q5PzAu5Vs6iZWX2ahs9l2lzrWlWBf2Lkg4bBr
	z2HqNy6ardlYnK
From: Andreas Mueller <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jun 2011 02:39:28 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <201106300102.16411.schnitzeltony@gmx.de>
	<BANLkTimEROj5AcR+eYjLVFH2Sh3+0sB04A@mail.gmail.com>
In-Reply-To: <BANLkTimEROj5AcR+eYjLVFH2Sh3+0sB04A@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201106300239.28629.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: How to reuse code in oe-core environment
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
X-List-Received-Date: Thu, 30 Jun 2011 00:41:28 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thursday, June 30, 2011 01:59:33 AM Chris Larson wrote:
> On Wed, Jun 29, 2011 at 4:02 PM, Andreas Mueller <schnitzeltony@gmx.de> wrote:
> > foo() {
> >        # code to reuse
> > }
> > 
> > and called foo from several recipes. In oe-core the run.* scripts are
> > much more stripped of unnecessary.  All the code included by 'require'
> > seems to miss, so the function foo() will not be found.
> > 
> > My searches for examples did not lead to a hook so what is the suggested
> > solution for reusing code for multiple recipes in oe-core?
> 
> The require doesn't have to do with anything. bitbake emits only the
> functions which get called somewhere from the task being run. It
> tracks what variables reference what other variables. If you call a
> shell function from another shell function, it tracks this, and
> realizes that both need to be emitted. Either you're doing something
> wrong, or you're doing something in a way that bitbake can't track.
> There's a variable flag you can set to explicitly add variable
> dependencies.
the scenario I wrote was not the whole truth - sorry:

I am making a new layer. There I have created u-boot_git.bbappend. In the build 
log I see that this extends u-boot_git.bb coming from meta-texasinstruments. In 
u-boot_git.bbappend there is (besides other showing me that bbappending works)

| require foo.inc

and

| do_deploy_append_<mynewmachine> {
|	foo
| }

the code in foo.inc is something like

| foo() {
|	sed ..
|	install ...
| }

Build stops complaining that foo cannot be found and the only function I see in 
run.do_deploy.nnnnn is do_deploy(). 

All code was taken from oe and builds fine there. Only difference to oe is that 
the lines now found in u-boot_git.bbappend were part of the one and only u-
boot_git.bb recipe.

Is it possible that that the dependency checks ignore functions brought in by 
bbappend - or where am I going wrong?

regards

Andreas


