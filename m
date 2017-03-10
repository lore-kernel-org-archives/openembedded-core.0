Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 02E9E72F4E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 16:41:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2AGfDcK017045
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 10 Mar 2017 08:41:13 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Mar 2017 08:41:12 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<1a43bf2b306b634596d2834ba59b824b88f57e84.1489144807.git.alexander.kanavin@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <778d7fed-885c-c529-567e-6249980b2501@windriver.com>
Date: Fri, 10 Mar 2017 10:41:11 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1a43bf2b306b634596d2834ba59b824b88f57e84.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 19/44] package_rpm.bbclass: correctly map RRECOMMENDS and RSUGGESTS to rpm tags
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
X-List-Received-Date: Fri, 10 Mar 2017 16:41:14 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/10/17 5:23 AM, Alexander Kanavin wrote:
> Previously they were swapped, not sure why. Their meaning, as far as rpm
> world goes, is different:

Just an FYI -- In RPM5 (well before rpm4 had support for recommended packages)
it was implemented as 'suggests'.  I have no idea why.

--Mark

> - Recommends is a soft dependency and will be installed by default; there is
> an option not to do that.
> 
> - Suggests is a suggestion to be picked up and presented to end user by
> package management tools; it has no special meaning otherwise.
> 
> OE packages use RRECOMMENDS, which should be mapped to Recommends rpm tag,
> so that the packages will be picked up as dependencies.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/package_rpm.bbclass | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 07eb974f736..480c6d58d39 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -450,10 +450,8 @@ python write_specfile () {
>          if splitrpostrm:
>              print_deps(splitrdepends, "Requires(postun)", spec_preamble_bottom, d)
>  
> -        # Suggests in RPM are like recommends in OE-core!
> -        print_deps(splitrrecommends, "Suggests", spec_preamble_bottom, d)
> -        # While there is no analog for suggests... (So call them recommends for now)
> -        print_deps(splitrsuggests,  "Recommends", spec_preamble_bottom, d)
> +        print_deps(splitrrecommends, "Recommends", spec_preamble_bottom, d)
> +        print_deps(splitrsuggests,  "Suggests", spec_preamble_bottom, d)
>          print_deps(splitrprovides,  "Provides", spec_preamble_bottom, d)
>          print_deps(splitrobsoletes, "Obsoletes", spec_preamble_bottom, d)
>  
> @@ -560,10 +558,8 @@ python write_specfile () {
>      if srcrpostrm:
>          print_deps(srcrdepends, "Requires(postun)", spec_preamble_top, d)
>  
> -    # Suggests in RPM are like recommends in OE-core!
> -    print_deps(srcrrecommends, "Suggests", spec_preamble_top, d)
> -    # While there is no analog for suggests... (So call them recommends for now)
> -    print_deps(srcrsuggests, "Recommends", spec_preamble_top, d)
> +    print_deps(srcrrecommends, "Recommends", spec_preamble_top, d)
> +    print_deps(srcrsuggests, "Suggests", spec_preamble_top, d)
>      print_deps(srcrprovides, "Provides", spec_preamble_top, d)
>      print_deps(srcrobsoletes, "Obsoletes", spec_preamble_top, d)
>      
> 


