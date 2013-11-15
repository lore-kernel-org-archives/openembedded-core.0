Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 748C36DA71
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 02:49:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAF2nDFJ028287
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 18:49:13 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 14 Nov 2013 18:49:13 -0800
Message-ID: <52858BB0.5040109@windriver.com>
Date: Fri, 15 Nov 2013 10:49:20 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1384433183.git.Qi.Chen@windriver.com>	<a86f7984cd1b08978d4358f862ff97d3d5cd3fb7.1384433183.git.Qi.Chen@windriver.com>	<5284CFAD.2060903@mlbassoc.com>	<1384436557.17320.62.camel@phil-desktop.brightsign>
	<5284F119.8010903@windriver.com> <52850FE8.3040409@linux.intel.com>
In-Reply-To: <52850FE8.3040409@linux.intel.com>
X-Originating-IP: [128.224.162.213]
Subject: Re: [PATCH 1/1] sanity.bbclass: check for validity of TMPDIR
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
X-List-Received-Date: Fri, 15 Nov 2013 02:49:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/2013 02:01 AM, Saul Wold wrote:
> On 11/14/2013 07:49 AM, Mark Hatle wrote:
>> On 11/14/13, 7:42 AM, Phil Blundell wrote:
>>> On Thu, 2013-11-14 at 06:27 -0700, Gary Thomas wrote:
>>>> Also, is "-" actually valid?  I seem to recall having problems when
>>>> my build
>>>> tree had the hyphen ("-") in the path.
>>>
>>> Paths with "-" in certainly work for me.  If there are any recipes 
>>> which
>>> break in that situation then we should just fix them.
>>
>> We found an issue with paths that -start- with a '-', there are
>> apparently many places where paths are passed into various shell, and
>> the initial '-' can be read as an argument identifier.
>>
>
> I think that I saw an email talking about "-D" in the TMPDIR caused 
> some some recipes to pick that up as a CFLAG define and cause problems
>
> Sau!
>

Yes. It's actually caused by the following statement in subversion-native.
./build/ac-macros/neon.m4: SVN_NEON_INCLUDES=[`$PKG_CONFIG neon --cflags 
| $SED -e 's/-D[^ ]*//g'`]
./build/ac-macros/neon.m4: SVN_NEON_INCLUDES=[`$neon_config --cflags | 
$SED -e 's/-D[^ ]*//g'`]

And there's a bug filed for it. 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5458

Best Regards,
Chen Qi

>>> OE already has quite a range of baroque restrictions on what sort of
>>> TMPDIR you are allowed to use (no nfs, no symlinks in the path, no
>>> spaces in the name) and every new prohibition represents a loss in
>>> usability.  This patch as proposed already forbids a whole range of
>>> characters, including things like "+", and I think that disallowing "-"
>>> as well would be a step too far.
>>
>> I don't believe Qi Chen sent it to the list, but we built path names
>> with all of the special characters and tried to run builds.  The
>> specific list is based on the results of those tests.  The other items
>> are already broken, and we're trying to be explicit with this for end
>> users.  (Note, it's really the TMPDIR that matters.. the 'build'
>> directory is a lot more flexible.)
>>
>> --Mark
>>
>>> p.
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


