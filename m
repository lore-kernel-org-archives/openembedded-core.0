Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E92936D138
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 08:37:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAT8b1UL019894
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 00:37:01 -0800 (PST)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Fri, 29 Nov 2013 00:37:00 -0800
Message-ID: <52985227.8040603@windriver.com>
Date: Fri, 29 Nov 2013 16:36:55 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1385634389-31914-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1385634389-31914-1-git-send-email-ming.liu@windriver.com>
X-Originating-IP: [128.224.162.145]
Subject: Re: [PATCH] gzip: fix MakeMaker issues with using wrong SHELL/GREP
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
X-List-Received-Date: Fri, 29 Nov 2013 08:37:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/28/2013 06:26 PM, Ming Liu wrote:
> Paths of shell/grep is being determined by detecting from host at configure
> stage, and then will be hard coded into scripts like zgrep, this would
> cause a following runtime error:
> "/usr/bin/zgrep: line 230: /usr/bin/grep: No such file or directory"
>
> Fixed by using runtime paths instead.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>   meta/recipes-extended/gzip/gzip.inc | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
> index 6ec1dae..4b265a6 100644
> --- a/meta/recipes-extended/gzip/gzip.inc
> +++ b/meta/recipes-extended/gzip/gzip.inc
> @@ -12,6 +12,11 @@ SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
>   
>   inherit autotools
>   
> +do_configure_prepend () {
> +	sed '\#|/bin/sh|\$(SHELL)|#d' -i Makefile.am
> +	sed 's#\(|\[@\]GREP@|\)\$(GREP)#\1/bin/grep#g' -i Makefile.am
There is a hardcode /bin/grep here, should be removed, and I am told 
it's better to use patch instead of prepending to do_configure task, so 
I will send the V2 soon.

//Ming Liu
> +}
> +
>   do_install_append () {
>   	# Rename and move files into /bin (FHS), which is typical place for gzip
>   	install -d ${D}${base_bindir}


