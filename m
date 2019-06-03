Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C1347D391
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 18:54:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x53IrRnn019491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Jun 2019 11:53:43 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 3 Jun 2019 11:53:28 -0700
To: Sakib Sajal <sakib.sajal@windriver.com>,
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <20190531202552.21421-1-sakib.sajal@windriver.com>
	<20190531202552.21421-3-sakib.sajal@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <81affb0d-b4aa-1368-0c7f-d58f3bb2dac8@windriver.com>
Date: Mon, 3 Jun 2019 14:53:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190531202552.21421-3-sakib.sajal@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH 3/3] bash: run bash ptest as non-root user
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
X-List-Received-Date: Mon, 03 Jun 2019 18:54:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 5/31/19 4:25 PM, Sakib Sajal wrote:
> new-exp ptest fails as it expects non-root user.
> 
>>From the failed ptest log:
>     < new-exp.tests: the test suite should not be run as root
>     628c627
>     < argv[1] = <host(2)[5.0]# >
>     ---
>     > argv[1] = <host(2)[5.0]$ >
>     FAIL: run-new-exp
> 
> Many of the ptests declare that they should not be run as root
> and a few fail since the expected result strings are for a
> user shell.
> 
> When ptests are run as bash_user (non-root) the glob test
> fails with error:
>      run-glob-test
>      59,60d58
>      < touch: cannot touch 'a?': Permission denied
>      < touch: cannot touch 'aa': Permission denied
> 
> So ensure that the bash/ptest/tests directory is owned by the
> bash_user while the tests are being run and return it to root
> owner afterwards.
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
> ---
>   meta/recipes-extended/bash/bash/run-ptest | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)


Ugh, there are some problems here.

1. We somehow dropped the change to add 'useradd' to
    the inherit line in bash.inc
2. We didn't confirm that there weren't any regressions
    when running as a user to fix glob-test.
    run-execscript [1] and perhaps other tests are now broken.

Sorry about that.

Fixes will be sent once local testing is done so perhaps
today and if not certainly tomorrow.

../Randy

[1] I should have noticed that Hongxu made some changes
to run some of the tests as non-root 4 years ago.
We'll need to revert/fix those changes now.

commit 1096140cb1d2532ecb38ac5fbbbe13d40fdaf6af
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Sat Nov 28 14:53:40 2015 +0800

     bash: fix testcase run-coproc/run-execscript/run-test/run-heredoc 
failed

> 
> diff --git a/meta/recipes-extended/bash/bash/run-ptest b/meta/recipes-extended/bash/bash/run-ptest
> index c61fabd020..c0cf27b6c2 100644
> --- a/meta/recipes-extended/bash/bash/run-ptest
> +++ b/meta/recipes-extended/bash/bash/run-ptest
> @@ -19,4 +19,8 @@ then
>           echo "Warning: The de_DE* locales is needed to run the intl.tests, please add it."
>   fi
>   
> -make -k THIS_SH=/bin/bash BUILD_DIR=`pwd` srcdir=`pwd`  runtest
> +useradd bash_user
> +chown -R bash_user:bash_user ./tests
> +su bash_user -c "make -k THIS_SH=/bin/bash BUILD_DIR=`pwd` srcdir=`pwd` runtest"
> +chown -R root:root ./tests
> +userdel bash_user
> 


-- 
# Randy MacLeod
# Wind River Linux

