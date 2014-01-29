Return-Path: <jplum@devonit.com>
Received: from mx1.devonhealth.com (unknown [8.20.30.154])
	by mail.openembedded.org (Postfix) with ESMTP id 330886EA0A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 14:55:12 +0000 (UTC)
Received: from emfserver.devonintlgroup.com (10.0.7.48) by mx1.devonhealth.com
	(10.0.20.154) with Microsoft SMTP Server id 8.3.327.1;
	Wed, 29 Jan 2014 09:54:34 -0500
Received: from [10.0.2.7] by emfserver.devonintlgroup.com over TLS secured
	channel with ESMTP (Devon Health Services, Inc Email Firewall SMTP Relay
	(Email Firewall v6.5)); Wed, 29 Jan 2014 09:55:01 -0500
X-Server-Uuid: 6CB55748-6642-4D3C-9211-397BC4E7A815
Received: from [10.0.15.96] (10.0.15.96) by boddingtons.devonintlgroup.com
	(10.0.2.15) with Microsoft SMTP Server ( TLS) id 8.3.327.1;
	Wed, 29 Jan 2014 09:55:00 -0500
Message-ID: <52E91639.6010606@devonit.com>
Date: Wed, 29 Jan 2014 09:54:49 -0500
From: Jason Plum <jplum@devonit.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:24.0) Gecko/20100101
	Thunderbird/24.2.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1390245778-9252-1-git-send-email-jplum@devonit.com>
	<52E7FB3B.8000000@linux.intel.com>
In-Reply-To: <52E7FB3B.8000000@linux.intel.com>
X-WSS-ID: 7EF7C9CF2B8426769-01-01
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
X-List-Received-Date: Wed, 29 Jan 2014 14:55:12 -0000
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 01/28/14 13:47, Saul Wold wrote:
> On 01/20/2014 11:22 AM, Jason Plum wrote:
>> Signed-off-by: Jason Plum <jplum@devonit.com>
>> ---
>>    meta/lib/oe/path.py | 13 ++++++++++++-
>>    1 file changed, 12 insertions(+), 1 deletion(-)
>>
> This patch is still not applying cleanly to master, I am also still a
> little concerned if this will affect performance since it's used often
> in sstate code.
>
> Have you compared build times with and without this patch?
>
> Sau!
Saul,

I pulled a fresh copy of master when I made this particular send-email 
patch, so it must keep changing from under me. I have the last commit to 
master on this checkout as 9c8d9781794ed0886a79c8ce4544ba98be0ff858

The performance difference should be quite minimal, but I have not 
extensively tested with timing metrics in place.
>> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
>> index 46783f8..dab20fc 100644
>> --- a/meta/lib/oe/path.py
>> +++ b/meta/lib/oe/path.py
>> @@ -90,7 +90,7 @@ def copyhardlinktree(src, dst):
>>        if os.path.isdir(src) and not len(os.listdir(src)):
>>            return	
>>
>> -    if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
>> +    if (getmount(src) ==  getmount(dst)):
>>            # Need to copy directories only with tar first since cp will error if two
>>            # writers try and create a directory at the same time
>>            cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --files-from - --no-recursion | tar -xf - -C %s' % (src, src, dst)
>> @@ -257,3 +257,14 @@ def realpath(file, root, use_physdir = True, loop_cnt = 100, assume_dir = False)
>>            raise
>>
>>        return file
>> +
>> +def getmount(path):
>> +    """ getmount takes a path parameter, uses os.path.realpath with os.path.abspath to
>> +    handle symlink resolution, and returns the path to the mount point of the input path
>> +    """
>> +    path = os.path.realpath(os.path.abspath(path))
>> +    while path != os.path.sep:
>> +        if os.path.ismount(path):
>> +            return path
>> +        path = os.path.abspath(os.path.join(path, os.pardir))
>> +    return path
>> \ No newline at end of file
>>

-- 
Jason Plum
Sr. Software Engineer
Devon IT



