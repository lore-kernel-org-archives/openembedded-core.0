Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF1B71C42
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 22:03:04 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3JM31HY027895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 19 Apr 2018 23:03:02 +0100
Message-ID: <1524175381.18865.128.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "OE Core
	(openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Apr 2018 23:03:01 +0100
In-Reply-To: <b720c2022a0a49b08ea3159ef3fdf083@XBOX02.axis.com>
References: <b720c2022a0a49b08ea3159ef3fdf083@XBOX02.axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: Oddness regarding file locks in package.bbclass
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
X-List-Received-Date: Thu, 19 Apr 2018 22:03:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-10-03 at 18:17 +0000, Peter Kjellerstedt wrote:
> I just stumbled upon something odd in package.bbclass. In commit 
> ede381d5 from January 2011 (the code hasn't changed since), the 
> use of the ${PACKAGELOCK} lock file was changed to shared to 
> improve parallelism. However, when looking at the actual change 
> it becomes confusing. I have included it below for reference.
> 
> > 
> > commit ede381d56b180b384fdad98d445e5430819cfade
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Wed Jan 19 11:04:15 2011 +0000
> > 
> >     package.bbclass: Take a shared lock when reading to improve
> > do_package parallelism
> >     
> >     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.o
> > rg>
> > 
> > diff --git a/meta/classes/package.bbclass
> > b/meta/classes/package.bbclass
> > index d39c694de5..8e7fa26f72 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -497,7 +497,8 @@ python emit_pkgdata() {
> >  	pkgdest = bb.data.getVar('PKGDEST', d, 1)
> >  	pkgdatadir = bb.data.getVar('PKGDESTWORK', d, True)
> >  
> > -	lf = bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}",
> > d))
> > +	# Take shared lock since we're only reading, not writing
> > +	lf = bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}",
> > d), True)
> Here the lock is changed to shared as per the commit message.
> 
> > 
> >  
> >  	data_file = pkgdatadir + bb.data.expand("/${PN}" , d)
> >  	f = open(data_file, 'w')
> > @@ -649,6 +650,7 @@ python package_do_shlibs() {
> >  	shlibs_dir = bb.data.getVar('SHLIBSDIR', d, True)
> >  	shlibswork_dir = bb.data.getVar('SHLIBSWORKDIR', d, True)
> >  
> > +	# Take shared lock since we're only reading, not writing
> >  	lf = bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}",
> > d))
> Here, however, it is not changed, even though a comment is added to 
> say that it is. Was this intentional, or just an oversight?
> 
> > 
> >  
> >  	def linux_so(root, path, file):
> > @@ -878,6 +880,7 @@ python package_do_pkgconfig () {
> >  							if hdr ==
> > 'Requires':
> >  								pk
> > gconfig_needed[pkg] += exp.replace(',', ' ').split()
> >  
> > +	# Take shared lock since we're only reading, not writing
> >  	lf = bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}",
> > d))
> Here again a comment is added, but the code is not changed to match.
> 
> > 
> >  
> >  	for pkg in packages.split():
> Also, what is the ${PACKAGELOCK} lock file actually protecting? With 
> the exception of the two questionable cases above, I cannot see that 
> the lock is taken privately anywhere else. And since it looks as the 
> code in package_do_shlibs() and package_do_pkgconfig() is not what 
> needs protection (based on the added comments above), what is?

Sorry for not replying sooner, this was brought to my attention again.

PACKAGELOCK is there for PKGDATA_DIR which is defined as
${TMPDIR}/pkgdata/${MACHINE}, i.e. not recipe specific.

If something is reading files from pkgdata and something else
writes/changes them, we used to see build failures. The lock therefore
does have a purpose in guarding against this.

Looking at the code, something has gotten lost with the addition of
recipe specific sysroots and the separation of do_packagedata from
do_package.

I suspect it needs:

-do_packagedata[sstate-lockfile-shared] = "${PACKAGELOCK}"
+do_packagedata[sstate-lockfile] = "${PACKAGELOCK}"

and the other sites you mention should be shared locks, then this would
all make a lot more sense.

Cheers,

Richard








