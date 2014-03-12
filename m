Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7DD0E6F763
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 13:38:46 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id cz12so10118319veb.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 06:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=w1HluHWTiX2fh/3lArK/MwVgTJagF1mHHiuROI0rqvI=;
	b=jPXZjmYs8qaFQU7dOmyFMu9GYGe0hsIwxaEkCz+1VjIYIkSSwWoAiOmHnGOeHO59yQ
	bWQry2FpkfeJ2NOYtnIq7aSui1cR5/FWjI9pdicwbuedJjBBA0Cxgr+FYNeRbq7cmjG/
	rxfSGAqHBYc8bn4dyIgU6JmJpgBfpwBUu8vmnzspLM6TMWqruYBxWbV9eF/3sEkTxNo5
	MZVeFEBRcVJt4gjOx6jzC98b7aik5hLuwRDWz+QFiyIqQnNLuQh5YUVgvSU/O1knM7Z8
	4jnRlRozYZRwPps/5jN8VHD5A+U9qXFOlgvOYBgF6TP3xo9g9IdOaFMNxuT3NHx+YKK5
	0r6w==
X-Received: by 10.220.83.4 with SMTP id d4mr101501vcl.39.1394631527676; Wed,
	12 Mar 2014 06:38:47 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Wed, 12 Mar 2014 06:38:07 -0700 (PDT)
In-Reply-To: <26724FB0BFCB3D4C91BDE184751AA3A4289CC2BB@sestoex05.enea.se>
References: <1394153667-4247-1-git-send-email-paul@paulbarker.me.uk>
	<1394153667-4247-2-git-send-email-paul@paulbarker.me.uk>
	<531E0149.7010905@linux.intel.com>
	<CANyK_8eb29MDTxadMxVF+G+P5PYZMgH4sr3fyD16-tXNOYHj-w@mail.gmail.com>
	<26724FB0BFCB3D4C91BDE184751AA3A4289CC2BB@sestoex05.enea.se>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 12 Mar 2014 13:38:07 +0000
X-Google-Sender-Auth: NQH_GLJ7-HfUqNvdNr4c_VeGKOI
Message-ID: <CANyK_8e7QKJ3BtM1M+v6wvthUPg3K064V=KyKDs4d-XCXnkwgQ@mail.gmail.com>
To: Tudor Florea <Tudor.Florea@enea.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: Add ptest support
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
X-List-Received-Date: Wed, 12 Mar 2014 13:38:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 11 March 2014 21:27, Tudor Florea <Tudor.Florea@enea.com> wrote:
>
>
>>On 10 March 2014 18:15, Saul Wold <sgw@linux.intel.com> wrote:
>>> On 03/06/2014 04:54 PM, Paul Barker wrote:
>>>>
>>>> A run-ptest script written in python is added which defines a new
>>>> TestRunner
>>>> subclass which prints test results in the required ptest format and then
>>>> executes python's built-in testsuite using this new TestRunner subclass.
>>>> <snip>
>>>
>>> Seems like there is an issue with the multi-lib build.
>>>
>>> ERROR: QA Issue: lib32-python3: Files/directories were installed but not
>>> shipped
>>>   /usr/lib/python3
>>>   /usr/lib/python3/ptest
>>> NOTE: recipe lib32-pulseaudio-4.0-r0: task do_package_write_rpm: Started
>>>
>>> Sau!
>>>
>>>
>>>
>>>> +# This must come after inherit ptest for the override to take effect
>>>> +do_install_ptest() {
>>>> +    install -m 0755 -d ${D}/${libdir}/python3/ptest
>>>> +    install -m 0755 ${S}/../run-ptest ${D}/${libdir}/${PN}/ptest
>>>> +}
>>
>> Should I be using something other than ${libdir} here? I can see
>> ${PTEST_PATH} used in the do_install_ptest function for python2,
>> should I be using that instead?
>>
>> As I think I noted elsewhere, this is the first ptest related patch
>> I've done so I don't really know much beyond what's documented at
>> https://wiki.yoctoproject.org/wiki/Ptest.
>
> I think you may have to add a line like
> FILES_${PN} += "/usr/lib/python3/ptest"
> in the recipe (meta/recipes-devtools/python/python3_3.3.3.bb).

No, this belongs in the -ptest package. I just don't know what I'm doing wrong.

> ${PTEST_PATH} might be different than the above due to the use of suffix  ${PYTHON_MAJMIN}.
> Alternatively you might they to install ptest stuff here: ${D}${libdir}/python${PYTHON_MAJMIN}

I think the path should be based on the package name (python3), not on
an internal identifier.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

