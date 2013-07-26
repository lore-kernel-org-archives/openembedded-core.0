Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 423FF601AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 01:25:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6Q1PODt001240
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Jul 2013 18:25:24 -0700 (PDT)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 25 Jul 2013 18:25:23 -0700
Message-ID: <51F1CFFF.3090600@windriver.com>
Date: Fri, 26 Jul 2013 09:25:19 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1374112474-13597-1-git-send-email-ming.liu@windriver.com>
	<51ECAB78.5070002@linux.intel.com>
	<5A29E957-205C-4040-A091-ED733D27F223@dominion.thruhere.net>
In-Reply-To: <5A29E957-205C-4040-A091-ED733D27F223@dominion.thruhere.net>
X-Originating-IP: [128.224.162.145]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3] util-linux: replace += with _append to EXTRA_OECONF_class-native
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
X-List-Received-Date: Fri, 26 Jul 2013 01:25:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2013 08:55 PM, Koen Kooi wrote:
> Op 22 jul. 2013, om 05:48 heeft Saul Wold <sgw@linux.intel.com> het volgende geschreven:
>
>> On 07/17/2013 06:54 PM, Ming Liu wrote:
>>> The native/nativesdk overrides of EXTRA_OECONF should take effect before
>>> append operator, otherwise, it will cause EXTRA_OECONF be overridden instead
>>> of be appended at native/nativesdk build time.
>>>
>>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>>> ---
>>>   meta/recipes-core/util-linux/util-linux_2.23.1.bb |    4 ++--
>>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/util-linux/util-linux_2.23.1.bb b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
>>> index 12f5021..3040476 100644
>>> --- a/meta/recipes-core/util-linux/util-linux_2.23.1.bb
>>> +++ b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
>>> @@ -18,5 +18,5 @@ SRC_URI[md5sum] = "6741eeaff93ff5a6bacdd3816bdd87c4"
>>>   SRC_URI[sha256sum] = "ad4a7831d7b27d0172996fd343e809716c2403b32a94e15194d8ea797223c4af"
>>>
>>>   CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
>>> -EXTRA_OECONF_class-native += "--disable-fallocate --disable-use-tty-group"
>>> -EXTRA_OECONF_class-nativesdk += "--disable-fallocate --disable-use-tty-group"
>>> +EXTRA_OECONF_append_class-native = " --disable-fallocate --disable-use-tty-group"
>>> +EXTRA_OECONF_append_class-nativesdk = " --disable-fallocate --disable-use-tty-group"
>>>
>> While this seems correct, it is causing some down stream issues with e2fsprogs-native and not finding the uuid library
> I ran into this when backporting fixes for texinfoand gcc 4.8 hosts from master to danny and I used this hack:
>
> 	https://github.com/Angstrom-distribution/oe-core/commit/9cd55347769555e89374e83d011196ae5450204a
>
> Not pretty, but it only affects the -native builds.

This hack may work for e2fsprogs-native because it uses a internal 
libuuid instead of detecting it in system, but it doesn't hit the root 
cause of this issue, as I described in this thread.

the best,
thank you
>
> regards,
>
> Koen
>


