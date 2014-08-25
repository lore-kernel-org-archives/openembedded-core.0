Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DD59C65D00;
	Mon, 25 Aug 2014 02:14:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7P2Eh0b012735
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 24 Aug 2014 19:14:43 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 24 Aug 2014 19:14:42 -0700
Message-ID: <53FA9C10.1060408@windriver.com>
Date: Mon, 25 Aug 2014 10:14:40 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20140823220223.0DA1E50496@opal.openembedded.org>
	<20140824155625.GJ20524@jama>
In-Reply-To: <20140824155625.GJ20524@jama>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : sanity.bbclass: check the format of MIRRORS
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
X-List-Received-Date: Mon, 25 Aug 2014 02:14:46 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/24/2014 11:56 PM, Martin Jansa wrote:
> On Sat, Aug 23, 2014 at 10:02:23PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: c8c213bb25b137cf70ba8ce9a45e60065d926735
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=c8c213bb25b137cf70ba8ce9a45e60065d926735
>>
>> Author: Robert Yang <liezhi.yang@windriver.com>
>> Date:   Fri Aug 22 01:31:27 2014 -0700
>>
>> sanity.bbclass: check the format of MIRRORS
>>
>> Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS:
>> * Each mirror shoudl contain two memebers.
>
> shoudl -> should
>
>> * The local "file://" url must use absolute path (file:///).
>> * The protocol must in protocols list.
>
> must "be"? seems like something is missing
>

Sorry for the typos.


>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>   meta/classes/sanity.bbclass | 33 +++++++++++++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> index 3b40ebe..dbcc26b 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -753,6 +753,39 @@ def check_sanity_everybuild(status, d):
>>       if oeroot.find(' ') != -1:
>>           status.addresult("Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space since autotools doesn't support this.")
>>
>> +    # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
>> +    mir_types = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
>> +    protocols = ['http://', 'ftp://', 'file://', 'https://', 'https?$://', \
>> +        'git://', 'gitsm://', 'hg://', 'osc://', 'p4://', 'svk://', 'svn://', \
>> +        'bzr://', 'cvs://']
>> +    for mir_type in mir_types:
>> +        mirros = (d.getVar(mir_type, True) or '').split('\\n')
>
> Is the "\n" (followed by actuall line break) really required as separator?
>
> openembedded-core/meta/classes/own-mirrors.bbclass doesn't separate the
> entries with "\n".
>
> and bitbake code seems to handle them both:
> def mirror_from_string(data):
>      return [ i.split() for i in (data or "").replace('\\n','\n').split('\n') if i ]

I think that "\n" is required, otherwise it can't split it as the code shows,
and I had tried that it didn't work without the "\n" at the end of the line
(except the last line, but we really need add the "\n" to the last line even
it works, in case of _append).

I will update the own-mirrors.bbclass after more investigations.

>
> If you want to unify the format to enforce "\\n" then I think it would
> be better to show the warning in bitbake fetcher, not in stanity.bbclass
>
> Also the list of supported protocols would be IMHO better in bitbake fetcher module.

Do it in the fetcher sounds fine to me, but we have to do more work,
for example, make sure that only check the various MIRRORS once rather
than checked in every do_fetch.

// Robert

>
>> +        for mir in mirros:
>> +            mir_list = mir.split()
>> +            # Should be two members.
>> +            if len(mir_list) not in [0, 2]:
>> +                bb.warn('Invalid %s: %s, should be 2 members, but found %s.' \
>> +                    % (mir_type, mir.strip(), len(mir_list)))
>> +            elif len(mir_list) == 2:
>> +                # Each member should start with protocols
>> +                valid_protocol_0 = False
>> +                valid_protocol_1 = False
>> +                file_absolute = True
>> +                for protocol in protocols:
>> +                    if not valid_protocol_0 and mir_list[0].startswith(protocol):
>> +                        valid_protocol_0 = True
>> +                    if not valid_protocol_1 and mir_list[1].startswith(protocol):
>> +                        valid_protocol_1 = True
>> +                        # The file:// must be an absolute path.
>> +                        if protocol == 'file://' and not mir_list[1].startswith('file:///'):
>> +                            file_absolute = False
>> +                    if valid_protocol_0 and valid_protocol_1:
>> +                        break
>> +                if not (valid_protocol_0 and valid_protocol_1):
>> +                    bb.warn('Invalid protocol in %s: %s' % (mir_type, mir.strip()))
>> +                if not file_absolute:
>> +                    bb.warn('Invalid file url in %s: %s, must be absolute path (file:///)' % (mir_type, mir.strip()))
>> +
>>       # Check that TMPDIR hasn't changed location since the last time we were run
>>       tmpdir = d.getVar('TMPDIR', True)
>>       checkfile = os.path.join(tmpdir, "saved_tmpdir")
>>
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

