Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE6E60125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 19:56:19 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so128744199wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 12:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to:cc
	:message-id; bh=+nUqEFPX9MjTAXWqAL0oqcWIliE+k/OuvfY69/O71bE=;
	b=0jIarlBbWu5uQC+GN4F981nKEHtWZmOKBjhSzRv2mGgN3HQLxngX4R5vpanINcdSNE
	npx/lVLRuwTSgHig4mCl0PWwxNL+73LNkIf7S030LDm5jk8wkeaIilU2A9lNr22v//sw
	+Of2GKw2f/b8LD3oiSKu60uyvHEmRfTwQXYgD1cb+xamPS7sw5IAMDlI1Cyz48gwu/7c
	CP3mbUbJiEik8Y/YzzkpTD5kiHqd89gze1YJWC2+6s1PdVLo2jfiIV7KwiMuCdij+RGo
	Hi4hOhKPztb7ayuPvAKIRer0/co0Boa0S6170feJaozLgx/INXcrYC04u8XE8nowQVFK
	4unw==
X-Received: by 10.194.205.101 with SMTP id lf5mr58793492wjc.42.1432065380475; 
	Tue, 19 May 2015 12:56:20 -0700 (PDT)
Received: from [10.50.88.238] (089144228238.atnat0037.highway.a1.net.
	[89.144.228.238]) by mx.google.com with ESMTPSA id
	yz3sm23246471wjc.19.2015.05.19.12.56.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 May 2015 12:56:19 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <5994133.HlFem3UHYJ@peggleto-mobl.ger.corp.intel.com>
References: <55555B65.80600@windriver.com>
	<3693019.ZXHb2MZYRx@peggleto-mobl.ger.corp.intel.com>
	<555AE1AB.8070907@windriver.com>
	<5994133.HlFem3UHYJ@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 19 May 2015 21:56:03 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Robert Yang <liezhi.yang@windriver.com>
Message-ID: <EDBB8EE8-E76F-4D2A-87D7-71BED1C272BE@gmail.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Add something like bitbake -cmenuconfig	<recipe>?
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
X-List-Received-Date: Tue, 19 May 2015 19:56:22 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On May 19, 2015 10:35:36 AM GMT+02:00, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>On Tuesday 19 May 2015 15:09:31 Robert Yang wrote:
>> Has a uniform backend for configuration sounds like a good idea, here
>are
>> some rough thoughts that we can do in metadata, please feel free to
>give
>> your comments:

Will read the thread but the subject reminds me of http://lists.openembedded.org/pipermail/openembedded-devel/2011-January/074285.html
maybe?

Cheers :)
>> 
>> 1) Add a conf file, bbclass or bb which contains the configable var
>list
>>     for the build, for example, DISTRO, MACHINES, DISTRO_FEATURES,
>>     PACKAGE_CLASSES and so on, we need maintain this file manually,
>we can
>>     discuss what is configurable in the mailing list, it may cost us
>a few
>>     time, but it is really good for OOBE, and would make the new
>user's
>>     life more easier.
>> 
>> 2) Other layer can extend the configable var list easily.
>
>I'd rather we end up with the configuration being defined where the
>variable is 
>actually used - it's tidier and easier to extend.
>
>> 3) Suppose we call the file config-build (.conf, .bbclass or .bb).
>> 
>> 4) The UIs (toaster UI, web HOB, or menuconfig) can invoke the
>contents in
>>     config-build and display them.
>> 
>> 5) The format of config-build can be:
>>     CONFIG_MACHINE[keys] = "machine1, machine2, ..."
>>     # The machines should be got automatically from a function.
>>     CONFIG_MACHINE[doc] = "xxx"
>>     # Re-use the MACHINE[doc] in meta/conf/documentation.conf
>>     [snip]
>
>MACHINE is such that we don't need to define the valid values for it -
>we can 
>simply search for conf/machine/*.conf along BBPATH. (This is what Hob
>does, 
>the mechanism it uses for finding conf files probably still exists.)
> 
>>     CONFIG_IMAGE_FSTYPES[keys] = "typ1, type2, ..."
>>     CONFIG_IMAGE_FSTYPES[doc] = "xxx"
>>     CONFIG_IMAGE_FSTYPES[bbclass] = "image"
>>     # The required bbclass.
>>     [snip]
>
>Similarly here we already have IMAGE_TYPES which defines the valid
>choices for 
>IMAGE_FSTYPES. Possibly not ideal, but it does already exist. On
>bbclasses, 
>surely the usage for a class and any variables it supports ought to be
>defined 
>in the class itself (see bug 6059), then it's easily applicable to any
>class 
>outside of the core.
>
>I think we need to step back a bit and think about how this should be 
>implemented properly. I would urge you to consider that we went through
>a lot 
>of this stuff already quite some time ago with Hob; not that that ended
>up as a 
>perfect codebase by any means, but it would be worth learning from it.
>
>As Chris was suggesting I'd rather we look at setting up a type
>declaration 
>mechanism (possibly at the bitbake level?) and make use of that rather
>than 
>creating something just for this UI where possible.
> 
>> 6) The result will be saved to a file such as local.conf.extend, and
>>     local.conf will include/require it.
>
>We went back-and-forth on this in the Hob timeframe; eventually it was 
>realised that what people really wanted is to have the settings applied
>in 
>local.conf itself rather than some UI-specific conf file. (On the other
>hand, 
>thinking further ahead, we ought to be thinking about distro
>customisation and 
>whether it's really appropriate to put every setting in local.conf as
>opposed 
>to a custom distro config that you select via DISTRO.)
>
>Cheers,
>Paul



