Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RLgNX-0007xL-4R
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 20:21:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA2JFT23000903
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2011 12:15:30 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 2 Nov 2011 12:15:29 -0700
Message-ID: <4EB196D0.5010005@windriver.com>
Date: Wed, 2 Nov 2011 14:15:28 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1319780499.10032.46.camel@localhost.localdomain>
	<CAGiJk9eo4FvhLZ6o9qdb75YyuZ5om19GYRLR6gDFEN_r0VWeuw@mail.gmail.com>
	<1319785517.10032.48.camel@localhost.localdomain>
	<CAAQYJAtJsSRSN5jLzK65iKUJPorc8h+RjqcnQBw2pyK34+ejjQ@mail.gmail.com>
	<4EAABF76.7080703@windriver.com>
	<1320021891.10032.56.camel@localhost.localdomain>
	<CAAQYJAt2ghQNxzw9EnpfChW0QrwepQLbSFcYD4AP+E32n4Wc5g@mail.gmail.com>
In-Reply-To: <CAAQYJAt2ghQNxzw9EnpfChW0QrwepQLbSFcYD4AP+E32n4Wc5g@mail.gmail.com>
Subject: Re: how to set time zone
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
X-List-Received-Date: Wed, 02 Nov 2011 19:21:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 11/2/11 12:32 PM, Andrea Adami wrote:
> On Mon, Oct 31, 2011 at 1:44 AM, Ni Qingliang <niqingliang@insigma.com.cn
> <mailto:niqingliang@insigma.com.cn>> wrote:
> 
>     I'd like the 'system level configuration' solution.
> 
>     the /etc/localtime/ link can be done when packaging rootfs (using the
>     system level configuration).
> 
>     On Fri, 2011-10-28 at 22:43 +0800, Mark Hatle wrote:
>     > Setting the default TZ for the image is something that should be done in a
>     post
>     > install script for the tzdata package or something similar.
>     >
>     > Since the /etc/localtime is usually a copy/hardlink or symlink to the timezone
>     > data we don't want to package it up.  Instead we want to perform the actions
>     > that a program running on the target system itself would use to change the
>     timezone.
>     >
>     > So I think the easiest approach is to add a system level configuration
>     variable
>     > (set the default).
>     >
>     > Then use this variable to populate the configuration file that specifies the
>     > system timezone... and then use the post install process to check the contents
>     > of a text file.
>     >
>     > Alternatively do this via an initscript -- but for folks w/ read-only
>     > filesystems I'm not sure that will work.
>     >
>     > --Mark
> 
> <cut>
> 
> Maybe I misunderstand "system level configuration" but in the meta-oe recipe we have
> 
> DEFAULT_TIMEZONE ?= "Europe/London"
> 
> Maybe UTC would be better?

To me no timezone (which is UTC) is preferable as the system designer can then
set the timezone, externally to the package(s).

> Note how the variable is weak thus can be overridden in local.conf.  
>  
> Secondly, why do it as post-install or at image do_rootfs stage when we have set
> the variable and are therefore able to provide sane defaults in do_install?

If it's done within a do_install, then the file (/etc/timezone) itself gets
placed into the package.  If it's in the package, then if/when someone upgrades
the package from a feed the timezone gets reset to the previous value.  That's a
bug IMHO.

If it's done as a post-install script, then the timezone configuration can be
evaluated and if one isn't set -- or there is no timezone file -- then we can
set it to UTC or a similar default timezone.. (the value in the DEFAULT_TIMEZONE
variable is reasonable in this approach.)

> Other points before starting to write a patch:
> -why is the recipe in oe-core doing   chown -R root:root ${D}   ?

There was an issue with the way the timezone data was extracted/constructed that
it was have all of the build system's uid/gid preserved in the copy to the final
install directory -- so when packaging incorrect usernames and groups were fed
into the process causing issues.

A simple chown -R root:root ${D} ensured that all of the timezone data was owned
by the root user (on the target).

> -the logic around   # libc is removing zoneinfo files from package
>   Is it only eglibc?

Timezone info is updated more often then the system libc.  So the zoneinfo files
are handled externally of the libc.  This allows for easier updates over time..
(This is my guess, as I'm not familiar with exactly what this comment refers to.)

> Regards
> 
> Andrea
> 
> |
> |
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



