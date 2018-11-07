Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 75C6879D87
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 12:07:13 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 400B35C0379;
	Wed,  7 Nov 2018 13:07:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1541592433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=umQIS/zy1T71qlMYhsG3FiIukr+cfpP37EyamZegfw0=;
	b=JnEoO00opA+aTJkz+JLeIK574ZD1G4XahAtCETP5/hZmizdOdQB6CJMCpHWcjDZFoWXzU0
	zOeKIzRFU4v0kIA7EQplPLBc4+L59MGTzLSs2RVOW/8FxT+N96Hs/rw88z1WyIRKZPhDZE
	KQXHdDVGWP3G4gg8Yiok9ENUBSw4QHo=
MIME-Version: 1.0
Date: Wed, 07 Nov 2018 13:07:13 +0100
From: Stefan Agner <stefan@agner.ch>
To: opkg-devel@googlegroups.com, alejandro.delcastillo@ni.com
In-Reply-To: <670d0eab-f33b-8883-2cdf-d83c1701789b@ni.com>
References: <20181019153821.21177-1-stefan@agner.ch>
	<670d0eab-f33b-8883-2cdf-d83c1701789b@ni.com>
Message-ID: <11acdfc51839b0ac3392e31f38fd08a8@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
Cc: Stefan Agner <stefan.agner@toradex.com>, yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org, ricardo@foundries.io
Subject: Re: [opkg-devel] [opkg-utils PATCH] opkg-make-index: use ctime instead of mtime
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
X-List-Received-Date: Wed, 07 Nov 2018 12:07:14 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Alejandro,

On 22.10.2018 16:45, Alejandro Del Castillo wrote:
> makes sense, sounds like this is going to fix a bunch of nasty 
> intermittent failures, thanks!
> 
> merged

Thanks for merging!

With the merge in opkg-utils this is not yet actively used in OE of
course. So my question: Is there a new release of opkg-utils planned
anytime soon? Or should that be added as a patch in the OE recipe for
now?

--
Stefan

> 
> On 10/19/18 10:38 AM, Stefan Agner wrote:
>> From: Stefan Agner <stefan.agner@toradex.com>
>>
>> When using sstate, two parallel builds can produce two packages
>> with the same mtime but different checksums. When later one of
>> those two builds fetches the others ipk, the package index does
>> not get udpated properly (since mtime matches). This ends up with
>> messages such as:
>>    Downloading file:/../tmp/work/../image/...ipk.
>>    Removing corrupt package file /../sysroot/../var/cache/opkg/volatile/...ipk
>>
>> However, in that case, ctime is different. Use ctime instead of
>> mtime to prevent failures like this.
>>
>> Suggested-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> ---
>> This addresses the issue discussed here:
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_pipermail_openembedded-2Dcore_2018-2DOctober_156348.html&d=DwIBaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=wNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&m=Innit37H69hUyZPGuuhwO6R5CbUNNTfXQwxbqsEA2NE&s=oFvqASrFTgasDqZ901HeIBFSsf6Cn4FcBieOOBU4MdI&e=
>>
>>   opkg-make-index | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/opkg-make-index b/opkg-make-index
>> index 3227fc0..db7bf64 100755
>> --- a/opkg-make-index
>> +++ b/opkg-make-index
>> @@ -115,12 +115,12 @@ for abspath in files:
>>        pkg = None
>>        fnameStat = os.stat(abspath)
>>        if filename in old_pkg_hash:
>> -          if filename in pkgsStamps and int(fnameStat.st_mtime) == pkgsStamps[filename]:
>> +          if filename in pkgsStamps and int(fnameStat.st_ctime) == pkgsStamps[filename]:
>>               if (verbose):
>>                  sys.stderr.write("Found %s in Packages\n" % (filename,))
>>               pkg = old_pkg_hash[filename]
>>             else:
>> -               sys.stderr.write("Found %s in Packages, but mtime differs - re-reading\n" % (filename,))
>> +               sys.stderr.write("Found %s in Packages, but ctime differs - re-reading\n" % (filename,))
>>
>>        if not pkg:
>>             if (verbose):
>> @@ -137,7 +137,7 @@ for abspath in files:
>>        else:
>>             old_filename = ""
>>        s = packages.add_package(pkg, opt_a)
>> -     pkgsStamps[filename] = fnameStat.st_mtime
>> +     pkgsStamps[filename] = fnameStat.st_ctime
>>        if s == 0:
>>             if old_filename:
>>                  # old package was displaced by newer
>>
> 
> -- 
> Cheers,
> 
> Alejandro

