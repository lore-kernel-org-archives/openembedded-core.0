Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id A69146F9FC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 18:38:28 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id q200so7814969ykb.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 11:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=m7/mdlNS+LM4K/cJmDROXzCWMk3tMOsZT2W9Q4TFbmg=;
	b=d+M4pw9WQfMPP3o86oFArQVORL0BI5zQAjFdsF7mSRusmLEcM/YC+RPJZ/5t+Y7UX+
	lNxXzpc14r60avy8BXNNYt+Mi5oxwLeqcj/eg/rDZGxB3WS69P8sPni57gU68B/kHTeM
	1LO/lkxu93/+FYf+ou2bfluluMKADMqEWNVoYyI4h7wbSlTqPk0VhamM0JkreePIymLm
	E6E6E97euUGftpB52puvmPZj9o2Ca8DGIb01R2oQD94p9faW3DkqNDWEZqE9siTJRzLU
	OY/J+T3+FCZGWMtn6Df0OtEoBpdjn+HbsE4OMRhz5JS/lzvxFWdHudjnabifCxaMQcc0
	1oVg==
MIME-Version: 1.0
X-Received: by 10.236.40.12 with SMTP id e12mr3755366yhb.155.1396377509125;
	Tue, 01 Apr 2014 11:38:29 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Tue, 1 Apr 2014 11:38:29 -0700 (PDT)
In-Reply-To: <1396374798.2910.29.camel@ted>
References: <1396372080-27607-1-git-send-email-otavio@ossystems.com.br>
	<1396374798.2910.29.camel@ted>
Date: Tue, 1 Apr 2014 15:38:29 -0300
X-Google-Sender-Auth: xXyYrJHHx5pZ7zmZGebp-SLN0rY
Message-ID: <CAP9ODKr29A6LKdALn6c_QVBG7v5jHcc020kva+nU9i+tC=+5ew@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] oe.utils, utils.bbclass: Add any_contains and base_any_contains
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
X-List-Received-Date: Tue, 01 Apr 2014 18:38:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 1, 2014 at 2:53 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2014-04-01 at 14:07 -0300, Otavio Salvador wrote:
>> This is similar to the contains but matches any of values. This is
>> useful to match for example several DISTRO_FEATURES which ought to
>> include a PACKAGECONFIG option.
>>
>> For example:
>>
>> PACKAGECONFIG ??= "${@base_any_contains('DISTRO_FEATURES', 'x11 wayland', 'gtk+', '', d)}"
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  meta/classes/utils.bbclass |  3 +++
>>  meta/lib/oe/utils.py       | 13 +++++++++++++
>>  2 files changed, 16 insertions(+)
>>
>> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
>> index 0a533af..966eda1 100644
>> --- a/meta/classes/utils.bbclass
>> +++ b/meta/classes/utils.bbclass
>> @@ -26,6 +26,9 @@ def base_version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
>>  def base_contains(variable, checkvalues, truevalue, falsevalue, d):
>>      return oe.utils.contains(variable, checkvalues, truevalue, falsevalue, d)
>>
>> +def base_any_contains(variable, checkvalues, truevalue, falsevalue, d):
>> +    return oe.utils.any_contains(variable, checkvalues, truevalue, falsevalue, d)
>> +
>>  def base_both_contain(variable1, variable2, checkvalue, d):
>>      return oe.utils.both_contain(variable1, variable2, checkvalue, d)
>>
>> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
>> index defa536..029d713 100644
>> --- a/meta/lib/oe/utils.py
>> +++ b/meta/lib/oe/utils.py
>> @@ -54,6 +54,19 @@ def contains(variable, checkvalues, truevalue, falsevalue, d):
>>          return truevalue
>>      return falsevalue
>>
>> +def any_contains(variable, checkvalues, truevalue, falsevalue, d):
>> +    val = d.getVar(variable, True)
>> +    if not val:
>> +        return falsevalue
>> +    val = set(val.split())
>> +    if isinstance(checkvalues, basestring):
>> +        checkvalues = set(checkvalues.split())
>> +    else:
>> +        checkvalues = set(checkvalues)
>> +    if checkvalues in val:
>> +        return truevalue
>> +    return falsevalue
>> +
>>  def both_contain(variable1, variable2, checkvalue, d):
>>      if d.getVar(variable1,1).find(checkvalue) != -1 and d.getVar(variable2,1).find(checkvalue) != -1:
>>          return checkvalue
>
> A more logical name is perhaps containsany().
>
> I'd also add that bitbake has special support for contains() and
> optimises sstate hashes for its use. We don't have such optimisation for
> containsany(). I think this is perhaps 1.7 material at this point.

I'd use contains_any. Any problem with this?

I didn't find the place bitbake handles it. Can you point the
reference for me to look at it and complete this?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

