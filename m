Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5C26041D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 19:49:32 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4UJrlDQ012616; Thu, 30 May 2013 20:53:47 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id r_A8wiA4wJm1; Thu, 30 May 2013 20:53:47 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4UJriCQ012612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 30 May 2013 20:53:46 +0100
Message-ID: <1369943353.14887.327.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>
Date: Thu, 30 May 2013 20:49:13 +0100
In-Reply-To: <1369334701-18752-1-git-send-email-ross.burton@intel.com>
References: <1369334701-18752-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] test-utils: handle import bb failing and skip the test
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
X-List-Received-Date: Thu, 30 May 2013 19:49:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-23 at 19:44 +0100, Ross Burton wrote:
> Instead of reporting an error when bb cannot be imported, skip the test
> instead. This makes it a lot easier to iterate a test suite when we don't care
> about this particular test.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/lib/oe/tests/test_utils.py |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/tests/test_utils.py b/meta/lib/oe/tests/test_utils.py
> index 466c47e..779247a 100644
> --- a/meta/lib/oe/tests/test_utils.py
> +++ b/meta/lib/oe/tests/test_utils.py
> @@ -1,11 +1,15 @@
>  import unittest
> -import bb, oe.utils
> +import oe.utils
>  
>  class TestPackagesFilterOutSystem(unittest.TestCase):
>      def test_filter(self):
>          """
>          Test that oe.utils.packages_filter_out_system works.
>          """
> +        try:
> +            import bb
> +        except ImportError:
> +            self.skipTest("Cannot import bb")
>  
>          d = bb.data_smart.DataSmart()
>          d.setVar("PN", "foo")

This a python 2.7ism :(

For various reasons we should really add unittest from python 2.7 into
bitbake and solve this problem that way once and for all. I appreciate
that adds a hard dependency on using bitbake but OE isn't much use
without it...

Cheers,

Richard


