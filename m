Received: from mail-ie0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U864s-0005wd-O8
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 10:35:16 +0100
Received: by mail-ie0-f180.google.com with SMTP id bn7so9798232ieb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 01:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=SA4xzhZTUloLqvW7V0ryJH07gSf8Ej+uNa9UAJYRfXs=;
	b=0F8W9bDpW5Aosre9unfxa6YdfDIlNXA6OPgpsXHPJE87ODpMT7f8GOhrwh/oEjm6qA
	Tf5Ub1MP6kf1Cwl34zWadI3lNmV5DnTDUUwnEbRhAuOmVP8p4YRM/7IS86bkUksD9Xkz
	8hCiU3BLLo4R8jxdch1rJqSkIGKrsRR0xHh5SwW/0Q5zwLitvICr2GVRySVWoEixnKxi
	5TY8Juwy/WvIsxGJ1p1NWfkjLQ8U5Htbh4L9h1xLMetddkTfaOOoc08yFFcgveEbjAY4
	rxR6WZuRVsgbZfIB1ei33Q47JJBD6WyoSTDeKUU37fyOf/pS7NPJK7ueADSksoPSOUux
	CDBw==
MIME-Version: 1.0
X-Received: by 10.50.185.194 with SMTP id fe2mr9471929igc.7.1361351929482;
	Wed, 20 Feb 2013 01:18:49 -0800 (PST)
Received: by 10.64.143.228 with HTTP; Wed, 20 Feb 2013 01:18:49 -0800 (PST)
In-Reply-To: <51247864.7000205@windriver.com>
References: <cover.1361338900.git.Qi.Chen@windriver.com>
	<5ef28960f6e00cda4b04bbe53399053704921d2d.1361338900.git.Qi.Chen@windriver.com>
	<13cf6700102.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<51247864.7000205@windriver.com>
Date: Wed, 20 Feb 2013 10:18:49 +0100
Message-ID: <CAC1BbcSWORfZ9x835DZ1f9oOdiqXFdGbFPYHNh3vTtmpdH-FHQ@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 4/5] populate-volatile.sh: improve the handling of link config items
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2013 09:35:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 20 February 2013 08:16, ChenQi <Qi.Chen@windriver.com> wrote:
> On 02/20/2013 03:10 PM, Bernhard Reutner-Fischer wrote:
>>
>> On 20 February 2013 06:55:33 <Qi.Chen@windriver.com> wrote:
>>>
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> Previously, if there's a link config item in the config file like
>>>
>>>         l root root 1777 /tmp /var/tmp
>>>
>>> and /tmp has existed, the symlink will not be created correctly.
>>>
>>> Another example is the /run directory. If /run directory has been
>>> created by some recipe or script before populate-volatile.sh runs,
>>> the symlink of /run to /var/run will not be created correctly.
>>>
>>> This patch ensures that the system creates symlinks exactly as the
>>> config file tells it.
>>
>>
>> This one also has bugs in background handling, it seems.
>
>
> What's the bug?

-                               link_file "${TSOURCE}" "${TNAME}" &
-                       }
+                       [ "${VERBOSE}" != "no" ] && echo "Creating
link -${TNAME}- pointing to -${TSOURCE}-."
+                       link_file "${TSOURCE}" "${TNAME}"

missing '&' after the link_file.
>
>
>> Can't you massage stderr redirection when setting EXIT instead?
>
>
> Could you please be more specific?
I meant EXEC.
Can't you put the > /dev/null 2>&1 into the relevant parts of _all_
the EXEC instead, in the whole series?


>>> [YOCTO #3404]
>>> [YOCTO #3406]


