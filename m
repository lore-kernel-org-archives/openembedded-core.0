Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1C1A6605F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 08:35:24 +0000 (UTC)
Received: by wgbdm7 with SMTP id dm7so48255084wgb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Apr 2015 01:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=plM3VxzeM7EXesRXAhjVHfS5z+1KRx5dVvKUzybnqz4=;
	b=A7Adf79bi2iEcTsf6vRo6+h6y0mIfVSHK7gmKA1frkYCwr17N0a/qqTNe/EAXG4mZC
	LpK7XpS57Ft4KBZCdYmBm4BEX4vzebruKiXTF/R8bB9GxfUYJ6KSGxWA93vogPh4V7dw
	WXmOgWPB30ZNKUfRSjuWuWlD+v+ArxDagyUUsaAVfJLgHRNuGRKTsrJORnq+6fHrG8Ch
	tUTmmBzsrOMraQCNM3NYk1sx0wh3BzI3uGx2GYNZjak7IcE6AbnS10mjcJngkszrzJ/m
	GnPTdgKmfCzXvNCFQWqI0swLk88c7YoyWTtRvRZ+B9TRVxl9krbXQ0mz2xk/6uOjajnT
	XHoA==
X-Gm-Message-State: ALoCoQlNP8zpWzlQgThUv6bIn7k0IW3FOMZKInOUvBWwg/TKiw8vqrv3t28QaCn95FB3PKCcRoQ+
X-Received: by 10.194.60.203 with SMTP id j11mr38417331wjr.5.1428395725126;
	Tue, 07 Apr 2015 01:35:25 -0700 (PDT)
Received: from ?IPv6:2001:bf0:c080:403:3ca1:db9f:ae2e:51cc?
	([2001:bf0:c080:403:3ca1:db9f:ae2e:51cc])
	by mx.google.com with ESMTPSA id e2sm9865831wjy.46.2015.04.07.01.35.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Apr 2015 01:35:24 -0700 (PDT)
Message-ID: <552396CA.7060806@dresearch-fe.de>
Date: Tue, 07 Apr 2015 10:35:22 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <551143C5.90207@dresearch-fe.de>
	<1427195564.14020.31.camel@linuxfoundation.org>
In-Reply-To: <1427195564.14020.31.camel@linuxfoundation.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: fetch race problem
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
X-List-Received-Date: Tue, 07 Apr 2015 08:35:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Am 24.03.2015 um 12:12 schrieb Richard Purdie:
> On Tue, 2015-03-24 at 12:00 +0100, Steffen Sledz wrote:
>> We hit the following problem in oe-classic. And we're not sure if this problem may occur in current oe too, or if it is fixed there.
>>
>> They are two or more recipes (may be in different layers) for packages with sources from the same (git) repository. If the fetching from the repo needs some time we see "file changed as we read it" errors in all likelihood.
>>
>> ------------------> snip <-------------------
>> ERROR: Error evaluating '${PF}:${P}:${PN}:${BP}:${BPN}:files:.'
>> Traceback (most recent call last):
>>   File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 116, in expandWithRefs
>>     s = __expand_var_regexp__.sub(varparse.var_sub, s)
>>   File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 60, in var_sub
>>     var = self.d.getVar(key, 1)
>>   File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 260, in getVar
>>     return self.expand(value, var)
>>   File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 132, in expand
>>     return self.expandWithRefs(s, varname).value
>>   File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 116, in expandWithRefs
>>     s = __expand_var_regexp__.sub(varparse.var_sub, s)
>> FetchError: Fetch command export HOME="/var/lib/jenkins"; export PATH="/CACHE/jenkins-workspace/foo/OE//bin:/CACHE/jenkins-workspace/foo/openembedded/bin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux/usr/armv5te/bin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux/usr/sbin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux/usr/bin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux/sbin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux//bin:/CACHE/jenkins-workspace/foo/OE/bin-HYP-6339:/CACHE/jenkins-workspace/foo/bitbake/bin:/sbin:/usr/sbin:/bin:/usr/bin"; tar -czf /var/lib/jenkins/sources/git_bitbucket.org.dresearchfe.drconfig.git.tar.gz ./.git/* failed with signal 1, output:
>> /bin/tar: ./.git/objects/pack/tmp_pack_BwThcc: File removed before we read it
>> /bin/tar: ./.git/objects/pack/tmp_pack_Ans7xK: File removed before we read it
>> /bin/tar: ./.git/objects/pack: file changed as we read it
>> ------------------> snap <-------------------
>>
>> Is this a problem in oe-core too (or oe-classic only)?
>>
>> Any ideas how to avoid such errors?
> 
> In theory bitbake has locks on files in DL_DIR, even for git
> repositories so it should only touch the repo with one fetch process at
> a time even if multiple recipes reference the same thing.
> 
> There were some big fetcher reworks in more recent versions of bitbake.
> For OE-Classic, I'm guessing you're using an older version. You could
> try transplanting the modern fetcher core onto your older bitbake I
> guess.

I do not feel competent enough to try this.

Is it possible (in oe-classic) to mark two or more recipes (or single stages) to run exclusive?



