Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6A38E77495
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 15:34:25 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id w12so99434518wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 08:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kBdHTjT5+374eVGZjtl7koG3+78J8izVCn3UMUbHJok=;
	b=UHMUv2E7KAbzbXQRTqkyrBEUsb36HP/8vMVhZ4xvi2RuYthDbVJZCegEIKnHk6+4sm
	jO4hiE7ayOsL9jWO34M4H1gMgOXV0fJL6hpOFZ7B5KLxP8gqOp5snd2IzBcfz/LVvJ1W
	UU0G1Sj++Y5lQLtIFwS9rjfcVP9X2w1jnpWjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kBdHTjT5+374eVGZjtl7koG3+78J8izVCn3UMUbHJok=;
	b=Rz1bMfZPyUOdo2tnLEPcmkM6DymX6nAWyQfvJXA3kUZK/A7YbVLKHbrfs+rdYtLZzl
	H34/thpn59cxoxxWUfSXAmcVdcvdHu5xiYbAkjDq7/UOfGL2geCmYdCQJXZtV34qUOu6
	njK3zYao8e3DOJOYmyiA1D5ukSfHPPrNGKDIQtPC+EkZhqg5OmnEw2/4W5g3o71c0M8W
	Pr3NHL+/LJ7Tbi2xmzS1JzGxYXlEGyAnfD/dP8Klvgu48WoIFS8AmdZco4J116DIMqY7
	vpEzHOP6e+txBSPsjOjDuyu3YX0QopIc6MigOuMWK/iEXxR/OGPU1SzYKagE2A318gog
	iHsQ==
X-Gm-Message-State: AE9vXwMiAQ0a9jDSsFWbSteAMLdvCdz+Ds1o0SV7vyGc603xV03VQ9Vk1qmX8kTd5n4+Jms1zwlJe0aKOkWpQ/gj
X-Received: by 10.28.149.137 with SMTP id x131mr16702696wmd.79.1473176065586; 
	Tue, 06 Sep 2016 08:34:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.120.162 with HTTP; Tue, 6 Sep 2016 08:34:04 -0700 (PDT)
In-Reply-To: <1473175565.20226.54.camel@linuxfoundation.org>
References: <cover.1472225461.git.joshua.g.lock@intel.com>
	<387803c1b2b8c0f2b3b29b55be61c27b52b4e7f0.1472225461.git.joshua.g.lock@intel.com>
	<CAP71WjwZ8Py3To_t+oEVuKNXEagshT2HBiZLL_FtgtCbgD9zBA@mail.gmail.com>
	<1473175565.20226.54.camel@linuxfoundation.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 6 Sep 2016 17:34:04 +0200
Message-ID: <CAP71WjxsXLfYoEaTD-j44hpmZaJWD=b8j5G_hdG+pre+8M7wew@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oe.path: preserve xattr in copytree() and copyhardlinktree()
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
X-List-Received-Date: Tue, 06 Sep 2016 15:34:27 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 6, 2016 at 5:26 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2016-09-06 at 17:22 +0200, Nicolas Dechesne wrote:
>> What happens is that I am installing coreutils in my images, and i
>> have a copy of 'cp' in my sysroot *and* I don't have xattrs in
>> DISTRO_FEATURES. As a consequence the 'cp' command which is invoked
>> does not have xattrs support, while my host 'cp' command has it...
>>
>> e.g.
>>
>> ~/work/oe-rpb-master/build-rpb$
>> tmp-rpb-glibc/sysroots/x86_64-linux/usr/bin/cp -afl --preserve=xattr
>> foo bar
>> tmp-rpb-glibc/sysroots/x86_64-linux/usr/bin/cp: cannot preserve
>> extended attributes, cp is built without xattr support
>>
>> while this one works fine:
>>
>> ~/work/oe-rpb-master/build-rpb$ cp -afl --preserve=xattr foo bar
>>
>> Should we revert these patches or am I missing anything?
>
> Did you have:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=92fc3ef9738165300a4daed4c90526dbbad43149

right. I am seeing it. The ERROR above happens when building
quilt-native , after I updated my layers. So it's probably a race
conditition. we need to rebuild quilt-native, so that we can rebuild
coreutils with the change you mention.. but with the --preserve=xattr
patch we can't rebuild quilt-native ;-)

so, i have removed coreutils from my sysroot and it is working now..
but we clearly have an 'upgrade' issue.. i am not going to be the only
one..

