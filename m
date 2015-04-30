Return-Path: <mario.goulart@gmail.com>
Received: from mail-vn0-f42.google.com (mail-vn0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD2E72491
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 13:30:33 +0000 (UTC)
Received: by vnbg1 with SMTP id g1so7161552vnb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=sf8XORveqq47BzdaVsaXPmMUdVyEUgd1Ww3685VNrFA=;
	b=du2R+hcbmZH6MPCoPrnFza73akzBFYDMw9ZBsYXOPeh4mNmekYZRLWXKcjbyM7wvzM
	yUmhYLmC6LyrUW0457FG8eB9OMwVlUruB5wEZE4+jus3bbFnfth+dLrpiqmfEfPOdsa9
	3T9mTrHqUMOvjazIJDnaEAmlhrFbi5xxj4HIlY64Kg+lRBH07TBUaZJNHqo7kOZZ//4l
	rioDrsJ5ps4tAFGYIay3P+XboN0hOr97MBnxrCKKHTVe+gucGVHimWMJTudrVKIMhLNc
	7jKGiJf6a/I5phvHRrdF42io5TC1Et7sjq2IxZdGSoRY5Oj8tS2C8BbF4e3JKw177WQ3
	97bQ==
X-Received: by 10.52.240.198 with SMTP id wc6mr7674603vdc.34.1430400634038;
	Thu, 30 Apr 2015 06:30:34 -0700 (PDT)
Received: from email.parenteses.org.gmail.com (email.parenteses.org.
	[198.199.72.94])
	by mx.google.com with ESMTPSA id h7sm3394010vdb.18.2015.04.30.06.30.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Apr 2015 06:30:33 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Gary Thomas <gary@mlbassoc.com>
References: <1430391890-6083-1-git-send-email-ed.bartosh@linux.intel.com>
	<87egn12286.fsf@email.parenteses.org> <55422B2C.6030300@mlbassoc.com>
Date: Thu, 30 Apr 2015 13:30:30 +0000
In-Reply-To: <55422B2C.6030300@mlbassoc.com> (Gary Thomas's message of "Thu,
	30 Apr 2015 07:16:28 -0600")
Message-ID: <871tj1216x.fsf@email.parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oeqa/utils: Allow ~ in bblayers
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
X-List-Received-Date: Thu, 30 Apr 2015 13:30:34 -0000
Content-Type: text/plain

On Thu, 30 Apr 2015 07:16:28 -0600 Gary Thomas <gary@mlbassoc.com> wrote:

> On 2015-04-30 07:08, Mario Domenech Goulart wrote:
>>
>> On Thu, 30 Apr 2015 14:04:50 +0300 Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
>>
>>> Bitbake can parse ~ in bblayer's paths.
>>> Added this functionality to oeqa code.
>>>
>>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>>> ---
>>>   meta/lib/oeqa/utils/commands.py | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
>>> index e8a467f..bc1dbb1 100644
>>> --- a/meta/lib/oeqa/utils/commands.py
>>> +++ b/meta/lib/oeqa/utils/commands.py
>>> @@ -155,6 +155,8 @@ def get_test_layer():
>>>       layers = get_bb_var("BBLAYERS").split()
>>>       testlayer = None
>>>       for l in layers:
>>> +        if '~' in l:
>>> +            l = os.path.expanduser(l)
>>
>> Is the "if '~' in l" test necessary?
>>
>> AFAIK, applying expanduser to a string that doesn't contain '~' will
>> just return the string itself.
>
> True, but why expand (create a new string, have to garbage-collect
> the old one, etc) when it's not necessary?

Good point, Gary.  Maybe we should only care about '~' as the first
character in paths?  In this case, "if l.startswith('~')" would do the
trick.

Best wishes.
Mario
-- 
http://www.ossystems.com.br

