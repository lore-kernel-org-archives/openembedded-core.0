Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 0F1BE6AFB5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 20:46:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7JKkXHb020422
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 16:46:34 -0400 (EDT)
Received: from [128.224.146.246] (128.224.146.246) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 19 Aug 2013 13:46:33 -0700
Message-ID: <52128427.3020009@windriver.com>
Date: Mon, 19 Aug 2013 16:46:31 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: wenzong fan <wenzong.fan@windriver.com>
References: <520C9F8A.7080703@windriver.com>
In-Reply-To: <520C9F8A.7080703@windriver.com>
X-Originating-IP: [128.224.146.246]
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: About PACKAGECONFIG audit
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
X-List-Received-Date: Mon, 19 Aug 2013 20:46:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Add Joe Slater who owns US17463: PACKAGECONFIG clean-up.


On 13-08-15 05:29 AM, wenzong fan wrote:
> Hi All,
>
> We have seen some problems like this:
>
> $ bitbake libcap
>
> ld: warning: libaudit.so.1, needed by .../lib64/libpam.so, not found
> .../lib64/libpam.so: undefined reference to `audit_open'
> .../lib64/libpam.so: undefined reference to `audit_close'
> ......
>
> The libaudit has been available and libpam build with it, after we run
> another build with sstate-cache and w/o libaudit, the error occurs. The
> solution in these cases is to use PACKAGECONFIG to lay out dependencies
> on optional packages and make them explicit. We need to run an audit and
> catch all of these issues.
>
> A probable ways maybe:
>
> 1) Run world build to generate the sysroots as much as possible;
> 2) Run 'configure --help' on each package to spot all of the optional
> dependencies, and convert them into PACKAGECONFIG specs/or any other
> prompts.

We should try to automate or codify this step so that the output is
a list of oe-core package names.

> 3) Run #1, #2 as an audit script periodically.
>
> Or could we run this check as part of a QA build step?

Do you mean:
   scripts/test-dependencies.sh

// Randy

>
>
> Thanks
> Wenzong


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

