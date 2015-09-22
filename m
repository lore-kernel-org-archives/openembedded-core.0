Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 8440776417
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 18:13:50 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id BCCDCF81202; Tue, 22 Sep 2015 12:13:50 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 8C1AAF811FE;
	Tue, 22 Sep 2015 12:13:49 -0600 (MDT)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <560173B5.1000408@mlbassoc.com>
	<CAP9ODKpcr+YgGsvnRrsxy9Z2xsN5+KP4KiP-UvYij5eyN+1V1g@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56019A6B.3070206@mlbassoc.com>
Date: Tue, 22 Sep 2015 12:14:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpcr+YgGsvnRrsxy9Z2xsN5+KP4KiP-UvYij5eyN+1V1g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error building gdk-pixbuf-native
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
X-List-Received-Date: Tue, 22 Sep 2015 18:13:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-09-22 12:05, Otavio Salvador wrote:
> On Tue, Sep 22, 2015 at 12:28 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> When building gdk-pixbuf-native, I got this error:
>> | DEBUG: Staging files from
>> /home/local/rpi2_2015-03-05/tmp/work/i686-linux/gdk-pixbuf-native/2.30.8-r0/sysroot-destdir/home/local/rpi2_2015-03-05/tmp/sysroots/i686-linux
>> to /home/local/rpi2_2015-03-05/tmp/sysroots/i686-linux
>> | DEBUG: Executing shell function pixbufcache_sstate_postinst
>> | g_module_open() failed for
>> /home/local/rpi2_2015-03-05/tmp/sysroots/i686-linux/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-svg.so:
>> libharfbuzz.so.0: cannot open shared object file: No such file or directory
>>
>> It seems that [at least] gdk-pixbuf-native needs harfbuzz-native
>> I looked at the recipe, but it's not 100% obvious to me how to
>> add this, especially w.r.t. all of the PACKAGECONFIG options.
>>
>> Guidance?
>
> I had similar failures[1] at O.S. Systems autobuilder and rebuilding
> made it work.
>
> 1. http://ci.ossystems.com.br/view/FSL%20Community%20BSP%20-%20master-next/job/fsl-community-bsp-master-next_wayland-imx28evk/827/console
>
> The builds are now succeeding but I did no change to fix it. This
> seems like a race for me.
>
> I tried very hard to reproduce the issue locally at my laptop without
> success. Do you can reliably reproduce it?
>

Yes, I had a full tree and this rebuild was kicked off by a meta-data
update.  Once it happened, I tried this:
   % bitbake harfbuzz-native gdk-pixbuf-native -c cleansstate
   % bitbake gdk-pixbuf-native
failed.  However the manual sequence
   % bitbake harfbuzz-native
   % bitbake gdk-pixbuf-native
succeeded.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

