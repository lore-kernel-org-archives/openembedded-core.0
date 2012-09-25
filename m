Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TGZoT-0000M7-7X
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 20:24:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8PIC3r8001456
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2012 11:12:03 -0700 (PDT)
Received: from msp-dhcp5.wrs.com (172.25.34.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 25 Sep 2012 11:12:02 -0700
Message-ID: <5061F3F1.2010502@windriver.com>
Date: Tue, 25 Sep 2012 13:12:01 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1348525482-31986-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1348525482-31986-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] gcc-common.inc: Consider multilib when renaming libgcc for debian'ness
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
X-List-Received-Date: Tue, 25 Sep 2012 18:24:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/12 5:24 PM, Khem Raj wrote:
> When doing multilib builds rpm does not find libgcc1 for lib32
> multilib because its not honoring the debian renaming scheme for
> libgcc-multilib. Lets add MLPREFIX to fix it.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/gcc/gcc-common.inc |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
> index 3b00017..38f3b7f 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -40,7 +40,7 @@ def get_gcc_multiarch_setting(bb, d):
>   # For now, libgcc is most important so we fix for that - RP.
>   SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
>
> -DEBIANNAME_libgcc = "libgcc1"
> +DEBIANNAME_${MLPREFIX}libgcc = "libgcc1"

I realize this is a fairly rare case, but should the debian (or multilib) 
bbclasses be multilib aware, and if so automatically generate the corresponding 
DEBIANNAME_${MLPREFIX}pn = value?

This is already done for blacklists, preferred provider/version and whitelists 
in the base.bbclass.  Then if anyone (in the future) specifies DEBIANNAME, it'll 
be automatic.

--Mark

>   MIRRORS =+ "\
>   ${GNU_MIRROR}/gcc    ftp://gcc.gnu.org/pub/gcc/releases/ \n \
>



