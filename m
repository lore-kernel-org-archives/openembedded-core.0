Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D72367D674
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 09:01:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4L91Yo1010922
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 02:01:35 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 21 May 2019 02:01:34 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1558428555-24836-1-git-send-email-hongxu.jia@windriver.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <ac48b674-4eae-9bda-d9aa-162027c91390@windriver.com>
Date: Tue, 21 May 2019 17:01:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558428555-24836-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH] xmlto: set CLEANBROKEN = "1"
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
X-List-Received-Date: Tue, 21 May 2019 09:01:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 5/21/19 4:49 PM, Hongxu Jia wrote:
> While rebuilding xmlto or xmlto-native, `make clean' in do_configure
> will remove man/man1/xmlif.1 which triger failure in do_compile
>
> $ bitbake xmlto-native
> $ bitbake xmlto-native -cconfigure -f
> $ bitbake xmlto-native -ccompile -f

Clarify two thing someone may ask:

1. The reproduce steps seems a bit weird

It just simplify the problem, the real environment is multiple build

share a common sstate, and the latter one trigger xmlto rebuilt

> ...
> |FORMAT_DIR=./format /bin/bash ./xmlto -o man/man1 man doc/xmlif.xml
> |xmlto: tmp-glibc/work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto-0.0.28/
> doc/xmlif.xml does not validate (status 3)
> |xmlto: Fix document syntax or use --skip-validation option
> I/O error : Attempt to load network entity http://www.oasis-open.org/
> docbook/xml/4.2/docbookx.dtd
> ...

2. The issue seems upstream problem, why not fix it.

The failure is to regenerate the missing document, I don't think

it worth to take time on it


//Hongxu


> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> index df798df..7d27c43 100644
> --- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> +++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> @@ -13,6 +13,8 @@ SRC_URI[sha256sum] = "2f986b7c9a0e9ac6728147668e776d405465284e13c74d4146c9cbc51f
>   
>   inherit autotools
>   
> +CLEANBROKEN = "1"
> +
>   DEPENDS = "libxml2-native"
>   
>   RDEPENDS_${PN} = "docbook-xml-dtd4 \



