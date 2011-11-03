Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1RLla6-0005rH-TC
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 01:54:59 +0100
Received: from WX-ExchMB.insigma.com.cn (10.0.1.203) by WX-Edge.insigma.com.cn
	(10.0.1.205) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Thu, 3 Nov 2011 08:48:35 +0800
Received: from [192.168.0.98] (122.224.76.38) by WX-ExchMB.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.240.5; Thu, 3 Nov 2011
	08:48:33 +0800
Message-ID: <1320281261.1504.10.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 3 Nov 2011 08:47:41 +0800
In-Reply-To: <4EB196D0.5010005@windriver.com>
References: <1319780499.10032.46.camel@localhost.localdomain>
	<CAGiJk9eo4FvhLZ6o9qdb75YyuZ5om19GYRLR6gDFEN_r0VWeuw@mail.gmail.com>
	<1319785517.10032.48.camel@localhost.localdomain>
	<CAAQYJAtJsSRSN5jLzK65iKUJPorc8h+RjqcnQBw2pyK34+ejjQ@mail.gmail.com>
	<4EAABF76.7080703@windriver.com>
	<1320021891.10032.56.camel@localhost.localdomain>
	<CAAQYJAt2ghQNxzw9EnpfChW0QrwepQLbSFcYD4AP+E32n4Wc5g@mail.gmail.com>
	<4EB196D0.5010005@windriver.com>
Organization: Insigma
X-Mailer: Evolution 3.2.1 
MIME-Version: 1.0
Subject: Re: how to set time zone
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 03 Nov 2011 00:54:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

maybe we can do the link in system booting, use the variable "TZ" to
create the symlink /etc/localtime, just like archlinux.
e.g. providing one script in /etc/rcS.d/ to create the symlink.

On Thu, 2011-11-03 at 03:15 +0800, Mark Hatle wrote:
> On 11/2/11 12:32 PM, Andrea Adami wrote:
> > On Mon, Oct 31, 2011 at 1:44 AM, Ni Qingliang <niqingliang@insigma.com.cn
> > <mailto:niqingliang@insigma.com.cn>> wrote:
> >
> >     I'd like the 'system level configuration' solution.
> >
> >     the /etc/localtime/ link can be done when packaging rootfs (using the
> >     system level configuration).
> >
> >     On Fri, 2011-10-28 at 22:43 +0800, Mark Hatle wrote:
> >     > Setting the default TZ for the image is something that should be done in a
> >     post
> >     > install script for the tzdata package or something similar.
> >     >
> >     > Since the /etc/localtime is usually a copy/hardlink or symlink to the timezone
> >     > data we don't want to package it up.  Instead we want to perform the actions
> >     > that a program running on the target system itself would use to change the
> >     timezone.
> >     >
> >     > So I think the easiest approach is to add a system level configuration
> >     variable
> >     > (set the default).
> >     >
> >     > Then use this variable to populate the configuration file that specifies the
> >     > system timezone... and then use the post install process to check the contents
> >     > of a text file.
> >     >
> >     > Alternatively do this via an initscript -- but for folks w/ read-only
> >     > filesystems I'm not sure that will work.
> >     >
> >     > --Mark
> >
> > <cut>
> >
> > Maybe I misunderstand "system level configuration" but in the meta-oe recipe we have
> >
> > DEFAULT_TIMEZONE ?= "Europe/London"
> >
> > Maybe UTC would be better?
> 
> To me no timezone (which is UTC) is preferable as the system designer can then
> set the timezone, externally to the package(s).
> 
> > Note how the variable is weak thus can be overridden in local.conf.
> >
> > Secondly, why do it as post-install or at image do_rootfs stage when we have set
> > the variable and are therefore able to provide sane defaults in do_install?
> 
> If it's done within a do_install, then the file (/etc/timezone) itself gets
> placed into the package.  If it's in the package, then if/when someone upgrades
> the package from a feed the timezone gets reset to the previous value.  That's a
> bug IMHO.
> 
> If it's done as a post-install script, then the timezone configuration can be
> evaluated and if one isn't set -- or there is no timezone file -- then we can
> set it to UTC or a similar default timezone.. (the value in the DEFAULT_TIMEZONE
> variable is reasonable in this approach.)
> 
> > Other points before starting to write a patch:
> > -why is the recipe in oe-core doing   chown -R root:root ${D}   ?
> 
> There was an issue with the way the timezone data was extracted/constructed that
> it was have all of the build system's uid/gid preserved in the copy to the final
> install directory -- so when packaging incorrect usernames and groups were fed
> into the process causing issues.
> 
> A simple chown -R root:root ${D} ensured that all of the timezone data was owned
> by the root user (on the target).
> 
> > -the logic around   # libc is removing zoneinfo files from package
> >   Is it only eglibc?
> 
> Timezone info is updated more often then the system libc.  So the zoneinfo files
> are handled externally of the libc.  This allows for easier updates over time..
> (This is my guess, as I'm not familiar with exactly what this comment refers to.)
> 
> > Regards
> >
> > Andrea
> >
> > |
> > |
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



