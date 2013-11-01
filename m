Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E18AD6AF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 11:42:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA1BgLw6015684
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Nov 2013 04:42:21 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 1 Nov 2013 04:42:18 -0700
Message-ID: <52739398.4070402@windriver.com>
Date: Fri, 1 Nov 2013 19:42:16 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa
	<martin.jansa@gmail.com>
References: <cover.1383214870.git.hongxu.jia@windriver.com>	
	<0ab98fd1823d92b6661b60432b3ec30fd9c9a03d.1383214870.git.hongxu.jia@windriver.com>	
	<20131031104111.GI32015@jama> <52724411.9050909@windriver.com>	
	<1383295856.25877.124.camel@ted> <20131101093903.GO32015@jama>
	<1383303152.25877.137.camel@ted>
In-Reply-To: <1383303152.25877.137.camel@ted>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 1/1] qemu: use PACKAGECONFIG to address nss dependencies
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
X-List-Received-Date: Fri, 01 Nov 2013 11:42:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2013 06:52 PM, Richard Purdie wrote:
> On Fri, 2013-11-01 at 10:39 +0100, Martin Jansa wrote:
>> On Fri, Nov 01, 2013 at 08:50:56AM +0000, Richard Purdie wrote:
>>> On Thu, 2013-10-31 at 19:50 +0800, Hongxu Jia wrote:
>>>> On 10/31/2013 06:41 PM, Martin Jansa wrote:
>>>>> On Thu, Oct 31, 2013 at 06:23:01PM +0800, Hongxu Jia wrote:
>>>>>> Use PACKAGECONFIG to explicitly address nss dependencies rather than
>>>>>> tested by configure.
>>>>>>
>>>>>> It avoided potential errors while multiple builds shared a common
>>>>>> state_cache.
>>>>> There are more floating dependencies in qemu.inc, see
>>>>> http://patchwork.openembedded.org/patch/56935/
>>>>>
>>>>> and even this list isn't complete, there is also:
>>>>> WARN: packages/armv5te-oe-linux-gnueabi/qemu/qemu/latest lost dependency on  cairo gdk-pixbuf gnutls gtk+ libvte
>>>>>
>>>>> Can you please improve it to fix them all?
>>>>>
>>>> OK, I will try to fix them as possible as I can.
>>>>
>>>> Drop this patch, wait for V2.
>>> Part of the problem here is that qemu-native has some "floating"
>>> dependencies by design. If the native system has graphics support, qemu
>>> will have too. If it doesn't it won't have. This works out to be quite
>>> useful for people. Some people have headless build machines they don't
>>> want to install X on, equally some have build machines which do have X
>>> and they do want graphical qemu.
>>>
>>> How do we support both?
>> Aren't reproducible builds more important than automagically enabled
>> graphics support, what if such automagically enabled qemu-native gets
>> reused from sstate on headless server without graphics support?
> I agree there is a problem here. Equally, there is an important use case
> which people do use and care about which this patch removes.
>
>> We can extend documentation to say that in order to enable graphics
>> support for qemu-native you need to set
>> PACKAGECONFIG_pn-qemu-native += "foo bar"
>> in local.conf (or to remove some to disable it, but enabling explicitly
>> is imho better because we don't have graphics native support in
>> ASSUME_PROVIDED).
> I think we'll have to do something like this, yes. I'd like to see the
> patches adding this documentation to local.conf before we change things
> though.

OK, how about add the above documentation as comments in the patch.
...
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -79,6 +79,10 @@ do_install_append() {
  }
  # END of qemu-mips workaround

+# Disable the following flags by default. Such as graphics is
+# disabled for qemu-native, if you need to enable them, set
+# PACKAGECONFIG_pn-qemu-native += "foo bar" in local.conf
+# or just comment out them to let configure do the test.
  PACKAGECONFIG ??= ""
  PACKAGECONFIG[virtfs] = "--enable-virtfs 
--enable-attr,--disable-virtfs,libcap attr,"
  PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
...

or add them to meta-yocto/conf/local.conf.sample.extended or some place 
else?

And I could not exactly figure out which flags affected the graphics.

//Hongxu


> Cheers,
>
> Richard
>


