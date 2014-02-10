Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B0EEB6E746
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 06:59:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Feb 2014 22:55:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,816,1384329600"; d="scan'208";a="480744800"
Received: from unknown (HELO [10.255.13.42]) ([10.255.13.42])
	by orsmga002.jf.intel.com with ESMTP; 09 Feb 2014 22:59:42 -0800
Message-ID: <52F878DE.6000609@linux.intel.com>
Date: Sun, 09 Feb 2014 22:59:42 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Jason Plum <jplum@devonit.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1390245778-9252-1-git-send-email-jplum@devonit.com>
	<52E7FB3B.8000000@linux.intel.com> <52E91639.6010606@devonit.com>
In-Reply-To: <52E91639.6010606@devonit.com>
Subject: Re: [PATCH v3] meta/oe/lib/path.py - check mount points, not device
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
X-List-Received-Date: Mon, 10 Feb 2014 06:59:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/29/2014 06:54 AM, Jason Plum wrote:
>
> On 01/28/14 13:47, Saul Wold wrote:
>> On 01/20/2014 11:22 AM, Jason Plum wrote:
>>> Signed-off-by: Jason Plum <jplum@devonit.com>
>>> ---
>>>    meta/lib/oe/path.py | 13 ++++++++++++-
>>>    1 file changed, 12 insertions(+), 1 deletion(-)
>>>
>> This patch is still not applying cleanly to master, I am also still a
>> little concerned if this will affect performance since it's used often
>> in sstate code.
>>
>> Have you compared build times with and without this patch?
>>
>> Sau!
> Saul,
>
> I pulled a fresh copy of master when I made this particular send-email
> patch, so it must keep changing from under me. I have the last commit to
> master on this checkout as 9c8d9781794ed0886a79c8ce4544ba98be0ff858
>
> The performance difference should be quite minimal, but I have not
> extensively tested with timing metrics in place.

Can you describe how much "quite minimal" really is, Richard is still 
concerned with the impact this might has (see his comment to my 
Consolidated Pull request).

Sau!

>>> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
>>> index 46783f8..dab20fc 100644
>>> --- a/meta/lib/oe/path.py
>>> +++ b/meta/lib/oe/path.py
>>> @@ -90,7 +90,7 @@ def copyhardlinktree(src, dst):
>>>        if os.path.isdir(src) and not len(os.listdir(src)):
>>>            return
>>>
>>> -    if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
>>> +    if (getmount(src) ==  getmount(dst)):
>>>            # Need to copy directories only with tar first since cp
>>> will error if two
>>>            # writers try and create a directory at the same time
>>>            cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p
>>> --files-from - --no-recursion | tar -xf - -C %s' % (src, src, dst)
>>> @@ -257,3 +257,14 @@ def realpath(file, root, use_physdir = True,
>>> loop_cnt = 100, assume_dir = False)
>>>            raise
>>>
>>>        return file
>>> +
>>> +def getmount(path):
>>> +    """ getmount takes a path parameter, uses os.path.realpath with
>>> os.path.abspath to
>>> +    handle symlink resolution, and returns the path to the mount
>>> point of the input path
>>> +    """
>>> +    path = os.path.realpath(os.path.abspath(path))
>>> +    while path != os.path.sep:
>>> +        if os.path.ismount(path):
>>> +            return path
>>> +        path = os.path.abspath(os.path.join(path, os.pardir))
>>> +    return path
>>> \ No newline at end of file
>>>
>

