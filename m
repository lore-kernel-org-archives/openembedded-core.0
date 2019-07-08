Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35D517D1E9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 08:59:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x688xHVU027491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Jul 2019 01:59:17 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 8 Jul 2019 01:59:09 -0700
To: Pierre Le Magourou <lemagoup@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20190708081423.8849-1-lemagoup@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <d6dc1c53-9866-16b0-0393-d5fc508e3738@windriver.com>
Date: Mon, 8 Jul 2019 17:00:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708081423.8849-1-lemagoup@gmail.com>
Subject: Re: [PATCH] cve-update-db: Skip recipe when cve-check class is not loaded.
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
X-List-Received-Date: Mon, 08 Jul 2019 08:59:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Great, the "bitbake universe --runall=fetch" works now.

// Robert

On 7/8/19 4:14 PM, Pierre Le Magourou wrote:
> From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
> 
> Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
> ---
>   meta/recipes-core/meta/cve-update-db.bb | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
> index ae8f1a958b..cfeee91c2e 100644
> --- a/meta/recipes-core/meta/cve-update-db.bb
> +++ b/meta/recipes-core/meta/cve-update-db.bb
> @@ -13,6 +13,11 @@ deltask do_compile
>   deltask do_install
>   deltask do_populate_sysroot
>   
> +python () {
> +    if not d.getVar("CVE_CHECK_DB_FILE"):
> +        raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
> +}
> +
>   python do_populate_cve_db() {
>       """
>       Update NVD database with json data feed
> 

