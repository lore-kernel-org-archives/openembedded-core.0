Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R3doc-0002wX-Qj
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 02:59:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8E0rqrc010374
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 17:53:52 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 13 Sep 2011 17:53:51 -0700
Message-ID: <4E6FFB1F.7040408@windriver.com>
Date: Tue, 13 Sep 2011 19:53:51 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1315961467.git.mark.hatle@windriver.com>
	<1c551b4b82b13aae991184a1dead6b224b369c48.1315961467.git.mark.hatle@windriver.com>
In-Reply-To: <1c551b4b82b13aae991184a1dead6b224b369c48.1315961467.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 1/1] Uprev to latest version of prelink_git, fixing TLS issues
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
X-List-Received-Date: Wed, 14 Sep 2011 00:59:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Just an FYI if anyone is curious, the actual fix is:

--- a/trunk/src/rtld/rtld.c
+++ b/trunk/src/rtld/rtld.c
@@ -1120,7 +1120,7 @@ process_one_dso (DSO *dso, int host_paths)
                   (size_t) (l->l_map_start - cur_dso_ent->dso->base));

           if (l->l_tls_modid)
-            printf (" TLS(0x%Zx, 0x%0*Zx)\n", l->l_tls_modid,
+            printf (" TLS(0x%Zx, 0x%0*Zx)\n", (size_t) l->l_tls_modid,
                     (int) size_pointer,
                     (size_t) l->l_tls_offset);
           else

l->l_tls_modid is a uint64_t....

--Mark

On 9/13/11 7:52 PM, Mark Hatle wrote:
> [YOCTO #1473]
> 
> From the upstream cross prelink respository:
> 
>     Fix printf typecast problem
> 
>     Without this fix the printed TLS(...) information is incorrect, which
>     causes the core prelinker code to incorrectly prelink.  This bug triggers
>     primarily on x86 (32-bit) hosts, targeting x86 (32-bit) targets and arm
>     targets.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-devtools/prelink/prelink_git.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
> index 1565ca6..af6de8e 100644
> --- a/meta/recipes-devtools/prelink/prelink_git.bb
> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
> @@ -8,9 +8,9 @@ and executables, so that far fewer relocations need to be resolved at \
>  runtime and thus programs come up faster."
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
> -SRCREV = "964f6eba613bf1c791a2a0b858cd044f05e2f151"
> +SRCREV = "3e3f9b0876aa5ac83a783a95b8bab52cb38ed785"
>  PV = "1.0+git${SRCPV}"
> -PR = "r6"
> +PR = "r7"
>  
>  #
>  # The cron script attempts to re-prelink the system daily -- on



