Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SCemN-0001kO-ND
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 00:22:16 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2RMDDO4029581
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 15:13:13 -0700 (PDT)
Received: from msp-dhcp8.wrs.com (172.25.34.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 27 Mar 2012 15:13:13 -0700
Message-ID: <4F723B78.2060308@windriver.com>
Date: Tue, 27 Mar 2012 17:13:12 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
	<1332877869-12195-3-git-send-email-kergoth@gmail.com>
	<4F72219A.2020301@windriver.com>
	<CABcZANmm5BNHdMtSJJ_P6WNpkgrQ+1vhbHgDg1-9Dc_FXWbhgQ@mail.gmail.com>
	<4F723618.6060104@windriver.com>
	<F4FE715B8B374104BDAF129362EBDD00@gmail.com>
In-Reply-To: <F4FE715B8B374104BDAF129362EBDD00@gmail.com>
Subject: Re: [PATCH 3/3] powerpc: define TUNE_PKGARCH for powerpc/powerpc-nf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2012 22:22:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/12 4:57 PM, Christopher Larson wrote:
> On Tuesday, March 27, 2012 at 2:50 PM, Mark Hatle wrote:
>> On 3/27/12 4:05 PM, Chris Larson wrote:
>>
>> On PowerPC TUNE_PKGARCH should be set to powerpc (or overriden by the machines).
>> On PowerPC64, it should be set to powerpc64. If this is not happening that is
>> the bug, lack of the default TUNE_PKGARCH. (based on the original implementation.)
>
> I don't think your point of view is covering all the issues.
>
> The default TUNE_PKGARCH is TUNE_PKGARCH_${TUNE_PKGARCH_tune-${DEFAULTTUNE}. If
> arch-powerpc.inc sets TUNE_PKGARCH directly, as it used to, then all the more
> specific tunings won't have their TUNE_PKGARCH_tune-<tune> obeyed, which was the
> behavior prior to my submitting a patch which removed the explicit TUNE_PKGARCH
> override in arch-powerpc.inc.

TUNE_PKGARCH_[override] should always replace TUNE_PKGARCH shouldn't it?  Why 
isn't the override being obeyed is my issue.  I really don't care much about the 
implementation other then originally I was told not to do that during various 
reviews.. and that the tuning (override) would always replace TUNE_PKGARCH.

> So we have two options. Either we override TUNE_PKGARCH directly in
> arch-powerpc.inc again, thereby making powerpc tune- files like tune-ppce500v2
> not have their TUNE_PKGARCH_tune-<tune> obeyed (or those tune- files have to
> override TUNE_PKGARCH as well, which seems counter to the whole design of the
> tuning implementation), or we add TUNE_PKGARCH_tune-<tune> definitions for the
> generic tunings also.

We need to be consistent as far as I'm concerned.  If we want to add 
TUNE_PKGARCH_tune-<tune> to all of the tunings, and base architecture 
definitions that is fine.  What I don't want is a mix of different ways this 
stuff is implemented.  It's already complicated enough for people to look at and 
identify what is going on today with subtle differences between the files.

If you can explain why the override isn't overriding the default TUNE_PKGARCH 
(and it's intentional and not a bug), and we can consistently modify all of the 
elements... I'm happy to accept the changes to all of the tunings.

--Mark

> -Chris
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



