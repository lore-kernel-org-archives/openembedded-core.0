Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QQQd3-0000Su-UK
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 23:01:02 +0200
Received: by pvc30 with SMTP id 30so1250579pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2011 13:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ro08TPjB+I8BHnsn6q/dAXwWNB1idWqJdaO63QFuxL4=;
	b=XJ1ye7HFWz+IJBlO81XKi2Ev3O8RT7dqgfuudzYXPnTL1I/qlcO+ls4PauJdR9GcJD
	1wyQbdmDanKuwLNdRDYcsH/l095Q63GAe9T9tMfYNofoC3BKt4w9dp2eD4hcyJ9BvOGI
	yO2EkrobE+B2EqwDs4DnTSemNuzQqOh3JwgZ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=DhUgTAvlobDkSM7xiHGq26ZpU7A2yHKV1XEWm0GbrGe7USCpVzBodueAYLW+XiI6O7
	T+sMJmZQKUix+PWmXPj+R+9oL4ksCQ+XGNwxuMpc7bdSQp5FUubNnU6wfqNSv0X36vFb
	ZjfYhqk3T6OwzAXcByRDZ0ORioCslKA6tac2Y=
Received: by 10.142.248.4 with SMTP id v4mr632744wfh.145.1306616270608;
	Sat, 28 May 2011 13:57:50 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x8sm2154056wfx.7.2011.05.28.13.57.48
	(version=SSLv3 cipher=OTHER); Sat, 28 May 2011 13:57:49 -0700 (PDT)
Message-ID: <4DE161C7.7040908@gmail.com>
Date: Sat, 28 May 2011 13:57:43 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4DE02216.1010003@intel.com>	<B424D198-12A5-4C45-93D7-C5CFA6C97BA5@dominion.thruhere.net>	<4DE128F5.1070603@gmail.com>
	<4DE136F2.8030407@intel.com>
In-Reply-To: <4DE136F2.8030407@intel.com>
Subject: Re: [PATCH 0/1][v3] license.bbclass parsing changes rebased sans debug
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 May 2011 21:01:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/2011 10:54 AM, Elizabeth Flanagan wrote:
> In this case, elfutils should probably be changes as well as
> license.bbclass. As do_populate_lic is looking for valid python to make
> a syntax tree from, this will fail. Solution:
>
> 1. Fix license.bbclass to check LICENSE and massage it a bit more.
> 2. Fix elfutils to be GPLv2* (unless it's the GCC exception. I haven't
> read the license yet).

It does not like () around license values so simple solution is to replace

-LICENSE = "(GPLv2 & Exception)"
+LICENSE = "GPLv2 & Exception"

Generally its preferable to fix eflutils first before license class in 
this case to keep the tree bisect'able.

>
> I'll poke around this today.
>
> -b
>
> On 05/28/2011 09:55 AM, Khem Raj wrote:
>> On 5/28/2011 2:16 AM, Koen Kooi wrote:
>>>
>>> Op 28 mei 2011, om 00:13 heeft Elizabeth Flanagan het volgende
>>> geschreven:
>>>
>>>>
>>>> Using python abstract syntax trees as a parser and an ast visitor
>>>> class, I've
>>>> begun the first steps to being able to put some sanity to license
>>>> selection.
>>>>
>>>> One note. License modifiers have traditionally been limited to the
>>>> "or greater"
>>>> modifier "+". I've added another modifier "with exceptions" for
>>>> licenses that
>>>> have no generic ie common-licenses/GPL-2,0-with-GCC-exception
>>>
>>> When building shadow I get:
>>
>>
>> and when building elfutils I get
>>
>> ERROR: (file: 'do_populate_lic', lineno: 116, function: do_populate_lic)
>> ERROR: Function 'do_populate_lic' failed
>> ERROR: Logfile of failure stored in:
>> /home/kraj/work/slugos/build/tmp-slugos-eglibc/work/armv5te-oe-linux-gnueabi/elfutils-0.148-r2/temp/log.do_populate_lic.31784
>>
>> Log data follows:
>> | WARNING:
>> /home/kraj/work/slugos/openembedded-core/meta/files/common-licenses
>> | ERROR: Error executing a python function in
>> /home/kraj/work/slugos/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb:
>>
>> | File "<unknown>", line 1
>> | ( 'GPLv2'& 'Exception' )
>> | ^
>> | IndentationError: unexpected indent
>> |
>> | ERROR: The stack trace of python calls that resulted in this
>> exception/failure was:
>> | ERROR: File "do_populate_lic", line 121, in<module>
>> | ERROR:
>> | ERROR: File "do_populate_lic", line 116, in do_populate_lic
>> | ERROR:
>> | ERROR: File "/usr/lib/python2.7/ast.py", line 37, in parse
>> | ERROR: return compile(source, filename, mode, PyCF_ONLY_AST)
>> | ERROR:
>> | ERROR: The code that was being executed was:
>> | ERROR: 0117: v = LicenseVisitor()
>> | ERROR: 0118: v.visit(node)
>> | ERROR: 0119:
>> | ERROR: 0120:
>> | ERROR: *** 0121:do_populate_lic(d)
>> | ERROR: 0122:
>> | ERROR: (file: 'do_populate_lic', lineno: 121, function:<module>)
>> | ERROR: 0112: clean_licenses += "'" + x + "'"
>> | ERROR: 0113: else:
>> | ERROR: 0114: clean_licenses += " " + x + " "
>> | ERROR: 0115:
>> | ERROR: *** 0116: node = ast.parse(clean_licenses)
>> | ERROR: 0117: v = LicenseVisitor()
>> | ERROR: 0118: v.visit(node)
>> | ERROR: 0119:
>> | ERROR: 0120:
>> | ERROR: (file: 'do_populate_lic', lineno: 116, function:
>> do_populate_lic)
>> | ERROR: Function 'do_populate_lic' failed
>> NOTE: package elfutils-0.148-r2: task do_populate_lic: Failed
>>
>>
>>>
>>> | WARNING:
>>> /home/koen/angstrom-core/sources/openembedded-core/meta/files/common-licenses
>>>
>>> | ERROR: Error executing a python function in
>>> /home/koen/angstrom-core/sources/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb:
>>>
>>> | RuntimeError: maximum recursion depth exceeded while calling a
>>> Python object
>>> |
>>> | ERROR: The stack trace of python calls that resulted in this
>>> exception/failure was:
>>> | ERROR: File "do_populate_lic", line 121, in<module>
>>> | ERROR:
>>> | ERROR: File "do_populate_lic", line 118, in do_populate_lic
>>> | ERROR:
>>> | ERROR: File "/usr/lib64/python2.7/ast.py", line 243, in visit
>>> | ERROR: return visitor(node)
>>> | ERROR:
>>> | ERROR: File "do_populate_lic", line 13, in generic_visit
>>>
>>> and a few hundred more lines, I had to change the scrollback buffer
>>> from 512 lines to unlimited to catch this :) I can send the full log
>>> on request.
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>



