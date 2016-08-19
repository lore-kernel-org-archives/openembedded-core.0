Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B5CDD76FFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 12:56:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7JCuPbg025145
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 05:56:25 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 19 Aug 2016 05:56:25 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1471539779.git.mark.hatle@windriver.com>
	<ac8bfa5987396bae636ebb152128755967d3ce83.1471539779.git.mark.hatle@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <d25a976d-7206-b00d-16de-bf308a6d82f0@windriver.com>
Date: Fri, 19 Aug 2016 07:56:24 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <ac8bfa5987396bae636ebb152128755967d3ce83.1471539779.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 2/3] local.conf.sample: Disable ARM and PPC due to prelink test case failures
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
X-List-Received-Date: Fri, 19 Aug 2016 12:56:25 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Just an FYI - I've investigated the ARM and PPC failures further.  It looks like
it may be a binutils problem.

Both of the failed tests link applications using the arguments "-Wl,-z,nocopyreloc"

Once this has been done, the executable will not run.  (Aborts very early.)

I'm currently verifying if this did work in the past.

--Mark

On 8/18/16 12:04 PM, Mark Hatle wrote:
> Internal prelink test cases reloc8 and reloc9 are failing on both ARM
> and PPC systems.  Disable them by removing the prelink from the
> IMAGE_CLASSES setting.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/conf/local.conf.sample | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 2949ffb..8879a08 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -132,6 +132,15 @@ EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
>  # image-prelink disabled for now due to issues with IFUNC symbol relocation
>  USER_CLASSES ?= "buildstats image-mklibs"
>  
> +# Prelinker tests are currently failing on ARM and PPC.  Prevent us from
> +# running on those architectures until the failure is explained.
> +USER_CLASSES_remove_arm = 'image-prelink'
> +USER_CLASSES_remove_armeb = 'image-prelink'
> +USER_CLASSES_remove_aarch64 = 'image-prelink'
> +USER_CLASSES_remove_aarch64eb = 'image-prelink'
> +USER_CLASSES_remove_powerpc = 'image-prelink'
> +USER_CLASSES_remove_powerpc64 = 'image-prelink'
> +
>  
>  #
>  # Runtime testing of images
> 


