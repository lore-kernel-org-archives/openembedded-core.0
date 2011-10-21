Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RHGXl-0006gS-Al
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 16:57:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9LEq39X015339
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 07:52:03 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 21 Oct 2011 07:52:03 -0700
Message-ID: <4EA18712.4050904@windriver.com>
Date: Fri, 21 Oct 2011 09:52:02 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1319206126.git.otavio@ossystems.com.br>
	<908ef7747e3391af158b7edb9f2b420b0016a7af.1319206126.git.otavio@ossystems.com.br>
In-Reply-To: <908ef7747e3391af158b7edb9f2b420b0016a7af.1319206126.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 3/4] base-passwd: move initial criation of group and passwd to preinst
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
X-List-Received-Date: Fri, 21 Oct 2011 14:57:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

I've seen other distributions solve this doing this by creating the passwd/group
files based on the contents of the recipe and not some external file.

So you would have a list of users/groups that need to be created with their
attributes.  In the do_install these items would be dumped into the
passwd/group.master file(s).  But also in the preinst, it would check for the
existence of the files -- if they didn't exist yet.. it would simply write out
the passwd/group files at that point.

By embedding the data in the recipe, it keeps things in sync and resolves the
chicken/egg problem.

Any opinions from folks if this is even halfway reasonable for us to consider?

(I'm guessing with some anon python code we could probably load in the
passwd/group files, place them into a variable and use the variable to embed
them within the preinst -- keeping the contents out of the recipe.)

--Mark

On 10/21/11 9:10 AM, Otavio Salvador wrote:
> To allow use and manipulation of users and groups at rootfs building
> time, the '/etc/passwd' and '/etc/group' needs to be available as soon
> as possible.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../recipes-core/base-passwd/base-passwd_3.5.22.bb |   19 ++++++++++++++++++-
>  1 files changed, 18 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
> index 137512d..aa90a6d 100644
> --- a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
> +++ b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Base system master password/group files."
>  DESCRIPTION = "The master copies of the user database files (/etc/passwd and /etc/group).  The update-passwd tool is also provided to keep the system databases synchronized with these master files."
>  SECTION = "base"
> -PR = "r3"
> +PR = "r4"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
>  
> @@ -37,6 +37,23 @@ do_install () {
>  	install -p -m 644 debian/copyright ${D}${docdir}/${BPN}/
>  }
>  
> +pkg_preinst_${PN} () {
> +	set -e
> +
> +	# Used for rootfs generation. On in-target install this will be run
> +        # before the unpack so the files won't be available
> +
> +	if [ ! -e $D${sysconfdir}/passwd ] && [ -e $D${datadir}/base-passwd/passwd.master ]; then
> +		cp $D${datadir}/base-passwd/passwd.master $D${sysconfdir}/passwd
> +	fi
> +
> +	if [ ! -e $D${sysconfdir}/group ] && [ -e $D${datadir}/base-passwd/group.master ]; then
> +		cp $D${datadir}/base-passwd/group.master $D${sysconfdir}/group
> +	fi
> +
> +	exit 0
> +}
> +
>  pkg_postinst_${PN} () {
>  	set -e
>  



