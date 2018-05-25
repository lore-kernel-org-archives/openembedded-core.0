Return-Path: <Yue.Tao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BFEFE747DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 10:32:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4PAW5eN006065
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 May 2018 03:32:21 -0700
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 25 May 2018 03:31:54 -0700
Message-ID: <5B07E697.5070900@windriver.com>
Date: Fri, 25 May 2018 18:33:59 +0800
From: "yue.tao" <yue.tao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Joshua Watt <jpewhacker@gmail.com>
References: <20180525030911.55982-1-Yue.Tao@windriver.com>
	<CAJdd5GYqp=urzru6H8EuTtS63QxjGC7BMntuV10w+KXediE9-w@mail.gmail.com>
In-Reply-To: <CAJdd5GYqp=urzru6H8EuTtS63QxjGC7BMntuV10w+KXediE9-w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] waf.bbclass: correct the searching patch of waf
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
X-List-Received-Date: Fri, 25 May 2018 10:32:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

You're correct. After updating the last commit of meta-oe, the commit 
below has already fixed this issue. Thank Watt.


commit 29e280ee11c9a6f13c004ff25299668e4616f275
Author: Joshua Watt <jpewhacker@gmail.com>
Date:   Mon Feb 12 10:20:41 2018 -0600

     waf-samba.bbclass: No longer inherit waf.bbclass

     waf-samba.bbclass uses waf in a very different way than the "standard"
     method that waf.bbclass targets and ends getting very little useful
     functionality from that class.

     Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
     Signed-off-by: Armin Kuster <akuster808@gmail.com>


Thanks,
yue.tao


On 2018年05月25日 11:46, Joshua Watt wrote:
>
>
> On Thu, May 24, 2018, 22:10 Yue Tao <Yue.Tao@windriver.com
> <mailto:Yue.Tao@windriver.com>> wrote:
>
>     The waf is localed at ${S}/buildtools/bin/, not ${S}. Update the
>     subsrcdir to look for the right path. The WARNINGs below can be fixed
>     by the fix.
>
>     WARNING: lib32-libtalloc-2.1.9-r0 do_configure: Unable to execute
>     waf --version, exit code 127. Assuming waf version without
>     bindir/libdir support.
>     WARNING: lib32-libtdb-1.3.14-r0 do_configure: Unable to execute waf
>     --version, exit code 127. Assuming waf version without bindir/libdir
>     support.
>     WARNING: lib32-libtevent-0.9.31-r0 do_configure: Unable to execute
>     waf --version, exit code 127. Assuming waf version without
>     bindir/libdir support.
>     WARNING: lib32-libldb-1.1.29-r0 do_configure: Unable to execute waf
>     --version, exit code 127. Assuming waf version without bindir/libdir
>     support.
>     WARNING: lib32-samba-4.6.7-r0 do_configure: Unable to execute waf
>     --version, exit code 127. Assuming waf version without bindir/libdir
>     support.
>
>     Signed-off-by: Yue Tao <Yue.Tao@windriver.com
>     <mailto:Yue.Tao@windriver.com>>
>     ---
>       meta/classes/waf.bbclass | 2 +-
>       1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
>     index 19e93761b3..f8e66835fb 100644
>     --- a/meta/classes/waf.bbclass
>     +++ b/meta/classes/waf.bbclass
>     @@ -7,7 +7,7 @@ python waf_preconfigure() {
>           import subprocess
>           from distutils.version import StrictVersion
>           subsrcdir = d.getVar('S')
>     -    wafbin = os.path.join(subsrcdir, 'waf')
>     +    wafbin = os.path.join(subsrcdir + '/buildtools/bin/', 'waf')
>
>
> NACK. ${S}/waf is the "standard" location for waf, if your recipe has it
> in a different location, you need to parameterize it. Probably something
> like:
>
>   WAF ?= "${S}/waf"
>
> However, I thought these recipes were inheriting from waf-samba.bbclass
> which already does the right thing. Perhaps you have an outdated version
> of meta-oe?
>
>           try:
>               result = subprocess.check_output([wafbin, '--version'],
>     cwd=subsrcdir, stderr=subprocess.STDOUT)
>               version = result.decode('utf-8').split()[1]
>     --
>     2.17.0
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


