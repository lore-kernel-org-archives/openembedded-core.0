Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 517706E3EC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 19:26:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Feb 2014 11:26:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,788,1384329600"; d="scan'208";a="476565714"
Received: from unknown (HELO [10.255.12.76]) ([10.255.12.76])
	by fmsmga002.fm.intel.com with ESMTP; 05 Feb 2014 11:26:56 -0800
Message-ID: <52F29080.9080200@linux.intel.com>
Date: Wed, 05 Feb 2014 11:26:56 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
	Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1390685105-16717-1-git-send-email-paul.eggleton@linux.intel.com>
	<CAMKF1sqEhyFP8VRTf1m_p3SdURHFeNswT_GtrE8aj6Pqwak2xQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqEhyFP8VRTf1m_p3SdURHFeNswT_GtrE8aj6Pqwak2xQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/buildhistory: fix expansion of escape sequences
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
X-List-Received-Date: Wed, 05 Feb 2014 19:26:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/25/2014 02:10 PM, Khem Raj wrote:
> Thanks for fixing it. Looks correct to me
>

There still might be an issue:

> ERROR: Error executing a python function in /srv/hdd/poky/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'buildhistory_emit_pkghistory', lineno: 220, function: <module>
>      0216:
>      0217:        write_pkghistory(pkginfo, d)
>      0218:
>      0219:
>  *** 0220:buildhistory_emit_pkghistory(d)
>      0221:
> File: 'buildhistory_emit_pkghistory', lineno: 217, function: buildhistory_emit_pkghistory
>      0213:        pkginfo.filelist = " ".join(filelist)
>      0214:
>      0215:        pkginfo.size = int(pkgdata['PKGSIZE'])
>      0216:
>  *** 0217:        write_pkghistory(pkginfo, d)
>      0218:
>      0219:
>      0220:buildhistory_emit_pkghistory(d)
>      0221:
> File: 'buildhistory.bbclass', lineno: 38, function: write_pkghistory
>      0034:        if pkginfo.rconflicts:
>      0035:            f.write("RCONFLICTS = %s\n" %  pkginfo.rconflicts)
>      0036:        f.write("PKGSIZE = %d\n" %  pkginfo.size)
>      0037:        f.write("FILES = %s\n" %  pkginfo.files)
>  *** 0038:        f.write("FILELIST = %s\n" %  pkginfo.filelist)
>      0039:
>      0040:    for filevar in pkginfo.filevars:
>      0041:        filevarpath = os.path.join(pkgpath, "latest.%s" % filevar)
>      0042:        val = pkginfo.filevars[filevar]
> Exception: UnicodeEncodeError: 'ascii' codec can't encode character u'\xed' in position 337: ordinal not in range(128)
>



I tried to delete the buildhistory for ca-certs and rebuild without any 
sstate, but it still failed to build. correctly.


Sau!


> ERROR: Function failed: buildhistory_emit_pkghistory
> ERROR: Logfile of failure stored in: /srv/hdd/builds/world/tmp/work/all-poky-linux/ca-certificates/20130610-r0/temp/log.do_packagedata.14089
> ERROR: Task 9 (/srv/hdd/poky/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb, do_packagedata) failed with exit code '1'

> Acked-by: Khem Raj <raj.khem@gmail.com>
>
> On Sat, Jan 25, 2014 at 1:25 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> OE-Core commit 259b8718a31b886f8a158aeb5de164840c9a28b2 fixed UTF-8
>> errors but broke decoding of escape sequences in strings (e.g.
>> pkg_postinst scripts had \n \t in them instead of newlines and tabs.)
>> We need a second call to decode() here as specifying 'string_escape' as
>> the second parameter won't do anything.
>>
>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> ---
>>   meta/classes/buildhistory.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
>> index e9a9c3b..debeea8 100644
>> --- a/meta/classes/buildhistory.bbclass
>> +++ b/meta/classes/buildhistory.bbclass
>> @@ -190,7 +190,7 @@ python buildhistory_emit_pkghistory() {
>>                   key = item[0]
>>                   if key.endswith('_' + pkg):
>>                       key = key[:-len(pkg)-1]
>> -                pkgdata[key] = item[1].decode('utf-8', 'string_escape')
>> +                pkgdata[key] = item[1].decode('utf-8').decode('string_escape')
>>
>>           pkge = pkgdata.get('PKGE', '0')
>>           pkgv = pkgdata['PKGV']
>> --
>> 1.8.5.3
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

