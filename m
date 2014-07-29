Return-Path: <kirgene@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id DC7907091D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 09:02:45 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id a108so9797954qge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 02:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=R7PGTc+1q1bcr1fsxY1cmIkNVtLqEYHVKGC2Jxo/HlY=;
	b=Rtq1dGjRT0YLLkaSO7RdT9NrActu1tDooiK5rtpm4KfrHvx9UK+t9zlewyZVhsCE6j
	ZKfqVbpmjVhhVh9YqmtFuo/lp3sDtaTgVhA54XlWUmmcWrosQaebUDmhw4A3vOXRScy/
	kgZgaI5DWV+MjgRPuHiG7vd3Bm+ImK7KOaobArS4KM8c0WG08oqXEmtUEk8kqfGNTExg
	+nreQrDjt0iCG6Vpy9LZyf70sfyhp9DmGh+ImEI0YtJ3OsS8wllXDB/azgfKKZHMdqbr
	bn1aogQrO5XC/ZU2mciQijhyJfHjwxbyu/ovRTAOdKfsl26S4MzW60o4DKtLQPhk1Ydr
	GVVQ==
MIME-Version: 1.0
X-Received: by 10.140.19.176 with SMTP id 45mr1261218qgh.46.1406624566978;
	Tue, 29 Jul 2014 02:02:46 -0700 (PDT)
Received: by 10.140.50.198 with HTTP; Tue, 29 Jul 2014 02:02:46 -0700 (PDT)
In-Reply-To: <4190240.9FhIxat4L9@peggleto-mobl5.ger.corp.intel.com>
References: <CADV-EXGEW1dQb1x6+20myn3X4JfUjPRfkBj2hon8kuX35ap91g@mail.gmail.com>
	<4190240.9FhIxat4L9@peggleto-mobl5.ger.corp.intel.com>
Date: Tue, 29 Jul 2014 12:02:46 +0300
Message-ID: <CADV-EXF9VUC64uKywLgRuOE794E-6soX1DsaVPTCcpGefC7_Lg@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Specifying MACHINE inside distro config only
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
X-List-Received-Date: Tue, 29 Jul 2014 09:02:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Paul,

2014-07-29 11:25 GMT+03:00 Paul Eggleton <paul.eggleton@linux.intel.com>:
> Hi Yevhen,
>
> On Tuesday 29 July 2014 09:55:20 Yevhen Kyriukha wrote:
>> I have several distro config files. I bind each of them to single machine
>> like this:
>>
>> # cat conf/distro/mydistro.conf
>>
>> DISTRO = "mydistro"
>> DISTRO_NAME = "My Distro"
>> DISTRO_VERSION = "1.01"
>> MACHINE = "cedartrail"
>> ...
>>
>> I also created "conf/auto.conf" file with following content:
>> DISTRO = "mydistro"
>> to specify distro to build.
>>
>> The problem is that without specifying MACHINE in "conf/auto.conf" I get
>> following error:
>>
>> ERROR:  OE-core's config sanity checker detected a potential
>> misconfiguration.
>>     Either fix the cause of this error or at your own risk disable the
>> checker (see sanity.conf).
>>     Following is the list of potential problems / advisories:
>>
>>     TUNE_ARCH is unset. Please ensure your MACHINE configuration includes a
>> valid tune configuration file which will set this correctly.
>> Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH
>> ().Toolchain tunings invalid:
>> No tuning found for default multilib.
>>
>>
>> I use a script to change distro (in "auto.conf") and each distro knows its
>> machine to build for. So specifying MACHINE in "auto.conf" isn't desirable.
>>
>> Can someone tell what did I miss?
>
> This is caused by a subtlety in the way that we have structured the
> configuration files. Here's a snippet from meta/conf/bitbake.conf (which aside
> from bblayers.conf is the only file that BitBake knows to look at by itself):
>
> ---------------- snip ----------------
> ##################################################################
> # Include the rest of the config files.
> ##################################################################
>
> require conf/abi_version.conf
> include conf/site.conf
> include conf/auto.conf
> include conf/local.conf
> include conf/build/${BUILD_SYS}.conf
> include conf/target/${TARGET_SYS}.conf
> include conf/machine/${MACHINE}.conf
> include conf/machine-sdk/${SDKMACHINE}.conf
> include conf/distro/${DISTRO}.conf
> include conf/distro/defaultsetup.conf
> include conf/documentation.conf
> include conf/licenses.conf
> require conf/sanity.conf
> ---------------- snip ----------------
>
> These statements are parsed in order; thus, by the time the distro config has
> been parsed, it's too late to include the right machine config file, that's
> already happened. (These lines are in this order deliberately; the reason
> being we want to allow the distro config to easily override things that are
> specified in the machine configuration if desired.)
>
> So the answer is you simply can't do what you're trying to do with the way
> that OE is set up. You need to set the MACHINE value from local.conf /
> auto.conf, or the external environment.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre


Thanks for your clarification.

-- 
Best regards,
Yevhen

