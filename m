Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F249F78235
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 15:31:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA8FV9wd024467
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Nov 2017 07:31:09 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 8 Nov 2017 07:31:07 -0800
To: Mark Wielaard <mark@klomp.org>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>, Neal Gompa <ngompa13@gmail.com>
References: <20171018121423.1310-1-alexander.kanavin@linux.intel.com>
	<264c9619-62e7-ef43-9412-f00e9a1028ba@linux.intel.com>
	<634edf6c-23d9-1dbf-6c51-caef2f30c06f@windriver.com>
	<d4391631-e05e-bae9-363e-6d9fb7f3e3b6@linux.intel.com>
	<CAEg-Je-MW3k897aKZmmjh4Q-eFD8Kko=7FLRByv19sGYK1ZxRg@mail.gmail.com>
	<0afcb034-1acf-3a4b-b27a-010b7073a308@linux.intel.com>
	<1510153768.10879.80.camel@klomp.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <26ddd9fc-7d5d-0dd7-fc48-c7e3ca5d4128@windriver.com>
Date: Wed, 8 Nov 2017 09:31:06 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510153768.10879.80.camel@klomp.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: update to 4.14.0
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
X-List-Received-Date: Wed, 08 Nov 2017 15:31:16 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/8/17 9:09 AM, Mark Wielaard wrote:
> Hi Alex,
> 
> On Wed, 2017-11-08 at 15:14 +0200, Alexander Kanavin wrote:
>> On 11/07/2017 11:17 PM, Neal Gompa wrote:
>>
>>>> Thanks, this is the offending commit:
>>>>
>>>> https://github.com/rpm-software-management/rpm/commit/88989572fff1f31e0c4f972a6895585e4742ef4b
>>>>
>>>> Looks like they added sophisticated in-place processing/rewriting of the
>>>> actual binary (that is not possible to switch off). And it fails in case of
>>>> grub modules.
>>>>
>>>> We, on the other hand, only need to extract the list of debug source code
>>>> files. Any hint on how to do that without the use of rpm/debugedit? Perhaps
>>>> something from binutils/elfutils?
>>>
>>> This is the first time I'm hearing of this. Has anyone talked to Mark
>>> Wielaard (CC'd to this email) about fixing this properly for you guys?
>>
>> We don't have any particular interest in debugedit though. It is only 
>> used as a crutch to extract the debug source locations. If readelf can 
>> do the same thing, we'll use that - please do understand that reporting 
>> issues upstream costs time, especially if upstream replies with 
>> NEEDINFO, WORKSFORME or WONTFIX type of thing, so we prioritize what's 
>> truly critical :)
> 
> Even though I don't know much about openembedded I am interested in
> your use case. And why it breaks.
> 
> There are a couple of ways already to tweak what debugedit does.
> We could maybe add another for your use case.
> 
> So a couple of questions.
> 
> - What exactly breaks currently when you let debugedit rewrite the
>   debuginfo source paths?

Alexander has more info then I do here, but I believe running it against grub
modules breaks the modules.

> - How do you invoke debugedit? Do you use the find-debuginfo.sh script?

http://git.openembedded.org/openembedded-core/tree/meta/classes/package.bbclass

Start at line 337.
def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):

The function is called by:

splitdebuginfo(file, fpath, debugsrcdir, sourcefile, d)

file is set to the next file to process.  (We only process known elffiles.)

debugsrcdir is usually set to "/usr/src/debug"

sourcefile is usually set to "working dir"/debugsources.list

But the main invocation is actually at 362:

debugedit -i -l sourcefile file

> - What do you use the debug source files list for if not for the actual
>   packaging?

We used to use it to both munge the source file path as well as collection the
sources to package.  However, we no longer need the munging support, as we
always build with the GCC options to setup the source file path for the proper
target location.

DEBUG_PREFIX_MAP ?=
"-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
                     -fdebug-prefix-map=${STAGING_DIR_HOST}= \
"

So essentially what we want is a simple read-only, give me a list of all of the
referenced sources.

> BTW. If you really don't want to use debugedit then you could use
> something simple like a quick hack to list all sources I wrote some
> time ago:
> https://lists.fedorahosted.org/archives/list/elfutils-devel@lists.fedor
> ahosted.org/message/VZP4G5N2ELYZEDAB3QYLXYHDGX4WMCUF/
> (see the dwarfsrcfiles.c attachement)

This may very well do what we need.   Our output does not depend on RPM (or any
specific package manager.)  We had simply been using the debugedit from RPM as
it was the best tool for the job.  Now that GCC has the debug-prefix-map option,
we no longer really need debugedit.

--Mark

> Cheers,
> 
> Mark
> 


