Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8EE7E6AB
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 15:16:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x51FGRZu020137
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 1 Jun 2019 08:16:27 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Sat, 1 Jun 2019 08:16:26 -0700
To: Sakib Sajal <sakib.sajal@windriver.com>,
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <20190531202552.21421-1-sakib.sajal@windriver.com>
	<20190531202552.21421-3-sakib.sajal@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <71b12ad8-a67a-80fb-f3d1-e0ed583c4932@windriver.com>
Date: Sat, 1 Jun 2019 11:16:25 -0400
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
X-List-Received-Date: Sat, 01 Jun 2019 15:16:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 5/31/19 4:25 PM, Sakib Sajal wrote:
> new-exp ptest fails as it expects non-root user.

This patch made me wonder if by default we should be
running the ptest as a user and assigning owndership of
all the ptest files to the same user.

I will open an ER if no one points out a reason not
to make such a change. I expect that some ptests would
need passwordless sudo access.

../Randy

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

