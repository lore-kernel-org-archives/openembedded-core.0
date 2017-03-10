Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 993C377717
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 16:54:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2AGsWIu019094
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 10 Mar 2017 08:54:33 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Mar 2017 08:54:32 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<3fee18a7b16ebb71dcabe04629bf9c9346abe82e.1489144807.git.alexander.kanavin@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <d7bb41f1-deef-14ed-297d-6de8ef355a39@windriver.com>
Date: Fri, 10 Mar 2017 10:54:31 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <3fee18a7b16ebb71dcabe04629bf9c9346abe82e.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 34/44] package_rpm.bbclass: add a /bin/sh Provides for nativesdk- packages
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
X-List-Received-Date: Fri, 10 Mar 2017 16:54:34 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/10/17 5:24 AM, Alexander Kanavin wrote:
> nativesdk-* rpm packages all require /bin/sh because postinst scriptlets
> are run with it. We can either teach rpm4 and dnf to ignore that dependency
> (a lot of non-upstreamable work), or add auto-satisfy the dependency
> in each package. I've chosen to do the latter.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/package_rpm.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index ff86dc87980..2cdaae0ff25 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -560,7 +560,7 @@ python write_specfile () {
>  
>      print_deps(srcrrecommends, "Recommends", spec_preamble_top, d)
>      print_deps(srcrsuggests, "Suggests", spec_preamble_top, d)
> -    print_deps(srcrprovides, "Provides", spec_preamble_top, d)
> +    print_deps(srcrprovides + (" /bin/sh" if srcname.startswith("nativesdk-") else ""), "Provides", spec_preamble_top, d)
>      print_deps(srcrobsoletes, "Obsoletes", spec_preamble_top, d)

I'm confused as to what this is doing...   I see this is only affecting the
virtual 'src package' (or the one built for archiving?)..

But providing /bin/sh as any type of provide seems wrong.  Either --nodeps to
the rpmbuild or there should be a configuration file that the (host/cross) rpm
can use to say "yes I really just have /bin/sh.

(rpm5 has a single file you could put arbitrary file provides into, at one point
rpm4 did as well -- but I don't know if it's still there.)

Doing this runs the risk of someone asking for '/bin/sh' and getting a source
package (a random one) as part of their build process using the DNF sources
option and such.  Definitely not what is expected.

>      
>      # conflicts can not be in a provide!  We will need to filter it.
> 


