Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9296C70331
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 09:19:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4J9JdgK025652
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 May 2015 02:19:39 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 May 2015 02:19:38 -0700
Message-ID: <555B0029.7030800@windriver.com>
Date: Tue, 19 May 2015 17:19:37 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <55555B65.80600@windriver.com>
	<3693019.ZXHb2MZYRx@peggleto-mobl.ger.corp.intel.com>
	<555AE1AB.8070907@windriver.com>
	<5994133.HlFem3UHYJ@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <5994133.HlFem3UHYJ@peggleto-mobl.ger.corp.intel.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Add something like bitbake -cmenuconfig <recipe>?
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
X-List-Received-Date: Tue, 19 May 2015 09:19:41 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/19/2015 04:35 PM, Paul Eggleton wrote:
> On Tuesday 19 May 2015 15:09:31 Robert Yang wrote:
>> Has a uniform backend for configuration sounds like a good idea, here are
>> some rough thoughts that we can do in metadata, please feel free to give
>> your comments:
>>
>> 1) Add a conf file, bbclass or bb which contains the configable var list
>>      for the build, for example, DISTRO, MACHINES, DISTRO_FEATURES,
>>      PACKAGE_CLASSES and so on, we need maintain this file manually, we can
>>      discuss what is configurable in the mailing list, it may cost us a few
>>      time, but it is really good for OOBE, and would make the new user's
>>      life more easier.
>>
>> 2) Other layer can extend the configable var list easily.
>
> I'd rather we end up with the configuration being defined where the variable is
> actually used - it's tidier and easier to extend.
>
>> 3) Suppose we call the file config-build (.conf, .bbclass or .bb).
>>
>> 4) The UIs (toaster UI, web HOB, or menuconfig) can invoke the contents in
>>      config-build and display them.
>>
>> 5) The format of config-build can be:
>>      CONFIG_MACHINE[keys] = "machine1, machine2, ..."
>>      # The machines should be got automatically from a function.
>>      CONFIG_MACHINE[doc] = "xxx"
>>      # Re-use the MACHINE[doc] in meta/conf/documentation.conf
>>      [snip]
>
> MACHINE is such that we don't need to define the valid values for it - we can
> simply search for conf/machine/*.conf along BBPATH. (This is what Hob does,
> the mechanism it uses for finding conf files probably still exists.)

Yes, as I said in the comment, it should be got automatically.

>
>>      CONFIG_IMAGE_FSTYPES[keys] = "typ1, type2, ..."
>>      CONFIG_IMAGE_FSTYPES[doc] = "xxx"
>>      CONFIG_IMAGE_FSTYPES[bbclass] = "image"
>>      # The required bbclass.
>>      [snip]
>
> Similarly here we already have IMAGE_TYPES which defines the valid choices for
> IMAGE_FSTYPES. Possibly not ideal, but it does already exist. On bbclasses,
> surely the usage for a class and any variables it supports ought to be defined
> in the class itself (see bug 6059), then it's easily applicable to any class
> outside of the core.
>
> I think we need to step back a bit and think about how this should be
> implemented properly. I would urge you to consider that we went through a lot
> of this stuff already quite some time ago with Hob; not that that ended up as a
> perfect codebase by any means, but it would be worth learning from it.

We can learn a lot from hob when we do the implementation.

>
> As Chris was suggesting I'd rather we look at setting up a type declaration
> mechanism (possibly at the bitbake level?) and make use of that rather than
> creating something just for this UI where possible.

A type declaration mechanism also sounds good, but I'm afraid that
it would make a lot of changes embed in the bbclass or conf files,
but the build system itself doesn't need these changes, I'm not sure
whether it is worth or not, our aim is just make OE easier for newbies.

// Robert

>
>> 6) The result will be saved to a file such as local.conf.extend, and
>>      local.conf will include/require it.
>
> We went back-and-forth on this in the Hob timeframe; eventually it was
> realised that what people really wanted is to have the settings applied in
> local.conf itself rather than some UI-specific conf file. (On the other hand,
> thinking further ahead, we ought to be thinking about distro customisation and
> whether it's really appropriate to put every setting in local.conf as opposed
> to a custom distro config that you select via DISTRO.)
>
> Cheers,
> Paul
>

