Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UVMn6-0006d3-Mx
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 16:04:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3PDl8dt027458
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 06:47:08 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 25 Apr 2013 06:47:08 -0700
Message-ID: <517933DC.9080809@windriver.com>
Date: Thu, 25 Apr 2013 08:47:08 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
	<1366888374.14512.78.camel@phil-desktop.brightsign>
In-Reply-To: <1366888374.14512.78.camel@phil-desktop.brightsign>
Subject: Re: [PATCH] rootfs_ipk, image: Add debug capture support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2013 14:05:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/25/13 6:12 AM, Phil Blundell wrote:
> On Tue, 2012-10-02 at 12:38 +0100, Richard Purdie wrote:
>> On Tue, 2012-10-02 at 12:15 +0100, Phil Blundell wrote:
>>> On Tue, 2012-10-02 at 12:12 +0100, Richard Purdie wrote:
>>>> Hasn't Paul added a general mechanism for doing this so we could add
>>>> this feature a level higher so that it could be used by all packaging
>>>> formats?
>>>
>>> Ah, possibly.  I'll have a look.  Can you give me a pointer to the
>>> mechanism you were thinking of?
>>
>> Something like IMAGE_FEATURES += "dbg-pkgs" should trigger the addition
>> of dbg packages.
>
> I've somewhat belatedly gotten around to using this and encountered a
> couple of issuettes:
>
> 1. There was a spurious-looking RRECOMMENDS_${PN}-dbg in bitbake.conf
> which was causing ${PN} to be dragged into the image whenever ${PN}-dbg
> was installed.  This is undesirable because it means that, for example,
> any image which includes sysvinit-pidof will end up installing sysvinit
> and this might cause quite drastic changes to the behaviour of the
> resulting image.
>
> 2. Having fixed the above I'm now left with a couple of file conflicts
> in the -dbg packages.  For example, sysvinit and util-linux both
> ship /sbin/sulogin and so sysvinit-dbg and util-linux-dbg both want to
> install /sbin/.debug/sulogin.  This is unfortunate if you have an image
> which uses, say, sysvinit-pidof and util-linux-blkid.

Is this a problem that they should have used the update-alternatives for 
sulogin?  (Sounds like it might be a security issue though...)  This would avoid 
the .debug conflict.

--Mark

> I'm not quite sure what the right way to fix (2) is.  I suppose in an
> ideal world the -dbg packages would be separated in the same way the
> parent binary packages are, but that doesn't look entirely
> straightforward to arrange.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



