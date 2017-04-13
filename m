Return-Path: <phil@advancedtelematic.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id C059877B14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 06:53:19 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id w64so104205455wma.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 23:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=advancedtelematic.com; s=google;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=z+TY3m9Z0B54HUfaYD1aGQi9d4RGXePmHNLY4k7pMz4=;
	b=pi8F+bm6JSiMFWm3PLWtDn9fXmeHCeT785rsJbS5tNzsjCmd9WD+WaTt0twyV2z18d
	Ona+B1wgorPbQ767sILPlFoUq7QquqrJxEl0ptDS0HyGvVxhVJIW/B+s9bSSRI2Kng4r
	fu5Eki6XF3r5eRpQT5lgboJFAn/TWAaKyPm2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=z+TY3m9Z0B54HUfaYD1aGQi9d4RGXePmHNLY4k7pMz4=;
	b=dAdrN38PEsG1A2t/PD4AIojt+4o52wO5cVbszUKlSxwpBDnG70LXLue0jYTbElorSh
	k1COvfC1ISfGU5z058is1YTs74mSEhxMYfRyT1HKwZwlqVykU+Mn8/Cyn6aZ3buMzvKs
	YoYDHMI6Ow51A4bUoNprgNHTt8FYUSnnj3JgiBtmf3+K/T8dAlXppRGdiXdlExfbyG8R
	hne077mLPYwfPN97EdytQjU+LQSLzgGarBSKVKPpCA/JEcQi7mBqbBO8ZjnHrDadpPa5
	BJ+JGJ/9N51DxI88OnVar8n1pOPLJ0SBPywx2TFUi3HfJIvgYQBHs8P1t6TBqWVBIqu/
	2Rrw==
X-Gm-Message-State: AN3rC/6MSpBjLLQ/7MvYtGwdCwAmv9yywytKO6D113UgPajFOibR1/4w
	6HiULtd7ZTJ826KpbvU=
X-Received: by 10.28.159.136 with SMTP id i130mr1630411wme.29.1492066399733;
	Wed, 12 Apr 2017 23:53:19 -0700 (PDT)
Received: from [192.168.1.93] (p57bf9f95.dip0.t-ipconnect.de. [87.191.159.149])
	by smtp.googlemail.com with ESMTPSA id
	k43sm28375367wrk.42.2017.04.12.23.53.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 23:53:19 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1492004877.5507.2.camel@ts.fujitsu.com>
	<1492065245.27604.45.camel@intel.com>
From: Phil Wise <phil@advancedtelematic.com>
Organization: ATS Advanced Telematic Systems GmbH
Message-ID: <1f6dd187-6d8a-d266-e3fb-620c1f723485@advancedtelematic.com>
Date: Thu, 13 Apr 2017 08:53:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1492065245.27604.45.camel@intel.com>
Subject: Re: Using boost-program-options and native
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
X-List-Received-Date: Thu, 13 Apr 2017 06:53:21 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit


On 13.04.2017 08:34, Patrick Ohly wrote:
> On Wed, 2017-04-12 at 13:47 +0000, thilo.cestonaro@ts.fujitsu.com wrote:
>> I want to build a tool which makes use of boost-program-options lib. As long as I compile for the target, all is fine, but when I add
>>> BBCLASSEXTEND += "native"
>> to my recipe, I a bitbake error "Nothing Provides" ... :(
>>
>>> ERROR: Required build target 'mytool-native' has no buildable providers.
>>> Missing or unbuildable dependency chain was: ['mytool-native', 'boost-program-options-native']
>>
>> In the recipe I just depend on boost and RDEPEND on boost-program-options:
>>> DEPENDS = "boost"
>>> RDEPENDS_${PN} = "boost-program-options"
>>
>> Is something wrong with this? Why is there a package
>> boost-program-options but no boost-program-options-native, altough
>> boost-native exists and the libboost-program-options.so is installed
>> into the
>> native sysroot. (I can compile flawlessly without the RDEPENDS line.)
> 
> Native and nativesdk flavors don't have packages, so RDEPENDS only works
> when depending on ${PN}-native (but not for ${PN}-native-some-package). 
> 
> Try:
> 
> DEPENDS = "boost"
> RDEPENDS_${PN}_class-target = "boost-program-options"
> 
> "boost" already is a dependency via DEPENDS, so you shouldn't need an
> RDEPENDS for it in the native case.

The following worked for me when building a native recipe that depends
on Boost Program Options:

https://github.com/advancedtelematic/meta-updater/blob/morty/recipes-sota/sota-tools/sota-tools_git.bb

  inherit cmake
  DEPENDS = "boost ..."
  BBCLASSEXTEND = "native"

I'm no OE expect, so I won't claim this it is right answer, but it does
at least build.

Cheers,

Phil
-- 
Phil Wise, ATS Advanced Telematic Systems GmbH
Kantstrasse 162, 10623 Berlin
Managing Directors: Dirk Pöschl, Armin G. Schmidt
Register Court: HRB 151501 B, Amtsgericht Charlottenburg

