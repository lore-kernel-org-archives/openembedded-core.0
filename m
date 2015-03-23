Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 483FE6AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 22:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 9F6533151A6C;
	Mon, 23 Mar 2015 23:03:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id bYT0ZOMpPUCS; Mon, 23 Mar 2015 23:03:53 +0100 (CET)
Received: from [172.22.22.61] (55d41d03.access.ecotel.net [85.212.29.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 6C3C2315193F;
	Mon, 23 Mar 2015 23:03:53 +0100 (CET)
Message-ID: <55108DC7.7020801@opendreambox.org>
Date: Mon, 23 Mar 2015 23:03:51 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1427125146-4871-1-git-send-email-obi@opendreambox.org>
	<CADkTA4MS10SSdxRibMSmUJbrBRGWwgmnk0COEwj_yUkjN8Howw@mail.gmail.com>
In-Reply-To: <CADkTA4MS10SSdxRibMSmUJbrBRGWwgmnk0COEwj_yUkjN8Howw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-module-split.bbclass: fix autoloading from postinst script
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
X-List-Received-Date: Mon, 23 Mar 2015 22:03:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 23.03.2015 21:51, Bruce Ashfield wrote:
> On Mon, Mar 23, 2015 at 11:39 AM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
>> When using KERNEL_MODULE_AUTOLOAD, autoload was empty, causing
>> "modprobe None" to get appended to the postinst script.
> 
> I stared at this a bit and it looks right to me, but let me ask a
> question. Are you saying
> that KERNEL_MODULE_AUTOLOAD isn't working for anyone ? Or just in a specific
> configuration ?
> 
> I don't have a build to check this at the moment, but I swear my
> autoloads were working!

It already works on boot. This patch only fixes autoloading of modules
installed from a package feed, i.e. modprobed by a postinst script.

Regards,
Andreas

> 
> Bruce
> 
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  meta/classes/kernel-module-split.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
>> index 68a23f8..e1a70e6 100644
>> --- a/meta/classes/kernel-module-split.bbclass
>> +++ b/meta/classes/kernel-module-split.bbclass
>> @@ -148,7 +148,7 @@ python split_kernel_module_packages () {
>>              postinst = d.getVar('pkg_postinst_%s' % pkg, True)
>>              if not postinst:
>>                  bb.fatal("pkg_postinst_%s not defined" % pkg)
>> -            postinst += d.getVar('autoload_postinst_fragment', True) % autoload
>> +            postinst += d.getVar('autoload_postinst_fragment', True) % (autoload or basename)
>>              d.setVar('pkg_postinst_%s' % pkg, postinst)
>>
>>          # Write out any modconf fragment
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 


