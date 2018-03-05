Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6706678A6E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 13:56:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w25Duxj9020568
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 Mar 2018 05:56:59 -0800 (PST)
Received: from [172.25.59.213] (172.25.59.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 5 Mar 2018 05:56:27 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
References: <1520022430-7908-1-git-send-email-jason.wessel@windriver.com>
	<CAP9ODKrOspi_MOPfaV3bHZyc9iZfOCgyJO4Db8urtpyYUseyMQ@mail.gmail.com>
	<1520092215.3436.54.camel@linuxfoundation.org>
	<8842ab24-f539-7809-8cd0-e69df8c254fb@windriver.com>
Message-ID: <3abad53f-36cf-f6cd-0955-384dda61f9bc@windriver.com>
Date: Mon, 5 Mar 2018 07:56:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <8842ab24-f539-7809-8cd0-e69df8c254fb@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: Use deltask instead of noexec for package_write_rpm
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
X-List-Received-Date: Mon, 05 Mar 2018 13:56:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 03/05/2018 07:52 AM, Jason Wessel wrote:
> On 03/03/2018 09:50 AM, Richard Purdie wrote:
>> On Sat, 2018-03-03 at 12:46 -0300, Otavio Salvador wrote:
>>> On Fri, Mar 2, 2018 at 5:27 PM, Jason Wessel <jason.wessel@windriver.
>>> com> wrote:
>>>>
>>>> If you install an image into another image (this is the case for
>>>> custom initrd for example), it will fail with a non obvious python
>>>> backtrace.  This patch modifies the package_manager.py print which
>>>> package causes the failure for the future, if it is missing a
>>>> manifest.
>>>>
>>>> The error you get looks like this:
>>>>
>>>> oe-core/meta/lib/oe/package_manager.py', lineno: 534, function:
>>>> create_packages_dir
>>>>        0530:
>>>>        0531:    for dep in rpmdeps:
>>>>        0532:        c = taskdepdata[dep][0]
>>>>        0533:        manifest, d2 =
>>>> oe.sstatesig.find_sstate_manifest(c, taskdepdata[dep][2], taskname,
>>>> d, multilibs)
>>>>    *** 0534:        if not os.path.exists(manifest):
>>>>        0535:            continue
>>>>        0536:        with open(manifest, "r") as f:
>>>>        0537:            for l in f:
>>>>        0538:                l = l.strip()
>>>> File: '/usr/lib/python3.5/genericpath.py', lineno: 19, function:
>>>> exists
>>>>        0015:# This is false for dangling symbolic links on systems
>>>> that support them.
>>>>        0016:def exists(path):
>>>>        0017:    """Test whether a path exists.  Returns False for
>>>> broken symbolic links"""
>>>>        0018:    try:
>>>>    *** 0019:        os.stat(path)
>>>>        0020:    except OSError:
>>>>        0021:        return False
>>>>        0022:    return True
>>>>        0023:
>>>> Exception: TypeError: stat: can't specify None for path argument
>>>>
>>>> The root cause of the problem was determined to be the noexec
>>>> clause
>>>> in the image.bbclass.  When the package_write_rpm task runs it
>>>> expects
>>>> that a manifest will be generated.  Not running the task eliminates
>>>> the problem.
>>>>
>>>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>>> What about the other image types?
>>
>> FWIW I'm testing:
>>
>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=d77755d02f23ba410a2c55596c4538b8c5c2f63a
>>
>> (but haven't posted it yet, I will shortly, just wanted to check it was
>> roughly going to work first).
>>
>> I'd propose taking my patch above along with Jason's patch rewritten to
>> add the bb.fatal().
>>
> 
> 
> I agree.
> 
> Reviewed-by: Jason Wessel <jason.wessel@windriver.com>
> 
> Attached is the revised bbfatal patch.
> 

The attachment didn't have the old patch deleted so don't use that.  I sent it to the list separately.

Cheers,
Jason.

