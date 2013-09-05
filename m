Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4F8C6C6BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:41:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r85DfHGv013188
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Sep 2013 06:41:17 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 5 Sep 2013 06:41:17 -0700
Message-ID: <52288A1E.6000808@windriver.com>
Date: Thu, 5 Sep 2013 21:41:50 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1378385266.git.Qi.Chen@windriver.com>
	<c425dc883150a2c69a92feae459545086e264ac9.1378385266.git.Qi.Chen@windriver.com>
In-Reply-To: <c425dc883150a2c69a92feae459545086e264ac9.1378385266.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.233]
Subject: Re: [PATCH 1/2] ptest.bbclass: fix error on ubuntu host
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
X-List-Received-Date: Thu, 05 Sep 2013 13:41:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Just noticed the do_configure_ptest_base and do_compile_ptest_base also 
have this problem.

I'll send out a new patchset.

//Chen Qi

On 09/05/2013 08:49 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The do_install_ptest_base function uses 'type -t' command to check
> whether do_install_ptest is a function and acts correspondingly.
>
> However, the 'type' command is a shell builtin and its behavior is
> not all the same across Linux distros. On ubuntu, if we use #!/bin/sh
> as the interpreter for the scripts, as in the case of our intermediate
> scripts, the '-t' option for the 'type' command is not supported. So
> the check always fails and the do_install_ptest function, even if defined,
> is not run.
>
> This patch fixes this problem by avoiding using the 'type' builtin command.
>
> [YOCTO #5128]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/ptest.bbclass |    8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
> index 37357e8..71183af 100644
> --- a/meta/classes/ptest.bbclass
> +++ b/meta/classes/ptest.bbclass
> @@ -32,6 +32,10 @@ do_compile_ptest_base() {
>       fi
>   }
>   
> +do_install_ptest() {
> +    :
> +}
> +
>   do_install_ptest_base() {
>       if [ ${PTEST_ENABLED} = 1 ]; then
>           if [ -f ${WORKDIR}/run-ptest ]; then
> @@ -39,9 +43,7 @@ do_install_ptest_base() {
>               if grep -q install-ptest: Makefile; then
>                   oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
>               fi
> -            if [ a$(type -t do_install_ptest) = afunction ]; then
> -                do_install_ptest
> -            fi
> +            do_install_ptest
>           fi
>       fi
>   }


