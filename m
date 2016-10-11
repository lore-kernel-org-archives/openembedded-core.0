Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DE177719FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 08:37:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9B8bsPk025875
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 01:37:55 -0700 (PDT)
Received: from soho-mhatle-m.local (147.11.116.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Oct 2016 01:37:54 -0700
To: Yuanjie Huang <Yuanjie.Huang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20161011080241.24267-1-Yuanjie.Huang@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <39a3791d-d74a-21de-5806-edda4c26b33f@windriver.com>
Date: Tue, 11 Oct 2016 10:37:52 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161011080241.24267-1-Yuanjie.Huang@windriver.com>
Subject: Re: [PATCH] glibc: Fix timestamp of plural.c after unpack
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
X-List-Received-Date: Tue, 11 Oct 2016 08:37:54 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

FYI this particular issue was observed by one of our customers.  Starting around
the YP 2.0 time period.  (We did not observe the problem prior to 2.0, but it
may be present.)

My understanding of the issue is that the extraction of the plural.c and
plural.y files happens so quickly that it is unclear to make if one is older
then the other -- so it sometimes uses bison to rebuild the plural.c.  This
produces a non-deterministic build.

The patch below addresses this by inserting a task between unpack and patch that
makes sure we use the plural.c from the archive.  If a later patch changes
plural.y -- it will then be reconstructed as expected from source.

--Mark

On 10/11/16 10:02 AM, Yuanjie Huang wrote:
> From: Yuanjie Huang <yuanjie.huang@windriver.com>
> 
> Source file plural.c might be updated with bison from plural.y, touch it
> before applying patches so that this file is consistent across builds.
> 
> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index e85c704..5225dfc 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -78,3 +78,10 @@ do_configure_prepend() {
>  }
>  
>  GLIBC_ADDONS ?= "nptl,libidn"
> +
> +# Ensure that plural.c is newer than its Bison source plural.y,
> +# unless the latter is patched.
> +do_unpack_workaround() {
> +	touch ${S}/intl/plural.c
> +}
> +addtask unpack_workaround after do_unpack before do_patch
> 


