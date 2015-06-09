Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 775D17568B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 10:00:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t599xtvc011789
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Jun 2015 02:59:55 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 02:59:55 -0700
Message-ID: <5576B919.9010808@windriver.com>
Date: Tue, 9 Jun 2015 17:59:53 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Costin Constantin <costin.c.constantin@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1433843066-7433-1-git-send-email-costin.c.constantin@intel.com>
In-Reply-To: <1433843066-7433-1-git-send-email-costin.c.constantin@intel.com>
Subject: Re: [PATCH] meta/testimage.bbclass: corrected the bug that prevented test cases to be loaded from layers other than meta when using TEST_SUITES = "auto"
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
X-List-Received-Date: Tue, 09 Jun 2015 10:00:17 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Costin,

I think that the subject line should be less than 50 characters, usually.

// Robert

On 06/09/2015 05:44 PM, Costin Constantin wrote:
> Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
> ---
>   meta/classes/testimage.bbclass | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> index 4074ff7..aadee45 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -88,19 +88,20 @@ def get_tests_list(d, type="runtime"):
>
>       if "auto" in testsuites:
>           def add_auto_list(path):
> -            if not os.path.exists(os.path.join(path, '__init__.py')):
> -                bb.fatal('Tests directory %s exists but is missing __init__.py' % path)
>               files = sorted([f for f in os.listdir(path) if f.endswith('.py') and not f.startswith('_')])
>               for f in files:
>                   module = 'oeqa.' + type + '.' + f[:-3]
>                   if module not in testslist:
>                       testslist.append(module)
> -
> +        tests_found = False
>           for p in bbpath:
>               testpath = os.path.join(p, 'lib', 'oeqa', type)
>               bb.debug(2, 'Searching for tests in %s' % testpath)
> -            if os.path.exists(testpath):
> +            if os.path.exists(os.path.join(testpath, '__init__.py')):
>                   add_auto_list(testpath)
> +                tests_found = True
> +        if not tests_found:
> +            bb.fatal('Couldn\'t find any test files inside  meta*/lib/oeqa/runtime or meta*/lib/oeqa/sdk directories.')
>
>       return testslist
>
>

