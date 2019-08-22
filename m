Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 894967DDAA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 03:00:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7M2xnLh025751
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 20:00:00 -0700
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 21 Aug 2019 19:59:39 -0700
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1566417666-22515-1-git-send-email-Trevor.Gamblin@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <ad31f9c1-2fcf-bffe-3695-e52d13868434@windriver.com>
Date: Wed, 21 Aug 2019 22:59:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566417666-22515-1-git-send-email-Trevor.Gamblin@windriver.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [PATCH 1/2] quilt: Export missing QUILT_PC variable in ptest Makefile
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
X-List-Received-Date: Thu, 22 Aug 2019 03:00:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

    quilt: Export missing QUILT_PC variable in ptest Makefile
is over the 50 character suggested short summary limit:
    quilt: Export QUILT_PC variable in ptest Makefile
works. :)

On 8/21/19 4:01 PM, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
> 
> The quilt ptest uses a custom Makefile to implement the
> "make check" rule, but the ptest Makefile does not export
> the value QUILT_PC, which is user-settable and normally
s/value/variable/
> defaults to ".pc". This causes failures e.g. import.test
> with "rm -rf patches/ %{QUILT_PC}/", evaluating to
> "rm -rf patches/ /" if the variable is not set by the
> Makefile. 

Add that:

These ptests broke in:
   73d6034f6b quilt: update to 0.66
when the upstream quilt developers enabled users to specify
their own QUILT_PC string.

../Randy


> 
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta/recipes-devtools/quilt/quilt/Makefile | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/quilt/quilt/Makefile b/meta/recipes-devtools/quilt/quilt/Makefile
> index 7b3ac8a..1f6cd24 100644
> --- a/meta/recipes-devtools/quilt/quilt/Makefile
> +++ b/meta/recipes-devtools/quilt/quilt/Makefile
> @@ -2,7 +2,8 @@ PATH :=         $(CURDIR)/bin:$(CURDIR)/compat:$(PATH)
>   QUILT_DIR :=    $(CURDIR)/quilt
>   QUILTRC :=      $(CURDIR)/test/test.quiltrc
>   export QUILT_DIR QUILTRC
> -CHECK_ENV := P=patches/; _P=../patches/; export P _P
> +CHECK_ENV := P=patches/; _P=../patches/; export P _P;
> +CHECK_ENV += QUILT_PC=.pc; export QUILT_PC
>   -include test/.depend
>   
>   check-% : test/%.test
> 


-- 
# Randy MacLeod
# Wind River Linux

