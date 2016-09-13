Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 858197017D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 03:08:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8D38rja000526
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Sep 2016 20:08:53 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Mon, 12 Sep 2016 20:08:52 -0700
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>
References: <1473129577-17238-1-git-send-email-mingli.yu@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <57D76CBF.1050108@windriver.com>
Date: Tue, 13 Sep 2016 11:04:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1473129577-17238-1-git-send-email-mingli.yu@windriver.com>
X-Originating-IP: [128.224.163.140]
Subject: Re: [PATCH v2] groff: not ship /usr/bin/glilypond
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
X-List-Received-Date: Tue, 13 Sep 2016 03:09:01 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Any update?

Thanks,


On 2016年09月06日 10:39, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Not ship /usr/bin/glilypond and related files such
> as man file /usr/share/man/man1/glilypond.1 and other
> three files related to glilypond under
> /usr/lib/groff/glilypond in embedded system, it is because:
>
> - Remove the confusion about glilypond fails to run
>    because it lacks dependency on File::HomeDir perl
>    module
>
> - We don't often have need for sheet music conversion
>    in groff in embedded or IoT devices (glilypond
>    transforms sheet music written in the lilypond language
>    into the groff language using the .PSPIC request, such
>    that groff can transform it into a format that can be
>    displayed directly).
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>   meta/recipes-extended/groff/groff_1.22.3.bb | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-extended/groff/groff_1.22.3.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
> index af5acbe..dd241f3 100644
> --- a/meta/recipes-extended/groff/groff_1.22.3.bb
> +++ b/meta/recipes-extended/groff/groff_1.22.3.bb
> @@ -62,6 +62,11 @@ do_install_append() {
>   	if [ -f ${SPECIAL_AWK} ]; then
>   		sed -i -e 's:#!.*awk:#! ${USRBINPATH}/awk:' ${SPECIAL_AWK}
>   	fi
> +
> +	# not ship /usr/bin/glilypond and its releated files in embedded target system
> +	rm -rf ${D}${bindir}/glilypond
> +	rm -rf ${D}${libdir}/groff/glilypond
> +	rm -rf ${D}${mandir}/man1/glilypond*
>   }
>
>   do_install_append_class-native() {
>

