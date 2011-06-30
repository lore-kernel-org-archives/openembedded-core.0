Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qc5N6-0004dG-E2
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 02:44:44 +0200
Received: (qmail invoked by alias); 30 Jun 2011 00:40:58 -0000
Received: from p5B0A22BD.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.34.189]
	by mail.gmx.net (mp015) with SMTP; 30 Jun 2011 02:40:58 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+EPbE3QVCENRF1USLJaXNIHJPgwI3VG8kJJrwtIm
	eHD8KSq3cc7m5W
From: Andreas Mueller <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jun 2011 02:42:42 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <201106300102.16411.schnitzeltony@gmx.de>
	<BANLkTimEROj5AcR+eYjLVFH2Sh3+0sB04A@mail.gmail.com>
	<4E0BC438.503@windriver.com>
In-Reply-To: <4E0BC438.503@windriver.com>
MIME-Version: 1.0
Message-Id: <201106300242.43185.schnitzeltony@gmx.de>
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
X-List-Received-Date: Thu, 30 Jun 2011 00:44:44 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday, June 30, 2011 02:32:56 AM Mark Hatle wrote:
> On 6/29/11 6:59 PM, Chris Larson wrote:
> > On Wed, Jun 29, 2011 at 4:02 PM, Andreas Mueller <schnitzeltony@gmx.de> 
wrote:
> >> foo() {
> >> 
> >>        # code to reuse
> >> 
> >> }
> >> 
> >> and called foo from several recipes. In oe-core the run.* scripts are
> >> much more stripped of unnecessary.  All the code included by 'require'
> >> seems to miss, so the function foo() will not be found.
> >> 
> >> My searches for examples did not lead to a hook so what is the suggested
> >> solution for reusing code for multiple recipes in oe-core?
> > 
> > The require doesn't have to do with anything. bitbake emits only the
> > functions which get called somewhere from the task being run. It
> > tracks what variables reference what other variables. If you call a
> > shell function from another shell function, it tracks this, and
> > realizes that both need to be emitted. Either you're doing something
> > wrong, or you're doing something in a way that bitbake can't track.
> > There's a variable flag you can set to explicitly add variable
> > dependencies.
> 
> There is an example of how to work around this in the rootfs_rpm.bbclass.. 
> It's a bit odd, but it has to do with the way the function is called:
> 
>         # Workaround so the parser knows we need the resolve_package
> function! if false ; then
>                 resolve_package_rpm foo ${RPMCONF_TARGET_BASE}.conf || true
>         fi
> 
> 
> ....
> 
>         pkg_name=$(resolve_package_rpm $pkg-locale-$lang
> ${RPMCONF_TARGET_BASE}.conf)
> 
> 
> So if the function is called within a subshell, the parser doesn't appear
> to know it's there.. so you have to reference it in the function somewhere
> (the if false works well for this) in order for it to be available to
> call.
I'll try to understand that tomorrow zzzzz

Andreas


