Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RJnk2-0003IK-HH
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 16:49:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9SEh3uC013830
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 07:43:03 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 28 Oct 2011 07:43:03 -0700
Message-ID: <4EAABF76.7080703@windriver.com>
Date: Fri, 28 Oct 2011 09:43:02 -0500
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
In-Reply-To: <CAAQYJAtJsSRSN5jLzK65iKUJPorc8h+RjqcnQBw2pyK34+ejjQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 28 Oct 2011 14:49:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Setting the default TZ for the image is something that should be done in a post
install script for the tzdata package or something similar.

Since the /etc/localtime is usually a copy/hardlink or symlink to the timezone
data we don't want to package it up.  Instead we want to perform the actions
that a program running on the target system itself would use to change the timezone.

So I think the easiest approach is to add a system level configuration variable
(set the default).

Then use this variable to populate the configuration file that specifies the
system timezone... and then use the post install process to check the contents
of a text file.

Alternatively do this via an initscript -- but for folks w/ read-only
filesystems I'm not sure that will work.

--Mark

On 10/28/11 3:22 AM, Andrea Adami wrote:
> On Fri, Oct 28, 2011 at 9:05 AM, Ni Qingliang <niqingliang@insigma.com.cn
> <mailto:niqingliang@insigma.com.cn>> wrote:
> 
>     THANKS!
> 
>     I still want the native support by oe-core/yocto:-). If no, I will try
>     by myself.
> 
> 
> I've asked three or four time the oe-core crow to improve the recipe...last one:
> 
> On Wed, Oct 19, 2011 at 12:24 AM, Joshua Lock <josh@linux.intel.com
> <mailto:josh@linux.intel.com>> wrote:
> 
>     Per mailing requests, here are updates to the tzdata and gst-plugins-good
>     recipes.
> 
>     Joshua
> 
>     The following changes since commit 95d0ff5e070c690314ab87665200099a52d37ebf:
> 
>      tzdata: updated SRC_URI and update to 2011k (2011-10-18 11:16:58 -0700)
> 
> 
> Thanks for the tzdata fix.
> Now, we have the same recipes in meta-oe with a slightly different do_install
> and packaging: I'm referring to /etc/localtime and /etc/timezone: which package
> do provide those in oe-core?
> 
> (We'll remove the tzdata/tzcodes from meta-oe once the recipes are matching)
> 
> Regards
> 
> 
> 
> Andrea
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



