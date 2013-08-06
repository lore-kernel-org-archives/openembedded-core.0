Return-Path: <Yang.Shi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 783996B563
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 23:44:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r76NiQil011342
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Aug 2013 16:44:27 -0700 (PDT)
Received: from [147.11.152.84] (147.11.152.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 6 Aug 2013 16:44:25 -0700
Message-ID: <52018A59.3020508@windriver.com>
Date: Tue, 6 Aug 2013 16:44:25 -0700
From: Yang Shi <yang.shi@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
Subject: Out-of-tree kernel module in multilib build
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
X-List-Received-Date: Tue, 06 Aug 2013 23:44:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi folks,

I'm looking a defect about out-of-tree kernel module in multilib build.

I'm building hello-mod package to run my test. During my test, I found 
module-split generates kernel-module-hello package (naming style is 
"kernel-module-" + ${moudle_name}). And, the real kernel module file is 
included in this package.

So, is this right or expected behavior to have kernel module package 
named with module name (kernel-module-hello) rather than the package 
name (kernel-module-hello-mod)? Isn't the multilib name, and 'regular' 
name for a kernel module package supposed to be identical?


But, for making multilib build happy, we need kernel-module-hello-mod 
package (naming style is "kernel-module-${PN}). Actually, it's a empty 
package (hello-mod or kernel-module-hello-mod). So, in hello-mod case, 
we need both:

kernel-module-hello-0.1-r0.4.intel_xeon_core.rpm
kernel-module-hello-mod-0.1-r0.4.intel_xeon_core.rpm

As we known, the workaround is to rename the package name to 
"kernel-module-" + ${PN} in hello-mod bb file otherwise multilib needs 
${mlib}-hello-mod package, i.e. lib32-hello-mod.

I'm not quite sure if this is a real fix or just a workaround? If it's 
not a real fix, how can we make multilib skip out-of-tree kernel module 
package? What code should I look into?

How are in-tree kernel modules skipped by multilib? Just because their 
names start with "kernel-module-"?

If we can't suppose multilib name, and 'regular' name for a kernel 
module package are identical, the workaround may sound like a real fix.

Thanks,
Yang

