Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1D03D73BFC;
	Tue, 24 Mar 2015 11:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2OBCxi9019857; Tue, 24 Mar 2015 11:12:59 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OI9efSCwLIIb; Tue, 24 Mar 2015 11:12:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2OBCiif019850
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 Mar 2015 11:12:55 GMT
Message-ID: <1427195564.14020.31.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Tue, 24 Mar 2015 11:12:44 +0000
In-Reply-To: <551143C5.90207@dresearch-fe.de>
References: <551143C5.90207@dresearch-fe.de>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 24 Mar 2015 11:13:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-03-24 at 12:00 +0100, Steffen Sledz wrote:
> We hit the following problem in oe-classic. And we're not sure if this problem may occur in current oe too, or if it is fixed there.
> 
> They are two or more recipes (may be in different layers) for packages with sources from the same (git) repository. If the fetching from the repo needs some time we see "file changed as we read it" errors in all likelihood.
> 
> ------------------> snip <-------------------
> ERROR: Error evaluating '${PF}:${P}:${PN}:${BP}:${BPN}:files:.'
> Traceback (most recent call last):
>   File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 116, in expandWithRefs
>     s = __expand_var_regexp__.sub(varparse.var_sub, s)
>   File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 60, in var_sub
>     var = self.d.getVar(key, 1)
>   File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 260, in getVar
>     return self.expand(value, var)
>   File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 132, in expand
>     return self.expandWithRefs(s, varname).value
>   File "/CACHE/jenkins-workspace/foo/bitbake/lib/bb/data_smart.py", line 116, in expandWithRefs
>     s = __expand_var_regexp__.sub(varparse.var_sub, s)
> FetchError: Fetch command export HOME="/var/lib/jenkins"; export PATH="/CACHE/jenkins-workspace/foo/OE//bin:/CACHE/jenkins-workspace/foo/openembedded/bin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux/usr/armv5te/bin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux/usr/sbin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux/usr/bin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux/sbin:/CACHE/jenkins-workspace/foo/OE/tmp.7/sysroots/x86_64-linux//bin:/CACHE/jenkins-workspace/foo/OE/bin-HYP-6339:/CACHE/jenkins-workspace/foo/bitbake/bin:/sbin:/usr/sbin:/bin:/usr/bin"; tar -czf /var/lib/jenkins/sources/git_bitbucket.org.dresearchfe.drconfig.git.tar.gz ./.git/* failed with signal 1, output:
> /bin/tar: ./.git/objects/pack/tmp_pack_BwThcc: File removed before we read it
> /bin/tar: ./.git/objects/pack/tmp_pack_Ans7xK: File removed before we read it
> /bin/tar: ./.git/objects/pack: file changed as we read it
> ------------------> snap <-------------------
> 
> Is this a problem in oe-core too (or oe-classic only)?
> 
> Any ideas how to avoid such errors?

In theory bitbake has locks on files in DL_DIR, even for git
repositories so it should only touch the repo with one fetch process at
a time even if multiple recipes reference the same thing.

There were some big fetcher reworks in more recent versions of bitbake.
For OE-Classic, I'm guessing you're using an older version. You could
try transplanting the modern fetcher core onto your older bitbake I
guess.

Cheers,

Richard


