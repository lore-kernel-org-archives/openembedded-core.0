Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4C3D16FF73
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 23:18:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u49NIImW029383
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 May 2016 16:18:18 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 9 May 2016 16:18:17 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1462832624.git.paul.eggleton@linux.intel.com>
	<f072033b140806b67ff2b098d6aa3d3a7e85a7b5.1462832624.git.paul.eggleton@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <33469fdb-ce28-8caa-2632-2ae14e8c912e@windriver.com>
Date: Mon, 9 May 2016 18:18:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <f072033b140806b67ff2b098d6aa3d3a7e85a7b5.1462832624.git.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH v2 1/2] classes/insane: do not force LIC_FILES_CHKSUM unless SRC_URI is set
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
X-List-Received-Date: Mon, 09 May 2016 23:18:20 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 5/9/16 5:25 PM, Paul Eggleton wrote:
> Recipes such as images and packagegroups don't actually fetch or build
> any source, so there's really no point having LIC_FILES_CHKSUM set.
> Forcing users to set it (as we have done for images inheriting
> image.bbclass) just makes things more difficult for the user for no
> discernable benefit. The easiest way to adjust this check is simply to
> skip it if SRC_URI is not set since this is a pretty good indicator that
> no source is being pulled in.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

I think this is a good idea.  I'd not considered empty SRC_URI as a pointer to
no LIC_FILES_CHKSUM, but it makes sense to me.

--Mark

> ---
>  meta/classes/insane.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 097dc3a..0b151c2 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -681,15 +681,15 @@ python populate_lic_qa_checksum() {
>      import tempfile
>      sane = True
>  
> -    lic_files = d.getVar('LIC_FILES_CHKSUM', True)
> +    lic_files = d.getVar('LIC_FILES_CHKSUM', True) or ''
>      lic = d.getVar('LICENSE', True)
>      pn = d.getVar('PN', True)
>  
>      if lic == "CLOSED":
>          return
>  
> -    if not lic_files:
> -        package_qa_handle_error("license-checksum", pn + ": Recipe file does not have license file information (LIC_FILES_CHKSUM)", d)
> +    if not lic_files and d.getVar('SRC_URI', True):
> +        package_qa_handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)
>          return
>  
>      srcdir = d.getVar('S', True)
> 


