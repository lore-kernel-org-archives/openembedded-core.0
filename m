Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7934974767
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Apr 2018 07:56:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w387uZJm024379
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 Apr 2018 00:56:35 -0700 (PDT)
Received: from [128.224.162.197] (128.224.162.197) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sun, 8 Apr 2018 00:56:34 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1522837858.git.Qi.Chen@windriver.com>
	<2e27990d1f27a0de84fc204caf77c28e5015173e.1522837858.git.Qi.Chen@windriver.com>
	<11a298c3-7fed-c73e-be12-0ed099fca145@linux.intel.com>
	<eeaa06cb-34e8-4b94-ee71-047d26894372@linux.intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <ef659b6b-41ab-2019-52ad-b00f10c131f2@windriver.com>
Date: Sun, 8 Apr 2018 15:57:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <eeaa06cb-34e8-4b94-ee71-047d26894372@linux.intel.com>
X-Originating-IP: [128.224.162.197]
Subject: Re: [PATCH 1/1] rpm: remove dbus dependency for rpm-native
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
X-List-Received-Date: Sun, 08 Apr 2018 07:56:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2018 05:16 PM, Alexander Kanavin wrote:
> On 04/04/2018 02:32 PM, Alexander Kanavin wrote:
>>> +# dbus dependency is deliberately omitted for rpm-native to prevent 
>>> it from attempting to
>>> +# inhibit shutdown via session dbus, even when some layer enables 
>>> plugins support for rpm-native.
>>> +DEPENDS_remove_class-native = "dbus"
>>> +
>>>   inherit autotools gettext pkgconfig python3native
>>>   export PYTHON_ABI
>>> @@ -63,7 +67,7 @@ EXTRA_OECONF_append_libc-musl = " --disable-nls"
>>>   #
>>>   # --localstatedir prevents rpm from writing its database to native 
>>> sysroot when building images
>>>   #
>>> -# Also disable plugins, so that rpm doesn't attempt to inhibit 
>>> shutdown via session dbus
>>> +# Disable plugins for rpm-native.
>>>   EXTRA_OECONF_append_class-native = " --sysconfdir=/etc 
>>> --localstatedir=/var --disable-plugins"
>>
>>
>> This should definitely be a PACKAGECONFIG option. Actually, two 
>> different options: "plugins" (pulls in dbus) and "plugins-native" 
>> (does not pull in dbus). Then both can be enabled for target and 
>> native, respectively.
>
> Actually, no, neither of these ideas is correct. If dbus is removed 
> from explicit dependencies, that does not guarantee that it will not 
> get pulled into rpm sysroot by something else that rpm depends on. You 
> need to either patch configure.ac in rpm source code to add an 
> explicit enable/disable-dbus switch, or to enable plugins in all 
> cases, and remove the unneeded plugin at do_install tim when building 
> rpm-native.
>
> Alex
>
Hi Alex,

Thanks for your advice.
I've sent out a new patch, which adds dbus option to configure.ac and 
then disables it for rpm-native.

Best Regards,
Chen Qi

