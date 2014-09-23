Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5205060167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 14:51:36 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id a1so4446522wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 07:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=n0YFJ2oRHtppERemQCT7VJAAoB8KRwB7P0jovWBwHb0=;
	b=QJwmREbDmJaEPE3pt03mjPBNMEQ1nEcgYhDwn0m/RmQh0mQjCZPmHsZR3u9h5hyCvB
	aPWMNr7gLVdfMy3JxE/1NZ2r5Jeog1nz+sMxG1wVxu8r76DAtIK3Oz1LOPLylJTzOrNU
	CrowH6W1aRviDOBP+VFSkH4q9Q06lI+MkR5T1a8mCz9Vn6ULf1O24gpOCFaLyXAvnYg9
	aikqC+YtANqB9ZSoCRUjhCLaNokXx45rZ4MWgEH+uYKHYqJtPTATkc3Dj5uHYenOOpHs
	21T7zi14fwRRcqPL5KmshSRTKq5TpiqK/7MjRR/rmdUhXPRNbmmzM4EgUZ0slzPVRTmk
	m1Ng==
X-Gm-Message-State: ALoCoQlbbEJaHazmUaUN7tGy/0SLQDHRWdo5d4y/MJEqEhtXl7WUW3cZ+kyF3MZYdS7PPnIiNDKG
X-Received: by 10.180.13.79 with SMTP id f15mr5197348wic.25.1411483897076;
	Tue, 23 Sep 2014 07:51:37 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id
	cz3sm16167175wjb.23.2014.09.23.07.51.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Sep 2014 07:51:36 -0700 (PDT)
Message-ID: <542188F7.3080007@dresearch-fe.de>
Date: Tue, 23 Sep 2014 16:51:35 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <54216293.4040907@dresearch-fe.de> <1411478501.15825.40.camel@ted>
In-Reply-To: <1411478501.15825.40.camel@ted>
Cc: Lianhao Lu <lianhao.lu@intel.com>
Subject: Re: hash generation/PR service problem with xuser-account and other packages
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
X-List-Received-Date: Tue, 23 Sep 2014 14:51:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 23.09.2014 15:21, Richard Purdie wrote:
> On Tue, 2014-09-23 at 14:07 +0200, Steffen Sledz wrote:
>> As i mentioned in another thread before we're investigating some problems related with package versions going backwards using a PR service.
>>
>> Now i have some more information. But i'm not able to understand and fix the problem for myself.
>>
>> Assume we have a clean workspace and i bitbake the xuser-account package with this command:
>>
>>   MACHINE="foo" bitbake xuser-account
>>
>> This generates these packages (the 207 comes from our PR service).
>>
>>   tmp-eglibc/deploy/ipk/all/xuser-account-dbg_0.1-r0.207_all.ipk
>>   tmp-eglibc/deploy/ipk/all/xuser-account-dev_0.1-r0.207_all.ipk
>>   tmp-eglibc/deploy/ipk/all/xuser-account_0.1-r0.207_all.ipk
>>
>> If i call the same bitbake command again, the same packages are generated. Fine!
>>
>> Now i call:
>>
>>   MACHINE="bar" bitbake xuser-account
>>
>> The generated packages now get a new number from the PR server (so they have a different hash i believe).
>>
>>   tmp-eglibc/deploy/ipk/all/xuser-account-dbg_0.1-r0.208_all.ipk
>>   tmp-eglibc/deploy/ipk/all/xuser-account-dev_0.1-r0.208_all.ipk
>>   tmp-eglibc/deploy/ipk/all/xuser-account_0.1-r0.208_all.ipk
>>
>> But this package does not seem to be machine dependent!?
>>
>> If the next build for machine foo is a clean build again (e.g. on our Jenkins continuous integration server which makes clean builds once a week) the PR service generated number wents back to 207 which results in:
>>
>>   "ERROR: QA Issue: Package version for package xuser-account went backwards which would break package feeds"
>>
>> Can someone confirm this behaviour?
>>
>> Is this a bug? I think so.
>>
>> Can someone give some details what went wrong here? Also after studying <http://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#checksums> i was not able to fully understand the background, not to speak of fixing something.
>>
>> BTW: We see the same behaviour for the cpufreq-tweaks, linux-firmware, run-postinsts, and some of our own packages.
> 
> I just took a look at this on master. There are some changes between
> master and daisy and I want to get this resolved in master before we
> think about daisy. I thought walking through debugging this may be
> helpful, so, I did:
> 
> MACHINE=qemux86 bitbake xuser-account
> MACHINE=qemuarm bitbake xuser-account
> 
> and sure enough, you are correct, things rebuild and they should not for
> an allarch package like this. Looking at the list of packages being
> built, its pulling in the toolchain. I checked:
> 
> MACHINE=qemuarm bitbake xuser-account -e | grep INHIBIT_DEFAULT_DEPS
> 
> and sure enough, that is set (as per allarch.bbclass) so why is it
> building the toolchain?! It has to be a dependency, so:
> 
> MACHINE=qemuarm bitbake xuser-account -e | grep DEPENDS=
> 
> and in there we see:
> 
> DEPENDS="  base-files base-passwd shadow-native shadow-sysroot shadow"
> 
> base-files is whitelisted in conf/layer.conf as a dependency we don't
> need to checksum. The checksum of shadow-native isn't an issue, the
> others however are a problem. Since they have well behaved APIs, we can
> add them to the list in layer.conf.
> 
> What this does mean is that if shadow rebuilds, xuser-account will not
> rebuild automatically. I don't believe that should be an issue.
> 
> After doing this, I reran the bitbake commands and then:
> 
> ls tmp/stamps/all-poky-linux/xuser-account/
> 
> shows things like:
> 
> 0.1-r0.do_populate_sysroot.978b6f9bfd5282121de701a24dc52c80.qemuarm
> 0.1-r0.do_populate_sysroot.978b6f9bfd5282121de701a24dc52c80.qemux86
> 
> 
> basically, the stamp hashes should not change between the two bitbake
> commands. SO the patch needed to fix xuser is:
> 
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 9143bdb..4deee89 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -31,6 +31,9 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>    packagegroup-x11-xserver \
>    systemd-serialgetty \
>    initscripts \
> +  shadow \
> +  shadow-sysroot \
> +  base-passwd \
>  "
>  
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \

Hi Richard, thanx for this detailled explanation. It is another step on my way to understand all this. ;-)

> The other recipes will need investigating since I doubt its this issue
> for them.

Is there someone who can do this work in a similar brightening way Richard did?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

