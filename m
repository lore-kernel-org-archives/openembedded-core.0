Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U7rz0-0003Ds-TH
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 19:32:04 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1JIFmPQ019959
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 10:15:48 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 19 Feb 2013 10:15:48 -0800
Message-ID: <5123C160.7050201@windriver.com>
Date: Tue, 19 Feb 2013 12:16:00 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1361194088.5927.17.camel@ted>
In-Reply-To: <1361194088.5927.17.camel@ted>
Subject: Re: [PATCH RFC] image: Enable fakeroot for the devshell
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Feb 2013 18:32:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/18/13 7:28 AM, Richard Purdie wrote:
> The rootfs task runs under fakeroot. This converts the devshell to do the same,
> allowing the user easier debugging of problems like permissions for example.
>
> I'm really after to provoke some discussion with this patch. There are a
> variety of cases where it would be desirable to run devshell in fakeroot
> context. This patch enables it for one, the image generation case but
> there are others.

What I am used to seeing is that PSEUDO is available in the devshell, and all 
you need to do to use it is:

unset PSEUDO_DISABLED ; bash

That will effectively enable pseudo (stop it from being disabled).. and the 
execution of a new shell will put you into this new environment.

However, there have been instances where this doesn't work as expected because 
other pseudo setup environment variables were not configured properly.  (I think 
the recent devshell patch will likely fix that...)

> We have several options:
>
> a) Add these in on a case by case basis. Image generation is one which
> is clearly makes sense to me.
> b) Always enable fakeroot for devshell. The downside is some calls
> accessing the user's session won't work properly. You'd have to run
> those in the form "PSEUDO_UNLOAD=1 <command>"

I'd like to see it always enabled, by either using the UNLOAD=1 or DISABLED=1 
the user has fine control when they do NOT want the pseudo environment.

(For those who don't know the differenced.. DISABLED means we will avoid the 
pseudo wrappers, but pseudo stays in memory -- allowing it to be enabled at any 
point.  While UNLOAD means we want to remove it from memory as soon as possible, 
and it can't be reenabled.  --  the DISABLED/UNLOAD occurs on the next fork/exec 
call...)

> c) Add a new fakerootdevshell task which sits along side devshell but
> starts devshell with fakeroot privileges.

This seems reasonably obvious, perhaps more so then the above...

> Adding a new task is relatively expensive in parsing performance and in
> runqueue generation. I'm not sure whether there is enough of a case for
> two different tasks or that it would user friendly. I'm therefore
> seriously considering b) but would be interested in the opinions of
> others. The attached patch implements a) as a proof of concept. b) would
> be just adding those lines to devshell.bbclass instead.

I do use pseudo to look at the output of the do_install and later operations. 
I've found it's a good way to ensure the permissions/uid/gid are correct for 
some complex packages.  However, it is a task that won't be run very much -- and 
likely not as much as the regular devshell.

> Regardless of which we pick, we need to document it, cc'ing Scott s he
> knows there is a change in this area brewing and needed before release.
>
> [YOCTO #3374]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/image.bbclass |    3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index dd78acb..0d737c3 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -184,6 +184,9 @@ do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
>   do_rootfs[cleandirs] += "${S} ${WORKDIR}/intercept_scripts"
>   do_build[nostamp] = "1"
>
> +do_devshell[depends] += "virtual/fakeroot-native:do_populate_sysroot"
> +do_devshell[fakeroot] = "1"
> +
>   # Must call real_do_rootfs() from inside here, rather than as a separate
>   # task, so that we have a single fakeroot context for the whole process.
>   do_rootfs[umask] = "022"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



