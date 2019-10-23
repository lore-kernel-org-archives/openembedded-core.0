Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6EF2A7ED5C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 19:23:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46z0fD1z8hz44;
	Wed, 23 Oct 2019 21:23:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1571858613;
	bh=rlvpYQj5m3Wk2U2/gDakW+uLEcaZsePPIe/s+0XHLwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AcpduMvgZ3KcYXU0EfuIFYb32kpevfLLyu89SMP6da0jzo6E8zlSkgvRpfsbwH6DE
	oX+AHehdedesj3dsOlABUc0nIOKyL6fXQ8gklpqDYVE8TvvRl8enYETG88p51ZogFZ
	O8qxgWO6u5a6zQ0VMSw3xqA/+2iEaS/wvY1lt/hMQ8G8iULSJxiRxgZeRwcWPl1bH2
	cA3Uam2KgyvwaGmoD72OwEmcRyqe7xBZT/42ErQJcmrPXPOz1cBG3tjUk8VKYeYanH
	TNJWlJYHirzUkq1NNYMGoipihAWlvLpeAWl2zyoyO01gcZdF4Wdd2icpO7GutuNFfZ
	HSzeo+DXKnOCA0bga7rW3PNvN1eBKJKZvikZ4xJhPSx+CNEoxjRiShC9ap025ax51v
	ojW2HQWo5HUIOOk1ygCy6k9UbWySXATZjlSMXAqZbeudWs5kKr6hOPGVBrv9n5abfg
	K6FMqSkJ78E7h3HN/m32kyZRiIgGxM87ezzP7ftpnOSg09y+vD3R51DFaxTYSYf38U
	z9OM3SjgOM5Om648NnHAd41nmaflV3KTWM4FHfjLFtwo0IKhNOkEBfDqhxc7fw+V7t
	gs1yRfWbN8XGcasxWkH/LHXy+jR9vs46ZxqTeYycv5B7EvAmE0Kc5Ljbx44YSkILi6
	Xgw5lz7YzyoGXz8L5jutYP6Q=
Date: Wed, 23 Oct 2019 22:23:29 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191023192329.GA31488@localhost>
References: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
	<40c36a7b-6e95-efc8-4ab0-6b9e19924e54@intel.com>
MIME-Version: 1.0
In-Reply-To: <40c36a7b-6e95-efc8-4ab0-6b9e19924e54@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: new meta-oe failures from master-next
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
X-List-Received-Date: Wed, 23 Oct 2019 19:23:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Oct 23, 2019 at 04:29:13PM +0100, Ross Burton wrote:
> On 23/10/2019 14:03, Khem Raj wrote:
> > Hi Richard
> > 
> > New master-next I see these fails
> > 
> > https://errors.yoctoproject.org/Errors/Build/91645/
> > 
> > First two are important one's we already know why
> > ti-display-sharing-fw fails to fetch
> 
> ERROR: QA Issue: libiio: Files/directories were installed but not shipped in
> any package:
>   /usr/lib/python2.7
>   /usr/lib/python2.7/site-packages
>   /usr/lib/python2.7/site-packages/libiio-0.18-py2.7.egg-info
>   /usr/lib/python2.7/site-packages/iio.pyc
>   /usr/lib/python2.7/site-packages/iio.py
> 
> That may have been triggered by some change in oe-core but that's definitely
> an issue with libiio.

I'd agree on that:

Python bindings were converted from python2 to python3 last week,
and it picks up the host python 2.7.

-inherit cmake pythonnative systemd
+inherit cmake python3native systemd

This does not in any way guarantee that there is no python2 interpreter 
available.

> WARNING: TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-r0/temp/run.do_configure.7679:1
> exit 1 from 'NO_FETCH_BUILD=1 TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-r0/recipe-sysroot-native/usr/bin/python3-native/python3
> setup.py clean'
> ERROR: Execution of 'TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-r0/temp/run.do_configure.7679'
> failed with exit code 1:
> Traceback (most recent call last):
>   File "setup.py", line 17, in <module>
>     setup(**config['options'])
>   File "TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-r0/recipe-sysroot-native/usr/lib/python3.7/site-packages/setuptools/__init__.py",
> line 145, in setup
>     return distutils.core.setup(**attrs)
> 
> Looks like whatever astor is doing with setuptools doesn't agree with the
> upgrade to 41.4.0?

The recipe is behind upstream, but even the latest version needs fixing:
https://github.com/berkerpeksag/astor/issues/162

Temporarily broken leaf package, not really important.

> Ross

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


